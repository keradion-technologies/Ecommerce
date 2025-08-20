<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('general_settings', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->string('site_name', 255)->nullable();
            $table->string('logo', 255)->nullable();
            $table->string('loder_logo', 255)->default('loder_logo.jpg');
            $table->longText('invoice_logo');
            $table->string('admin_logo_lg', 1000)->default('default.jpg');
            $table->string('admin_logo_sm', 255)->nullable();
            $table->string('site_logo', 255)->nullable();
            $table->string('cod', 200)->default('Active');
            $table->integer('guest_checkout')->default(0)->comment('Enable : 1,Disable :0');
            $table->string('address', 100)->nullable();
            $table->text('copyright_text')->nullable();
            $table->string('seller_mode', 200)->default('Active');
            $table->string('site_favicon', 255)->nullable();
            $table->string('currency_name', 20)->nullable();
            $table->string('currency_symbol', 20)->nullable();
            $table->string('primary_color', 255)->nullable();
            $table->string('secondary_color', 255)->nullable();
            $table->string('font_color', 255)->nullable();
            $table->integer('sms_gateway_id')->nullable();
            $table->decimal('commission', 18, 8)->nullable();
            $table->string('mail_from', 255)->nullable();
            $table->string('phone', 100)->nullable();
            $table->string('order_prefix', 100)->nullable();
            $table->integer('email_gateway_id')->nullable();
            $table->text('email_template')->nullable();
            $table->text('sms_template')->nullable();
            $table->tinyInteger('email_notification')->nullable()->comment('Yes : 1, No : 2');
            $table->tinyInteger('sms_notification')->default(1)->comment('Enable : 1, Disable : 2');
            $table->decimal('search_min', 18, 8)->default('0.00000000');
            $table->decimal('search_max', 18, 8)->default('0.00000000');
            $table->text('s_login_google_info')->nullable();
            $table->text('s_login_facebook_info')->nullable();
            $table->tinyInteger('refund')->default(0);
            $table->tinyInteger('preloader')->default(0)->comment('Active 1 , Inactive 0');
            $table->longText('tawk_to')->nullable();
            $table->integer('refund_time_limit')->default(10);
            $table->longText('app_settings')->nullable();
            $table->tinyInteger('seller_reg_allow')->default(1)->comment('ON : 1, OFF : 2');
            $table->string('status_expiry', 100)->nullable();
            $table->mediumText('banner_section')->nullable();
            $table->string('app_version', 100)->nullable();
            $table->string('system_installed_at', 125)->nullable();
            $table->longText('security_settings')->nullable();
            $table->string('maintenance_mode', 100)->nullable();
            $table->string('strong_password', 100)->nullable();
            $table->longText('open_ai_setting')->nullable();
            $table->longText('otp_configuration')->nullable();
            $table->longText('task_config')->nullable();
            $table->timestamp('last_cron_run')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('general_settings');
    }
};