<div class="table-responsive">
    <table class="table table-nowrap align-middle">
        <thead class="table-light">
            <tr class="text-muted fs-14">
                <th scope="col" class="text-start">
                    {{ translate("Product") }}
                </th>
                <th scope="col" class="text-center">
                    {{ translate("Qty") }}
                </th>
                <th scope="col" class="text-center">
                    {{ translate("Total Price") }}
                </th>
                <th scope="col" class="text-end">
                    {{ translate("Action") }}
                </th>
            </tr>
        </thead>
        @php
            $subtotal = 0;
            $flag = 1;
        @endphp
        <tbody class="border-bottom-0">
            @forelse($items as $data)
                @if($data->product)
                    @php
                        $subtotal += ($data->price - $data->total_taxes) * $data->quantity;
                    @endphp
                    <tr class="fs-14 cart-item" id="cart-{{ $data->id }}">
                        <td>
                            <div class="wishlist-product align-items-center">
                                <div class="wishlist-product-img">
                                    <img src="{{ show_image(file_path()['product']['featured']['path'].'/'.$data->product->featured_image, file_path()['product']['featured']['size']) }}" alt="{{ $data->product->name }}">
                                </div>
                                <div class="wishlist-product-info">
                                    <h4 class="product-title mb-1">{{ $data->product->name }}</h4>
                                    <span class="badge rounded-pill bg-light text-dark border fw-normal fs-12">
                                        {{ $data->attributes_value }}
                                    </span>
                                </div>
                            </div>
                        </td>

                        <td class="text-center">
                            <div class="input-step">
                                <button type="button" class="quantitybutton x decrement">–</button>
                                <input data-price="{{ short_amount($data->price,false) }}" value="{{ $data->quantity }}" data-cart_id="{{ $data->id }}" type="number" class="product-quantity" name="quantity" id="quantity">
                                <button type="button" class="quantitybutton y increment">+</button>
                            </div>
                        </td>

                        <td class="text-center">
                            <span class="item-product-amount">
                                {{ short_amount(($data->price - $data->total_taxes) * $data->quantity) }}
                            </span>
                        </td>

                        <td class="text-end">
                            <div class="d-flex align-items-center gap-3 justify-content-end">
                                <button data-id="{{ $data->id }}" class="remove-cart-data badge badge-soft-danger fs-12 pointer">
                                    <i class="fa-solid fa-trash"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                @endif
            @empty
                @php $flag = 0; @endphp
                <tr>
                    <td class="text-center" colspan="100">{{ translate('No Data Found') }}</td>
                </tr>
            @endforelse

            
        </tbody>
    </table>
</div>


