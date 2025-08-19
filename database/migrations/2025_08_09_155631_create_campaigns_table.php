<?php

use App\Enums\StatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('campaigns', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('uid', 100)->nullable()->index();
            $table->json('payment_method')->nullable();
            $table->string('name', 255)->unique();
            $table->string('slug', 255)->unique();
            $table->string('banner_image', 255)->nullable();
            $table->timestamp('start_time')->nullable();
            $table->timestamp('end_time')->nullable();
            $table->enum('discount_type', StatusEnum::toArray())->default(StatusEnum::true->status())->comment('Percent: 1, Flat: 0');
            $table->string('discount', 255)->nullable();
            $table->enum('show_home_page', StatusEnum::toArray())->default(StatusEnum::false->status())->comment('Yes: 1, No: 0');
            $table->enum('status', StatusEnum::toArray())->default(StatusEnum::true->status())->comment('Active: 1, Inactive: 0');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('campaigns');
    }
};