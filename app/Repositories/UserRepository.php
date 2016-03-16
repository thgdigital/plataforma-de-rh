<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 03/01/16
 * Time: 22:03
 */

namespace App\Repositories;
use App\User;


class UserRepository extends AbstractRepository{
    protected $model;

    public function __construct(User $model){
        $this->model = $model;
    }
}