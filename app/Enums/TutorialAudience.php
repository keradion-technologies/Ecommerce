<?php
  
namespace App\Enums;

use Illuminate\Support\Arr;

enum TutorialAudience :string {

    use EnumTrait;

    case SELLER         = "seller";
    case CUSTOMER       = "customer";
    case DELIVERY_MAN   = "delivery_man";
}