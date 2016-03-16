<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 03/01/16
 * Time: 22:03
 */

namespace App\Repositories;
use App\Models\Comportamento;


class ComportamentoRepository extends AbstractRepository{
    protected $model;

    public function __construct(Comportamento $model){
        $this->model = $model;
    }
}