<?php

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
        Schema::create('plan_subscriptions', function (Blueprint $table) {
            $table->id();
            $table->string('uid', 100)->nullable();
            $table->unsignedInteger('seller_id')->nullable();
            $table->unsignedInteger('plan_id')->nullable();
            $table->integer('total_product')->default(0);
            $table->tinyInteger('status')->comment('Running : 1, Expired : 2, Requested : 3');
            $table->dateTime('expired_date', 6)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('plan_subscriptions');
    }
};
