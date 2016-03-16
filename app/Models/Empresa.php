<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Empresa extends Model
{
    //
    protected $fillable = [
        'nome',
        'estado',
        'cidade',
        'telefone',
        'email'
    ];
    /*
    public function users(){
        return $this->hasMany('App\User');
    }
    */
    public function departamento(){
        return $this->hasMany('App\Models\Departamento');
    }
    public function avalicoes(){
        return $this->hasMany('App\Models\Avalicoe');
    }
    public function dadosUser()
    {
        return $this->hasMany('App\Models\DadosUser');
    }
    public function competencias()
    {
        return $this->hasMany('App\Models\Competencia');
    }
}
