<?php

namespace App\Http\Services\Pos;

use App\Models\Order;

class OrderService
{
    public function getOrderList($user)
    {
        $response = ['status' => false, 'message' => 'Couuld not fetch orders', 'data' => []];

        $orders = Order::with('billingAddress' , 'customer')
            ->physicalOrder()
            ->posOrder()
            ->when($user instanceof \App\Models\Seller, fn($q) => $q->sellerOrder($user->id))
            ->when($user instanceof \App\Models\Admin, fn($q) => $q->adminOrder())
            ->latest()
            ->get();

        if ($orders->isNotEmpty()) {
            $response = ['status' => true, 'message' => 'Order retrived Successfully', 'data' => $orders];
        }

        return $response;
    }

    public function getOrderById($id)
    {
        $order = Order::with('billingAddress' ,'customer')->find($id);

        if (!$order) return $response = ['status' => false,'message'=> 'Order not found','data'=> []];

        return $response = ['status' => true , 'message' => 'order retrived successfully' , 'data' => $order];

    }
}
