@if(@$is_details_stock)

    @php  
        $stockQty = (int) @$product->stock->first()->qty ??  0; 
    @endphp

    <div class="{{ $stockQty > 0  ? 'instock' : 'outstock'}}">
        <i class="{{ $stockQty > 0 ? 'fa-solid fa-circle-check' : 'fas fa-times-circle' }}"></i>
        <p>
            {{ $stockQty > 0 ? translate("In Stock") . ' (' . $stockQty . ')' : translate("Stock out") }}
        </p>
    </div>

@else

    @php 
        $totalQty = $product->stock->sum("qty");
    @endphp

    <div class='{{ $totalQty > 0 ? "instock" : "outstock" }} mt-0 mb-2'>
        <i class='{{ $totalQty > 0 ? "fa-solid fa-circle-check" : "fas fa-times-circle" }}'></i>
        <p>
            {{ $totalQty > 0 ? translate('In Stock') . ' (' . $totalQty . ')' : translate('Stock out') }}
        </p>
    </div>

@endif
