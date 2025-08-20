<?php

namespace App\Http\Controllers\Admin;

use App\Enums\StatusEnum;
use App\Http\Controllers\Controller;
use App\Models\Country;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Transaction;
use App\Models\Order;
use App\Models\PaymentLog;
use App\Models\RewardPointLog;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Traits\ExportAble;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class CustomerController extends Controller
{

    use ExportAble;
    public function __construct(){

        $this->middleware(['permissions:manage_customer']);
    }

    public function index() :View
    {

        $title     = translate('Manage customers');

        $overview  = User::getOverview();
        $customers = User::search()->latest()
                            ->with(['order','rewards'])
                            ->paginate(site_settings('pagination_number',10))
                            ->appends(request()->all());

        $order = Order::when(request()->query('date'), function ($query) {

                                    [$startDate, $endDate] = explode(' - ', request()->query('date'));

                                    $query->whereBetween('created_at', [
                                        Carbon::parse($startDate)->startOfDay(),
                                        Carbon::parse($endDate)->endOfDay(),
                                    ]);
                                }, function ($query) {
                                    $query->whereYear('created_at', Carbon::now()->year); // Filter by current year by default if no date range selected
                                })
                                ->get();

        $orderStats = (object) [
            'total_orders' => $order->count(),
            'total_amount' => $order->sum('amount')
        ];

        return view('admin.customer.index', compact('title', 'customers','overview' , 'orderStats' ));
    }




    public function details(int $id) :View
    {
        $title = translate('Customer Details');
        $user  = User::where('id', $id)->first();
        $countries = Country::visible()->get();
        return view('admin.customer.details', compact('title', 'user','countries'));
    }
    public function login(int $id) :RedirectResponse
    {
        $user  = User::where('id', $id)->firstOrfail();
        $user->status = StatusEnum::true->status();
        $user->save();
        Auth::guard('web')->login($user);

        return redirect()->route('home');

    }

    public function update(Request $request, int  $id) :RedirectResponse
    {
        $request->validate([
            'name'      => 'nullable|max:120',
            'email'     => 'nullable|unique:users,email,'.$id,
            'phone'     => 'nullable|unique:users,phone,'.$id,
            'address'   => 'nullable|max:250',
            'city'      => 'nullable|max:250',
            'state'     => 'nullable|max:250',
            'zip'       => 'nullable|max:250',
            'status'    => 'nullable|in:1,0',
            'country_id' => 'required|exists:countries,id',
        ]);
        $user = User::where('id',$id)->firstOrfail();
        $user->name  = $request->name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->country_id = $request->country_id;
        $address = [
            'address' => $request->address,
            'city'    => $request->city,
            'state'   => $request->state,
            'zip'     => $request->zip
        ];
        $user->address = $address;
        $user->status  = $request->status;
        $user->save();
        return back()->with('success',translate('User has been updated'));

    }



    public function transaction(int | string  $id) :View
    {
        $user         = User::where('id',$id)->firstOrfail();
        $title        = ucfirst($user->name)." transaction";
        $transactions = Transaction::users()->where('user_id', $id)->latest()->with('user')->paginate(site_settings('pagination_number',10));
        return view('admin.report.index', compact('title', 'transactions'));
    }

    public function physicalProductOrder(int $id) :View
    {
        $user   = User::where('id', $id)->firstOrfail();
        $title  = ucfirst($user->name)." physical product order";
        $orders = Order::physicalOrder()->where('customer_id', $id)->orderBy('id', 'DESC')->with('customer')->paginate(site_settings('pagination_number',10));
        return view('admin.order.index', compact('title', 'orders'));
    }

    public function digitalProductOrder(int $id) :View
    {
        $user   = User::where('id',$id)->firstOrfail();
        $title  = ucfirst($user->name)." digital product order";
        $orders = Order::digitalOrder()->where('customer_id', $id)->orderBy('id', 'DESC')->with('customer')->paginate(site_settings('pagination_number',10));
        return view('admin.digital_order.index', compact('title', 'orders'));
    }


    #VERSION 2.1



    /**
     * Summary of delete
     * @param int|string $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function delete(int | string $id): RedirectResponse{


        $user = User::with(['billingAddress'])
                           ->where('id',$id)
                           ->firstOrfail();
        $user->billingAddress()->delete();
        if($user->image ) remove_file(file_path()['profile']['user']['path'],$user->image );
        $user->delete();
        return redirect()->back()->with('success','User deleted successfully');
    }




    /**
     * Summary of balanceUpdate
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function balanceUpdate(Request $request): RedirectResponse{

        $request->validate([
            'user_id'      => 'required',
            'balance_type' => 'required|in:1,2',
            'amount'       => 'required|numeric|gt:0',
        ]);

        $user = User::findOrFail($request->input('user_id'));
        if($request->input('balance_type') == 1){
            $user->balance += $request->input('amount');
            $user->save();
            $transaction = Transaction::create([
                'user_id'            => $user->id,
                'amount'             => $request->input('amount'),
                'post_balance'       => $user->balance,
                'transaction_type'   => Transaction::PLUS,
                'transaction_number' => trx_number(),
                'details'            => 'Balance Added by admin',
            ]);
        }else{
            if($request->input('amount') >  $user->balance  )  return back()->with('error',translate('User Doesnot have enough balance to withdraw'));
            $user->balance -= $request->input('amount');
            $user->save();
            $transaction = Transaction::create([
                'user_id'            => $user->id,
                'amount'             => $request->input('amount'),
                'post_balance'       => $user->balance,
                'transaction_type'   => Transaction::MINUS,
                'transaction_number' => trx_number(),
                'details'            => 'Balance subtract by admin',
            ]);
        }

        return back()->with('success',translate('User balance has been updated'));
    }



    /**
     * Summary of create
     * @return \Illuminate\View\View
     */
    public function create(): View{
        $title = translate('Create customer');
        $countries = Country::visible()->get();

        return view('admin.customer.create', compact('title','countries'));
    }



    /**
     * Summary of store
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request): RedirectResponse{


        $request->validate([
            'name'      => 'required|max:120',
            'email'     => 'required|unique:users,email',
            'password'  => 'required',
            'address'   => 'nullable|max:250',
            'city'      => 'nullable|max:250',
            'state'     => 'nullable|max:250',
            'zip'       => 'nullable|max:250',
            'country_id' => 'required|exists:countries,id',
        ]);
        $user = new User();
        $user->name  = $request->name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->country_id = $request->country_id;
        $address = [
            'address' => $request->address,
            'city'    => $request->city,
            'state'   => $request->state,
            'zip'     => $request->zip
        ];
        $user->address = $address;
        $user->status    = StatusEnum::true->status();
        $user->password  = Hash::make($request->password);

        if($request->hasFile('image')){
            try{
                $user->image = store_file($request->image, file_path()['profile']['user']['path']);
            }catch (\Exception $exp){

            }
        }
        $user->save();
        return back()->with('success',translate('User has been created'));

    }




    /**
     * Summary of rewards
     * @return \Illuminate\View\View
     */
    public function rewards(): View{

        $title     = translate('Customer rewards');
        $customers = User::latest()->get();

        $rewardsLogs = RewardPointLog::with(['user','product','order'])
                              ->search()
                              ->date()
                              ->whereNotNull('user_id')
                              ->paginate(site_settings('pagination_number',10))
                              ->appends(request()->all());

        return view('admin.customer.rewards', compact('title', 'customers','rewardsLogs'));

    }




    /**
     * Summary of exportCsv
     * @return \Symfony\Component\HttpFoundation\StreamedResponse
     */
    public function exportCsv(): \Symfony\Component\HttpFoundation\StreamedResponse{
        $fileHeaders = ['ID','EMAIL','USERNAME','PHONE','REGISTRATION_TIME'];
        $pluckableKeys = ['id','email','username','phone','created_at'];
        return ($this->csvExport(model: 'User',fileNamePrefix:'user',fileHeader: $fileHeaders , pluckableKeys: $pluckableKeys));
    }







    /**
     * Summary of wallet
     * @return \Illuminate\View\View
     */
    public function wallet(): View{

        $title      = translate('Wallet transaction');
        $customers  = User::latest()->get();
        $paymentLogs = PaymentLog::whereNotNull('user_id')
                                    ->filter()
                                    ->date()
                                    ->with(['user','paymentGateway','paymentGateway.currency'])
                                    ->deposit()
                                    ->paginate(site_settings('pagination_number',10))
                                    ->appends(request()->all());


        return view('admin.customer.wallet_log', compact('title', 'customers','paymentLogs'));

    }

    public function depositLogCsv(): \Symfony\Component\HttpFoundation\StreamedResponse{
        $fileHeaders = ['TIME','TRX_NUMBER','USERNAME','USER_EMAIL', 'METHOD','AMOUNT', 'FINAL_AMOUNT' ];
        $pluckableKeys = ['created_at','trx_number',['user', 'name'], ['user' , 'email'], ['paymentGateway' , 'name'] ,'amount' , 'final_amount' ];

        return $this->csvExport(model: 'PaymentLog',fileNamePrefix:'deposit_log',fileHeader: $fileHeaders , pluckableKeys: $pluckableKeys);
    }

    public function walletLogCsv(): \Symfony\Component\HttpFoundation\StreamedResponse{
        $fileHeaders = ['CUSTOMER','TOTAL_POINT','STATUS','EXPIRED_AT', 'CREATED_AT','DETAILS' ];
        $pluckableKeys = [['user', 'email'], 'point', 'status', 'expired_at' ,'created_at' , 'details' ];

        return $this->csvExport(model: 'RewardPointLog',fileNamePrefix:'deposit_log',fileHeader: $fileHeaders , pluckableKeys: $pluckableKeys);
    }


}
