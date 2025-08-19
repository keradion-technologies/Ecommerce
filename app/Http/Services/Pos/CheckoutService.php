<?php

namespace App\Http\Services\Pos;

use App\Enums\Pos\DeliveryOption;
use App\Enums\Pos\OrderSourceEnum;
use App\Enums\Pos\PaymentOption;
use App\Enums\StatusEnum;
use App\Http\Requests\Api\Pos\AddressStoreRequest;
use App\Http\Utility\PaymentInsert;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\PaymentLog;
use App\Models\PaymentMethod;
use App\Models\PosCart;
use App\Models\ProductStock;
use App\Models\Transaction;
use App\Models\User;
use App\Models\UserAddress;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class CheckoutService
{


    public function placeOrder(Request $request, $user = null): array
    {
        $ownerKey = $user instanceof \App\Models\Admin ? 'admin_id' : 'seller_id';

        $cartItems = PosCart::with('product')->where($ownerKey, $user->id)->get();

        if ($cartItems->isEmpty()) {
            return [
                'status' => false,
                'message' => translate('Can not checkout ,Cart is empty')
            ];
        }

        $originalPrice = $cartItems->sum(fn($item) => $item->original_price * $item->quantity);
        $regularDiscount = $cartItems->sum(fn($item) => $item->discount * $item->quantity);
        $preCalculatedPrice = $cartItems->sum(fn($item) => $item->price * $item->quantity);
        $totalTaxes = $cartItems->sum(fn($item) => $item->total_taxes* $item->quantity);


        

        $discountOnPos = $request->input('discount_value') ?? 0;
        $couponAmount = $request->input('coupon_amount') ?? 0;
        $shipping = (float) ($request->input('shipping_charge') ?? 0);


        $total = max(0, $preCalculatedPrice - $discountOnPos - $couponAmount + $shipping);
        $totalDiscount = $regularDiscount + $discountOnPos + $couponAmount;

        $customer       = User::find($request->input('customer_id'));

        if ($request->has('billing_address') && !$request->input('address_id')) {
            $billing = $request->input('billing_address');

            $customer = User::where('email', $billing['email'])->first()
                ?? User::create([
                    'name' => $billing['name'],
                    'email' => $billing['email'],
                    'password' => Hash::make('123123'),
                    'phone' => $billing['phone'],
                ]);


            $billingAddress = UserAddress::create([
                'user_id' => $request->customer_id ?? $customer?->id ?? null,
                'first_name' => $billing['name'],
                'email' => $billing['email'],
                'phone' => $billing['phone'],
                'country_id' => $billing['country'],
                'state_id' => $billing['state'],
                'city_id' => $billing['city'],
                'address' => ['address' => $billing['address']],
            ]);
        }


        $order = Order::create([
            'order_id' => site_settings('order_prefix') . random_number(),
            'customer_id' => $request->input('customer_id') ?? null,
            'address_id' => $request->input('address_id') ?? ($billingAddress->id ?? null),
            'qty' => $cartItems->sum('quantity'),
            'shipping_charge' => $shipping,
            'discount' => $totalDiscount,
            'amount' => $total,
            'original_amount' => $originalPrice,
            'total_taxes' => $totalTaxes,
            'payment_type' => Order::PAYMENT_METHOD,
            'payment_status' => Order::PAID,
            'payment_method_id' => $request->input('payment_method'),
            'order_type' => Order::PHYSICAL,
            'source' => OrderSourceEnum::POS->value,
            'status' => $request->input('delivery_option') == DeliveryOption::PICKUP->value ? Order::DELIVERED : site_settings('default_order_status', Order::PLACED),
            'custom_information' => $request->input('payment_info') ?? null,
            'customer_type' => $request->input('customer_type') ?? null,
            'delivery_option' => $request->input('delivery_option') ?? null,

        ]);

        $paymentMethod      = PaymentMethod::find($request->input('payment_method'));
        $paymentLog         =  PaymentInsert::paymentCreate($paymentMethod, $customer, $order->order_id);
        $paymentLog->status = PaymentLog::SUCCESS;
        $paymentLog->save();


        $orderDetailsData = [];
        $stockUpdates = [];

        foreach ($cartItems as $item) {
            $quantity = (int) $item->quantity;
            $attributeValue = $item->attributes_value;
            $originalPrice = (float) $item->original_price*$quantity;
            $totalTaxes = (float) $item->total_taxes*$quantity;
            $lineDiscount = (float) $item->discount*$quantity;
            $lineTotal = (float) $item->total;


            $orderDetailsData[] = [
                'order_id' => $order->id,
                'product_id' => $item->product_id,
                'quantity' => $quantity,
                'attribute' => json_encode($attributeValue),
                'original_price' => $originalPrice,
                'total_price' => $lineTotal,
                'total_taxes' => $totalTaxes,
                'discount' => $lineDiscount,
                'status' => ($request->input('delivery_option') == DeliveryOption::PICKUP->value) ? Order::DELIVERED : site_settings('default_order_status', Order::PLACED),

            ];

            if ($attributeValue) {
                $stock = ProductStock::where('product_id', $item->product_id)
                    ->where('attribute_value', $attributeValue)
                    ->first();
                if ($stock) {
                    $stock->qty = max(0, $stock->qty - $quantity);
                    $stockUpdates[] = $stock;
                }
            }
        }


        OrderDetails::insert($orderDetailsData);


        $orderDetails = OrderDetails::with('product')->where('order_id', $order->id)->get();

        foreach ($orderDetails as $key => $value) {

            if ($value->status == Order::DELIVERED && $user instanceof \App\Models\Seller) {

                $user->pos_balance += $value->total_price;
                $user->save();

                $transaction = Transaction::create([
                    'seller_id'             => $user->id,
                    'amount'                => $value->total_price,
                    'post_balance_pos'      => $user->pos_balance,
                    'transaction_type'      => Transaction::PLUS,
                    'transaction_number'    => trx_number(),
                    'source'                => OrderSourceEnum::POS->value,
                    'details'               => 'Amount added for this pos order ' . $order->order_id,
                ]);

            }
        }

        foreach ($stockUpdates as $stock) {
            $stock->save();
        }

        PosCart::where($ownerKey, $user->id)->delete();

        return [
            'status' => true,
            'message' => 'Order placed successfully',
            'data' => $order->load('billingAddress', 'customer'),
            'order_details' => $orderDetails,

        ];
    }

    public function storeAddress(AddressStoreRequest $request)
    {

        $userAddress = UserAddress::create([
            'name' => $request->input('address_name', 'default'),
            'email' => $request->input('email'),
            'user_id' => $request->input('customer_id'),
            'first_name' => $request->input('first_name'),
            'last_name' => $request->input('last_name'),
            'phone' => $request->input('phone'),
            'zip' => $request->input('zip'),
            'country_id' => $request->input('country_id'),
            'state_id' => $request->input('state_id'),
            'city_id' => $request->input('city_id'),
            'address' => ['address' => $request->input('address')],
        ]);

        if (!$userAddress) {
            return [
                'status' => false,
                'message' => translate('Failed to save address')
            ];
        }

        return [
            'status' => true,
            'message' => translate('Address saved successfully'),
            'data' => $userAddress
        ];

    }


    public function getAddressList($userId)
    {
        $addresses = UserAddress::where('user_id', $userId)->get();

        if ($addresses->isEmpty()) {
            return ['status' => false, 'message' => translate('No addresses found')];
        }


        $formattedAddresses = $addresses->map(function ($address) {
            return [
                'id' => $address->id,
                'user_id' => $address->user_id,
                'first_name' => $address->first_name,
                'last_name' => $address->last_name,
                'zip' => $address->zip,
                'phone' => $address->phone,
                'email' => $address->email,
                'country' => optional($address->country)->name,
                'state' => optional($address->state)->name,
                'city' => optional($address->city)->name,
                'address' => $address->address,
            ];
        });


        return [
            'status' => true,
            'message' => translate('Addresses retrieved successfully'),
            'data' => $addresses,
            'formatted_address' => $formattedAddresses
        ];
    }



    public function getOrderById($id)
    {
        $order = Order::with(['orderDetails', 'billingAddress', 'customer'])
            ->where('id', $id)
            ->first();

        if (!$order) {
            return [
                'status' => false,
                'message' => translate('Order not found')
            ];
        }

        return [
            'status' => true,
            'message' => translate('Order retrieved successfully'),
            'data' => $order
        ];
    }


    public function generateInvoice($cart)
    {

    }
}