<?php

namespace App\Http\Controllers\Api\Pos\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Pos\CreateCustomerRequest;
use App\Http\Resources\Pos\UserCollection;
use App\Http\Services\Pos\CustomerService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class CustomerController extends Controller
{
    protected $customerService;

    public function __construct(CustomerService $customerService)
    {
        $this->customerService = $customerService;
    }
    

    public function index(Request $request): JsonResponse
    {
        $customers = $this->customerService->getCustomerList();

        return api([
            'customers' => new UserCollection($customers),
        ])->success(__('response.success'));

    }

    public function store(CreateCustomerRequest $request): JsonResponse
    {
        $customer = $this->customerService->createCustomer($request);

        return api([
            'customer' => $customer,
            
        ])->success(__('response.success'));
    }
}
