<div class="product-item">
    <div class="product-img">
        <a
            href="{{route('product.details', [$product->slug ? $product->slug : make_slug($product->name), $product->id])}}">
            <img src="{{show_image(file_path()['product']['featured']['path'] . '/' . $product->featured_image, file_path()['product']['featured']['size'])}}"
                alt="{{$product->name}}">
        </a>


        @if($product->discount_percentage > 0)
            <span class="offer-tag">{{translate('off')}}
                {{num_format($product->discount_percentage)}} %</span>
        @endif
    </div>
    <div class="product-info">

        <h4 class="product-title">
            <a
                href="{{route('product.details', [$product->slug ? $product->slug : make_slug($product->name), $product->id])}}">{{$product->name}}
            </a>
        </h4>
        <div class="stock-status" id="quick-view-stock">

            @include('pos.partials.product_stock_status', ['is_details_stock' => true])

        </div>
        <p class="text-muted mb-0">
            <strong>{{ translate('SKU') }}:</strong> {{ $product?->sku }}
        </p>
        <div class="priceAndRatting">
            <div class="product-price">
                @include('pos.partials.product_price', ['product' => $product])
            </div>
        </div>
        @include('pos.partials.product_action', ['product' => $product, 'rand_separator' => true])
    </div>
</div>