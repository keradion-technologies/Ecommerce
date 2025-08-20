<?php

use App\Enums\StatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('countries', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name', 191);
            $table->string('code', 191);
            $table->enum('status', StatusEnum::toArray())->default(StatusEnum::true->status())->comment('Visible: 1, hidden: 0');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('countries');
    }
};