<?php

use App\Enums\StatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('country_id')->nullable();
            $table->string('uid', 100)->nullable();
            $table->longText('fcm_token')->nullable();
            $table->string('name')->nullable();
            $table->string('username', 70)->nullable();
            $table->string('last_name')->nullable();
            $table->string('email', 70)->nullable();
            $table->string('image', 100)->nullable();
            $table->string('phone', 40)->nullable();
            $table->decimal('balance', 18, 8)->default('0.00000000');
            $table->timestamp('email_verified_at')->nullable();
            $table->text('address')->nullable();
            $table->longText('billing_address')->nullable();
            $table->string('google_id')->nullable();
            $table->mediumInteger('point')->default(0);
            $table->mediumInteger('otp_code')->nullable();
            $table->string('password');
            $table->enum('status', StatusEnum::toArray())->default(StatusEnum::true->status())->comment('Active : 1, Inactive : 0');
            $table->string('remember_token', 100)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
