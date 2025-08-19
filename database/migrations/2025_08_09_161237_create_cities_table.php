<?php

use App\Enums\StatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('cities', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('state_id')->nullable();
            $table->string('name', 191);
            $table->double('shipping_fee', 25, 8);
            $table->enum('status', StatusEnum::toArray())->default(StatusEnum::true->status())->comment('Visible: 1, hidden: 0');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('cities');
    }
};