<?php

namespace App\Enums\Pos;

enum DeliveryOption: string
{
    case PICKUP = 'pickup';
    case SHIPPING = 'shipping';

    public function label(): string
    {
        return match ($this) {
            self::PICKUP => 'Pickup in Store',
            self::SHIPPING => 'Ship to Address',
        };
    }

    public function icon(): string
    {
        return match ($this) {
            self::PICKUP => 'fa-store',
            self::SHIPPING => 'fa-truck',
        };
    }

    public static function values(): array
    {
        return array_column(self::cases(), 'value');
    }
}
