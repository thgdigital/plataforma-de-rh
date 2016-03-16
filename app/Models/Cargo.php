<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cargo extends Model
{
    //
    protected $fillable = [
        'nome',
        'descricao',
        'departamento_id'
    ];
    public function departamento(){
        return $this->belongsTo('App\Models\Departamento');
    }
    public function users(){
        return $this->hasMany('App\User');
    }
    public function dadosUser(){
        return $this->belongsTo('App\Models\DadosUser');
    }
}
