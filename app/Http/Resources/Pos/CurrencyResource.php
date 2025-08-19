<?php

namespace App\Http\Resources\Pos;

use Illuminate\Http\Resources\Json\JsonResource;

class CurrencyResource extends JsonResource
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
            'id'      => $this->id,
            'uid'     => $this->uid,
            'name'    => $this->name,
            'symbol'  => $this->symbol,
            'rate'    => num_format($this->rate,2),
        ];
    }
}
