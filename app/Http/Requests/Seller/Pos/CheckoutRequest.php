<?php

namespace App\Http\Requests\Seller\Pos;

use App\Enums\Pos\CustomerType;
use App\Enums\Pos\PaymentOption;
use Illuminate\Foundation\Http\FormRequest;

class CheckoutRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'customer_id'     => 'nullable|exists:users,id',
            'address_id'      => 'nullable|exists:user_addresses,id',
            'customer_type'   => 'required|in:' . implode(',', CustomerType::values()),
            'payment_method' => 'required|exists:payment_methods,id',
            'discount_type'   => 'nullable|in:flat,percentage',
            'discount_value'  => 'nullable|numeric|min:0',
            'shipping_charge' => 'nullable|numeric|min:0',
            'note'            => 'nullable|string|max:1000',
            'billing_address' => 'nullable|array',
            'delivery_option' =>'required|string'
        ];
    }
}
