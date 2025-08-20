<?php

use App\Enums\StatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('delivery_men', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('referral_id')->nullable();
            $table->unsignedBigInteger('country_id');
            $table->text('referral_code')->nullable();
            $table->longText('fcm_token')->nullable();
            $table->string('phone_code', 191);
            $table->string('first_name', 191);
            $table->string('last_name', 191);
            $table->string('username', 70)->nullable();
            $table->string('email', 70)->nullable();
            $table->string('phone', 40)->nullable();
            $table->decimal('balance', 25, 8)->default(0.00000000);
            $table->tinyInteger('enable_push_notification')->nullable();
            $table->decimal('order_balance', 25, 8)->default(0.00000000);
            $table->string('password', 191);
            $table->string('image', 191)->nullable();
            $table->text('kyc_data')->nullable();
            $table->timestamp('last_login_time')->nullable();
            $table->tinyInteger('is_kyc_verified')->nullable();
            $table->text('address')->nullable();
            $table->enum('status', StatusEnum::toArray())->default(StatusEnum::true->status())->comment('Active : 1,Inactive : 0');
            $table->tinyInteger('is_online')->nullable();
            $table->string('point', 191)->default('0');
            $table->string('remember_token', 100)->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('delivery_men');
    }
};