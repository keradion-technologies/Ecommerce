<?php

use App\Enums\StatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('languages', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->unsignedBigInteger('created_by')->nullable();
            $table->unsignedBigInteger('updated_by')->nullable();
            $table->string('name', 255)->nullable();
            $table->string('code', 5)->nullable();
            $table->enum('is_default', StatusEnum::toArray())->default(StatusEnum::false->status())->comment('default : 1,Not default : 0');
            $table->enum('status', StatusEnum::toArray())->default(StatusEnum::false->status())->comment('Active : 1,Inactive : 0');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('languages');
    }
};