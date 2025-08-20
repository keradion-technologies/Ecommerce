<script>

    const prefix = "{{ $prefix }}";

    fetchCartItem();

    $(document).ready(function () {
        if (window.location.href.includes('/pos')) {
            $('#hamburger-btn').trigger('click');
        }
    });

    

    //add customer
    $(document).ready(function () {
        $('#addCustomerForm').on('submit', function (e) {
            e.preventDefault();

            const form = $(this);
            const url = form.data('route');

            $.ajax({
                type: 'POST',
                url: url,
                data: form.serialize(),
                dataType: 'json',
                success: function (response) {
                    const customer = response.customer;

                    // Fill the card with customer info
                    $('#selected-customer-name').text(customer.name);
                    $('#selected-customer-phone').text(customer.phone ?? '-');
                    $('#selected-customer-email').text(customer.email ?? '-');
                    $('#selected-customer-id').val(customer.id);

                    //fill checkout form
                    $('#checkout-customer-name').text(customer.name);
                    $('#checkout-customer-id').val(customer.id);


                    $('#selected-customer-card').removeClass('d-none');

                    $('#addCustomerModal').modal('hide');

                    $('#addCustomerForm')[0].reset();

                    toaster('Customer added and selected!', 'success');


                },
                error: function (error) {
                    if (error && error.responseJSON) {
                        if (error.responseJSON.errors) {
                            for (let i in error.responseJSON.errors) {
                                toaster(error.responseJSON.errors[i][0], 'danger')
                            }
                        }
                        else {
                            if ((error.responseJSON.message)) {

                                toaster(error.responseJSON.message == 'Unauthenticated.' ? "You need to login first" : error.responseJSON.message, 'danger')
                            }
                            else {
                                toaster(error.responseJSON.error, 'danger')
                            }
                        }
                    }
                    else {
                        toaster(error.message, 'danger')
                    }
                },
            });
        });
    });

    //add to cart
    $(document).on('click', '.addtocartbtn', function (e) {

        e.preventDefault();
        var quantity = $('input[name="quantity"]').val();
        var form = $('.attribute-options-form')[0];

        var id = $(this).attr("data-product_id")

        if (id) {
            form = $(`.attribute-options-form-${id}`)[0];
        }

        var $element = $(this);

        var formData = new FormData(form);

        let combination = [];
        const $form = $(form);

        $form.find('input[name^="attribute_id["]:checked').each(function () {
            combination.push($(this).val());
        });

        var attribute_combination = combination.join('-');

        formData.append('attribute_combination', attribute_combination);


        $.ajax({
            headers: { "X-CSRF-TOKEN": "{{ csrf_token() }}", },
            url: "{{route($prefix . '.pos.system.cart.store')}}",

            beforeSend: function () {

                $element.off('click');
                $element.css('cursor', 'not-allowed');
                var margin = '';
                if ($element.find('i').length === 0) {
                    margin = 'mx-1';
                }
                $element.find('.spinner-border').remove();
                $element.prepend(`<div class="spinner-border ${margin} cart-spinner" role="status">
                                                                                                                                                                                                                                                                                                                                                                                                                                <span class="visually-hidden"></span>
                                                                                                                                                                                                                                                                                                                                                                                                                     </div>`);

                $element.find('span').addClass("d-none");
                $element.find('i').addClass("d-none");

            },
            method: "POST",
            data: formData,
            processData: false,
            contentType: false,

            success: function (response) {

                setTimeout(() => {

                    if (response.status) {
                        fetchCartItem();

                        toaster(response.message, 'success')

                    } else if (response.message) {
                        toaster(response.message, 'danger')
                    } else {
                        $.each(response.validation, function (i, val) {
                            toaster(val, 'danger')
                        });
                    }
                }, 1000);
            },
            error: function (error) {
                if (error && error.responseJSON) {
                    if (error.responseJSON.errors) {
                        for (let i in error.responseJSON.errors) {
                            toaster(error.responseJSON.errors[i][0], 'danger')
                        }
                    }
                    else {
                        if ((error.responseJSON.message)) {

                            toaster(error.responseJSON.message == 'Unauthenticated.' ? "You need to login first" : error.responseJSON.message, 'danger')
                        }
                        else {
                            toaster(error.responseJSON.error, 'danger')
                        }
                    }
                }
                else {
                    toaster(error.message, 'danger')
                }
            },
            complete: function () {
                setTimeout(() => {
                    $element.find('span').removeClass("d-none");
                    $element.find('i').removeClass("d-none");
                    $element.find('.spinner-border').remove();
                    $element.css('cursor', 'pointer');

                }, 1000);

            },

        });

    });


    // Select option
    $(document).on('click', '.select-option-btn', function () {

        var modal = $('#selectOption');
        var productId = $(this).data('product_id');
        var slug = $(this).attr('data-slug');
        $.ajax({
            url: "{{route($prefix . '.pos.system.product.option')}}",
            method: "GET",
            data: {
                id: productId,
                slug: slug,
            },

            beforeSend: function () {
                modal.find('.product-option-modal-body').html(`<div class="quick-view-loader">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                <div class="spinner-border" role="status">
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    <span class="visually-hidden"></span>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                </div>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           </div>`);
            },
            success: function (response) {
                modal.find('.product-option-modal-body').html(response);

            },
            error: function (error) {
                if (error && error.responseJSON) {
                    if (error.responseJSON.errors) {
                        for (let i in error.responseJSON.errors) {
                            toaster(error.responseJSON.errors[i][0], 'danger')
                        }
                    }
                    else {
                        if ((error.responseJSON.message)) {

                            toaster(error.responseJSON.message == 'Unauthenticated.' ? "You need to login first" : error.responseJSON.message, 'danger')
                        }
                        else {
                            toaster(error.responseJSON.error, 'danger')
                        }
                    }
                }
                else {
                    toaster(error.message, 'danger')
                }
            },
            complete: function () {




            },
        });
        modal.modal('show');
    });


    //update quantity
    $(document).on('click', '.update_qty', function (e) {
        var cartItemQuantity = $('#option_quantity').val();
        if ($(this).hasClass('increment')) {
            cartItemQuantity++;
        } else {
            if (cartItemQuantity > 1) {
                cartItemQuantity--;
            } else {
                cartItemQuantity = 1;
            }
        }

        $('#option_quantity').val(cartItemQuantity);
    });




    //live product search
    $(document).on('change', 'select[name="category_id"]', function () {
        const categoryId = $(this).val();
        const brandId = $('select[name="brand_id"]').val();
        const searchText = $('#search-text').val().trim();
        performLiveSearch(searchText, categoryId, brandId);
    });

    $(document).on('change', 'select[name="brand_id"]', function () {
        const brandId = $(this).val();
        const categoryId = $('select[name="category_id"]').val();
        const searchText = $('#search-text').val().trim();
        performLiveSearch(searchText, categoryId, brandId);
    });

    $(document).on('keyup', '#search-text', function () {
        const searchText = $(this).val().trim();
        const categoryId = $('select[name="category"]').val();
        const brandId = $('select[name="brand_id"]').val();
        performLiveSearch(searchText, categoryId, brandId);
    });

    $(document).on('click', '.reset-filter', function () {

        $('#category_id').val('').trigger('change');
        $('#brand_id').val('').trigger('change');

        const searchText = '';
        const categoryId = '';

        performLiveSearch(searchText, categoryId)
    });

    function performLiveSearch(searchText, categoryId, brandId) {

        $.ajax({
            headers: { "X-CSRF-TOKEN": "{{ csrf_token() }}" },
            url: "{{ route($prefix . '.pos.system.product.live.search') }}",
            method: "GET",
            data: {
                searchData: searchText,
                categoryId: categoryId,
                brandId: brandId
            },
            beforeSend: function () {
                $('.live-search-loader').show();
            },
            success: function (response) {
                $('.product-grid').html(response.html);
            },
            error: function () {
                $('.product-grid').html('<p class="text-danger text-center py-4">Failed to load products</p>');
            },
            complete: function () {
                $('.live-search-loader').hide();
            }
        });
    }


    //barcode search
    let scanner;

    $('#scan-barcode-btn').on('click', function () {
        $('#barcode-scanner').show();

        if (!scanner) {
            scanner = new Html5Qrcode("barcode-scanner");
        }
        $('#scan-barcode-btn').prop('disabled', true);
        scanner.start(
            { facingMode: "environment" },
            {
                fps: 30,
                qrbox: { width: 300, height: 150 },
                rememberLastUsedCamera: false,
                experimentalFeatures: {
                    useBarCodeDetectorIfSupported: true,
                },
            },
            function (decodedText) {

                scanner.stop().then(() => {
                    $('#barcode-scanner').hide();
                    $('#scan-barcode-btn').prop('disabled', false);
                    performLiveSearch(decodedText);
                }).catch((err) => {
                    console.error("Stop failed:", err);
                });
            },
            function (errorMessage) {

            }
        ).catch((err) => {
            console.error("Camera start error:", err);
            alert("Camera access error: " + err);
        });
    });

    //live search customer
    $(document).on('keyup', '#customer-search-text', function () {
        const searchText = $(this).val().trim();

        if (searchText.length < 2) {
            $('#customer-search-dropdown').hide().empty();
            return;
        }

        $.ajax({
            headers: { "X-CSRF-TOKEN": "{{ csrf_token() }}" },
            url: "{{ route($prefix . '.pos.system.customer.live.search') }}",
            method: "GET",
            data: {
                searchData: searchText,
            },
            beforeSend: function () {
                $('.live-search-loader').show();
            },
            success: function (response) {
                const dropdown = $('#customer-search-dropdown');
                dropdown.empty();

                if (response.success && response.customer.length > 0) {
                    $.each(response.customer, function (i, customer) {
                        dropdown.append(`
                                        <a href="#" class="customer-item customer-select-item"
                                            data-id="${customer.id}"
                                            data-name="${customer.name}"
                                            data-phone="${customer.phone ?? ''}"
                                            data-email="${customer.email ?? ''}">
                                                <span class="customer-name">${customer.name}</span>
                                                <div class="customer-details">
                                                    <span class="customer-phone">Phone: ${customer.phone ?? 'N/A'}</span>
                                                    <span class="customer-email">Email: ${customer.email ?? 'N/A'}</span>
                                                </div>
                                        </a>
                                `);
                    });
                    dropdown.show();
                } else {
                    dropdown.append('<div class="list-group-item">No customers found</div>').show();
                }
            },
            error: function () {
                dropdown.append(`
                    <div class="list-group-item">
                        <div class="no-results-message">
                            <div class="no-results-text">No customers found</div>
                        </div>
                    </div>
                `).show();
            },
            complete: function () {
                $('.live-search-loader').hide();
            }
        });
    });

    //select customer type
    $(document).ready(function () {
        $('.customer-type-radio').on('change', function () {
            if ($(this).val() === 'existing' && $(this).is(':checked')) {
                $('.search-container').removeClass('d-none');
            } else {
                $('.search-container').addClass('d-none');

                $('#customer-search-text').val('');
                $('#customer-search-dropdown').empty();

                $('#selected-customer-card').addClass('d-none');
                $('#selected-customer-name').text('');
                $('#selected-customer-phone').text('');
                $('#selected-customer-email').text('');

                $('#selected-customer-id').val('');
            }
        });
    });



    //customer select action 
    $(document).on('click', '.customer-select-item', function (e) {
        e.preventDefault();

        const name = $(this).data('name');
        const phone = $(this).data('phone');
        const email = $(this).data('email');
        const id = $(this).data('id');

        $('#selected-customer-name').text(name);
        $('#selected-customer-phone').text(phone);
        $('#selected-customer-email').text(email);
        $('#selected-customer-id').val(id);

        $('#checkout-customer-name').text(name);
        $('#checkout-customer-id').val(id);


        $('#selected-customer-card').removeClass('d-none');
        $('#customer-search-dropdown').hide();
        $('#customer-search-text').val('');
    });

    //cutomer remove 
    $(document).on('click', '#remove-selected-customer', function () {
        $('#selected-customer-card').addClass('d-none');
        $('#selected-customer-id').val('');

        $('#checkout-customer-name').text('Guest');
        $('#checkout-customer-id').val('');

        renderCustomerAddressList([]);
    });



    /*Remove Product Item from Cart*/
    $(document).on('click', '.remove-cart-data', function (e) {
        var item = $(this);
        var subtotal = $('#subtotalamount').text();
        var itemamount = item.parents('.cart-item').find('.item-product-amount').text();
        var id = $(this).data('id');
        var $element = $(this);
        var html = $element.html();
        $.ajax({
            headers: { "X-CSRF-TOKEN": "{{ csrf_token() }}", },
            url: "{{route($prefix . '.pos.system.cart.item.remove')}}",

            beforeSend: function () {

                $element.html(`<div class="spinner-border spinner-border-sm cart-spinner" role="status">
                                            <span class="visually-hidden"></span>
                                </div>`);
                $('.order-summary-loader').removeClass('d-none');

            },
            method: "POST",
            data: { id: id },
            success: function (response) {
                if (response.status) {

                    item.parents('.cart-item').remove();
                    if (itemamount) {
                        var number = (subtotal - itemamount).toFixed(2)
                        $('#subtotalamount').text(number);
                        $('#totalamount').text(number);
                    }
                    if (response.coupon) {
                        $('.order-coupon-item').addClass('d-none');
                    }

                    fetchCartItem();
                    $('.order-summary').html(response.order_summary)
                    toaster(response.message, 'success')
                    $(`#cart-${id}`).remove()
                } else {
                    toaster(response.message, 'danger')

                }
            },

            error: function (error) {
                if (error && error.responseJSON) {
                    if (error.responseJSON.errors) {
                        for (let i in error.responseJSON.errors) {
                            toaster(error.responseJSON.errors[i][0], 'danger')
                        }
                    }
                    else {
                        if ((error.responseJSON.message)) {
                            toaster(error.responseJSON.message == 'Unauthenticated.' ? "You need to login first" : error.responseJSON.message, 'danger')
                        }
                        else {
                            toaster(error.responseJSON.error, 'danger')
                        }
                    }
                }
                else {
                    toaster(error.message, 'danger')
                }
            },
            complete: function () {
                $element.html(html);
            },
        });
    });


    // Cart Qty update
    $(document).on('click', '.quantitybutton', function () {

        var cartItemQuantity = $(this).parents('.cart-item').find('#quantity').val();
        if ($(this).hasClass('increment')) {
            cartItemQuantity++;
        } else {
            if (cartItemQuantity > 1) {
                cartItemQuantity--;
            } else {
                $(".cart--minus").prop("disabled", true);
            }
        }
        cartItemUpdate($(this), cartItemQuantity);

    });

    //cart item update
    function cartItemUpdate(object, quantity) {

        var item = object;
        var subtotal = $('#subtotalamount').text();

        var itemTotalPrice = item.parents('.cart-item').find('.item-product-amount').text();
        var itemPrice = item.parents('.cart-item').find('#quantity').data('price');

        var afterCalculationItemTotal = quantity * itemPrice;
        var difference = afterCalculationItemTotal - itemTotalPrice;
        var afterCalculationSubtotal = parseFloat(subtotal) + parseFloat(difference);
        var cartId = item.parents('.cart-item').find('#quantity').attr('data-cart_id');
        var html = item.html();


        $.ajax({
            headers: { "X-CSRF-TOKEN": "{{ csrf_token() }}" },
            url: "{{route($prefix . '.pos.system.cart.update')}}",
            method: "POST",

            data: { cart_id: cartId, quantity: quantity },

            beforeSend: function () {
                $('.quantitybutton').attr('disabled', true);
                object.html(`<div class="spinner-border " role="status">
                                                                                                                                                                                                                                                                                                                <span class="visually-hidden"></span>
                                                                                                                                                                                                                                                                                                    </div>`);

            },

            success: function (response) {


                if (response.status) {
                    
                    fetchCartItem();
                    $('#subtotalamount').text(parseFloat(afterCalculationSubtotal).toFixed(2));
                    $('#totalamount').text(parseFloat(afterCalculationSubtotal).toFixed(2));
                    item.parents('.cart-item').find('.item-product-amount').text(parseFloat(afterCalculationItemTotal.toFixed(2)));
                    if (response.coupon) {
                        $('.order-coupon-item').addClass('d-none');
                    }
                    $(item).parents('.cart-item').find('#quantity').val(quantity)
                    toaster(response.message, 'success')




                } else {
                    toaster(response.error, 'danger')

                }
            },
            error: function (error) {
                if (error && error.responseJSON) {
                    if (error.responseJSON.errors) {
                        for (let i in error.responseJSON.errors) {
                            toaster(error.responseJSON.errors[i][0], 'danger')
                        }
                    }
                    else {
                        if ((error.responseJSON.message)) {

                            toaster(error.responseJSON.message == 'Unauthenticated.' ? "You need to login first" : error.responseJSON.message, 'danger')
                        }
                        else {
                            toaster(error.responseJSON.error, 'danger')
                        }
                    }
                }
                else {
                    toaster(error.message, 'danger')
                }
            },
            complete: function () {
                item.html(html);

                $('.quantitybutton').attr('disabled', false);

            },
        });
    }

    //clear cart
    $(document).on('click', '.clear-cart', function () {
        const user = $(this).data('user');

        let url = "{{ route($prefix . '.pos.system.cart.clear') }}";

        $.ajax({
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            url: url,
            method: "GET",
            dataType: "json",
            success: function (response) {
                if (response.status) {
                    toaster(response.message, 'success');

                    location.reload();
                } else {
                    toaster('Failed to clear cart', 'danger');
                }
            },
            error: function () {
                toaster('Something went wrong', 'danger');
            }
        });
    });


    function fetchCartItem() {


        $.ajax({

            url: "{{route($prefix . '.pos.system.cart.view')}}",
            method: "get",
            beforeSend: function () {
                $('.cart-item-loader').removeClass('d-none');
            },
            dataType: 'json',

            success: function (response) {

                $('.cart-table').html(response.cart_html);
                $('.order-summary').html(response.summary_html);
                $('.checkout-order-summary').html(response.summary_html);
            },
            error: function (error) {
                if (error && error.responseJSON) {
                    if (error.responseJSON.errors) {
                        for (let i in error.responseJSON.errors) {
                            toaster(error.responseJSON.errors[i][0], 'danger')
                        }
                    }
                    else {
                        if ((error.responseJSON.message)) {

                            toaster(error.responseJSON.message == 'Unauthenticated.' ? "You need to login first" : error.responseJSON.message, 'danger')
                        }
                        else {
                            toaster(error.responseJSON.error, 'danger')
                        }
                    }
                }
                else {
                    toaster(error.message, 'danger')
                }
            },
            complete: function () {

                $('.cart-item-loader').addClass('d-none');
            },
        });

    }

    //apply coupon
    $(document).on('click', '#apply-coupon-btn', function (e) {
        e.preventDefault();

        let productIds = $('#product_ids').val();
        let couponCode = $('#coupon_code').val();
        var subtotal = $('#subtotalamount').attr('data-sub');
        var shippingcost = $('#shipping_cost').text();
        var $element = $(this);
        var html = $element.html();


        if (!couponCode) {
            toaster("Please enter a coupon code.", 'danger');
            return;
        }

        $.ajax({
            url: "{{ route($prefix . '.pos.system.apply.coupon') }}",
            method: 'POST',
            data: {
                code: couponCode,
                subtotal: subtotal,
                product_ids: productIds,
                _token: '{{ csrf_token() }}'
            },
            beforeSend: function () {


                $element.html(`<div class="spinner-border  cart-spinner" role="status">
                                                                                                                                                                                                                                                                                                                                                                                                            <span class="visually-hidden"></span>
                                                                                                                                                                                                                                                                                                                                                                                                </div>`);


            },
            success: function (response) {

                $('#couponModal').modal('hide');

                if (response.status) {
                    toaster(response.message, 'success');

                    let cachedDiscount = parseFloat($('#pos-discount-amount').data('discount-on-pos')) || 0;
                    let cachedShipping = parseFloat($('#shipping-fee').data('shipping-fee')) || 0;

                    let target = document.querySelector('.order-summary');

                    if (target) {
                        const observer = new MutationObserver(function (mutationsList, observerInstance) {
                            reapplyDiscountAndShipping(cachedDiscount, cachedShipping);
                            observerInstance.disconnect();
                        });

                        observer.observe(target, { childList: true, subtree: true });
                    }

                    fetchCartItem();
                } else {
                    toaster(response.message, 'danger');
                }



            },
            error: function (error) {
                if (error && error.responseJSON) {
                    if (error.responseJSON.errors) {
                        for (let i in error.responseJSON.errors) {
                            toaster(error.responseJSON.errors[i][0], 'danger')
                        }
                    }
                    else {
                        if ((error.responseJSON.message)) {

                            toaster(error.responseJSON.message, 'danger')
                        }
                        else {
                            toaster(error.responseJSON.error, 'danger')
                        }
                    }
                }
                else {
                    toaster(error.message, 'danger')
                }
            },
            complete: function () {

                $element.html(html);

            }
        });
    });


    function reapplyDiscountAndShipping(discount, shipping) {
        let subtotal = parseFloat($('#subtotalamount').attr('data-sub')) || 0;

        let grandTotal = subtotal - discount + shipping;

        $('#pos-discount-row, #checkout-order-summary #pos-discount-row').removeClass('d-none');
        $('#pos-discount-amount, #checkout-order-summary #pos-discount-amount').text(showCurrency(discount)).attr('data-discount-on-pos', discount);
        $('#shipping-fee, #checkout-order-summary #shipping-fee').text(showCurrency(shipping)).attr('data-shipping-fee', shipping);

        $('#subtotalamount').attr('data-sub', grandTotal.toFixed(2))
        $('#totalamount, #checkout-order-summary #totalamount').text(showCurrency(grandTotal));

        $('input[name="discount_amount"]').val(discount.toFixed(2));
        $('input[name="shipping_charge"]').val(shipping.toFixed(2));
    }


    //apply discount
    $(document).ready(function () {
        $('#discont_form').on('submit', function (e) {
            e.preventDefault();

            let discountType = $('input[name="discount_type"]:checked').val();
            let discountValue = parseFloat($('#discount_amount').val()) || 0;
            let subtotal = parseFloat($('#subtotalamount').attr('data-sub')) || 0;

            if (parseFloat(subtotal) === 0) {
                toaster('Cannot apply discount on 0 total', 'danger');
                return;
            }

            let calculatedDiscount = 0;

            if (discountType === 'flat') {
                calculatedDiscount = discountValue;
            } else if (discountType === 'percentage') {
                calculatedDiscount = (discountValue / 100) * subtotal;
            }
            

            calculatedDiscount = Math.min(calculatedDiscount, subtotal);

            if (calculatedDiscount > 0) {
                $('#pos-discount-row, #checkout-order-summary #pos-discount-row').removeClass('d-none');
                $('#pos-discount-amount, #checkout-order-summary #pos-discount-amount').text(showCurrency(calculatedDiscount)).attr('data-discount-on-pos', calculatedDiscount);
            } else {
                $('#pos-discount-row, #checkout-order-summary #pos-discount-row').addClass('d-none');
                $('#pos-discount-amount, #checkout-order-summary #pos-discount-amount').text('').attr('data-discount-on-pos', 0);
            }

            let grandTotal = subtotal - calculatedDiscount;

            $('#subtotalamount').attr('data-sub', grandTotal.toFixed(2))


            $('#totalamount, #checkout-order-summary #totalamount').text(showCurrency(grandTotal));

            $('input[name="discount_type"]').val(discountType);
            $('input[name="discount_value"]').val(discountValue);
            $('input[name="discount_amount"]').val(calculatedDiscount.toFixed(2));


            $('#discountModal').modal('hide');
        });


    });

    const currencySymbol = @json(show_currency());


    function showCurrency(amount) {
        return currencySymbol + parseFloat(amount).toFixed(2);
    }



    //apply shipping
    $(document).ready(function () {
        $('#shipping_form').on('submit', function (e) {
            e.preventDefault();

            let shippingCharge = parseFloat($('#shipping_charge').val()) || 0;
            let subtotal = parseFloat($('#subtotalamount').attr('data-sub')) || 0;

            if (parseFloat(subtotal) === 0) {
                toaster('Cannot apply shipping fee on empty cart', 'danger');
                return;
            }

            let grandTotal = subtotal + shippingCharge;

            $('#subtotalamount').attr('data-sub', grandTotal.toFixed(2))

            $('#shipping-fee, #checkout-order-summary #shipping-fee').text(showCurrency(shippingCharge)).attr('data-shipping-fee', shippingCharge);

            $('#totalamount, #checkout-order-summary #totalamount').text(showCurrency(grandTotal));

            $('input[name="shipping_charge"]').val(shippingCharge);

            $('#shippingModal').modal('hide');
        });
    });




    //Hold cart
    $(document).on('click', '.hold-cart-btn', function () {

        var $element = $(this);

        $.ajax({
            url: "{{ route($prefix . '.pos.system.hold.cart') }}",
            type: 'GET',
            beforeSend: function () {

                $element.off('click');
                $element.css('cursor', 'not-allowed');
                var margin = '';
                if ($element.find('i').length === 0) {
                    margin = 'mx-1';
                }
                $element.find('.spinner-border').remove();
                $element.prepend(`<div class="spinner-border ${margin} cart-spinner" role="status">
                                                                                                                                                                                                                                                                                                                                                                                                                                <span class="visually-hidden"></span>
                                                                                                                                                                                                                                                                                                                                                                                                                     </div>`);

                $element.find('span').addClass("d-none");
                $element.find('i').addClass("d-none");

            },
            success: function (response) {
                if (response.status) {
                    toaster(response.message, 'success');
                    fetchCartItem();
                }
            },
            error: function (error) {
                if (error && error.responseJSON) {
                    if (error.responseJSON.errors) {
                        for (let i in error.responseJSON.errors) {
                            toaster(error.responseJSON.errors[i][0], 'danger');
                        }
                    } else if (error.responseJSON.message) {
                        toaster(error.responseJSON.message, 'danger');
                    } else {
                        toaster(error.responseJSON.error || 'Unexpected error occurred.', 'danger');
                    }
                } else {
                    toaster(error.message || 'An unknown error occurred.', 'danger');
                }
            },
            complete: function () {
                setTimeout(() => {
                    $element.find('span').removeClass("d-none");
                    $element.find('i').removeClass("d-none");
                    $element.find('.spinner-border').remove();
                    $element.css('cursor', 'pointer');

                }, 1000);

            },
        });
    });


    $(document).ready(function () {
        $('#held-orders-btn').on('click', function () {
            $('#heldOrdersModal').modal('show');
            fetchHoldOrder();
        });
    });

    //Fetch Hold cart
    function fetchHoldOrder(containerSelector = '#held-orders-container') {
        const $container = $(containerSelector);

        $container.html('<div class="text-center p-5">{{ translate("Loading...") }}</div>');

        $.ajax({
            url: "{{ route($prefix . '.pos.system.hold.cart.list') }}",
            method: 'GET',
            success: function (html) {
                $container.html(html);
            },
            error: function () {
                $container.html('<div class="text-danger text-center p-5">{{ translate("Failed to load held orders.") }}</div>');
            }
        });
    }






    //checkout 
    $(document).on('click', '.checkout', function () {


        let selectedInput = $('input[name="payment_method"]:checked');


        let selectedName = selectedInput.parent().text().trim();
        let params = selectedInput.data('params');
        let percent_charge = parseFloat(selectedInput.data('percent-charge')) || 0;
        let subtotal = parseFloat($('#subtotalamount').attr('data-sub')) || 0;

        let chargeAmount = (percent_charge / 100) * subtotal;
        let payable = subtotal + chargeAmount;


        if (!params) {
            toaster('No payment method selected , create payment mehtod for POS', 'danger');
            return
        }

        if (chargeAmount > 0) {
            $('#pos-payment-charge-row').removeClass('d-none');
            $('#pos-payable-row').removeClass('d-none');
            $('#pos-payment-charge-amount')
                .text(showCurrency(chargeAmount))
                .attr('data-payment-charge', chargeAmount);
            $('#pos-payable-amount')
                .text(showCurrency(payable))
                .attr('data-payable', payable);

            $('.checkout-order-summary #pos-payment-charge-row').removeClass('d-none');
            $('.checkout-order-summary #pos-payable-row').removeClass('d-none');
            $('.checkout-order-summary #pos-payment-charge-amount')
                .text(showCurrency(chargeAmount))
                .attr('data-payment-charge', chargeAmount);
            $('.checkout-order-summary #pos-payable-amount')
                .text(showCurrency(payable))
                .attr('data-payable', payable);
        } else {
            $('#pos-payment-charge-row, #pos-payable-row').addClass('d-none');
            $('#pos-payment-charge-amount').text('').attr('data-payment-charge', 0);
            $('#pos-payable-amount').text('').attr('data-payable', 0);

            $('.checkout-order-summary #pos-payment-charge-row, #checkout-order-summary #pos-payable-row').addClass('d-none');
            $('.checkout-order-summary #pos-payment-charge-amount').text('').attr('data-payment-charge', 0);
            $('.checkout-order-summary #pos-payable-amount').text('').attr('data-payable', 0);
        }

        $('#checkoutModal').modal('show');




        let container = $('#payment-info-section');
        container.empty();

        if (Array.isArray(params)) {
            container.empty();

            params.forEach(param => {
                let label = param.name.replace(/_/g, ' ').replace(/\b\w/g, c => c.toUpperCase());
                let required = param.is_required ? 'required' : '';
                let star = param.is_required ? '<span class="text-danger">*</span>' : '';

                let inputField = '';

                if (param.type === 'textarea') {
                    inputField = `
                            <textarea 
                                name="payment_info[${param.name}]" 
                                class="form-control" 
                                ${required}
                            ></textarea>`;
                } else {
                    inputField = `
                            <input 
                                type="${param.type}" 
                                name="payment_info[${param.name}]" 
                                class="form-control" 
                                ${required}
                            >`;
                }

                let input = `
                        <div class="mb-2">
                            <label class="form-label">${label} ${star}</label>
                            ${inputField}
                        </div>
                    `;

                container.append(input);
            });

            $('.payment-method-display').text(selectedName);
        }

    });


    //shipping info
    $(document).on('change', '.delivery-option', function () {
        const selected = $('input[name="delivery_option"]:checked').val();

        if (selected === 'shipping') {
            $('#shipping-info').removeClass('d-none');

            const customerId = $('#selected-customer-id').val();

            if (customerId) {
                $.ajax({
                    url: "{{ route($prefix . '.pos.system.customer.address') }}",
                    data: { _token: "{{ csrf_token()}}", id: customerId },
                    type: 'POST',
                    success: function (response) {

                        renderCustomerAddressList(response.formatted_address ?? []);
                    },

                    error: function () {
                        console.error('Failed to fetch customer address');
                        $('#customer-existing-address-section').addClass('d-none');
                        $('#shipping-form-section').removeClass('d-none');
                    }
                });
            } else {
                $('#customer-existing-address-section').addClass('d-none');
                $('#shipping-form-section').removeClass('d-none');
            }

        } else {
            $('#shipping-info').addClass('d-none');
            renderCustomerAddressList([]);
        }

    });

    // Handle switching to full address form
    $('#add-new-address-btn').on('click', function () {
        $('#customer-existing-address-section').addClass('d-none');
        $('#shipping-form-section').removeClass('d-none');
    });

    function renderCustomerAddressList(addresses = []) {
        const $section = $('#customer-existing-address-section');
        const $list = $('#customer-address-list');
        const $form = $('#shipping-form-section');

        $list.empty();

        if (addresses.length > 0) {
            let html = '';
            console.log(addresses);

            addresses.forEach((addr, index) => {
                const fullName = `${addr.first_name ?? ''} ${addr.last_name ?? ''}`.trim();
                const addressText = `${addr.address?.address ?? ''}, ${addr.zip ?? ''}`;
                const phone = addr.phone ?? '-';
                const email = addr.email ?? '-';

                html += `<div class="address-card ${index === 0 ? 'selected' : ''}" onclick="selectAddress(${addr.id})">
                            <input class="form-check-input" type="radio" name="shipping_address_id" 
                                id="address-${addr.id}" value="${addr.id}" ${index === 0 ? 'checked' : ''}>
                            <div class="radio-indicator"></div>
                            
                            <div class="address-content">
                                <div class="address-name">${fullName}</div>
                                
                                <div class="address-details">
                                    ${addr.phone ? `
                                        <div class="address-item">
                                            <span class="address-item-text">📞 ${addr.phone}</span>
                                        </div>
                                    ` : ''}
                                    
                                    ${addr.email ? `
                                        <div class="address-item">
                                            <span class="address-item-text">✉️ ${addr.email}</span>
                                        </div>
                                    ` : ''}
                                    
                                    ${addr.address ? `
                                        <div class="address-item">
                                            <span class="address-item-text">🏠 ${addressText}</span>
                                        </div>
                                    ` : ''}
                                </div>
                                
                                
                            </div>
                        </div>`;
            });

            $list.html(html);
            $section.removeClass('d-none');
            $form.addClass('d-none');
        } else {
            $section.addClass('d-none');
            $form.removeClass('d-none');
        }
    }





    //country change 
    $('#country').on('change', function () {
        const countryId = $(this).val();

        // Show only matching states
        $('#state option').each(function () {
            const belongsTo = $(this).data('country');
            $(this).toggle(belongsTo == countryId || $(this).val() === "");
        });

        $('#state').val('');
        $('#city').val('').trigger('change');
    });

    $('#state').on('change', function () {
        const stateId = $(this).val();

        // Show only matching cities
        $('#city option').each(function () {
            const belongsTo = $(this).data('state');
            $(this).toggle(belongsTo == stateId || $(this).val() === "");
        });

        $('#city').val('');
    });



    $(document).on('submit', '#checkout-form', function (e) {
        e.preventDefault();

        const form = $(this);

        const paymentInfo = {};
        form.find('[name^="payment_info["]').each(function () {
            const nameAttr = $(this).attr('name');
            const key = nameAttr.match(/\[([^\]]+)\]/)[1];
            paymentInfo[key] = $(this).val();
        });

        const data = {
            customer_id: $('#checkout-customer-id').val(),
            address_id: $('input[name="shipping_address_id"]:checked').val() || null,
            customer_type: $('input[name="customer_type"]:checked').val(),
            payment_method: $('input[name="payment_method"]:checked').val(),
            delivery_option: $('input[name="delivery_option"]:checked').val(),

            coupon_amount: parseFloat($('#couponamount').text()) || 0,
            discount_type: form.find('[name="discount_type"]').val(),
            discount_value: parseFloat($('#pos-discount-amount').data('discount-on-pos')) || 0,
            shipping_charge: parseFloat($('#shipping-fee').data('shipping-fee')) || 0,
            note: form.find('[name="note"]').val() || '',
            payment_info: paymentInfo
        };

        if (!data.address_id && data.delivery_option === 'shipping') {
            data.billing_address = {
                name: $('[name="shipping_name"]').val(),
                email: $('[name="shipping_email"]').val(),
                phone: $('[name="shipping_phone"]').val(),
                country: $('#country').val(),
                state: $('#state').val(),
                city: $('#city').val(),
                address: $('[name="shipping_address"]').val()
            };
        }


        $.ajax({
            url: "{{ route($prefix . '.pos.system.checkout') }}",
            method: 'POST',
            data: data,
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            beforeSend: function () {
                $('.checkout-complete').prop('disabled', true).text('Processing...');
            },
            success: function (response) {

                if (response.status) {
                    $('#checkoutModal').modal('hide');
                    fetchCartItem();
                    toaster('Order placed successfully!', 'success');
                    $('.invoice-container').html(response.invoice_html);
                    $('#invoiceModal').modal('show');

                } else {
                    toaster(response.message, 'danger');
                }

            },
            error: function (error) {
                if (error && error.responseJSON) {
                    if (error.responseJSON.errors) {
                        for (let i in error.responseJSON.errors) {
                            toaster(error.responseJSON.errors[i][0], 'danger');
                        }
                    } else if (error.responseJSON.message) {
                        toaster(error.responseJSON.message, 'danger');
                    } else {
                        toaster(error.responseJSON.error || 'Unexpected error occurred.', 'danger');
                    }
                } else {
                    toaster(error.message || 'An unknown error occurred.', 'danger');
                }
            },
            complete: function () {
                $('.checkout-complete').prop('disabled', false).html('<i class="fa fa-check-circle me-1"></i> Complete Order');
            }
        });
    });


    function printDiv() {
        var divToPrint = document.getElementById('DivIdToPrint');
        var newWin = window.open('', 'Print-Window');
        newWin.document.open();
        newWin.document.write('<html><body onload="window.print()">' + divToPrint.innerHTML + '</body></html>');
        newWin.document.close();
    }

    $(".selectItem").each(function () {
        $(this).select2({
            placeholder: $(this).attr('data-placeholder'),
        });
    });






</script>