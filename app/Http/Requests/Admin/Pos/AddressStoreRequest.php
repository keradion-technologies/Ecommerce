<?php

namespace App\Http\Requests\Admin\Pos;

use Illuminate\Foundation\Http\FormRequest;

class AddressStoreRequest extends FormRequest
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
            'address_name'  => 'nullable|string|max:255',
            'email'         => 'nullable|email|max:255',
            'customer_id'   => 'required|exists:users,id',
            'first_name'    => 'required|string|max:255',
            'last_name'     => 'required|string|max:255',
            'phone'         => 'required|string|max:20',
            'zip'           => 'nullable|string|max:100',
            'country_id'    => 'required|integer|exists:countries,id',
            'state_id'      => 'required|integer|exists:states,id',
            'city_id'       => 'required|integer|exists:cities,id',
            'address'       => 'required|string|max:500',
        ];
    }
}
