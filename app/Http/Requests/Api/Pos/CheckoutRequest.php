<?php

namespace App\Http\Requests\Api\Pos;

use App\Enums\Pos\CustomerType;
use App\Enums\Pos\DeliveryOption;
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
            'customer_id' => 'nullable|exists:users,id',
            'address_id' => 'nullable|exists:user_addresses,id',
            'customer_type' => 'required|in:' . implode(',', CustomerType::values()),
            'payment_method' => 'required|exists:payment_methods,id',
            'delivery_option' => 'required|in:' . implode(',', DeliveryOption::values()),
            'discount_type' => 'nullable|in:flat,percentage',
            'discount_value' => 'nullable|numeric|min:0',
            'shipping_charge' => 'nullable|numeric|min:0',
            'coupon_amount' => 'nullable|numeric|min:0',
            'note' => 'nullable|string|max:1000',
            'billing_address' => 'nullable|array',
            'billing_address.name' => 'required_with:billing_address|string|max:255',
            'billing_address.email' => 'required_with:billing_address|email|unique:users,email|max:255',
            'billing_address.phone' => 'required_with:billing_address|unique:users,phone|string|max:20',
            'billing_address.country' => 'required_with:billing_address|exists:countries,id',
            'billing_address.state' => 'required_with:billing_address|exists:states,id',
            'billing_address.city' => 'required_with:billing_address|exists:cities,id',
            'billing_address.address' => 'required_with:billing_address|string|max:500',
        ];
    }

    public function messages()
    {
        return [
            'billing_address.email.unique' => 'This email is already taken.',
            'billing_address.phone.unique' => 'This phone number is already taken.',
        ];
    }

}
