<?php

namespace App\Enums\Settings;

use App\Enums\EnumTrait;

enum TokenKey: string
{
    use EnumTrait;

    case ADMIN_AUTH_TOKEN       = 'adminAuthToken';
    case ADMIN_TOKEN_ABILITIES  = 'admin';


    case SELLER_AUTH_TOKEN          = "sellerAuthToken";
    case SELLER_TOKEN_ABILITIES     = "seller";

    case DELIVERY_MAN_AUTH_TOKEN          = "deliverymanAuthToken";
    case DELIVERY_MAN_TOKEN_ABILITIES     = "deliveryman";

    
}