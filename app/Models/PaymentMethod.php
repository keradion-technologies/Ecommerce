<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PaymentMethod extends Model
{
    use HasFactory;

    const ACTIVE = 1;
    const INACTIVE = 2;
    const AUTOMATIC = 1;
    const MANUAL = 2;
    const POS = 3;
    protected $guarded = [];

    protected $casts = [
        'payment_parameter' => 'object'
    ];




    /**
     * Get gateway currency
     *
     * @return BelongsTo
     */
    public function currency(): BelongsTo
    {
        return $this->belongsTo(Currency::class, 'currency_id');
    }



    /**
     * Get active payment method
     *
     * @param Builder $query
     * @return Builder
     */
    public function scopeActive(Builder $query): Builder
    {
        return $query->where('status', self::ACTIVE);
    }



    /**
     * Get automatic payment method
     *
     * @param Builder $query
     * @return Builder
     */
    public function scopeAutomatic(Builder $query): Builder
    {
        return $query->where('type', self::AUTOMATIC);
    }

    /**
     * Get manual payment method
     *
     * @param Builder $query
     * @return Builder
     */
    public function scopeManual(Builder $query): Builder
    {
        return $query->where('type', self::MANUAL);
    }


    public function scopePos(Builder $query): Builder
    {
        return $query->where('type', self::POS);
    }




    protected static function booted()
    {
        static::creating(function (Model $paymentMethod) {
            $paymentMethod->uid = str_unique();
        });
    }



    /**
     * Search by request params
     *
     * @param Builder $query
     * @return Builder
     */
    public function scopeSearch(Builder $query): Builder
    {

        return $query->when(request()->input('search'), function ($q) {
            $searchBy = '%' . request()->input('search') . '%';
            return $q->where('name', 'like', $searchBy);
        });
    }

    public function scopeForAdmin($query)
    {
        return $query->whereNull('owner_type');
    }

    public function scopeForSeller($query, $sellerId)
    {
        return $query->where('owner_type', 'seller')
            ->where('owner_id', $sellerId);
    }

}
