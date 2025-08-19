<?php

namespace App\Http\Controllers\Seller;

use App\Enums\Pos\OrderSourceEnum;
use App\Enums\StatusEnum;
use App\Http\Controllers\Controller;
use App\Jobs\SendMailJob;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\OrderStatus;
use App\Models\Product;
use App\Models\Transaction;
use Carbon\Carbon;

class OrderController extends Controller
{

    private function getSellerOrders(?string $status = null)
    {
        $seller = Auth::guard('seller')->user();
        $isPOS = request()->routeIs('seller.pos.*');

        $query = Order::with([
            'log',
            'customer',
            'paymentMethod',
            'shipping',
            'shipping.method',
            'orderDetails' => function ($q) use ($seller) {
                $q->sellerOrderProduct()->whereHas('product', function ($q) use ($seller) {
                    $q->where('seller_id', $seller->id);
                });
            },
            'orderDetails.product',
        ])

            ->physicalOrder()
            ->date()
            ->search()
            ->whereHas('orderDetails', function ($q) use ($seller) {
                $q->whereHas('product', function ($q) use ($seller) {
                    $q->where('seller_id', $seller->id);
                });
            });

        if ($isPOS) {
            $query->where('source', OrderSourceEnum::POS->value);
        } else {
            $query->where('source', OrderSourceEnum::WEB->value)->sellerOrder();
        }

        if ($status && method_exists(self::class, $status)) {
            $query->{$status}();
        }

        return $query->orderBy('id', 'DESC')
            ->paginate(site_settings('pagination_number', 10))
            ->appends(request()->all());
    }

    public function index()
    {
        $title = translate('Seller all orders');
        $orders = $this->getSellerOrders(); // No status
        return view('seller.order.index', compact('title', 'orders'));
    }

    public function placed()
    {
        $title = translate('Seller placed orders');
        $orders = $this->getSellerOrders('placed');
        return view('seller.order.index', compact('title', 'orders'));
    }

    public function confirmed()
    {
        $title = translate('Seller confirmed orders');
        $orders = $this->getSellerOrders('confirmed');
        return view('seller.order.index', compact('title', 'orders'));
    }

    public function return()
    {
        $title = translate('Seller return orders');
        $orders = $this->getSellerOrders('return');
        return view('seller.order.index', compact('title', 'orders'));
    }

    public function pending()
    {
        $title = translate('Seller pending orders');
        $orders = $this->getSellerOrders('pending');
        return view('seller.order.index', compact('title', 'orders'));
    }

    public function processing()
    {
        $title = translate('Seller processing orders');
        $orders = $this->getSellerOrders('processing');
        return view('seller.order.index', compact('title', 'orders'));
    }

    public function shipped()
    {
        $title = translate('Seller shipped orders');
        $orders = $this->getSellerOrders('shipped');
        return view('seller.order.index', compact('title', 'orders'));
    }

    public function delivered()
    {
        $title = translate('Seller delivered orders');
        $orders = $this->getSellerOrders('delivered');
        return view('seller.order.index', compact('title', 'orders'));
    }

    public function cancel()
    {
        $title = translate('Seller cancel orders');
        $orders = $this->getSellerOrders('cancel');
        return view('seller.order.index', compact('title', 'orders'));
    }

    public function details($id)
    {
        $title = translate('Seller order details');
        $seller = Auth::guard('seller')->user();
        $order = Order::sellerOrder()->physicalOrder()->whereHas('orderDetails', function ($q) use ($seller) {
            $q->whereHas('product', function ($query) use ($seller) {
                $query->where('seller_id', $seller->id);
            });
        })->where('id', $id)->firstOrFail();

        $orderDeatils = OrderDetails::where('order_id', $order->id)->sellerOrderProduct()->whereHas('product', function ($query) use ($seller) {
            $query->where('seller_id', $seller->id);
        })->with('product')->get();

        $orderStatus = OrderStatus::where('order_id', $id)->latest()->get();
        return view('seller.order.details', compact('title', 'order', 'orderDeatils', 'orderStatus'));
    }


