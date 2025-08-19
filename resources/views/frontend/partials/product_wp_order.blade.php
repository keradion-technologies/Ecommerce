@if(site_settings('whatsapp_order',App\Enums\StatusEnum::false->status()) == App\Enums\StatusEnum::true->status() )

@php
            $wpMessage  = @$wp_message ?? site_settings('wp_order_message');
            $message = str_replace(
                                    [
                                        '[product_name]',
                                        '[link]',
                                    ],
                                    [
                                        @$product_name ?? $product->name,
                                        @$link ?? route('product.details',[$product->slug ? $product->slug : make_slug($product->name),$product->id])
                                    ],
                            $wpMessage);
            
@endphp

        <input type="hidden" class="wp-message" value="{{$message}}">
        
    @if($seller && optional($seller->sellerShop)->whatsapp_order ==  App\Enums\StatusEnum::true->status())

        <input type="hidden" class="wp-number" value="{{optional($seller->sellerShop)->whatsapp_number}}">
         <a href="javascript:void(0);"  onclick="social_share()" class="buy-now-btn buy-with-whatsapp">
             <i class="fa-brands fa-whatsapp fs-2 me-3"></i> {{translate("Order Via Whatsapp")}}
         </a>

     @endif
     
     @if(!$seller)
        <input type="hidden" class="wp-number" value="{{site_settings('whats_app_number')}}">

         <a href="javascript:void(0);"  onclick="social_share()" class="buy-now-btn buy-with-whatsapp">
             <i class="fa-brands fa-whatsapp fs-2 me-3"></i> {{translate("Order Via Whatsapp")}}
         </a>
     @endif
@endif