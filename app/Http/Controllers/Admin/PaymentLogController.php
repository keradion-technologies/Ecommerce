<?php

namespace App\Http\Controllers\Admin;

use App\Enums\PaymentType;
use App\Http\Controllers\Controller;
use App\Traits\ExportAble;
use Illuminate\Http\Request;
use App\Models\PaymentLog;
use Carbon\Carbon;
use Illuminate\View\View;

class PaymentLogController extends Controller
{
    use ExportAble;

    public function __construct()
    {
        $this->middleware(['permissions:view_log']);
    }
    public function index(): View
    {
        $title = translate('Payments log');
        $paymentLogs = PaymentLog::latest()
            ->adminLogs()
            ->order()
            ->search()
            ->web()
            ->date()
            ->where('status', '!=', 0)
            ->with('user', 'order', 'paymentGateway', 'paymentGateway.currency')
            ->paginate(site_settings('pagination_number', 10));
        return view('admin.payment_log.index', compact('title', 'paymentLogs'));
    }

    public function pending(): View
    {
        $title = translate('Pending payments log');
        $paymentLogs = PaymentLog::with(['order'])->adminLogs()->latest()
            ->order()->search()->web()->date()->where('status', 1)->with('user', 'paymentGateway', 'paymentGateway.currency')->paginate(site_settings('pagination_number', 10));
        return view('admin.payment_log.index', compact('title', 'paymentLogs'));
    }

    public function approved(): View
    {
        $title = translate('Approved payments log');
        $paymentLogs = PaymentLog::with(['order'])->adminLogs()->latest()
            ->order()->search()->web()->date()->where('status', 2)->with('user', 'paymentGateway', 'paymentGateway.currency')->paginate(site_settings('pagination_number', 10));
        return view('admin.payment_log.index', compact('title', 'paymentLogs'));
    }

    public function rejected(): View
    {
        $title = translate('Rejected payments log');
        $paymentLogs = PaymentLog::with(['order'])->adminLogs()->latest()
            ->order()->search()->web()->date()->where('status', 3)->with('user', 'paymentGateway', 'paymentGateway.currency')->paginate(site_settings('pagination_number', 10));
        return view('admin.payment_log.index', compact('title', 'paymentLogs'));
    }

    public function paymentLogCsv(): \Symfony\Component\HttpFoundation\StreamedResponse
    {
        $fileHeaders = ['TIME', 'USER', 'METHOD', 'AMOUNT', 'FINAL_AMOUNT'];
        $pluckableKeys = ['created_at', ['user', 'email'], ['paymentGateway', 'name'], 'amount', 'final_amount'];
        $condition = [
            'type' => PaymentType::ORDER->value
        ];

        return $this->csvExport('PaymentLog', 'deposit_log', $fileHeaders, $pluckableKeys, $condition);
    }

    public function posPaymentLogs()
    {
        $status = match (true) {
            request()->routeIs('admin.pos.system.payment.pending') => 1,
            request()->routeIs('admin.pos.system.payment.approved') => 2,
            request()->routeIs('admin.pos.system.payment.rejected') => 3,
            default => null,
        };

        $titleMap = [
            null => 'POS Payment Logs',
            1 => 'Pending POS Payments',
            2 => 'Approved POS Payments',
            3 => 'Rejected POS Payments',
        ];

        $title = translate($titleMap[$status]);

        $query = PaymentLog::adminLogs()
            ->pos()
            ->with('user', 'order', 'paymentGateway', 'paymentGateway.currency')
            ->latest()
            ->date()
            ->filter();

        if (!is_null($status)) {
            $query->where('status', $status);
        } else {
            $query->where('status', '!=', 0);
        }

        $paymentLogs = $query->paginate(site_settings('pagination_number', 10))
            ->appends(request()->all());

        return view('admin.payment_log.index', compact('title', 'paymentLogs'));
    }


}