    public function orderStatusUpdate(Request $request, $id)
    {
        $this->validate($request, [
            'status' => 'required|in:2,3,4,5,7,1,0',
        ]);
        $seller = Auth::guard('seller')->user();
        $order = Order::sellerOrder()->physicalOrder()->whereHas('orderDetails', function ($q) use ($seller) {
            $q->whereHas('product', function ($query) use ($seller) {
                $query->where('seller_id', $seller->id);
            });
        })->where('id', $id)->firstOrFail();
        $orderDeatils = OrderDetails::where('order_id', $order->id)->sellerOrderProduct()->whereHas('product', function ($query) use ($seller) {
            $query->where('seller_id', $seller->id);
        })->get();


        if ($order->status == 5)
            return back()->with('error', translate('This order has already been delivered'));
        if ($order->status == 7)
            return back()->with('error', translate('This order has already been Returned'));

        $phone = @$order->billingAddress ? @$order->billingAddress->phone : @$order->billing_information->phone;
        $email = @$order->billingAddress ? @$order->billingAddress->email : @$order->billing_information->email;
        $first_name = @$order->billingAddress ? @$order->billingAddress->first_name : @$order->billing_information->first_name;
        $address = @$order->billingAddress ? @$order->billingAddress->address->address : @$order->billing_information->address;

        $mailCode = [
            'order_number' => $order->order_id,
            'time' => Carbon::now(),
            'payment_status' => $order->payment_status == Order::PAID ? 'Paid' : "Unpaid",
            'amount' => show_amount($order->amount),
            'customer_phone' => @$phone ?? '--',
            'customer_email' => @$email,
            'customer_name' => @$first_name ?? "--",
            'customer_address' => @$address ?? '--',
        ];

        $user = (object) [
            "first_name" => $first_name,
            "email" => $email,
        ];

        $order->status = $request->status;
        $order->save();
        if ($order->status == Order::CANCEL) {
            SendMailJob::dispatch($user, 'ORDER_CANCEL', $mailCode);
        } elseif ($order->status == Order::DELIVERED) {
            SendMailJob::dispatch($user, 'ORDER_DELIVERED', $mailCode);
        } elseif ($order->status == Order::CONFIRMED) {
            SendMailJob::dispatch($user, 'ORDER_CONFIRMED', $mailCode);
        }


        foreach ($orderDeatils as $key => $value) {

            $value->status = $request->status;
            $value->save();

            if ($request->status == Order::DELIVERED) {
                $isPos = $order->source == OrderSourceEnum::POS->value;

                $amount = $value->total_price;
                $commission = (!$isPos && site_settings('seller_commission_status') == StatusEnum::true->status())
                    ? ($amount * site_settings('seller_commission') / 100)
                    : 0;

                $finalAmount = $amount - $commission;

                if ($isPos) {
                    $seller->pos_balance += $amount;
                } else {
                    $seller->balance += $finalAmount;
                }
                $seller->save();

                Transaction::create([
                    'seller_id' => $seller->id,
                    'amount' => $isPos ? $amount : $finalAmount,
                    'post_balance' =>  $seller->balance,
                    'post_balance_pos' =>  $seller->pos_balance,
                    'transaction_type' => Transaction::PLUS,
                    'transaction_number' => trx_number(),
                    'source' => $isPos ? OrderSourceEnum::POS->value : null,
                    'details' => 'Amount added for this ' . ($isPos ? 'pos ' : '') . 'order ' . $order->order_id,
                ]);
            }

        }

        if ($order->status == 5) {
            $order->payment_status = Order::PAID;
            $order->save();
        }


        $orderStatus = new OrderStatus();

        $orderStatus->order_id = $id;

        $orderStatus->delivery_status = $request->status;

        if ($request->delivery_note != '')
            $orderStatus->delivery_note = $request->delivery_note;


        $orderStatus->payment_status = $request->status == 5 ? Order::PAID : Order::UNPAID;

        $orderStatus->save();

        return back()->with('success', translate("Order status has been updated"));




    }



    public function printInvoice($id)
    {
        $title = translate('Print invoice');
        $seller = Auth::guard('seller')->user();
        $order = Order::sellerOrder()->physicalOrder()->whereHas('orderDetails', function ($q) use ($seller) {
            $q->whereHas('product', function ($query) use ($seller) {
                $query->where('seller_id', $seller->id);
            });
        })->where('id', $id)->firstOrFail();
        $orderDeatils = OrderDetails::where('order_id', $order->id)->sellerOrderProduct()->whereHas('product', function ($query) use ($seller) {
            $query->where('seller_id', $seller->id);
        })->with('product')->get();
        return view('seller.order.print', compact('title', 'order', 'orderDeatils'));
    }
}
