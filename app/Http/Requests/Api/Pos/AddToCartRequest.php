<?php

namespace App\Http\Requests\Api\Pos;

use Illuminate\Foundation\Http\FormRequest;

class AddToCartRequest extends FormRequest
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
            'product_uid'           => 'required|string|exists:products,uid',
            'quantity'              => 'nullable|integer|min:1',
            'attribute_combination' => 'nullable|string',
            'attribute_id'          => 'nullable|array',
            'session_id'            => 'nullable|string',
        ];
    }

    public function messages(): array
    {
        return [
            'product_uid.required'  => 'Product UID is required.',
            'product_uid.exists'    => 'No matching product found.',
            'quantity.min'          => 'Minimum quantity is 1.',
        ];
    }
}
