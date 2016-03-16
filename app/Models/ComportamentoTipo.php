<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ComportamentoTipo extends Model
{
    //
    public function tipo(){
        return $this->belongsTo('App\Models\ComportamentoTipo');
    }
}
