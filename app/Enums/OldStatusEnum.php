<?php
  
namespace App\Enums;
 
enum OldStatusEnum {
    case true;
    case false;

    /**
     * get enum status
     */
    public function status(): string
    {
        return match($this) 
        {
            OldStatusEnum::true   => '1',   
            OldStatusEnum::false  => '2',   
        };
    }


    
    public static function toArray() :array{
        return [
            'Active'  => (OldStatusEnum::true)->status(),
            'Inctive' => (OldStatusEnum::false)->status()
        ];
    }

}