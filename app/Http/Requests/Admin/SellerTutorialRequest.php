<?php

namespace App\Http\Requests\Admin;

use App\Enums\StatusEnum;
use App\Rules\General\FileExtentionCheckRule;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class SellerTutorialRequest extends FormRequest
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
            'title'         => 'required|max:255',
            'description'   => 'required',
            'files.*'       => ['nullable', new FileExtentionCheckRule(['jpg', 'jpeg', 'png', 'pdf', 'mp4'], 'file')],
            'status'        => ['required', Rule::in(StatusEnum::toArray())],
        ];
    }
}
