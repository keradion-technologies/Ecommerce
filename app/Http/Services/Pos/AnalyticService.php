<?php

namespace App\Http\Services\Pos;

use App\Enums\ProductStatus;
use App\Enums\ProductType;
use App\Models\Category;
use App\Models\Order;
use App\Models\OrderDetails;
use App\Models\PaymentLog;
use App\Models\PlanSubscription;
use App\Models\Product;
use App\Models\Seller;
use App\Models\Transaction;
use App\Models\User;
use App\Models\Visitor;
use App\Models\Withdraw;
use Carbon\Carbon;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;

class AnalyticService
{
    public function getDashboardData(int $year = null): array
    {
        $year = $year ?? date("Y");

        $data['product_by_year'] = sort_by_month(
            array_merge(...array_map(
                function ($month) {
                    return [key($month) => reset($month)];
                },
                Product::inhouseProduct()
                    ->selectRaw("MONTHNAME(created_at) as months, COUNT(*) as total,
                            COUNT(CASE WHEN product_type = 101 THEN status END) AS digital,
                            COUNT(CASE WHEN product_type = 102 THEN status END) AS physical")
                    ->whereYear('created_at', $year)
                    ->groupBy('months')
                    ->get()
                    ->map(function ($item) {
                        return [
                            $item->months => [
                                'total' => $item->total,
                                'digital' => $item->digital,
                                'physical' => $item->physical,
                            ]
                        ];
                    })->toArray()
            )),
            ['total' => 0, 'digital' => 0, 'physical' => 0]
        );



        $orderSum = Order::where('payment_status', Order::PAID)->posOrder()->inhouseOrder()->sum('amount');
        $paymentCharge = PaymentLog::where('status', PaymentLog::SUCCESS)->sum('charge');

        $data['order_payment'] = num_format($orderSum);
        $data['total_customer'] = User::count();
        $data['total_seller'] = Seller::count();
        $data['total_payment'] = num_format($orderSum + $paymentCharge);
        $data['physical_product'] = Product::inhouseProduct()->physical()->whereYear('created_at', $year)->count();

        $data['pos_order'] = Order::inhouseOrder()->posOrder()->inhouseOrder()->count();
        $data['processing_order'] = Order::inhouseOrder()->posOrder()->inhouseOrder()->processing()->count();
        $data['shipped_order'] = Order::inhouseOrder()->posOrder()->inhouseOrder()->shipped()->count();
        $data['cancel_order'] = Order::inhouseOrder()->posOrder()->inhouseOrder()->cancel()->count();
        $data['confirmed_order'] = Order::inhouseOrder()->posOrder()->inhouseOrder()->confirmed()->count();
        $data['placed_order'] = Order::inhouseOrder()->posOrder()->inhouseOrder()->placed()->count();
        $data['delivered_order'] = Order::inhouseOrder()->posOrder()->inhouseOrder()->delivered()->count();

        $orderStatus = array_flip(Order::delevaryStatus());

        $data['monthly_order_report'] = Order::posOrder()->whereMonth('created_at', now()->month)
            ->selectRaw('COUNT(*) as count, status')
            ->groupBy('status')
            ->pluck('count', 'status')
            ->mapWithKeys(function ($count, $status) use ($orderStatus) {
                return [Arr::get($orderStatus, $status) => $count];
            })->toArray();

        $data['earning_per_months'] = sort_by_month(Order::posOrder()->where('payment_status', Order::PAID)
            ->selectRaw("MONTHNAME(created_at) as months, SUM(amount) as total")
            ->whereYear('created_at', $year)
            ->groupBy('months')
            ->pluck('total', 'months')
            ->toArray());

        $data['monthly_payment_charge'] = sort_by_month(PaymentLog::where('status', PaymentLog::SUCCESS)
            ->selectRaw("MONTHNAME(created_at) as months, SUM(charge) as total")
            ->whereYear('created_at', $year)
            ->groupBy('months')
            ->pluck('total', 'months')
            ->toArray());

        $data['monthly_withdraw_charge'] = sort_by_month(Withdraw::where('status', PaymentLog::SUCCESS)
            ->selectRaw("MONTHNAME(created_at) as months, SUM(charge) as total")
            ->whereYear('created_at', $year)
            ->groupBy('months')
            ->pluck('total', 'months')
            ->toArray());

        $data['top_categories'] = Category::withCount('product')->top()->get();

        $data['order_by_year'] = sort_by_month(
            array_merge(...array_map(
                function ($month) {
                    return [key($month) => reset($month)];
                },
                Order::selectRaw("MONTHNAME(created_at) as months, COUNT(*) as total,
                                COUNT(CASE WHEN source = 'pos' THEN 1 END) as pos,
                                COUNT(CASE WHEN source = 'web' THEN 1 END) as web")
                    ->whereYear('created_at', $year)
                    ->groupBy('months')
                    ->get()
                    ->map(function ($item) {
                        return [
                            $item->months => [
                                'total' => $item->total,
                                'pos' => $item->pos,
                                'web' => $item->web,
                            ]
                        ];
                    })->toArray()
            )),
            ['total' => 0, 'pos' => 0, 'web' => 0]
        );

        $data['product_sell_by_month'] = sort_by_month(OrderDetails::selectRaw("MONTHNAME(created_at) as month, count(DISTINCT product_id) as total_products")
            ->whereYear('created_at', $year)
            ->groupBy('month')
            ->pluck('total_products', 'month')
            ->toArray());

        $data['product_sell_by_month_pos'] = sort_by_month(OrderDetails::posOrder()->selectRaw("MONTHNAME(created_at) as month, count(DISTINCT product_id) as total_products")
            ->whereYear('created_at', $year)
            ->groupBy('month')
            ->pluck('total_products', 'month')
            ->toArray());






        $data['latest_orders'] = Order::latest()->with(['customer', 'shipping'])->posOrder()->inhouseOrder()->take(5)->get();
        $data['latest_transaction'] = Transaction::with(['user', 'seller'])->latest()->take(5)->get();
        $data['best_selling_product'] = Product::with(['category', 'order'])
            ->whereIn('status', [ProductStatus::NEW , ProductStatus::PUBLISHED])
            ->where('product_type', ProductType::PHYSICAL_PRODUCT)
            ->where('best_selling_item_status', ProductStatus::BESTSELLING)
            ->take(5)->get();

        $data['web_visitors'] = sort_by_month(Order::selectRaw("MONTHNAME(created_at) as month, count(*) as total")
            ->whereYear('created_at', $year)
            ->where('source', 'pos')
            ->groupBy('month')
            ->pluck('total', 'month')
            ->toArray());


        return ['status' => true, 'data' => $data];
    }




    public function getSellerDashboardData(): array
    {
        $seller = auth_user('seller');

        $data['physical'] = Product::sellerProduct()->physical()->where('seller_id', $seller->id)->count();

        $order['order'] = $this->countOrders($seller->id);
        $order['placed'] = $this->countOrders($seller->id, 'placed');
        $order['shipped'] = $this->countOrders($seller->id, 'shipped');
        $order['canceled'] = $this->countOrders($seller->id, 'cancel');
        $order['delivered'] = $this->countOrders($seller->id, 'delivered');

        $transactions = Transaction::whereNotNull('seller_id')
            ->where('seller_id', $seller->id)
            ->pos()
            ->latest()
            ->take(8)
            ->get();

        $salesReport = [
            'month' => collect(),
            'order_count' => collect(),
        ];

        $orderinfo = Order::sellerOrder()->physicalOrder()->posOrder()
            ->whereHas('orderDetails', function ($q) use ($seller) {
                $q->whereHas('product', function ($query) use ($seller) {
                    $query->where('seller_id', $seller->id);
                });
            })
            ->selectRaw("count(*) as order_count, DATE_FORMAT(created_at,'%M %Y') as months")
            ->groupBy('months')
            ->get();

        $orderinfo->each(function ($query) use (&$salesReport) {
            $salesReport['month']->push($query->months);
            $salesReport['order_count']->push($query->order_count);
        });

        $monthlyOrderReport = Order::sellerOrder()->physicalOrder()->posOrder()
            ->whereHas('orderDetails', function ($q) use ($seller) {
                $q->whereHas('product', function ($query) use ($seller) {
                    $query->where('seller_id', $seller->id);
                });
            })
            ->whereMonth('created_at', Carbon::now()->month)
            ->selectRaw('COUNT(*) AS all_orders')
            ->selectRaw('COUNT(CASE WHEN status = 1 THEN status END) AS placed')
            ->selectRaw('COUNT(CASE WHEN status = 2 THEN status END) AS confirmed')
            ->selectRaw('COUNT(CASE WHEN status = 3 THEN status END) AS processing')
            ->selectRaw('COUNT(CASE WHEN status = 4 THEN status END) AS shipped')
            ->selectRaw('COUNT(CASE WHEN status = 5 THEN status END) AS delivered')
            ->selectRaw('COUNT(CASE WHEN status = 6 THEN status END) AS cancel')
            ->get()
            ->map(function ($item) {
                return [
                    'all_orders' => $item->all_orders,
                    'placed' => $item->placed,
                    'confirmed' => $item->confirmed,
                    'processing' => $item->processing,
                    'shipped' => $item->shipped,
                    'delivered' => $item->delivered,
                    'cancel' => $item->cancel,
                ];
            })->first();


        return [
            'data' => [
                'title' => translate('Seller dashboard'),
                'seller' => $seller,
                'data' => $data,
                'order' => $order,
                'salesReport' => $salesReport,
                'monthlyOrderReport' => array_values($monthlyOrderReport),
                'transactions' => $transactions
            ]
        ];
    }

    private function countOrders(int $sellerId, string $status = null): int
    {
        $query = Order::sellerOrder()->physicalOrder()->posOrder();


        if ($status) {
            $query = $query->$status();
        }

        return $query->whereHas('orderDetails', function ($q) use ($sellerId) {
            $q->whereHas('product', function ($query) use ($sellerId) {
                $query->where('seller_id', $sellerId);
            });
        })->count();
    }


    /**
     * Get a specific seller dashboard overview data
     *
     * @param Seller $seller
     * @return array
     */
    public function getDashboardOverview($user): array
    {
        $isSeller = $user instanceof Seller;

        $productQuery = Product::sellerProduct()->physical();
        $productQuery = $isSeller
            ? $productQuery->where('seller_id', $user->id)
            : $productQuery->whereNull('seller_id');

        $data['total_physical_product'] = $productQuery->count();

        $baseOrderQuery = Order::query()
            ->physicalOrder()
            ->posOrder();

        $baseOrderQuery = $isSeller
            ? $baseOrderQuery->sellerOrder($user->id)
            : $baseOrderQuery->adminOrder();

        $data['total_physical_order'] = (clone $baseOrderQuery)->count();
        $data['total_placed_order'] = (clone $baseOrderQuery)->placed()->count();
        $data['total_shipped_order'] = (clone $baseOrderQuery)->shipped()->count();
        $data['total_cancel_order'] = (clone $baseOrderQuery)->cancel()->count();
        $data['total_delivered_order'] = (clone $baseOrderQuery)->delivered()->count();

        return $data;
    }



    /**
     * Get seller dashboard data 
     *
     * @param Seller|null $seller
     * @return array
     */
    public function getGraphData($user): array
    {
        $isSeller = $user instanceof Seller;

        // === YEARLY ORDER REPORT ===
        $orderQuery = Order::query()
            ->posOrder()
            ->whereYear('created_at', date('Y'));

        $orderQuery = $isSeller
            ? $orderQuery->sellerOrder($user->id)
            : $orderQuery->adminOrder();

        $rawYearlyData = $orderQuery
            ->selectRaw("MONTHNAME(created_at) as months")
            ->selectRaw("COUNT(*) as total")
            ->selectRaw("COUNT(CASE WHEN order_type = 101 THEN 1 END) as digital")
            ->selectRaw("COUNT(CASE WHEN order_type = 102 THEN 1 END) as physical")
            ->groupBy('months')
            ->get()
            ->map(function ($order) {
                return [
                    $order->months => [
                        'total' => $order->total,
                        'digital' => $order->digital,
                        'physical' => $order->physical,
                    ]
                ];
            })
            ->toArray();

        $data['yearly_order_report'] = sort_by_month(array_merge(...array_map(function ($month) {
            return [key($month) => reset($month)];
        }, $rawYearlyData)), [
            'total' => 0,
            'digital' => 0,
            'physical' => 0,
        ]);


        // === MONTHLY ORDER REPORT ===
        $monthlyQuery = Order::query()
            ->posOrder()
            ->whereMonth('created_at', Carbon::now()->month);

        $monthlyQuery = $isSeller
            ? $monthlyQuery->sellerOrder($user->id)
            : $monthlyQuery->adminOrder();

        $data['monthly_order_report'] = $monthlyQuery
            ->selectRaw('COUNT(CASE WHEN status = 1 THEN status END) AS placed')
            ->selectRaw('COUNT(CASE WHEN status = 2 THEN status END) AS confirmed')
            ->selectRaw('COUNT(CASE WHEN status = 3 THEN status END) AS processing')
            ->selectRaw('COUNT(CASE WHEN status = 4 THEN status END) AS shipped')
            ->selectRaw('COUNT(CASE WHEN status = 5 THEN status END) AS delivered')
            ->selectRaw('COUNT(CASE WHEN status = 6 THEN status END) AS cancel')
            ->first()
            ->toArray();

        return $data;
    }



    /**
     * Get latest transaction
     *
     * @param Seller|null $seller
     * @param integer $take
     * @return Collection
     */
    public function getLatestTransaction($user, int $take = 5): Collection
    {
        $query = Transaction::query()->latest()->take($take);

        if ($user instanceof Seller) {
            $query->where('seller_id', $user->id);
        } elseif ($user instanceof \App\Models\Admin) {
            $query->whereNull('seller_id');
        }

        return $query->get();
    }



}