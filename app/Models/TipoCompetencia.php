<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TipoCompetencia extends Model
{

    public function CompetenciaTipo(){

            return $this->belongsTo('App\Models\CompetenciaTipo');

    }

}
