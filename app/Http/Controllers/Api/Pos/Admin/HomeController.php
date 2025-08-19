<?php

namespace App\Http\Controllers\Api\Pos\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\Pos\BrandCollection;
use App\Http\Resources\Pos\CategoryCollection;
use App\Http\Resources\Pos\CityCollection;
use App\Http\Resources\Pos\CountryCollection;
use App\Http\Resources\Pos\PaymentMethodCollection;
use App\Http\Resources\Pos\StateCollection;
use App\Http\Resources\Pos\TransactionCollection;
use App\Http\Services\Pos\AnalyticService;
use App\Models\Admin;
use App\Models\Brand;
use App\Models\Category;
use App\Models\City;
use App\Models\Country;
use App\Models\PaymentMethod;
use App\Models\State;
use Carbon\Carbon;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class HomeController extends Controller
{

    protected $analyticService;
    protected $admin;
    public function __construct(AnalyticService $analyticService)
    {
        $this->analyticService = $analyticService;
        $this->admin = auth_user('admin:api');
    }


    public function config()
    {
        $posPaymentMehtod = PaymentMethod::active()
            ->pos()
            ->get();

        $countries = Country::visible()->get();
        $states = State::visible()->get();
        $cities = City::visible()->get();
        $brands = Brand::active()->get();
        $categories = Category::active()->get();



        return api([
            'pos_system' => site_settings('pos_system'),
            'payment_methods' => new PaymentMethodCollection($posPaymentMehtod),
            'countries' => new CountryCollection($countries),
            'states' => new StateCollection($states),
            'cities' => new CityCollection($cities),
            'brands' => new BrandCollection($brands),
            'categories' => new CategoryCollection($categories),
        ])->success(__('response.success'));
    }

    public function dashboard(): JsonResponse
    {

        $now = Carbon::now()->toDateTimeString();

        return api([

            'overview' => $this->analyticService->getDashboardOverview($this->admin),
            'graph_data' => $this->analyticService->getGraphData($this->admin),
            'transaction' => new TransactionCollection($this->analyticService->getLatestTransaction($this->admin)),
        ])->success(__('response.success'));
    }


}
