<?php

use App\Enums\OldStatusEnum;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('email_templates', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('uid', 100)->nullable();
            $table->string('name', 255)->nullable();
            $table->string('slug', 255)->nullable();
            $table->string('subject', 255)->nullable();
            $table->text('body')->nullable();
            $table->text('sms_body')->nullable();
            $table->text('codes')->nullable();
            $table->tinyInteger('status')->default(OldStatusEnum::true->status())->comment('Active : 1, Inactive : 2');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('email_templates');
    }
};