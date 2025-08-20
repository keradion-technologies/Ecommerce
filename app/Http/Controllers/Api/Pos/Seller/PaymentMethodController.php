<?php

namespace App\Http\Controllers\Api\Pos\Seller;

use App\Http\Controllers\Controller;
use App\Http\Requests\Seller\Pos\PaymentMethodRequest;
use App\Http\Resources\Pos\PaymentLogCollection;
use App\Http\Resources\Pos\PaymentMethodCollection;
use App\Http\Resources\Pos\PaymentMethodResource;
use App\Http\Resources\Pos\TransactionCollection;
use App\Models\PaymentMethod;
use Illuminate\Http\Request;
use App\Http\Services\Pos\PaymentMethodService;

class PaymentMethodController extends Controller
{
    protected $paymentMethodService;

    public function __construct(PaymentMethodService $paymentMethodService)
    {
        $this->paymentMethodService = $paymentMethodService;
    }

    public function paymentMethods(Request $request)
    {
        $response = $this->paymentMethodService->getPaymentMethods(auth_user('seller:api'));

        return $response['status']
            ? api(['message' => $response['message'], 'orders' => new PaymentMethodCollection($response['data']) ])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));
    }

    public function store(PaymentMethodRequest $request)
    {
        $response = $this->paymentMethodService->storePaymentMethod($request, auth_user('seller:api'));

        return $response['status']
            ? api(['message' => $response['message'], 'payment_method' => new PaymentMethodResource($response['data'])])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));
    }

    public function update(PaymentMethodRequest $request)
    {
        if (!$request->has('id')) {
            return api(['errors' => [translate('Payment method ID is required')]])->fails(__('response.fail'));
        }

        $paymentMethod = PaymentMethod::find($request->input('id'));

        if (!$paymentMethod) {
            return api(['errors' => [translate('Payment method not found')]])->fails(__('response.fail'));
        }


        $response = $this->paymentMethodService->paymentMethodUpdate($request, auth_user('seller:api') , $paymentMethod);
        return $response['status']
            ? api(['message' => $response['message'], 'payment_method' => new PaymentMethodResource($response['data'])])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));
    }

    public function destroy( $id)
    {
    
        $paymentMethod = PaymentMethod::find($id);

        if (!$paymentMethod) {
            return api(['errors' => [translate('Payment method not found')]])->fails(__('response.fail'));
        }

        $response = $this->paymentMethodService->deletePaymentMethod($paymentMethod);

        return $response['status']
            ? api(['message' => $response['message']])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));
    }


    public function paymentLogs(Request $request)
    {
        $response = $this->paymentMethodService->getPaymentLogs(auth_user('seller:api'));   
        return $response['status']
            ? api(['message' => $response['message'], 'payment_logs' => new PaymentLogCollection($response['data']) ])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail')); 
    }

    public function tansactionLogs(Request $request)
    {
        $response = $this->paymentMethodService->getTransactionLogs(auth_user('seller:api'));   
        return $response['status']
            ? api(['message' => $response['message'], 'transaction_logs' => new TransactionCollection($response['data'])])->success(__('response.success'))
            : api(['errors' => [$response['message']]])->fails(__('response.fail'));
    }
}
