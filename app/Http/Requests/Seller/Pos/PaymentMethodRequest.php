<?php

namespace App\Http\Requests\Seller\Pos;

use Illuminate\Foundation\Http\FormRequest;

class PaymentMethodRequest extends FormRequest
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
        $id = request()->input('id');

        return [
            'name' => 'required|unique:payment_methods,name,'.$id,
            'currency_id' => 'required|exists:currencies,id',
            'percent_charge' => 'required|numeric|gt:-1',
            'rate' => 'required|numeric|gt:-1',
            'image' => 'nullable|image|mimes:jpg,png,jpeg',
        ];
    }
}
