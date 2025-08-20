<?php

use App\Enums\OldStatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('brands', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('uid', 100)->nullable()->index();
            $table->integer('serial')->nullable();
            $table->json('name')->nullable();
            $table->string('slug', 255)->nullable();
            $table->string('logo', 120)->nullable();
            $table->tinyInteger('status')->default(OldStatusEnum::true->status())->comment('Active: 1, Inactive: 2');
            $table->tinyInteger('top')->default(OldStatusEnum::true->status())->comment('No: 1, Yes: 2');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('brands');
    }
};