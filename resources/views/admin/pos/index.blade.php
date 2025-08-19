@extends('admin.layouts.app')
@push('style-include')
    <!-- POS CSS -->
    <link href="{{asset('assets/global/css/pos/all.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('assets/global/css/pos/style.css')}}" rel="stylesheet" type="text/css">
    <link href="{{asset('assets/global/css/pos/customer-search-dropdown.css')}}" rel="stylesheet" type="text/css">

    <link href="{{asset('assets/global/css/pos/media.css')}}" rel="stylesheet" type="text/css">
    <link href="{{asset('assets/global/css/pos/productcard.css')}}" rel="stylesheet" type="text/css">
    <link href="{{asset('assets/global/css/pos/payment-method.css')}}" rel="stylesheet" type="text/css">
    <link href="{{asset('assets/global/css/pos/order-summary.css')}}" rel="stylesheet" type="text/css">
    <link href="{{asset('assets/global/css/pos/checkout-modal.css')}}" rel="stylesheet" type="text/css">
    <link href="{{asset('assets/global/css/pos/main.css')}}" rel="stylesheet" type="text/css">
    <link href="{{asset('assets/global/css/pos/address-card-style.css')}}" rel="stylesheet" type="text/css">

@endpush
@push('style-push')
    <style>

    </style>
@endpush
@section('main_content')
    @include('pos.partials.main_content')

    @include('pos.modals.select_option')

    @include('pos.modals.add_customer')

    @include('pos.modals.checkout')

    @include('pos.modals.held_orders')

    @include('pos.modals.coupon')

    @include('pos.modals.discount')

    @include('pos.modals.shipping')
    @include('pos.modals.invoice')

@endsection

@push('script-include')
    <script src="{{asset('assets/global/js/pos/html5-qrcode.js')}}"></script>
@endpush


@push('script-push')
    @include('pos.partials.script' , ['prefix' => 'admin'])
@endpush