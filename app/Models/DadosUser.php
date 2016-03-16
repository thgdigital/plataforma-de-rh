<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DadosUser extends Model
{
    //
    protected $fillable = [
        'user_id',
        'cargo_id',
        'empresa_id',
        'departamento_id'
    ];
     public function empresa(){
         return $this->belongsToMany('App\Models\Empresa');
     }
    public function cargo(){
        return $this->belongsToMany('App\Models\Cargo');
    }
    public function departamentos(){
        return $this->belongsToMany('App\Models\Departamento');
    }
}
