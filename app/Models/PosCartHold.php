<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PosCartHold extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $casts = [
        'cart_items'    => 'object',
        'summary_meta'  => 'object',
    ];

    protected static function booted()
    {
        static::creating(function ($cart) {
            $cart->uid = str_unique();
        });
    }
}
