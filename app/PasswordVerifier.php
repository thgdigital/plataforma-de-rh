<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 03/01/16
 * Time: 18:15
 */


namespace app;
use Illuminate\Support\Facades\Auth;

class PasswordVerifier
{
    public function verify($username, $password)
    {
        $credentials = [
            'email'    => $username,
            'password' => $password,
        ];

        if (Auth::validate($credentials)) {
            $where = [
                'email'=>$username,
                'status'=> 1
            ];

            $user = \App\User::where($where)->first();
            if(count($user) > 0){
                return $user->id;
            }else{
                return false;
            }

        }

        return false;
    }
}