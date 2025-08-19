@php
        $randNum = rand(1,10000000);
        if(@$rand_separator){
            $separator = @$rand_separator_text?? '-';
            $randNum  = $randNum.$separator.$randNum;
        }

        $authUser       = auth_user('web');
        $wishedProducts = $authUser ? $authUser->wishlist->pluck('product_id')->toArray() : [];
@endphp
<form class="attribute-options-form-{{ $randNum  }}">
       <input type="hidden" name="id" value="{{ $product->id }}">
        @if(@$campaign)
           <input type="hidden" name="campaign_id" value="{{ $campaign->id }}">
        @endif
</form>

<div class="product-action">
        <a href="javascript:void(0)"  data-product_id = '{{$randNum }}' class="buy-now addtocartbtn">
            <span class="buy-now-icon"><svg  version="1.1"  x="0" y="0" viewBox="0 0 511.997 511.997"   xml:space="preserve" ><g><path d="M405.387 362.612c-35.202 0-63.84 28.639-63.84 63.84s28.639 63.84 63.84 63.84 63.84-28.639 63.84-63.84-28.639-63.84-63.84-63.84zm0 89.376c-14.083 0-25.536-11.453-25.536-25.536s11.453-25.536 25.536-25.536c14.083 0 25.536 11.453 25.536 25.536s-11.453 25.536-25.536 25.536zM507.927 115.875a19.128 19.128 0 0 0-15.079-7.348H118.22l-17.237-72.12a19.16 19.16 0 0 0-18.629-14.702H19.152C8.574 21.704 0 30.278 0 40.856s8.574 19.152 19.152 19.152h48.085l62.244 260.443a19.153 19.153 0 0 0 18.629 14.702h298.135c8.804 0 16.477-6.001 18.59-14.543l46.604-188.329a19.185 19.185 0 0 0-3.512-16.406zM431.261 296.85H163.227l-35.853-150.019h341.003L431.261 296.85zM173.646 362.612c-35.202 0-63.84 28.639-63.84 63.84s28.639 63.84 63.84 63.84 63.84-28.639 63.84-63.84-28.639-63.84-63.84-63.84zm0 89.376c-14.083 0-25.536-11.453-25.536-25.536s11.453-25.536 25.536-25.536 25.536 11.453 25.536 25.536-11.453 25.536-25.536 25.536z" opacity="1" data-original="#000000" ></path></g></svg></span>
            {{translate("Add to cart")}}
        </a>
        @if(!@$disable_wishlist)
            <button data-product_id ="{{$product->id}}" class="heart-btn wishlistitem"><i class="@if(in_array($product->id,$wishedProducts))
                fa-solid
                @else
                    fa-regular
                @endif fa-heart"></i>
           </button>
        @endif
</div>