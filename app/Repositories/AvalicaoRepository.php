<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 03/01/16
 * Time: 14:28
 */

namespace App\Repositories;
use App\Models\Avalicoe;

class AvalicaoRepository extends AbstractRepository{
	
    protected $model;

    public function __construct(Avalicoe $model){
        $this->model = $model;
    }
}