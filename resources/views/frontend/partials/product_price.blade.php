@php
    $price      =  (@$product->stock->first()?->price ?? $product->price);
@endphp


@if(@$campain_details)


        <span>
            {{short_amount(discount($price,$product->pivot->discount,$product->pivot->discount_type))}}
        </span>
        <del>
            {{short_amount($price)}}</del>


@else
        @if(@$is_campaign && 
            count($product->campaigns) != 0 && 
            $product->campaigns->first()->end_time > Carbon\Carbon::now()->toDateTimeString() &&   
                        $product->campaigns->first()->status == '1')

            @if(short_amount($product->campaigns->first()->pivot->discount) == 0)

                <span  class="varient-product-price">{{(short_amount($price))}}
                </span>

            @else
                <span>
                    {{(short_amount(discount($price,$product->campaigns->first()->pivot->discount,$product->campaigns->first()->pivot->discount_type)))}}
                </span>
                <del>
                    {{(short_amount($price))}}
                </del>
            @endif

        @else
                @if(($product->discount_percentage) > 0)

                    <span>
                        {{short_amount(cal_discount($product->discount_percentage, $price))}}
                    </span>
                    <del> {{short_amount($price)}}</del>

                @else
                    <span>
                        {{short_amount($price)}}
                    </span>

                @endif
        @endif

@endif
