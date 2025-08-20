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
        Schema::create('page_setups', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->string('name')->nullable();
            $table->text('body')->nullable();
            $table->longText('description')->nullable();
            $table->enum('status', StatusEnum::toArray())->default(StatusEnum::true->status())->comment('Active : 1,Inactive : 0');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('page_setups');
    }
};
