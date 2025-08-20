<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\PricingPlan;
use Database\Seeders\Admin\AdminCredentialSeeder;

use Database\Seeders\Admin\SettingsSeeder;
use Database\Seeders\Installer\RoleSeeder;
use Database\Seeders\Installer\PaymentMethodSeeder;
use Database\Seeders\Installer\CurrencySeeder;
use Database\Seeders\Installer\EmailTemplateSeeder;
use Database\Seeders\Installer\FrontendSeeder;
use Database\Seeders\Installer\GeneralSettingSeeder;
use Database\Seeders\Installer\LanguageSeeder;
use Database\Seeders\Installer\MailSeeder;
use Database\Seeders\Installer\PageSetupSeeder;
use Database\Seeders\Installer\PricingPlanSeeder;
use Database\Seeders\Installer\SettingSeeder;
use Database\Seeders\Installer\SmsGatewaySeeder;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {

        $this->call([
            // RoleSeeder::class,
            // BrandSeeder::class,
            // CategorySeeder::class,
            // AdminCredentialSeeder::class,
            // SettingsSeeder::class,
            // LangSeeder::class
            // SMSgatewaySeeder::class,
            // TemplateSeeder::class,
            // GeneralSettingsSeeder::class
            // UpdateSeeder::class,
            
            // Seeder classes for the installer
            CountriesTableSeeder::class,
            CurrencySeeder::class,
            RoleSeeder::class,
            EmailTemplateSeeder::class,
            FrontendSeeder::class,
            GeneralSettingSeeder::class,
            LanguageSeeder::class,
            MailSeeder::class,
            PageSetupSeeder::class,
            PaymentMethodSeeder::class,
            PricingPlanSeeder::class,
            SettingSeeder::class,
            SmsGatewaySeeder::class
        ]);
    }
}
