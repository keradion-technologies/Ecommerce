<div class="quick-view-container product-details-container">
    <div class="product-detail-left pe-lg-5">
        <div class="product-thumbnail-slider">
            <img class="qv-lg-image"
                src="{{show_image(file_path()['product']['gallery']['path'].'/'.$product->gallery->first()->image,file_path()['product']['gallery']['size'])}}"
                alt="{{@$product->gallery->first()->image}}">
        </div>

        @php
        $seller = $product->seller;
        @endphp
        <div class="small-img">
            <div class="small-img-item">
                @foreach($product->gallery as $gallery)
                <div class="gallery-sm-img quick-view-img">
                    <img src="{{show_image(file_path()['product']['gallery']['path'].'/'.$gallery->image,file_path()['product']['gallery']['size'])}}"
                        alt="{{$gallery->image}}">
                </div>
                @endforeach
            </div>
        </div>
    </div>
    <div class="product-detail-middle">
        <h3 class="details-product-title">
            {{($product->name)}}
        </h3>
        <div class="product-item-review">
            <div class="ratting mb-0">
                @php echo show_ratings($product->rating()->avg('rating')) @endphp
                <small>({{$product->rating()->count()}} {{translate('Reviews')}})</small>
            </div>
            <small>{{$product->order->count()}}
                {{translate("Orders")}}
            </small>
        </div>
        <div class="product-item-price  price-section">

            @include('frontend.partials.product_price',['product' => $product , "is_campaign" => true])
        </div>


        @if($product->taxes)
        @include('frontend.partials.product_tax',['product' => $product])
        @endif

        <div class="product-item-summery">
            @php echo $product->short_description @endphp
        </div>
        @php
        $randNum = rand(5,99999999);
        $randNum = $randNum."details".$randNum;
        @endphp
        <form class="attribute-options-form-{{$randNum}} quick-view-form">
            <input type="hidden" name="product_uid" value="{{ $product->uid }}">
            @if(count($product->campaigns) != 0 && $product->campaigns->first()->end_time >
            Carbon\Carbon::now()->toDateTimeString() && $product->campaigns->first()->status == '1')
            <input type="hidden" name="campaign_id" value="{{ $product->campaigns->first()->id }}">
            @endif
            @foreach (json_decode($product->attributes_value) as $key => $attr_val)

            @php
            $attributeOption = get_cached_attributes()->find($attr_val->attribute_id);
            $attributValues = @$attributeOption->value;

            @endphp

            <div class="product-colors">
                <span> {{ $attributeOption->name }}:</span>
                <div class="variant">
                    @foreach ($attr_val->values as $key => $value)

                    @php
                    $displayName = $value;

                    if($attributValues){
                    $attributeValue = $attributValues->where('name',$value)->first();
                    if($attributeValue){
                    $displayName = $attributeValue->display_name
                    ? $attributeValue->display_name
                    : $attributeValue->name;
                    }

                    }

                    @endphp
                    <div class="variant-item">
                        <input @if ($key==0) checked @endif type="radio" class="btn-check attribute-select"
                            name="attribute_id[{{ $attr_val->attribute_id }}]" value="{{str_replace(' ', '', $value)}}"
                            id="success-outlined-{{$value}}" autocomplete="off">
                        <label class="btn-outline-success variant-btn" for="success-outlined-{{$value}}">{{ $displayName
                            }}</label>
                    </div>
                    @endforeach
                </div>
            </div>
            @endforeach

            <div class="weight">
                <div class="product-colors">
                    <span>
                        {{translate('Weight')}} : {{$product->weight}} {{translate('KG')}}
                    </span>
                </div>
            </div>

            <p class="text-muted mb-0">
                <strong>{{ translate('SKU') }}:</strong> {{ $product?->sku }}
            </p>

            <div class="stock-status" id="quick-view-stock">

                @include('pos.partials.product_stock_status', ['is_details_stock' => true])

            </div>
            

            <div class="product-actions-type">
                <div class="input-step">
                    <button type="button" class="update_qty x decrement ">–</button>
                    <input type="number" data-view='quick-view' id="option_quantity"
                        class="quick-view-quantity product-quantity" name="quantity" value="1" min='0'>
                    <button type="button" class="update_qty y increment ">+</button>
                </div>

            </div>
        </form>
        <div class="product-detail-btn">
            <a href="javascript:void(0)" data-product_id="{{$randNum}}" class="buy-now-btn quick-buy-btn addtocartbtn">
                <i class="fa-solid fa-cart-plus fs-2 me-3"></i>{{translate("Add to cart")}}
            </a>

        </div>

    </div>
</div>