<?php

namespace App\Http\Controllers\Api\Pos\Seller;

use App\Http\Controllers\Controller;
use App\Http\Resources\Pos\AttributeCollection;
use App\Http\Resources\Pos\ProductCollection;
use App\Http\Services\Seller\ProductService;
use App\Models\Attribute;
use App\Models\PlanSubscription;
use App\Models\Product;
use App\Models\Seller;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ProductController extends Controller
{

    protected ? Seller $seller;
    protected ? PlanSubscription $subscription = null;

    public function __construct(protected ProductService $productService){


        $this->middleware(function ($request, $next) {

            $this->seller = auth()->guard('seller:api')->user()?->load(['sellerShop']);

            $this->subscription = PlanSubscription::where('seller_id',$this->seller ->id)
                                     ->where('status',PlanSubscription::RUNNING)
                                     ->where('expired_date','>' ,Carbon::now()->toDateTimeString())
                                     ->first();
    
            //check subscriptions
            if(!$this->subscription)  return api(['errors' => [translate('You dont have any runnig subscription')]])
                                                                   ->fails(__('response.fail'));
        
             // Shop status check
            if(@$this->seller->sellerShop && $this->seller->sellerShop->status == 1 ) return $next($request);

            return api(['errors' => [translate('Your store is not approve yet')]])->fails(__('response.fail'));
 
        });
    }
    public function list(): JsonResponse
    {
        $status = request()->input("status");
        $type   = 'physical';


        $product =  Product::with(['category', 'brand', 'subCategory', 'order','gallery','stock','review','review.customer','shippingDelivery','digitalProductAttribute','digitalProductAttribute.digitalProductAttributeValueKey'])
                                ->sellerProduct()
                                ->where('seller_id', $this->seller->id)
                                ->search()
                                ->filter()
                                ->when($type == 'physical', fn(Builder $query) : Builder => $query->physical())
                                ->latest()
                                ->paginate(site_settings('pagination_number',10));


        $attributes = Attribute::with('value')->active()->get();

        
        return api([ 
            'products'                  => new ProductCollection($product),
            'attribute'                 => new AttributeCollection($attributes)
        ])->success(__('response.success'));
    }
}
