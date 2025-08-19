<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PosCart extends Model
{
    use HasFactory;

    protected $guarded = [];
    
    protected $casts = [
        'attribute' => 'object',
    ];

    protected static function booted()
    {
        static::creating(function ($cart) {
            $cart->uid = str_unique();
        });
    }

    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class);
    }

    public function seller(): BelongsTo
    {
        return $this->belongsTo(Seller::class);
    }

    public function admin(): BelongsTo
    {
        return $this->belongsTo(Admin::class);
    }

    public function customer(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function scopeFilter($q,$user,$sessionId){

        return $q->when($user && $sessionId  ,  function ($q) use ($user,$sessionId) {
            return $q->where('user_id', $user->id);
        })->when($sessionId ,  function ($q) use ($sessionId) {
            return $q->where('session_id', $sessionId);
        });
    }
}
