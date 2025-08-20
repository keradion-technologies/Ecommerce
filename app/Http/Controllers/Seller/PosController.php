<?php

namespace App\Http\Controllers\Seller;

use App\Enums\StatusEnum;
use App\Http\Controllers\Controller;
use App\Http\Requests\Seller\Pos\AddToCartRequest;
use App\Http\Requests\Seller\Pos\CreateCustomerRequest;
use App\Http\Requests\Seller\Pos\CheckoutRequest;
use App\Http\Services\Pos\AnalyticService;
use App\Http\Services\Pos\CartService;
use App\Http\Services\Pos\CheckoutService;
use App\Http\Services\Pos\CustomerService;
use App\Models\Brand;
use App\Models\Category;
use App\Models\City;
use App\Models\Country;
use App\Models\Product;
use App\Models\State;
use App\Models\User;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\View;

class PosController extends Controller
{
    protected $customerService, $cartService, $checkoutService, $analyticService ;

    public function __construct(CustomerService $customerService, CartService $cartService, CheckoutService $checkoutService, AnalyticService $analyticService)
    {
        $this->middleware(['permissions:manage_pos_system']);
        $this->customerService = $customerService;
        $this->cartService = $cartService;
        $this->checkoutService = $checkoutService;
        $this->analyticService = $analyticService;
    }



    public function index()
    {
        $productsQuery =Product::where('seller_id' , auth_user('seller')->id)->search()
                ->sellerProduct()
                ->latest()
                ->physical();
        $productIds = $productsQuery->clone()->pluck('id')->toArray();
        return view('seller.pos.index', [
            'title' => 'Point of Sale',
            "product_ids" => $productIds,
            'products' => $productsQuery->clone()
                ->with(['category', 'brand', 'subCategory', 'order', 'review', 'stock'])
                ->paginate(20)->withQueryString(),
            'countries' => Country::visible()->get(),
            'states' => State::visible()->get(),
            'cities' => City::visible()->get(),
            'categories' => Category::active()->parentCategory()->get(),
            'brands' => Brand::active()->get(),


        ]);
    }

    public function dashboard()
    {
        $response = $this->analyticService->getSellerDashboardData();

        return view('seller.pos.dashboard', $response['data']);

    }

    public function configurations()
    {
        return view('seller.pos.configurations');
    }


    public function productOption(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'id' => 'required|exists:products,id',
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors());
        }
        $slug = '';
        if ($request->slug) {
            $slug = $request->slug;
        }

        $product = Product::with(
            [
                'campaigns' => fn(BelongsToMany $q): BelongsToMany => $q->where('slug', $slug)
                ,
                'shippingDelivery'
                ,
                'shippingDelivery.shippingDelivery'
                ,
                'shippingDelivery.shippingDelivery.method'
                ,
                'stock'
                ,
                'review'
                ,
                'brand'
                ,
                'order'
                ,
                'gallery'
                ,
                'seller'
                ,
                'seller.sellerShop'
                ,
                'review'
                ,
                'review.customer'

            ]
        )->where('id', $request->id)
            ->firstOrFail();



        $title = translate('Product Details');
        return view('pos.partials.product_option', compact('product', 'title'));
    }

    public function productLiveSearch()
    {
        $search = request()->searchData;
        $category = request()->category;
        $seller = auth_user('seller');

        $products = Product::physical()
            ->where('seller_id', $seller->id)
            ->when($category, fn($q) => $q->where('category_id', $category))
            ->when($search, function ($q) use ($search) {
                $q->where(function ($query) use ($search) {
                    $query->where('name', 'like', "%{$search}%")
                        ->orWhere('sku', 'like', "%{$search}%")
                        ->orWhere('barcode', 'like', "%{$search}%");
                });
            })
            ->latest()
            ->take(6)
            ->get();

        return response()->json([
            'success' => $products->isNotEmpty(),
            'html' => view('pos.partials.product_search_results', compact('products'))->render(),
        ]);
    }



    public function customerLiveSearch()
    {
        $search = request()->searchData;

        $customer = User::when($search, fn($q) => $q->where('name', 'like', "%{$search}%"))
            ->latest()->take(6)->get();

        return response()->json([
            'success' => $customer->isNotEmpty(),
            'customer' => $customer
        ]);
    }

    public function customerStore(CreateCustomerRequest $request)
    {
        $customer = $this->customerService->createCustomer($request);

        return response()->json([
            'customer' => $customer
        ]);

    }

    public function cartStore(AddToCartRequest $request)
    {
        $response = $this->cartService->addToCart($request, auth_user('seller'));
        return response()->json($response);
    }


    public function viewCart()
    {
        $title = translate('Shopping Cart');

        $items = $this->cartService->getCartItems(auth_user('seller'));


        if (request()->ajax()) {
            return [
                'cart_html' => view('pos.partials.cart_list', compact('title', 'items'))->render(),
                'summary_html' => view('pos.partials.order_summary', compact('items'))->render(),
            ];
        }
    }


    public function removeFromCart(Request $request)
    {

        $response = $this->cartService->removeFromCart($request->id, auth_user('seller'));

        return response()->json($response);
    }

    public function clearCart()
    {
        $response = $this->cartService->clearCart(auth_user('seller'));

        return response()->json($response);
    }

    public function updateCart(Request $request)
    {
        $response = $this->cartService->updateCart($request, auth_user('seller'));

        return response()->json($response);

    }

    public function holdCart()
    {
        $response = $this->cartService->holdCart(auth_user('seller'));

        return response()->json($response);

    }

    public function holdCartList()
    {
        $response = $this->cartService->getHoldList(auth_user('seller'));

        $heldOrders = $response['data'];

        $html = view('pos.partials.hold_order_list', compact('heldOrders'))->render();

        return response()->json($html);
    }

    public function restoreCart($holdUid)
    {
        $response = $this->cartService->restoreCart($holdUid, auth_user('seller'));

        return back()->with('success', 'Cart restored');
    }

    public function applyCoupon(Request $request)
    {
        $response = $this->cartService->applyCoupon($request);


        return response()->json($response);

    }



    public function customerAddress(Request $request)
    {
        $response = $this->checkoutService->getAddressList($request->id);


        return response()->json($response);

    }

    public function checkout(CheckoutRequest $request)
    {
        $response = $this->checkoutService->placeOrder($request, auth_user('seller'));

        if ($response['status']) {

            session()->forget('coupon');

            $title = translate('Print invoice');
            $order = $response['data'];
            $orderDeatils = $response['order_details'];
            $response['invoice_html'] = view('pos.partials.print', compact('title', 'order', 'orderDeatils'))->render();

        }


        return response()->json($response);

    }


}
