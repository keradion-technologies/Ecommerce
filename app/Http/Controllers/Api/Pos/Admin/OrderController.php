<?php

namespace App\Http\Controllers\Api\Pos\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\Pos\OrderCollection;
use App\Http\Resources\Pos\OrderResource;
use App\Http\Services\Pos\OrderService;
use Illuminate\Http\Request;

class OrderController extends Controller
{

    protected $orderService;

    public function __construct(OrderService $orderService)
    {
        $this->orderService = $orderService;
    }
    public function list()
    {
        $response = $this->orderService->getOrderList(auth_user('admin:api'));

        return $response['status']
            ? api(['message' => $response['message'], 'orders' => new OrderCollection($response['data'])])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));

    }


    public function show($id)
    {
        $response = $this->orderService->getOrderById($id);

        return $response['status']
            ? api(['message' => $response['message'], 'order' => new OrderResource($response['data'])])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));


    }
}
