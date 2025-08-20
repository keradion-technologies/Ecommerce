<section class="pt-80 pb-80">
    <div class="Container">
        <div class="section-title">
            <div class="section-title-left">
                <div class="title-left-content">
                    <h3>{{@frontend_section_data($top_product_section->value,'heading')}} </h3>
                    <p>{{@frontend_section_data($top_product_section->value,'sub_heading')}}</p>
                </div>
            </div>
            <div class="section-title-right">
                <a href="{{route('product')}}" class="view-more-btn">
                     {{translate('View More')}}
                </a>
            </div>

        </div>

        <div class="best-selling-items">
            <div class="row g-4">
                @forelse($top_products   as $product)
                    <div class="col-xl-4 col-md-6">
                        <div class="best-selling-item">
                            <div class="product-img">
                                <a href="{{route('product.details',[$product->slug ? $product->slug : make_slug($product->name),$product->id])}}">
                                    <img src="{{show_image(file_path()['product']['featured']['path'].'/'.$product->featured_image,file_path()['product']['featured']['size'])}}" alt="{{$product->featured_image}}">
                                </a>
                            </div>
                            <div class="product-info">

                                <div class="stock-status">
                                    @include('frontend.partials.product_stock_status')
                                </div>

                                <div class="priceAndRatting">
                                    <div class="ratting">
                                        @php echo show_ratings($product->review->avg('rating')) @endphp
                                    </div>

                                    <div class="product-price">
                                            @include('frontend.partials.product_price',['product' => $product])
                                    </div>

                                </div>
                                <h4 class="product-title">
                                    <a href="{{route('product.details',[$product->slug ? $product->slug : make_slug($product->name),$product->id])}}">
                                        {{$product->name}}
                                    </a>
                                </h4>

                                @include('frontend.partials.product_action',['product' => $product])

                            </div>
                        </div>
                    </div>
                @empty
                    <div class="col-12">
                        @include("frontend.partials.empty",['message' => 'No product found'])
                    </div>
                @endforelse
            </div>
        </div>
    </div>
</section>


@if( @frontend_section_data($promo_banner->value,'position') == 'top-products')
  @includeWhen($promo_banner->status == '1', 'frontend.section.promotinal_banner', ['promo_banner' => $promo_banner])
@endif

@if( @frontend_section_data($promo_second_banner->value,'position') == 'top-products')
    @includeWhen($promo_second_banner->status == '1', 'frontend.section.promotinal_banner', ['promo_banner' => $promo_second_banner])
@endif
