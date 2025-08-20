<?php

use App\Enums\OldStatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('coupons', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('uid', 100)->nullable()->index();
            $table->string('name', 255)->nullable();
            $table->string('code', 255)->nullable();
            $table->tinyInteger('type')->nullable()->comment('Fixed: 1, Percent: 2');
            $table->date('start_date')->nullable();
            $table->date('end_date')->nullable();
            $table->decimal('value', 18, 8)->default(0.00000000);
            $table->tinyInteger('status')->default(OldStatusEnum::true->status())->comment('Enable: 1, Disable: 2');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('coupons');
    }
};