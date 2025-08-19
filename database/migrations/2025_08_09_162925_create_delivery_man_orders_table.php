<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('delivery_man_orders', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('order_id')->nullable();
            $table->unsignedInteger('assign_by')->nullable();
            $table->unsignedInteger('deliveryman_id')->nullable();
            $table->longText('pickup_location')->nullable();
            $table->tinyInteger('status')->nullable();
            $table->longText('note')->nullable();
            $table->longText('feedback')->nullable();
            $table->longText('rejected_reason')->nullable();
            $table->longText('time_line')->nullable();
            $table->decimal('amount', 18, 8)->default(0.00000000);
            $table->string('details', 191)->nullable();
            $table->timestamp('rejected_at')->nullable();
            $table->timestamp('delivered_at')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('delivery_man_orders');
    }
};