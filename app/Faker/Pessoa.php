<?php
/**
 * Created by PhpStorm.
 * User: ConQuist
 * Date: 07/01/2016
 * Time: 15:39
 */

namespace App\Faker;
use Faker\Provider\pt_BR\Person;

class Pessoa extends Person
{
    protected static  $titleMale = [];
    protected  static  $titleFemale = [];
}