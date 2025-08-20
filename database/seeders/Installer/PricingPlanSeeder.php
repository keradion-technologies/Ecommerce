<?php

namespace Database\Seeders\Installer;

use App\Models\PricingPlan;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class PricingPlanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        try {
            PricingPlan::create([
                'uid' => '63z8-MqYxuJkm-7NCC',
                'name' => 'Free',
                'amount' => 0.00000000,
                'total_product' => 10,
                'duration' => 10,
                'module_access' => null,
                'status' => 1,
                'created_at' => '2023-03-28 06:58:17',
                'updated_at' => '2023-03-28 07:05:48',
            ]);

            $this->command->info('Pricing plans seeded successfully.');
        } catch (\Exception $e) {
            $this->command->error('Failed to seed pricing plans: ' . $e->getMessage());
            throw $e;
        }
    }
}