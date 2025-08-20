<?php

namespace App\Http\Resources\Pos;

use App\Models\DigitalProductAttribute;
use App\Models\Order;
use Illuminate\Http\Resources\Json\JsonResource;

class OrderDetailsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {


        $status = '--';

        


        return [
            'id'                 => $this->id,
            'uid'                => $this->uid,
            'product_name'       => $this->product->name,
            'product_image'      => show_image(file_path()['product']['featured']['path'].'/'.$this->product->featured_image ,file_path()['product']['featured']['size']),
            'quantity'           => $this->quantity,
            'total_price'                 => api_short_amount($this->total_price),
            'original_total_price'        => api_short_amount($this->original_price),
            'total_taxes'        => api_short_amount($this->total_taxes),
            'discount'           => api_short_amount($this->discount),
            'attribute'          => ($this->attribute),

        ];
    }
}
