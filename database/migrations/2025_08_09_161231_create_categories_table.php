<?php

use App\Enums\StatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('uid', 100)->nullable()->index();
            $table->integer('serial')->default(1);
            $table->json('name')->nullable();
            $table->string('slug', 255)->nullable();
            $table->unsignedInteger('parent_id')->nullable();
            $table->string('banner', 255)->nullable();
            $table->string('image_icon', 255)->nullable();
            $table->string('meta_title', 255)->nullable();
            $table->string('meta_description', 255)->nullable();
            $table->string('meta_image', 255)->nullable();
            $table->enum('feature', StatusEnum::toArray())->default(StatusEnum::false->status())->comment('No: 0, Yes: 1');
            $table->enum('status', StatusEnum::toArray())->default(StatusEnum::true->status())->comment('Active: 1, Inactive: 0');
            $table->enum('top', StatusEnum::toArray())->default(StatusEnum::false->status())->comment('No: 0, Yes: 1');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('categories');
    }
};