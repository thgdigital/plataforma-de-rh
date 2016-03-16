<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Departamento extends Model
{
    //
    protected $fillable = [
        'nome',
        'descricao',
        'empresa_id'
    ];

    public function empresa(){

        return $this->belongsTo('App\Models\Empresa');
    }

    public function cargos(){

        return $this->hasMany('App\Models\Cargo');
    }

    public function dadosUser(){

        return $this->hasMany('App\Models\DadosUser');
    }

}
