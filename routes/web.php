<?php

use App\Http\Controllers\CongViecController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\SignUpController;
use App\Models\CongViec;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return csrf_token();
    // $res = CongViec::select('*')->where('ngay', '>=', '2021/12/20')->where('id_user', "=", "1")->where('ngay', '<=', '2021/12/25')->get();

    // return $res;
});

Route::get('login', [LoginController::class, 'getView'])->name("login");
Route::post('login', [LoginController::class, 'postLogin']);


Route::post('signup', [SignUpController::class, 'postSignUp'])->name('signup');

// Route::get('home', function () {
//     return view("web.ViewHome");
// })->name("home");

Route::prefix('user')->group(function () {
    Route::prefix('/schedule')->group(function () {
        Route::get('view', function (Request $request) {
            $user = Auth::user();
            $danhMucs  = DB::table('danhmuc')->get();
            return view("web.ViewHome", ['user' => $user, 'danhMucs' => $danhMucs]);
        })->name("ViewSchedule");
        Route::delete('{id}', [CongViecController::class, 'deleteCongViec']);
        Route::get('{id}', [CongViecController::class, 'getCongViecById']);
        Route::get('', [CongViecController::class, 'getAllCongViec']);
        Route::post('', [CongViecController::class, 'postCongViec'])->name('schedule');
    });

    Route::get('profile', function () {
        return view("web.ViewProfile");
    })->name('profile');

    Route::get('getprofile', function () {
        return Auth::user();
    })->name('getprofile');


    Route::post('postprofile', function (Request $request) {
        $user = User::find(Auth::user()->id);
        $user->name = $request->name;
        $user->email = $request->email;
        $user->taget = $request->taget;

        $user->save();
        return $user;
    })->name('postprofile');

    Route::post('postimageprofile', function (Request $request) {
        if ($request->has('images')) {

            $user  = User::find(Auth::user()->id);
            $user->linkanhavata = "http://localhost/ScheduleWEBTH/public/image/avata" . $user->id . ".jpg";
            // DB::table('hinhanh')->insert([
            //     'id_nongsan' => $id,
            //     'src' => "img/image" . $id . ".jpg"
            // ]);
            $user->save();
            $images = $request->images;
            $images->move("image", 'avata' . $user->id . '.jpg');
            return "http://localhost/ScheduleWEBTH/public/image/avata" . $user->id . ".jpg";

        } else {
            echo "không";
        }
    })->name("postimageprofile");
});
