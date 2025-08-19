<?php

namespace App\Enums\Pos;

enum OrderSourceEnum: string
{
    case POS = 'pos';
    case WEB = 'web';
    case APP = 'app';

    public function label(): string
    {
        return match ($this) {
            self::POS => 'Point of Sale',
            self::WEB => 'Web',
            self::APP => 'Mobile App',
        };
    }

    public function orderSource(): string
    {
        return match ($this) {
            self::POS => 'pos',
            self::WEB => 'web',
            self::APP => 'app',
        };
    }
}