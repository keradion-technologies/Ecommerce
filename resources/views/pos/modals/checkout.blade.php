<div class="modal fade" id="checkoutModal" tabindex="-1" aria-labelledby="checkoutModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">{{ translate('Checkout') }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form id="checkout-form">
                @csrf
                <div class="modal-body">
                    <div class="row g-4">
                        
                        <input type="hidden" name="customer_id" id="checkout-customer-id" value="">
                        <input type="hidden" name="address_id" id="checkout-address-id" value="">
                        <input type="hidden" name="customer_type" id="checkout-customer-type" value="">
                        
                        <input type="hidden" name="payment_method" id="checkout_payment_method" value="">

                        <div class="col-lg-7">
                            <div class="border rounded p-3 h-100">
                                <h6 class="mb-3">{{ translate('Order Information') }}</h6>

                                <div class="mb-3">
                                    <label class="form-label">{{ translate('Customer') }}</label>
                                    <div id="checkout-customer-name">Guest</div>
                                    <input type="hidden" name="customer_id" id="checkout-customer-id" value="">
                                </div>



                                <div id="shipping-info" class="mt-3 d-none">

                                    
                                    <div id="customer-existing-address-section" class="d-none mb-3">
                                        <label
                                            class="form-label d-block">{{ translate('Select Shipping Address') }}</label>
                                        <div id="customer-address-list" class="row g-2"></div>

                                        <button type="button" id="add-new-address-btn" class="btn btn-sm btn-link mt-2">
                                            {{ translate('Use a different address') }}
                                        </button>
                                    </div>


                                    <div id="shipping-form-section" class="row g-3">

                                        <!-- Name -->
                                        <div class="col-md-6">
                                            <label class="form-label">{{ translate('Full Name')}}</label>
                                            <input type="text" class="form-control" name="shipping_name"
                                                placeholder="{{ translate('Customer Name') }}">
                                        </div>

                                        <!-- Email -->
                                        <div class="col-md-6">
                                            <label class="form-label">{{ translate('Email')}}</label>
                                            <input type="email" class="form-control" name="shipping_email"
                                                placeholder="{{ translate('example@email.com') }}">
                                        </div>

                                        <!-- Phone -->
                                        <div class="col-md-6">
                                            <label class="form-label">{{ translate('phone')}}</label>
                                            <input type="text" class="form-control" name="shipping_phone"
                                                placeholder="{{ translate('01XXXXXXXXX')}}">
                                        </div>


                                        <div class="col-md-6">
                                            <label class="form-label">{{ translate('Country') }}</label>
                                            <select id="country" class="form-select">
                                                <option value="">{{ translate('Select Country') }}</option>
                                                @foreach($countries as $country)
                                                    <option value="{{ $country->id }}">{{ $country->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label">{{ translate('State') }}</label>
                                            <select id="state" class="form-select mt-2">
                                                <option value="">{{ translate('Select State') }}</option>
                                                @foreach($states as $state)
                                                    <option value="{{ $state->id }}"
                                                        data-country="{{ $state->country_id }}">
                                                        {{ $state->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="col-md-3">
                                            <label class="form-label">{{ translate('City') }}</label>
                                            <select id="city" class="form-select mt-2">
                                                <option value="">{{ translate('Select City') }}</option>
                                                @foreach($cities as $city)
                                                    <option value="{{ $city->id }}" data-state="{{ $city->state_id }}">
                                                        {{ $city->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="col-12">
                                            <label class="form-label">{{ translate('Address') }}</label>
                                            <input type="text" class="form-control" name="shipping_address"
                                                placeholder="{{ translate('Street address...') }}">
                                        </div>

                                    </div>
                                </div>


                                <div class="mb-3">
                                    <label class="form-label d-block">{{ translate('Delivery Option') }}</label>

                                    @php

                                        $selectedDelivery = old('delivery_option', 'pickup');
                                    @endphp

                                    @foreach (\App\Enums\Pos\DeliveryOption::cases() as $option)
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input delivery-option" type="radio"
                                                name="delivery_option" id="delivery-{{ $option->value }}"
                                                value="{{ $option->value }}">
                                            <label class="form-check-label" for="delivery-{{ $option->value }}">
                                                <i class="fa {{ $option->icon() }}"></i> {{ translate($option->label()) }}
                                            </label>
                                        </div>
                                    @endforeach


                                    <small class="text-muted d-block mt-1">
                                        {{ translate('Customer will pick up the order at the store. No shipping required.') }}
                                    </small>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">{{ translate('Payment info') }}</label>
                                    <div class="payment-method-display">Cash</div>
                                </div>
                                <div id="payment-info-section"></div>



                                <div>
                                    <label class="form-label">{{ translate('Notes') }}</label>
                                    <textarea class="form-control" rows="3" id="note" name="note"
                                        placeholder="Enter any special instructions or notes for this order"></textarea>
                                </div>
                            </div>
                        </div>

                        <!-- Order Summary -->
                        <div class="col-lg-5">
                            <div class="checkout-order-summary">
                                <div class="border rounded p-3 bg-light h-100">
                                    <h6 class="mb-3">{{ translate('Order Summary') }}</h6>
                                    <ul class="list-unstyled mb-0">
                                        <li class="d-flex justify-content-between mb-2">
                                            <span>{{ translate('Subtotal') }}</span>
                                            <span>$0.00</span>
                                        </li>
                                        <li class="d-flex justify-content-between mb-2">
                                            <span>{{ translate('Tax') }}</span>
                                            <span>$0.00</span>
                                        </li>
                                        <li class="d-flex justify-content-between mb-2">
                                            <span>{{ translate('Shipping') }}</span>
                                            <span>$0.00</span>
                                        </li>
                                        <li class="d-flex justify-content-between fw-bold fs-5">
                                            <span>{{ translate('Total') }}</span>
                                            <span class="text-primary"> $0.00</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">
                        <i class="fa fa-xmark me-1"></i> {{ translate('Cancel') }}
                    </button>
                    <button type="submit" class="btn btn-primary checkout-complete">
                        <i class="fa fa-check-circle me-1"></i> {{ translate('Complete Order') }}
                    </button>
                </div>
            </form>


        </div>
    </div>
</div>