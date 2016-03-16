<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AvalicaoCompetencia extends Model
{
    //
    protected $fillable = [
        'avalicao_id',
        'competencia_id'
    ];
}
