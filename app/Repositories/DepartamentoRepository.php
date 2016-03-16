<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 03/01/16
 * Time: 22:03
 */

namespace App\Repositories;
use App\Models\Departamento;


class DepartamentoRepository extends AbstractRepository{
    protected $model;

    public function __construct(Departamento $model){
        $this->model = $model;
    }
}