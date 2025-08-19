<?php

namespace App\Http\Services\Pos;

use App\Models\Coupon;
use App\Models\PosCart;
use App\Models\PosCartHold;
use App\Models\ProductStock;
use Illuminate\Http\Request;
use App\Models\Product;
use Illuminate\Support\Facades\Cache;

class CartService
{

    /**
     * Summary of addToCart
     * @param \Illuminate\Http\Request $request
     * @param mixed $user
     * @return array{message: string, status: bool}
     */
    public function addToCart(Request $request, $user)
    {
        $quantity = $request->input('quantity', 1);
        $productUid = $request->input('product_uid');
        $attributeValue = $request->input('attribute_combination');
        $attribute = $request->input('attribute_id');
        $sessionId = $request->input('session_id') ?? session()->getId();
        $currencyId = $request->input('currency_id') ?? default_currency();
        $customerId = $request->input('customer_id') ?? null;

        $product = Product::with('stock')->where('uid', $productUid)->first();


        if (!$attributeValue) {
            $attributeValue = optional($product->stock->first())->attribute_value;
        }

        $stock = ProductStock::where('product_id', $product->id)
            ->where('attribute_value', $attributeValue)
            ->first();


        if (!$stock || $quantity > $stock->qty) {

            return $response = [
                'status' => false,
                'message' => translate('Insufficient stock'),
            ];
        }


        $basePrice = $stock->price;
        $discountValue = $product->discount_percentage ?? 0;
        $discount = api_short_amount((double) cal_discount_amount($discountValue, $basePrice));

        $payablePrice = $basePrice - $discount;

        $taxCollection  = getTaxesCollection($product, $payablePrice);
        $taxAmount      = getTaxes($product, $payablePrice);

        $finalPrice = $payablePrice + $taxAmount;
        $total = $finalPrice * $quantity;
        $totalTaxes = $taxAmount * $quantity;


        $ownerKey = $user instanceof \App\Models\Admin ? 'admin_id' : 'seller_id';


        $conditions = [
            $ownerKey => $user->id,
            'product_id' => $product->id,
            'attributes_value' => $attributeValue,
            'session_id' => $sessionId,
            'customer_id' => $customerId,
            'currency_id' => $currencyId,
        ];

        $cart = PosCart::where($conditions)->first();

        if ($cart) {
            $newQty = $cart->quantity + $quantity;

            if ($newQty > $stock->qty) {

                return $response = [
                    'status' => false,
                    'message' => translate('Cannot exceed available stock'),
                ];
            }

            $cart->update([
                'quantity'  => $newQty,
                'total'     => $finalPrice ,
            ]);

        } else {
            PosCart::create(array_merge($conditions, [
                'price' => $finalPrice,
                'discount' => $discount,
                'original_price' => $basePrice,
                'quantity' => $quantity,
                'total' => $total,
                'taxes' => $taxCollection,
                'total_taxes' => $totalTaxes,
                'attribute' => $attribute,
            ]));
        }

        return $response = [
            'status' => true,
            'message' => translate('Product added to POS cart'),
        ];

    }


    /**
     * Summary of updateCart
     * @param \Illuminate\Http\Request $request
     * @param mixed $user
     * @return array{message: string, status: bool}
     */
    public function updateCart(Request $request, $user)
    {
        $cart = PosCart::find($request->input('cart_id'));
        $quantity = $request->input('quantity', 1);

        if ($quantity == 0)
            $cart->delete();

        $stock = ProductStock::where('product_id', $cart->product_id)
            ->where('attribute_value', $cart->attributes_value)
            ->first();

        if (!$stock || $quantity > $stock->qty) {
            return $response = [
                'status' => false,
                'message' => translate('Insufficient stock'),
            ];
        }

        $finalPrice = $cart->price;

        $cart->update([
            'quantity' => $quantity,
            'total' => $finalPrice * $quantity
        ]);

        return $response = [
            'status' => true,
            'message' => translate('Cart quantity updated'),
        ];
    }


    /**
     * Summary of removeFromCart
     * @param mixed $cartId
     * @param mixed $user
     * @return array{message: string, status: bool}
     */
    public function removeFromCart($cartId, $user)
    {
        $cart = PosCart::find($cartId);


        if (!$cart) {
            return $response = [
                'status' => false,
                'message' => translate('Cart item not found'),
            ];
        }

        $cart->delete();

        return $response = [
            'status' => true,
            'message' => translate('Cart item removed'),
        ];
    }




    /**
     * Summary of getCartItems
     * @param mixed $user
     * @return \Illuminate\Database\Eloquent\Builder[]|\Illuminate\Database\Eloquent\Collection
     */
    public function getCartItems($user)
    {
        $field = $user instanceof \App\Models\Admin ? 'admin_id' : 'seller_id';

        return PosCart::with('product')
            ->where($field, $user->id)
            ->get();


    }


