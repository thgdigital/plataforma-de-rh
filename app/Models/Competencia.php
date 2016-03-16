<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Competencia extends Model
{
    protected $fillable = [
        'nome',
        'descricao',
        'competencia_id'
    ];
    //
    public function tipoCompetencia(){
        return $this->hasMany('App\Models\TipoCompetencia');
    }

    public function competenciaTipo(){
        return $this->hasMany('App\Models\CompetenciaTipo' );
    }
    public function comportamentos(){
        return $this->hasMany('App\Models\Comportamento' );
    }
/*
    public function competenciaTipo()
    {
        return $this->hasManyThrough('App\Models\TipoCompetencia', 'App\Models\CompetenciaTipo','country_id','competencia_id');
    }
    */

    public function empresa(){

        return $this->belongsTo('App\Models\Empresa');
    }
}
