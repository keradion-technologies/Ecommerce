<?php

use App\Enums\StatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('banners', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('uid', 100)->nullable()->index();
            $table->integer('serial_id')->nullable();
            $table->string('heading', 255)->nullable();
            $table->string('sub_heading', 255)->nullable();
            $table->string('sub_heading_2', 100)->nullable();
            $table->string('btn_name', 255)->nullable();
            $table->string('btn_url', 255)->nullable();
            $table->string('bg_image', 255)->default('default.jpg');
            $table->enum('status', StatusEnum::toArray())->default(StatusEnum::true->status())->comment('Active: 1, Inactive: 0');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('banners');
    }
};