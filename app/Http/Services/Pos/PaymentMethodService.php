<?php

namespace App\Http\Services\Pos;

use App\Models\PaymentLog;
use App\Models\PaymentMethod;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;


class PaymentMethodService
{
    public function getPaymentMethods($user)
    {
        $methods = $user instanceof \App\Models\Admin
            ? PaymentMethod::with('currency')->search()->pos()->where('type', 3)->get()
            : PaymentMethod::with('currency')->search()->pos()->forSeller($user->id)->where('type', 3)->get();

        return [
            'status' => $methods->isNotEmpty(),
            'message' => $methods->isNotEmpty()
                ? translate('Payment methods found')
                : translate('No payment method found'),
            'data' => $methods,
        ];
    }

    public function storePaymentMethod(Request $request, $user)
    {
        $paymentMethod = new PaymentMethod();

        $paymentMethod->currency_id = $request->input('currency_id');
        $paymentMethod->name = $request->input('name');
        $paymentMethod->percent_charge = $request->input('percent_charge');
        $paymentMethod->rate = $request->input('rate');
        $paymentMethod->status = PaymentMethod::ACTIVE;
        $paymentMethod->type = PaymentMethod::POS;
        $paymentMethod->unique_code = strtoupper(Str::slug($request->input('name'), '_'));


        if ($user instanceof \App\Models\Admin) {
            $paymentMethod->owner_type = 'admin';
            $paymentMethod->owner_id = $user->id;
        } else {
            $paymentMethod->owner_type = 'seller';
            $paymentMethod->owner_id = $user->id;
        }

        $paymentMethod->payment_parameter = collect($request->input('data_name', []))->map(
            function (string $value, int $key) use ($request) {
                return [
                    'name' => t2k($value),
                    'type' => Arr::get($request->input('type', []), $key, 'text'),
                    'is_required' => Arr::get($request->input('required', []), $key) === 'required',
                ];
            }
        );

        if ($request->hasFile('image')) {
            try {
                $paymentMethod->image = store_file(
                    file: $request->file('image'),
                    location: file_path()['payment_method']['path'],
                    removefile: $paymentMethod->image ?? null
                );
            } catch (\Exception $e) {

            }
        }

        $paymentMethod->save();

        return $response = [
            'status' => true,
            'message' => translate('Payment method created successfully'),
            'data' => $paymentMethod,
        ];
    }

    public function paymentMethodUpdate(Request $request, $user, PaymentMethod $paymentMethod)
    {
        $paymentMethod->name = $request->input('name');
        $paymentMethod->currency_id = $request->input('currency_id');
        $paymentMethod->percent_charge = $request->input('percent_charge');
        $paymentMethod->rate = $request->input('rate');
        $paymentMethod->status = $request->input('status');

        $parameter = match ($paymentMethod->type) {
            PaymentMethod::AUTOMATIC => $this->getAutomaticParameters($paymentMethod, $request),
            PaymentMethod::MANUAL,
            PaymentMethod::POS => $this->getManualOrPosParameters($request),
            default => [],
        };

        $paymentMethod->payment_parameter = $parameter;

        if ($request->hasFile('image')) {
            try {
                $paymentMethod->image = store_file(
                    file: $request->file('image'),
                    location: file_path()['payment_method']['path'],
                    removefile: $paymentMethod->image ?: null
                );
            } catch (\Exception $e) {
            }
        }

        $paymentMethod->save();

        return $response = [
            'status' => true,
            'message' => translate('Payment method has been updated'),
            'data' => $paymentMethod,
        ];
    }

    private function getAutomaticParameters(PaymentMethod $paymentMethod, Request $request)
    {
        $params = [];

        foreach ($paymentMethod->payment_parameter as $key => $value) {
            $params[$key] = $request->method[$key] ?? null;
        }

        return $params;
    }

    private function getManualOrPosParameters(Request $request)
    {
        return collect($request->input('data_name', []))->map(function (string $value, int $key) use ($request) {
            $types = $request->input('type', []);
            $required = $request->input('required', []);

            return [
                'name' => t2k($value),
                'type' => Arr::get($types, $key, 'text'),
                'is_required' => Arr::get($required, $key) === 'required',
            ];
        });
    }

    public function deletePaymentMethod($paymentMethod)
    {
        if ($paymentMethod->image) {
            remove_file(file_path()['payment_method']['path'], $paymentMethod->image);
        }

        $paymentMethod->delete();

        return [
            'status' => true,
            'message' => translate('Payment method deleted successfully'),
        ];
    }

    public function getPaymentLogs($user, ?string $status = null)
    {
        $query = PaymentLog::query()
            ->date()
            ->search()
            ->filter()
            ->latest()
            ->with('user', 'order', 'paymentGateway', 'paymentGateway.currency');

        if ($user instanceof \App\Models\Admin) {
            $query->adminLogs();
        } else {
            $query->sellerLogs($user->id);
        }

        $statusMap = [
            'pending' => 1,
            'approved' => 2,
            'rejected' => 3,
        ];

        if ($status && isset($statusMap[$status])) {
            $query->where('status', $statusMap[$status]);
        }

        $logs = $query->paginate(site_settings('pagination_number', 10))
            ->appends(request()->all());

        return [
            'status' => $logs->isNotEmpty(),
            'message' => $logs->isNotEmpty() ? translate('Payment logs found') : translate('No payment logs found'),
            'data' => $logs,
        ];
    }


    public function getTransactionLogs($user)
    {
        $logs = $user instanceof \App\Models\Admin
            ? Transaction::adminLogs()
                ->date()
                ->search()
                ->paginate(site_settings('pagination_number', 10))
                ->appends(request()->all())
            : Transaction::sellerLogs($user->id)
                ->date()
                ->search()
                ->paginate(site_settings('pagination_number', 10))
                ->appends(request()->all());

        if ($logs->isEmpty()) {
            return $response = [
                'status' => false,
                'message' => translate('No transaction logs found'),
                'data' => [],
            ];
        }

        return $response = [
            'status' => true,
            'message' => translate('Transaction logs found'),
            'data' => $logs,
        ];

    }







}