@extends('frontend.layouts.app')
@section('content')

<div class="campaign-full-banner p-0">
    <img src="{{show_image(file_path()['flash_deal']['path'].'/'.$flashDeal->banner_image,file_path()['campaign_banner']['size'])}}" alt="{{@$campaign->banner_image}}">
</div>

@php
  $dateTime = date("Y-m-d H:i:s",strtotime($flashDeal->end_date));
@endphp

<section class="pt-80 pb-80">
    <div class="Container">
        <div class="title-with-tab section-title">
            <div class="section-title-left align-items-center flex-row justify-content-between w-100">
                <div class="title-left-content">
                    <h3>{{$flashDeal->name}}</h3>
                </div>
                <div class="date" id="timerThree">
                    <div class="time-clock">
                        <div class="d-flex flex-column">
                            <div id="days"></div>
                            <p>
                                 {{translate('Days')}}
                            </p>
                        </div>
                        <div class="d-flex flex-column">
                            <div id='hours'></div>
                            <p>{{translate('Hours')}}
                            </p>
                        </div>
                        <div class="d-flex flex-column">
                            <div id="minutes"></div>
                            <p>
                                {{translate('Minutes')}}
                            </p>
                        </div>
                        <div class="d-flex flex-column">
                        <div id="seconds"></div>
                            <p>
                                {{translate('Seconds')}}
                            </p>
                        </div>

                    </div>
                </div>
            </div>

        </div>

         <div class="row g-2 g-md-4">
                @forelse($products   as $product)
                    <div class="col-lg-3 col-sm-4 col-6">
                        <div class="product-item">
                            <div class="product-img">
                                <a href="{{route('product.details',[$product->slug ? $product->slug : make_slug($product->name),$product->id])}}">
                                    <img src="{{show_image(file_path()['product']['featured']['path'].'/'.$product->featured_image,file_path()['product']['featured']['size'])}}" alt="{{$product->name}}">
                                </a>
                                <div class="quick-view">
                                    <button class="quick-view-btn quick--view--product"  data-product_id="{{$product->id}}">
                                        <svg  version="1.1"   width="18" height="18" x="0" y="0" viewBox="0 0 519.644 519.644"   xml:space="preserve" ><g><path d="M259.822 427.776c-97.26 0-190.384-71.556-251.854-145.843-10.623-12.839-10.623-31.476 0-44.314 15.455-18.678 47.843-54.713 91.108-86.206 108.972-79.319 212.309-79.472 321.492 0 50.828 36.997 91.108 85.512 91.108 86.206 10.623 12.838 10.623 31.475 0 44.313-61.461 74.278-154.572 145.844-251.854 145.844zm0-304c-107.744 0-201.142 102.751-227.2 134.243a2.76 2.76 0 0 0 0 3.514c26.059 31.492 119.456 134.243 227.2 134.243s201.142-102.751 227.2-134.243c1.519-1.837-.1-3.514 0-3.514-26.059-31.492-119.456-134.243-227.2-134.243z"  data-original="#000000" ></path><path d="M259.822 371.776c-61.757 0-112-50.243-112-112s50.243-112 112-112 112 50.243 112 112-50.243 112-112 112zm0-192c-44.112 0-80 35.888-80 80s35.888 80 80 80 80-35.888 80-80-35.888-80-80-80z"  data-original="#000000" ></path></g></svg>
                                        {{translate("Quick View")}}
                                    </button>
                                </div>
                                <ul class="hover-action">
                                    <li>
                                        <a class="comparelist compare-btn wave-btn" data-product_id="{{$product->id}}" href="javascript:void(0)">
                                         <i class="fa-solid fa-code-compare "></i>

             
                                        </a>
                                   </li>

                                </ul>
                                @if($product->discount_percentage > 0)
                                <span class="offer-tag">{{translate('off')}}  {{num_format($product->discount_percentage)}} %</span>
                                @endif
                            </div>

                            <div class="product-info">
                                    <div class="ratting">
                                                @php echo show_ratings($product->review->avg('rating')) @endphp
                                            </div>
                                    <h4 class="product-title">
                                        <a href="{{route('product.details',[$product->slug ? $product->slug : make_slug($product->name),$product->id])}}">
                                                {{$product->name}}
                                        </a>
                                    </h4>
                                    <div class="priceAndRatting">
                                        <div class="product-price">
                                            @include('frontend.partials.product_price',['product' => $product])
                                        </div>
                                    </div>


                                    @include('frontend.partials.product_action',['product' => $product ,'rand_separator'=> true ,'rand_separator_text' => 'flash_deal' ])

                

                            </div>
                        </div>
                    </div>
                @empty
                    <div class="col-12">
                        @include("frontend.partials.empty",['message' => 'No Data Found'])
                    </div>
                @endforelse
         </div>
    </div>
</section>

@endsection


@if($flashDeal)
    @push('scriptpush')
        <script>
            'use strict';
            const second = 1000,
                minute = second * 60,
                hour = minute * 60,
                day = hour * 24;
                let test = "{{$dateTime }}";
            const countDown = new Date(test).getTime(),
                x = setInterval(function() {
                const now = new Date().getTime(),
                distance = countDown - now;
                document.getElementById("days").innerText = Math.floor(distance / (day)),
                document.getElementById("hours").innerText = Math.floor((distance % (day)) / (hour)),
                document.getElementById("minutes").innerText = Math.floor((distance % (hour)) / (minute)),
                document.getElementById("seconds").innerText = Math.floor((distance % (minute)) / second);
            }, 0)
        </script>
    @endpush
@endif
