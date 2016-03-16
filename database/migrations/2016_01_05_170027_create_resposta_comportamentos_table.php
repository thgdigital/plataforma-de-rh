<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRespostaComportamentosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('resposta_comportamentos', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('comportamento_id')->unsigned();
            $table->foreign('comportamento_id')->references('id')->on('comportamentos');
            $table->integer('resposta_id')->unsigned();
            $table->foreign('resposta_id')->references('id')->on('respostas');
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
        Schema::drop('resposta_comportamentos');
    }
}
