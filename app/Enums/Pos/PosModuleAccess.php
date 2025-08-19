<?php

namespace App\Enums\Pos;

enum PosModuleAccess
{
    case true;
    case false;

    /**
     * get enum status
     */
    public function status(): string
    {
        return match ($this) {
            PosModuleAccess::true => '1',
            PosModuleAccess::false => '0',
        };
    }

    public static function toArray(): array
    {
        return [
            'Active' => (PosModuleAccess::true)->status(),
            'Inactive' => (PosModuleAccess::false)->status(),
        ];
    }

}