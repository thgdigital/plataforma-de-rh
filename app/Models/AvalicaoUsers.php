<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AvalicaoUsers extends Model
{
    //
    protected $fillable = [
        'avalicao_id',
        'tipo_id',
        'avalidado_id',
        'avalidador_id'
    ];

}
