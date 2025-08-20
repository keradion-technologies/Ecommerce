<?php

namespace App\Http\Resources\Pos;

use Illuminate\Http\Resources\Json\JsonResource;

class PosCartResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $data = [
            'id'                => $this->id,
            'product_id'        => $this->product_id,
            'name'              => optional($this->product)->name,
            'barcode'           => optional($this->product)->barcode,
            'original_price'    => $this->original_price,
            'price'             => $this->price,
            'discount'          => $this->discount,
            'total_taxes'       => $this->total_taxes,
            'quantity'          => $this->quantity,
            'total'             => $this->total,
            'attribute'         => $this->attributes_value,
        ];

        if ($this->relationLoaded('product')) {
            $data['product'] = new ProductResource($this->product);
        }

        return $data;


    }
}
