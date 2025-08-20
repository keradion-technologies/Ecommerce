<?php

namespace Database\Seeders\Installer;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class PaymentMethodSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $sqlFilePath = resource_path('database/seeder_data/payment_methods.sql');
        
        if (!File::exists($sqlFilePath)) {
            throw new \Exception("SQL file not found at: {$sqlFilePath}");
        }

        try {

            $sql = File::get($sqlFilePath);
            DB::unprepared($sql);
            $this->command->info('Frontend sections seeded successfully.');

        } catch (\Exception $e) {
            $this->command->error('Failed to seed frontend sections: ' . $e->getMessage());
            throw $e;
        }
    }
}
