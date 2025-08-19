<?php

namespace App\Enums\Pos;

enum PaymentOption: string
{
    case CASH = 'cash';
    case CARD = 'card';
    case BANK = 'bank';
    case MOBILE_BANKING = 'mobile_banking';
    case OTHER = 'other';



    public static function values(): array
    {
        return array_column(self::cases(), 'value');
    }

    public function label(): string
    {
        return match ($this) {
            self::CASH => 'Cash',
            self::CARD => 'Card',
            self::BANK => 'Bank Transfer',
            self::MOBILE_BANKING => 'Mobile Banking',
            self::OTHER => 'Other',
        };
    }

    public function description(): string
    {
        return match($this) {
            self::CASH => 'Pay with cash at the counter',
            self::CARD => 'Pay with credit or debit card',
            self::BANK => 'Pay via bank transfer',
            self::MOBILE_BANKING => 'Pay with mobile banking apps',
            self::OTHER => 'Pay with another payment method',
        };
    }

    public function icon(): string
    {
        return match($this) {
            self::CASH => '💵',
            self::CARD => '💳',
            self::BANK => '🏦',
            self::MOBILE_BANKING => '📱',
            self::OTHER => '❓',
        };
    }
}