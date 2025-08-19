<?php

namespace Database\Seeders;

use App\Enums\Settings\GlobalConfig;
use App\Enums\StatusEnum;
use App\Models\Country;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CitiesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $states     = GlobalConfig::STATES;
        $countries  = Country::select('id', 'code')->get()->keyBy('code');

        $insertData = [];

        foreach ($states as $state) {
            $country = $countries[$state['country_code']] ?? null;

            if ($country) {
                $insertData[] = [
                    'name'          => $state['name'],
                    'country_id'    => $country->id,
                    'status'        => StatusEnum::true->status(),
                ];
            }
        }

        DB::table('states')->insert($insertData);
    }
}
