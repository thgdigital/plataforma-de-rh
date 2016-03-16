<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comportamento extends Model{

    protected $fillable = [
        'nome',
        'descricao',
        'empresa_id'
    ];
    //
    public function competencia(){

        return $this->belongsTo('App\Models\Competencia');
    }
}
