<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    //

    function getView()
    {
        return view("web.viewLogin");
    }

    function postLogin(Request $request)
    {
        $res =  Auth::attempt(['email' => $request->email, 'password' => $request->password]);
        if ($res) {
            return 1;
        }
        return 0;
    }

    function logout(Request $request)
    {
        Auth::logout();
        return redirect('login');
    }
}
