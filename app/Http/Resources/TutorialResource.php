<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class TutorialResource extends JsonResource
{
    protected array $dateFields = ['created_at', 'updated_at'];
    protected array $basicFields = [
        'uid',
        'status',
        'title',
        'description',
        'files'
    ];

    /**
     * Transform the resource into an array.
     *
     * @param mixed $request
     * @return array
     */
    public function toArray($request): array
    {
        $data = [];

        collect($this->basicFields)->each(function ($field) use (&$data) {
            $data[$field] = isset($this->{$field}) ? $this->{$field} : null;
        });

        collect($this->dateFields)->each(function ($dateField) use (&$data) {
            $data[$dateField] = isset($this->{$dateField}) ? get_date_time(date: $this->{$dateField}) : null;
            $data['raw_' . $dateField] = isset($this->{$dateField}) ? $this->{$dateField} : null;
        });
        return $data;
    }
}
