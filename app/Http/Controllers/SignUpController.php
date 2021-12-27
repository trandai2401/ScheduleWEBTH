<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;


class SignUpController extends Controller
{
    function postSignUp(Request $request)
    {
        $user = new User();
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->name = $request->name;
        $user->save();
        return 1;
    }
}
