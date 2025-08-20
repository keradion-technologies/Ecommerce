<?php

namespace App\Http\Resources\Pos;

use Illuminate\Http\Resources\Json\JsonResource;

class CartHoldResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id'             => $this->id,
            'uid'            => $this->uid,
            'note'           => $this->note,
            'order_id'       => $this->summary_meta->order_id ?? null,
            'date'           => $this->summary_meta->date ?? null,
            'customer_name'  => $this->summary_meta->customer_name ?? null,
            'total'          => $this->summary_meta->total ?? null,
            'item_count'     => $this->summary_meta->item_count ?? null,
            'item_summary'   => $this->summary_meta->item_summary ?? null,
        ];
    }
}
