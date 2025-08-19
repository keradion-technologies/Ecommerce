<?php

namespace App\Http\Controllers\Api\Pos\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Pos\AddToCartRequest;
use App\Http\Requests\Api\Pos\UpdateCartRequest;
use App\Http\Resources\Pos\CartHoldCollection;
use App\Http\Resources\Pos\PosCartCollection;
use App\Http\Services\Pos\CartService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class CartController extends Controller
{
    protected $cartService;

    public function __construct(CartService $cartService)
    {
        $this->cartService = $cartService;
    }

    public function add(AddToCartRequest $request): JsonResponse
    {
        $response = $this->cartService->addToCart($request, auth()->guard('admin:api')->user());

        return $response['status']
            ? api(['message' => $response['message']])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));
    }

    public function update(UpdateCartRequest $request): JsonResponse
    {
        $response = $this->cartService->updateCart($request, auth()->guard('admin:api')->user());

        return $response['status']
            ? api(['message' => $response['message']])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));
    }

    public function show()
    {
        $cartItems = $this->cartService->getCartItems(auth()->guard('admin:api')->user());

        return api([
            'carts' => new PosCartCollection($cartItems),
        ])->success(__('response.success'));


    }

    public function remove($cartId): JsonResponse
    {
        $response = $this->cartService->removeFromCart($cartId, auth()->guard('admin:api')->user());

        return $response['status']
            ? api(['message' => $response['message']])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));
    }

    public function hold(): JsonResponse
    {
        $response = $this->cartService->holdCart(auth()->guard('admin:api')->user());

        return $response['status']
            ? api(['message' => $response['message']])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));
    }

    public function restore($holdUid): JsonResponse
    {
        $response = $this->cartService->restoreCart($holdUid, auth()->guard('admin:api')->user());

        return $response['status']
            ? api(['message' => $response['message']])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));
    }

    public function holdList()
    {
        $response = $this->cartService->getHoldList(auth()->guard('admin:api')->user());

        return api(['hold_list' => new CartHoldCollection($response['data'] ?? [])])->success(__('response.success'));
        
    }

    public function applyCoupon(Request $request)
    {
        $response = $this->cartService->applyCoupon($request);

        return $response['status']
            ? api(
                [
                    'message' => $response['message'],
                    'code' => $response['code'],
                    'amount' => $response['amount']
                ]
            )->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));
    }

}
