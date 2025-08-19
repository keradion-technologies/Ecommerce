<?php

namespace App\Enums\Pos;

enum CustomerType: string
{
    case WALK_IN  = 'walk_in';

    case EXISTING = 'existing';

    public function label(): string
    {
        return match ($this) {
            self::WALK_IN  => 'Walk-in',
            self::EXISTING => 'Existing',
        };
    }

    public static function values(): array
    {
        return array_column(self::cases(), 'value');
    }
}
