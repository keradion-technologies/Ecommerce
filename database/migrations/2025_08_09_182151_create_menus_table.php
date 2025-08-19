<?php

use App\Enums\StatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('menus', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->string('name', 255)->nullable();
            $table->string('image', 255)->nullable();
            $table->string('banner_image', 100)->nullable();
            $table->string('slug', 255)->nullable();
            $table->string('url', 255)->nullable();
            $table->enum('default', StatusEnum::toArray())->default(StatusEnum::false->status())->comment('Default : 1,Not Default : 0');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('menus');
    }
};