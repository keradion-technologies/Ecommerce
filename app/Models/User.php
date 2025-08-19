<?php

namespace App\Models;

use App\Enums\Status;
use Carbon\Carbon;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
class User extends Authenticatable implements MustVerifyEmail
{
    use HasApiTokens, HasFactory, Notifiable;


    const ACTIVE = 'active';
    const BANNED = "banned";

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'last_name',
        'password',
        'country_id',
        'phone',
        'address',
        'image',
        'google_id',
        'status',
        'billing_address',
        'uid',
        'balance',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'address' => 'object',
        'billing_address' => 'object',
    ];


    public function scopeActive($query)
    {
        return $query->where('status', '1');
    }


    public function billingAddress()
    {

        return $this->hasMany(UserAddress::class,'user_id')->with(['city','state','country'])->latest();

    }


    public function scopeBanned($query)
    {
        return $query->where('status', '0');
    }

    public function scopeDate($query)
    {
        return $query->where('status', '0');
    }

    public function physicalProductOrder()
    {
        return $this->hasMany(Order::class, 'customer_id')->where('order_type', 102);
    }

    public function digitalProductOrder()
    {
        return $this->hasMany(Order::class, 'customer_id')->where('order_type', 101);;
    }

    public function order()
    {
        return $this->hasMany(Order::class, 'customer_id','id')->orderBy('id', 'DESC');
    }

    public function transaction()
    {
        return $this->hasMany(Transaction::class, 'user_id');
    }

    public function ticket()
    {
        return $this->hasMany(SupportTicket::class, 'user_id');
    }

    public function wishlist()
    {
        return $this->hasMany(WishList::class, 'customer_id')->orderBy('id', 'DESC')->with('product', 'product.brand', 'product.stock');
    }

    public function reviews()
    {
        return $this->hasMany(ProductRating::class, 'user_id')->with('product');
    }

    public function following() {
        return $this->belongsToMany(User::class, 'followers', 'follower_id', 'following_id');
    }

    public function follower()
    {
        return $this->hasMany(Follower::class, 'following_id');
    }
    protected static function booted()
    {
        static::creating(function ($user) {
            $user->uid = str_unique();
        });
    }




    public function rewards() {
        return $this->hasMany(RewardPointLog::class,'user_id','id');
    }

    public function scopeSearch($q)
    {
        return $q->when(request()->input('search'),function($q){

             $searchBy = '%'. request()->input('search').'%';
             return  $q->where('name','like',$searchBy)
                        ->orWhere('email',request()->input('search'))
                        ->orWhere('username',request()->input('search'))
                        ->orWhere('phone',request()->input('search'));
            })->when(request()->input(key: 'status'),function($q){
                  $status = request()->input(key: 'status');
                  return  $q->when($status == SELF::ACTIVE , fn(Builder $query):Builder => $query->active() , fn(Builder $query):Builder => $query->banned() );
               });
    }


    public function country(){
        return $this->belongsTo(Country::class,'country_id','id');
    }




    public function latestDeliveryManMessage(){
        return $this->hasOne(CustomerDeliverymanConversation::class,'customer_id','id')
                                   ->latest();
    }




    public function latestSellerMessage(){
        return $this->hasOne(CustomerSellerConversation::class,'customer_id','id')
                                   ->latest();
    }







    /**
     * Summary of getOverview
     * @return  object
     */
    public static function getOverview(): object{


        $topCustomers = SELF::withCount('order')
                                            ->orderBy('order_count', 'desc')
                                            ->take(10)
                                            ->get();



        $active   = Status::ACTIVE;
        $inactive = Status::INACTIVE;

        $customerStats = SELF::selectRaw(expression: "
                                COUNT(*) as total,
                                SUM(CASE WHEN status = ? THEN {$active} ELSE {$inactive} END) as active,
                                SUM(CASE WHEN status = ? THEN {$active} ELSE {$inactive} END) as banned
                            ", bindings: [$active, $inactive])
                            ->first();





        $customersByMonth = SELF::selectRaw('MONTH(created_at) as month, COUNT(*) as total')
                            ->when(request()->query('date'), function ($query) {

                                [$startDate, $endDate] = explode(' - ', request()->query('date'));

                                $query->whereBetween('created_at', [
                                    Carbon::parse($startDate)->startOfDay(),
                                    Carbon::parse($endDate)->endOfDay(),
                                ]);
                            }, function ($query) {
                                $query->whereYear('created_at', Carbon::now()->year); // Filter by current year by default if no date range selected
                            })
                            ->groupBy('month')
                            ->orderBy('month')
                            ->get();

        $graphData = [];

        foreach ($customersByMonth as $customer) {
            $month = Carbon::createFromFormat('m', $customer->month)->format('M'); // Jan, Feb, etc.
            $graphData[$month] = $customer->total;
        }





        return (object)([
                    'top_customers' => $topCustomers,
                    'customer_stats' =>  [

                        k2t(text: 'active') => (int) @$customerStats->active ?? 0,
                        k2t(text: 'banned') => (int) @$customerStats->banned ?? 0,
                    ],
                    'graph_data' => $graphData
                ]);
    }






}
