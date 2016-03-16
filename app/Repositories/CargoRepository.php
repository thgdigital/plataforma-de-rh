<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 03/01/16
 * Time: 22:03
 */

namespace App\Repositories;
use App\Models\Cargo;


class CargoRepository extends AbstractRepository{
    protected $model;

    public function __construct(Cargo $model){
        $this->model = $model;
    }
}