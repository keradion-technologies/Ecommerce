<?php

namespace App\Http\Controllers\Api\Pos\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\Pos\AttributeCollection;
use App\Http\Resources\Pos\ProductCollection;
use App\Http\Services\Seller\ProductService;
use App\Models\Attribute;
use App\Models\Product;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\JsonResponse;

class ProductController extends Controller
{


    
    public function list(): JsonResponse
    {
        $status = request()->input("status");
        $type   = 'physical';

        $product =  Product::with(['category', 'brand', 'subCategory', 'order','gallery','stock','review','review.customer','shippingDelivery','digitalProductAttribute','digitalProductAttribute.digitalProductAttributeValueKey'])
                                ->whereNull('seller_id')
                                ->search()
                                ->when($type == 'physical', fn(Builder $query) : Builder => $query->physical())
                                ->filter()
                                ->latest()
                                ->paginate(site_settings('pagination_number',10));

        $attributes = Attribute::with('value')->active()->get();

        
        return api([ 
            'products'                  => new ProductCollection($product),
            'attribute'                 => new AttributeCollection($attributes)
        ])->success(__('response.success'));
    }
}
