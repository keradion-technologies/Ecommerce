<div class="page-content">
    <div class="container-fluid">

        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
            <h4 class="mb-sm-0">
                {{translate($title)}}
            </h4>
            @php
                $route = Route::is('admin.*')
                    ? route('admin.dashboard')
                    : route('seller.dashboard');
            @endphp

            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="{{$route}}">
                            {{translate('Dashboard')}}
                        </a></li>
                    <li class="breadcrumb-item active">
                        {{translate("Pos")}}
                    </li>
                </ol>
            </div>

        </div>

        <div class="row">
            <div class="col-9">
                <div class="card">
                    <div class="product-header">
                        <div class="product-header-content">
                            <div class="product-title-section">
                                <div class="product-accent-bar"></div>
                                <h5 class="product-title">{{ translate('Products') }}</h5>
                            </div>

                            <div class="product-action-buttons">
                                <button id="scan-barcode-btn" class="product-btn product-btn-primary">
                                    <i class="fas fa-barcode"></i>
                                    <span class="product-btn-text">{{ translate('Scan Barcode') }}</span>
                                </button>

                                <button id="held-orders-btn" class="product-btn product-btn-warning">
                                    <i class="fas fa-clock"></i>
                                    <span class="product-btn-text">{{ translate('Held Orders') }}</span>
                                </button>
                            </div>
                        </div>

                        <div id="barcode-scanner" class="product-barcode-scanner">
                        </div>
                    </div>

                    <div class="card-body border border-dashed border-end-0 border-start-0">

                        <div class="row">
                            <div class="col-md-3">
                                <select name="category_id" id="category_id" class="form-select w-100 selectItem"
                                    data-placeholder="Select category">
                                    <option value="">{{translate('--Select One--')}}</option>
                                    @foreach($categories as $category)
                                    <option {{old('category_id') == $category->id ? "selected" : ''}}
                                        value="{{$category->id}}">
                                        {{(@get_translation($category->name))}}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="col-md-3">
                                <select name="brand_id" id="brand_id" class="form-select w-100 selectItem"
                                    data-placeholder="Select Brand">
                                    <option value="">{{translate('--Select One--')}}</option>
                                    @foreach($brands as $brand)
                                    <option {{old('brand_id') == $brand->id ? "selected" : ''}}
                                        value="{{$brand->id}}">
                                        {{(@get_translation($brand->name))}}</option>
                                    @endforeach
                                </select>
                            </div>


                            <div class="col-md-3">
                                <div class="search-wrapper">
                                    <form method="GET" class="search-bar w-100">
                                        <div class="search">
                                            <i class="fa fa-search"></i>
                                            <input id="search-text" type="search"
                                                placeholder="{{ translate('What are you looking for?') }}" name="search"
                                                value="" class="form-control">
                                        </div>
                                    </form>
                                </div>

                            </div>

                            <div class="col-md-3">
                                <button type="button" class="btn btn-secondary reset-filter">
                                    {{ translate('Reset Filters') }}
                                </button>
                            </div>

                        </div>


                        <div class="product-grid">
                            @forelse($products as $product)
                            @include('pos.partials.product_card', ['product' => $product])
                            @empty
                            @include("pos.partials.empty", ['message' => 'No product found'])
                            @endforelse
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-3">

                <!-- Customer card -->

                <div class="card">
                    <div class="customer-header">
                        <div class="customer-header-content">
                            <div class="customer-title-section">
                                <div class="customer-accent-bar"></div>
                                <h5 class="customer-title">{{ translate('Customers') }}</h5>
                            </div>

                            <button type="button" class="customer-btn customer-btn-primary" id="add-customer-btn"
                                data-bs-toggle="modal" data-bs-target="#addCustomerModal">
                                <i class="fas fa-plus"></i>
                                <span>{{ translate('Add Customer') }}</span>
                            </button>
                        </div>
                    </div>
                    <div class="card-body border border-dashed border-end-0 border-start-0">

                        <div class="mb-3 d-flex flex-wrap gap-2 customer-type-container">
                            @foreach(\App\Enums\Pos\CustomerType::cases() as $type)
                            <div class="form-check customer-type-item">
                                <input class="form-check-input customer-type-radio" type="radio" name="customer_type"
                                    id="customer_type_{{ $type->value }}" value="{{ $type->value }}"
                                    @if($loop->first)checked @endif>
                                <label class="form-check-label" for="customer_type_{{ $type->value }}">
                                    {{ $type->label() }}
                                </label>
                            </div>
                            @endforeach
                        </div>


                        <div class="search-container mb-3 d-none">
                            <input type="text" class="search-input" placeholder="Search customers..."
                                id="customer-search-text" name="search" autocomplete="off">

                            <div id="customer-search-dropdown" class="customer-search-dropdown">

                            </div>
                        </div>

                        <div id="selected-customer-card" class="card bg-light p-3 mb-3 d-none">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <h6 class="mb-1 fw-bold" id="selected-customer-name"></h6>
                                    <p class="mb-1 text-muted">
                                        <i class="fa fa-phone me-1"></i>
                                        <span id="selected-customer-phone"></span>
                                    </p>
                                    <p class="mb-0 text-muted">
                                        <i class="fa fa-envelope me-1"></i>
                                        <span id="selected-customer-email"></span>
                                    </p>
                                </div>
                                <button type="button" id="remove-selected-customer"
                                    class="btn btn-sm btn-light text-danger">
                                    <i class="fa fa-times"></i>
                                </button>
                            </div>
                        </div>
                        <input type="hidden" id="selected-customer-id" name="customer_id">
                    </div>

                </div>


                <!-- Order summary -->
                <div class="card checkout-product">

                    <div class="order-summary-header">
                        <div class="order-header-content">
                            <div class="order-title-section">
                                <div class="order-accent-bar"></div>
                                <h5 class="order-title">{{ translate('Order Summary') }}</h5>

                                <div class="order-action-buttons">
                                    <button type="button"
                                        class="order-btn order-btn-warning order-hold-cart-btn hold-cart-btn">
                                        <i class="fas fa-pause-circle"></i>
                                        <span>{{ translate('Hold') }}</span>
                                    </button>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card-body order-summary">


                    </div>

                    <div class="card-body">
                        <div class="order-action-buttons">
                            <div class="d-flex d-flex flex-wrap gap-2">
                                <button type="button" class="order-btn order-btn-outline order-coupon-btn"
                                    data-bs-toggle="modal" data-bs-target="#couponModal">
                                    <i class="fas fa-ticket-alt"></i>
                                    <span class="order-btn-text">{{ translate('Coupon') }}</span>
                                </button>

                                <button type="button" class="order-btn order-btn-outline order-discount-btn"
                                    data-bs-toggle="modal" data-bs-target="#discountModal">
                                    <i class="fas fa-percent"></i>
                                    <span class="order-btn-text">{{ translate('Discount') }}</span>
                                </button>

                                <button type="button" class="order-btn order-btn-outline order-shipping-btn"
                                    data-bs-toggle="modal" data-bs-target="#shippingModal">
                                    <i class="fas fa-truck"></i>
                                    <span class="order-btn-text">{{ translate('Shipping') }}</span>
                                </button>

                            </div>
                        </div>

                    </div>




                </div>

                <!-- Payment Method Card -->
                <div class="card mt-3 payment-method-compact">
                    <div class="card-header">
                        <h4 class="card-title">{{ translate("Payment Method") }}</h4>
                    </div>
                    @php
                        $isSeller = Route::is('seller.*');
                        $paymentMethods = $isSeller
                            ? \App\Models\PaymentMethod::forSeller(auth_user('seller')->id)->pos()->get()
                            : \App\Models\PaymentMethod::forAdmin()->pos()->get();
                    @endphp
                    <div class="card-body">
                        <form id="payment-method-form">
                            @foreach($paymentMethods as $option)
                            <div class="payment-option">
                                <input type="radio" name="payment_method" id="payment_{{ $option->id }}"
                                    data-percent-charge="{{ $option->percent_charge }}", data-params='@json($option->payment_parameter)' value="{{ $option->id }}" @if($loop->first) checked @endif>
                                <label for="payment_{{ $option->id }}">
                                    <div>
                                        <span class="title">{{ $option->name }}</span>
                                    </div>
                                </label>
                            </div>
                            @endforeach

                        </form>


                        <div class="cart-actions-section">
                            <div class="cart-actions-content">
                                <a href="javascript:void(0)" class="cart-btn cart-btn-clear clear-cart"
                                    data-user="admin">
                                    <i class="fas fa-trash"></i>
                                    <span>{{ translate('Clear Cart') }}</span>
                                </a>

                                <a href="javascript:void(0)" class="cart-btn cart-btn-checkout checkout">
                                    <span>{{ translate('Checkout') }}</span>
                                    <i class="fas fa-credit-card"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


        </div>
    </div>
</div>