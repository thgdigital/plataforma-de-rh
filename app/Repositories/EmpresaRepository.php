<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 03/01/16
 * Time: 14:28
 */

namespace App\Repositories;
use App\Models\Empresa;

class EmpresaRepository extends AbstractRepository{
    protected $model;

    public function __construct(Empresa $model){
        $this->model = $model;
    }
}