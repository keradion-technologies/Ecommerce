<?php

namespace App\Http\Controllers\Seller;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Coupon;
use App\Models\PlanSubscription;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class CouponController extends Controller
{
    /**
     * Summary of index
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function index(): View
    {
        $seller     = Auth::guard('seller')->user();
        $title      = translate('Manage Coupons');
        $coupons    = Coupon::where("seller_id", $seller->id)
                                ->latest()
                                ->paginate(site_settings('pagination_number',10));
        return view('seller.marketing.coupon.index', compact('title', 'coupons'));
    }

    /**
     * Summary of create
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function create(): View
    {
        $title = translate('Coupon create');
        return view('seller.marketing.coupon.create', compact('title'));
    }

    /**
     * Summary of store
     * @param \Illuminate\Http\Request $request
     * @return RedirectResponse
     */
    public function store(Request $request) :RedirectResponse
    {
        $seller       = Auth::guard('seller')->user();
        $subscription = PlanSubscription::where('seller_id',$seller->id)
                                            ->where('status',1)
                                            ->first();
        if(!$subscription){
            return back()->with('error',translate('You dont have any runnig subscription'));
        }
        if($subscription->total_coupon < 1 ){
            return back()->with('error',translate('You dont have enough coupon balance to add a new coupon'));
        }
            $this->validate($request, [
            'name'        => 'required',
            'code'        => 'required|unique:coupons,code',
            'type'        => 'required|in:1,2',
            'value'       => 'required|numeric|gt:0',
            'start_date'  => 'required|date',
            'end_date'    => 'required|date|after:start_date',
            'status'      => 'required|in:1,2'
        ]);
        
        $coupon                 = new Coupon();
        $coupon->seller_id      = $seller->id;
        $coupon->name           = $request->name;
        $coupon->code           = $request->code;
        $coupon->type           = $request->type;
        $coupon->value          = $request->value;
        $coupon->start_date     = $request->start_date;
        $coupon->end_date       = $request->end_date;
        $coupon->status         = $request->status;
        $coupon->save();

        $subscription->total_coupon -=1;

        $subscription->save();
        return back()->with('success',translate('Coupon has been created'));
    }

    /**
     * Summary of edit
     * @param int|null $id
     * @return RedirectResponse|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function edit(int|null $id = null) :View|RedirectResponse
    {
        $seller = Auth::guard('seller')->user();
        $title  = translate('Coupon update');
        $coupon = Coupon::where("seller_id", $seller->id)
                            ->where('id',$id)
                            ->first();
        if(!$coupon) {
            return redirect()->back()->with('error',translate('Invalid Coupon'));
        }
        return view('seller.marketing.coupon.edit', compact('title', 'coupon'));
    }

    /**
     * Summary of update
     * @param \Illuminate\Http\Request $request
     * @param int|null $id
     * @return RedirectResponse
     */
    public function update(Request $request, int|null  $id = null) :RedirectResponse
    {
        $this->validate($request, [
            'name'       => 'required',
            'code'        => 'required|unique:coupons,code,'.$id,

            'type'       => 'required|in:1,2',
            'value'      => 'required|numeric|gt:0',

            'start_date' => 'date',
            'end_date'   => 'date|after:start_date',
            'status'     => 'required|in:1,2'
        ]);

        $seller             = Auth::guard('seller')->user();

        $coupon             = Coupon::where("seller_id", $seller->id)
                                        ->where('id', $id)->firstOrfail();
        $coupon->name       = $request->name;
        $coupon->code       = $request->code;
        $coupon->type       = $request->type;
        $coupon->value      = $request->value;
        $coupon->start_date = $request->start_date;
        $coupon->end_date   = $request->end_date;
        $coupon->status     = $request->status;
        $coupon->save();
        return back()->with('success',translate('Coupon has been updated'));
    }

    /**
     * Summary of couponDelete
     * @param \Illuminate\Http\Request $request
     * @return RedirectResponse
     */
    public function couponDelete(Request $request) :RedirectResponse
    {
        Coupon::where('id', $request->id)->delete();
        return back()->with('success',translate('Coupon has been deleted'));
    }
}
