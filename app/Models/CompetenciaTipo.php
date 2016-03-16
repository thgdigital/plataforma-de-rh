<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CompetenciaTipo extends Model
{
    //
    protected $fillable = [
        'competencia_id',
        'tipo_id'
    ];


    public function tipoCompetencia(){

        return $this->hasMany('App\Models\TipoCompetencia');
    }

}
