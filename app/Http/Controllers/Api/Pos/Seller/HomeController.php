<?php

namespace App\Http\Controllers\Api\Pos\Seller;

use App\Http\Controllers\Controller;
use App\Http\Resources\Pos\BrandCollection;
use App\Http\Resources\Pos\CategoryCollection;
use App\Http\Resources\Pos\CurrencyCollection;
use App\Http\Resources\Pos\PaymentMethodCollection;
use App\Http\Resources\Seller\SellerResource;
use App\Http\Resources\Seller\TransactionCollection;
use App\Http\Services\Pos\AnalyticService;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Currency;
use App\Models\PaymentMethod;
use App\Models\Seller;
use Carbon\Carbon;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Models\City;
use App\Models\Country;
use App\Models\State;
use App\Http\Resources\Pos\CityCollection;
use App\Http\Resources\Pos\CountryCollection;
use App\Http\Resources\Pos\StateCollection;


class HomeController extends Controller
{
    protected $analyticService;
    protected ? Seller $seller;
    public function __construct(AnalyticService $analyticService){
        $this->analyticService = $analyticService;
        $this->seller = auth()->guard('seller:api')->user()?->load(['sellerShop']);
    }


    public function config()
    {
        $posPaymentMehtod = PaymentMethod::with('currency')->search()->pos()->forSeller($this->seller->id)->where('type', 3)->get();

        $countries      = Country::visible()->get();
        $states         = State::visible()->get();
        $cities         = City::visible()->get();
        $brands         = Brand::active()->get();
        $categories     = Category::active()->get();
        $currency       = Currency::latest()->get();

 

        return api([
            'payment_methods' => new PaymentMethodCollection($posPaymentMehtod),
            'countries' => new CountryCollection($countries),
            'states' => new StateCollection($states),
            'cities' => new CityCollection($cities),
            'brands' => new BrandCollection($brands),
            'categories' => new CategoryCollection($categories),
            'currencies' => new CurrencyCollection($currency)
        ])->success(__('response.success'));
    }


    public function dashboard(): JsonResponse
    {

        $now = Carbon::now()->toDateTimeString();

        return api([
            'seller' => new SellerResource($this->seller),
            'overview' => $this->analyticService->getDashboardOverview($this->seller),
            'graph_data' => $this->analyticService->getGraphData($this->seller),
            'transaction' => new TransactionCollection($this->analyticService->getLatestTransaction($this->seller)),
        ])->success(__('response.success'));
    }
}
