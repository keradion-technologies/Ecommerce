<?php

use App\Enums\OldStatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('currencies', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('uid', 100)->nullable()->unique();
            $table->string('name', 255)->nullable();
            $table->string('symbol', 255)->nullable();
            $table->decimal('rate', 18, 8)->default(0.00000000);
            $table->tinyInteger('status')->default(OldStatusEnum::true->status())->comment('Active: 1, Inactive: 2, default: 3');
            $table->tinyInteger('default')->nullable()->comment('Yes: 1, No: 2');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('currencies');
    }
};