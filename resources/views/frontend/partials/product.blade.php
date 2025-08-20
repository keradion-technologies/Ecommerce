@forelse($products  as $product)
    <div class="col-xl-3 col-lg-4 col-6">
        <div class="product-item">
            <div class="product-img">
                  <div class="todays-deal-cart">

                    @include('frontend.partials.product_action',['product' => $product ,'rand_separator'=> true ,'rand_separator_text' => $loop->index , 'disable_wishlist' => true ])
                  
                </div>
                <a href="{{route('product.details',[$product->slug ? $product->slug : make_slug($product->name),$product->id])}}">
                    <img src="{{show_image(file_path()['product']['featured']['path'].'/'.$product->featured_image,file_path()['product']['featured']['size'])}}" alt="{{$product->name}}">
                </a>
                <ul class="hover-action">
                    <li><a class="comparelist compare-btn wave-btn" data-product_id="{{$product->id}}" href="javascript:void(0)"><i class="fa-solid fa-code-compare"></i></a></li>
                </ul>
                <div class="quick-view">
                        <button class="quick-view-btn quick--view--product"  data-product_id="{{$product->id}}">
                            <svg  version="1.1" width="18" height="18" x="0" y="0" viewBox="0 0 519.644 519.644"   xml:space="preserve" ><g><path d="M259.822 427.776c-97.26 0-190.384-71.556-251.854-145.843-10.623-12.839-10.623-31.476 0-44.314 15.455-18.678 47.843-54.713 91.108-86.206 108.972-79.319 212.309-79.472 321.492 0 50.828 36.997 91.108 85.512 91.108 86.206 10.623 12.838 10.623 31.475 0 44.313-61.461 74.278-154.572 145.844-251.854 145.844zm0-304c-107.744 0-201.142 102.751-227.2 134.243a2.76 2.76 0 0 0 0 3.514c26.059 31.492 119.456 134.243 227.2 134.243s201.142-102.751 227.2-134.243c1.519-1.837-.1-3.514 0-3.514-26.059-31.492-119.456-134.243-227.2-134.243z"  data-original="#000000" ></path><path d="M259.822 371.776c-61.757 0-112-50.243-112-112s50.243-112 112-112 112 50.243 112 112-50.243 112-112 112zm0-192c-44.112 0-80 35.888-80 80s35.888 80 80 80 80-35.888 80-80-35.888-80-80-80z"  data-original="#000000" ></path></g></svg>
                            {{translate("Quick View")}}
                        </button>
                </div>
                @if($product->discount_percentage > 0)
                  <span class="offer-tag">{{translate('off')}}  {{num_format($product->discount_percentage,0)}} %  
              
                  </span>
                @endif
            </div>

            <div class="product-info todays-deal-product-info">
                <div class="ratting mb-0">
                    @php echo show_ratings($product->review->avg('rating')) @endphp
                </div>
                <h4 class="product-title">
                    <a href="{{route('product.details',[$product->slug ? $product->slug : make_slug($product->name),$product->id])}}">
                       {{$product->name}}
                    </a>
               </h4>

                <div class="product-price todays-deal-price">
                    @include('frontend.partials.product_price',['product' => $product])
                </div>
            </div>
        </div>
    </div>
@empty
    <div class="col-12">
        @include("frontend.partials.empty",['message' => 'No Product Found'])
    </div>
@endforelse


