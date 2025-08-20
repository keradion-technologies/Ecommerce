<?php
  
namespace App\Enums;

use Illuminate\Support\Arr;

enum TutorialPlatform :string {

    use EnumTrait;

    case WEB  = "web";
    case APP  = "app";
    case BOTH = "both";
}