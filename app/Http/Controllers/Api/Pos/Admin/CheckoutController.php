<?php

namespace App\Http\Controllers\Api\Pos\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Pos\AddressStoreRequest;
use App\Http\Requests\Api\Pos\CheckoutRequest;
use App\Http\Resources\AddressResource;
use App\Http\Resources\Pos\AddressCollection;
use App\Http\Resources\Pos\OrderDetailsCollection;
use App\Http\Resources\Pos\OrderResource;
use App\Http\Services\Pos\CheckoutService;
use Illuminate\Http\Request;

class CheckoutController extends Controller
{
    protected $checkoutService;

    public function __construct(CheckoutService $checkoutService)
    {
        $this->checkoutService = $checkoutService;
    }

    public function processCheckout(CheckoutRequest $request)
    {
        
        $response = $this->checkoutService->placeOrder($request, auth()->guard('admin:api')->user());


        return $response['status']
            ? api([
                'message'   => $response['message'],
                'order'     => new OrderResource($response['data']),
                'order_detials' => new OrderDetailsCollection($response['order_details']),
                ])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));
    }

    public function storeAddress(AddressStoreRequest $request)
    {
        $response = $this->checkoutService->storeAddress($request);

        return $response['status']
            ? api(['message' => $response['message'], 'address' => new AddressResource($response['data'])])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));

    }

    public function getAddressList($userId)
    {
        $response = $this->checkoutService->getAddressList($userId);

        return $response['status']
            ? api(['addresses' => new AddressCollection($response['data'])])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));

    }

    public function orderShow($id)
    {
        $response = $this->checkoutService->getOrderById($id);

        return $response['status']
            ? api(['order' => new OrderResource($response['data'])])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));
    }

    
    

}
