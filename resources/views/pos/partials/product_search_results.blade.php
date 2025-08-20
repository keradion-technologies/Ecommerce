@forelse($products as $product)
    @include('pos.partials.product_card', ['product' => $product])
@empty
    @include("pos.partials.empty", ['message' => 'No product found'])
@endforelse