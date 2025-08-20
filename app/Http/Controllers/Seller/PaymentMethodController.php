<?php

namespace App\Http\Controllers\Seller;

use App\Http\Controllers\Controller;
use App\Http\Requests\Seller\Pos\PaymentMethodRequest;
use App\Http\Services\Pos\PaymentMethodService;
use Illuminate\Http\Request;
use App\Models\PaymentMethod;
use App\Models\Currency;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Arr;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules\RequiredIf;

class PaymentMethodController extends Controller
{
    protected $paymentMethodService;
    public function __construct(PaymentMethodService $paymentMethodService)
    {
        $this->paymentMethodService = $paymentMethodService;
    }



    /**
     * Get all payment methods
     *
     * @return View
     */
    public function index(): View
    {

        $title = translate('POS Payment methods');
        $seller = auth_user('seller');

        $response = $this->paymentMethodService->getPaymentMethods(auth_user('seller'));

        $paymentMethods = $response['data'];

        return view('seller.payment.index', compact('title', 'paymentMethods'));
    }




    /**
     * Create a payment method
     *
     * @return View
     */
    public function create(): View
    {

        $title = translate('Payment method create');
        $currencies = Currency::latest()->get();
        return view('seller.payment.create', compact('title', 'currencies'));
    }





    /**
     * Store a manual payment method
     *
     * @param Request $request
     * @return RedirectResponse
     */
    public function store(PaymentMethodRequest $request)
    {

        $response = $this->paymentMehthodService->storePaymentMethod($request, auth_user('seller'));

        $messageType = $response['status'] ? 'success' : 'error';

        return back()->with($messageType, $response['message']);


    }


    /**
     * Edit a payment method
     *
     * @param string $slug
     * @param integer $id
     * @return View
     */
    public function edit(string $slug, int $id): View
    {

        $title = translate('Payment method update');
        $paymentMethod = PaymentMethod::findOrFail($id);
        $currencies = Currency::latest()->get();

        return view('seller.payment.edit', compact('title', 'paymentMethod', 'currencies'));
    }


    /**
     * Update a payment method
     *
     * @param Request $request
     * @param integer $id
     * @return RedirectResponse
     */
    public function update(PaymentMethodRequest $request, int $id): RedirectResponse
    {
        $response = $this->paymentMethodService->paymentMethodUpdate($request, auth_user('seller'), PaymentMethod::findOrFail($id));

        $messageType = $response['status'] ? 'success' : 'error';

        return back()->with($messageType, $response['message']);
    }


    /**
     * delete a payment method
     *
     * @param integer $id
     * @return RedirectResponse
     */
    public function delete(int $id): RedirectResponse
    {
        $paymentMethod = PaymentMethod::findOrFail($id);

        $response = $this->paymentMethodService->deletePaymentMethod($paymentMethod);


        $messageType = $response['status'] ? 'success' : 'error';

        return back()->with($messageType, $response['message']);


    }

    public function logs()
    {
        $route = request()->route()->getName();

        $status = match (true) {
            request()->routeIs('seller.payment.pending') => 'pending',
            request()->routeIs('seller.payment.approved') => 'approved',
            request()->routeIs('seller.payment.rejected') => 'rejected',
            default => 'all',
        };

        $statusTitles = [
            'all' => 'Payment logs',
            'pending' => 'Pending payments',
            'approved' => 'Approved payments',
            'rejected' => 'Rejected payments',
        ];

        $title = translate($statusTitles[$status]);

        $response = $this->paymentMethodService->getPaymentLogs(auth_user('seller'), $status);
        $paymentLogs = $response['data'];

        return view('seller.payment_log.index', compact('title', 'paymentLogs'));
    }



}
