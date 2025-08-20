<?php

use App\Enums\StatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('admins', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('uid', 100)->nullable()->index();
            $table->unsignedBigInteger('role_id')->nullable();
            $table->unsignedBigInteger('created_by')->nullable();
            $table->unsignedBigInteger('updated_by')->nullable();
            $table->string('name', 70)->nullable();
            $table->string('user_name', 70)->unique();
            $table->string('email', 70)->unique();
            $table->string('phone', 70)->nullable();
            $table->string('image', 120)->nullable();
            $table->string('address', 255)->nullable();
            $table->string('password', 255)->nullable();
            $table->enum('status', StatusEnum::toArray())->default(StatusEnum::true->status())->comment('Active: 1, Inactive: 0');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('admins');
    }
};