    /**
     * Summary of holdCart
     * @param mixed $user
     * @param string $note
     * @return array{message: string, status: bool}
     */
    public function holdCart($user, string $note = null): array
    {
        $ownerKey = $user instanceof \App\Models\Admin ? 'admin_id' : 'seller_id';

        $cartItems = PosCart::where($ownerKey, $user->id)->get();

        if ($cartItems->isEmpty()) {
            return ['status' => false, 'message' => 'Cart is empty'];
        }

        $payload = $cartItems->map(function ($item) {
            $data = $item->only([
                'admin_id',
                'seller_id',
                'product_id',
                'attributes_value',
                'session_id',
                'customer_id',
                'currency_id',
                'price',
                'discount',
                'original_price',
                'quantity',
                'total',
                'taxes',
                'total_taxes',
                'attribute',
            ]);

            if (is_string($data['taxes'])) {
                $decoded = json_decode($data['taxes'], true);
                if (json_last_error() === JSON_ERROR_NONE) {
                    $data['taxes'] = $decoded;
                }
            }

            if (is_string($data['attribute'])) {
                $decoded = json_decode($data['attribute'], true);
                if (json_last_error() === JSON_ERROR_NONE) {
                    $data['attribute'] = $decoded;
                }
            }

            return $data;
        });


        $uid = now()->timestamp;
        $total = $cartItems->sum('total');
        $itemCount = $cartItems->sum('quantity');
        $customerName = $cartItems->first()->customer_id ? $cartItems->first()->customer->name : 'Guest';


        $summaryItems = $cartItems->map(function ($item) {
            $name = $item->product->name ?? 'Unknown';
            return "{$name} ({$item->quantity})";
        })->implode(', ');


        $summary = [
            'order_id' => "hold-{$uid}",
            'date' => now()->format('n/j/Y, g:i:s A'),
            'customer_name' => $customerName ?? 'Guest',
            'total' => $total,
            'item_count' => "{$itemCount} item(s)",
            'item_summary' => $summaryItems,
        ];


        PosCartHold::create([
            $ownerKey => $user->id,
            'cart_items' => $payload,
            'note' => $note,
            'summary_meta' => $summary
        ]);

        PosCart::where($ownerKey, $user->id)->delete();

        return ['status' => true, 'message' => 'Cart held successfully'];
    }



    public function restoreCart(string $holdUid, $user): array
    {
        $hold = PosCartHold::where('uid', $holdUid)->first();


        if (!$hold) {
            return ['status' => false, 'message' => 'Hold not found'];
        }

        $cartData = [];

        foreach ($hold->cart_items as $item) {
            $cartData[] = [
                'admin_id' => $item->admin_id ?? null,
                'seller_id' => $item->seller_id ?? null,
                'product_id' => $item->product_id,
                'attributes_value' => $item->attributes_value ?? null,
                'session_id' => $item->session_id ?? null,
                'customer_id' => $item->customer_id ?? null,
                'currency_id' => $item->currency_id ?? null,
                'price' => $item->price ?? null,
                'discount' => $item->discount ?? 0,
                'original_price' => $item->original_price,
                'quantity' => $item->quantity,
                'total' => $item->total ?? 0,
                'taxes' => $item->taxes ? json_encode($item->taxes) : null,
                'total_taxes' => $item->total_taxes ?? 0,
                'attribute' => $item->attribute ? json_encode($item->attribute) : null,

            ];
        }

        PosCart::insert($cartData);
        $hold->delete();

        return ['status' => true, 'message' => 'Cart restored from hold'];
    }


    public function getHoldList($user)
    {
        $field = $user instanceof \App\Models\Admin ? 'admin_id' : 'seller_id';


        $holdList = PosCartHold::where($field, $user->id)
            ->orderBy('created_at', 'desc')
            ->get();

        if ($holdList->isEmpty()) {
            return ['status' => false, 'message' => 'No holds found', 'data'=>$holdList];
        }

        return ['status' => true, 'data' => $holdList];

    }

    public function clearCart($user)
    {
        $ownerKey = $user instanceof \App\Models\Admin ? 'admin_id' : 'seller_id';

        PosCart::where($ownerKey, $user->id)->delete();

        session()->forget('coupon');

        return ['status' => true, 'message' => 'Cart cleared Successfully'];

    }

    public function applyCoupon(Request $request)
    {

        $request->validate([
            'code' => 'required',
            'subtotal' => 'required|numeric|gt:0',
        ], [
            'code.required' => 'Coupon code is required'
        ]);

        $code = $request->input('code');
        $isApi = request()->is('api/*');

        
        if ((!$isApi && session('coupon.code') === $code)) {
            return ['status' => false, 'message' => 'Coupon has already been applied'];
        }


        $isApi
            ? Cache::put("applied_coupon_$code", true, now()->addMinutes(30))
            : session(['coupon.code' => $code]);


        
        $coupon = Coupon::where('code', $code)
            ->valid()
            ->first();

        if (!$coupon)
            return $response = ['status' => false, 'message' => 'This coupon doesn\'t exist'];

        if($coupon->seller && $request->input("product_ids")) {
            $productIds = json_decode($request->input("product_ids"), true);
            
            $invalidProductExists = Product::whereIn("id", $productIds)
                                                ->where(function($query) use ($coupon) {
                                                    $query->where("seller_id", "!=", $coupon->seller->id)
                                                                ->orWhere("seller_id", null);
                                                })->exists();
            $invalidProductMessage = translate('Sorry, your order contains ineligible products');
            if($isApi && $invalidProductExists) return response()->json(['error'=> $invalidProductMessage]);
            if(!$isApi && $invalidProductExists) return ['status' => false, 'message' => $invalidProductMessage];
        }
        $amount = num_format(($coupon->discount(($request->subtotal))));

        if ((int) $amount == 0)
            return response()->json(['error' => translate('Sorry, your order total doesn\'t meet the requirements for this coupon')]);

        $response = [
            'status' => true,
            'message' => translate('Coupon has applied successfully'),
            'code' => $coupon->code,
            'amount' => $amount,
        ];
        session()->put('coupon', ['code' => $coupon->code, 'amount' => $amount]);

        return $response;
    }



}