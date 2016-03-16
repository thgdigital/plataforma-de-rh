<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAvalicaoCompetenciasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('avalicao_competencias', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('avalicao_id')->unsigned();
            $table->foreign('avalicao_id')->references('id')->on('avalicoes');
            $table->integer('competencia_id')->unsigned();
            $table->foreign('competencia_id')->references('id')->on('competencias');
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
        Schema::drop('avalicao_competencias');
    }
}
