<?php

namespace Database\Seeders;

use App\Enums\StatusEnum;
use App\Models\PaymentMethod;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class PosPaymentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
         DB::table('payment_methods')->insert([
            'uid' => Str::uuid(),
            'currency_id' => null,
            'percent_charge' => 0,
            'rate' => 1,
            'name' => 'Cash',
            'unique_code' => 'CASH',
            'image' => null,
            'payment_parameter' => '{}',
            'status' => StatusEnum::true->status(),
            'type' => PaymentMethod::POS,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        
    }
}
