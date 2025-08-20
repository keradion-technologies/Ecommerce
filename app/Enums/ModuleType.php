<?php

namespace App\Enums;

enum ModuleType: string
{
    case POS = "pos";

    public static function toArray(): array
    {
        return array_map(fn($case) => $case->value, self::cases());
    }
}