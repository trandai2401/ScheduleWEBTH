<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Congviec extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('congviec', function (Blueprint $table) {
            $table->id();
            $table->string('tieude');
            $table->string("noidung");
            $table->date('ngay');
            $table->time('giobatdau');
            $table->time('gioketthuc');
            $table->unsignedBigInteger('id_user');
            $table->unsignedBigInteger('id_danhmuc');


            $table->foreign('id_user')->references('id')->on('users');
            $table->foreign('id_danhmuc')->references('id')->on('danhmuc');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('congviec');
    }
}
