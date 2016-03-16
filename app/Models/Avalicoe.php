<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Avalicoe extends Model
{
    //
     protected $fillable = [
        'nome',
        'descricao',
        'date_inicio',
        'date_finalizar',
        'date_result',
        'empresa_id'
    ];
    
    public function empresa(){

        return $this->belongsTo('App\Models\Empresa');
    }
}
