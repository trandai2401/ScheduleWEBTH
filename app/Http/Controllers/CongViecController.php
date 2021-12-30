<?php

namespace App\Http\Controllers;

use App\Models\CongViec;
use App\Models\User;
use App\Models\user_congviec;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class CongViecController extends Controller
{
    //



    function postCongViec(Request $request)
    {

        $congViec = new CongViec();
        $congViec->tieude = $request->tieude;
        $congViec->noidung = $request->noidung;
        $congViec->ngay = $request->ngay;
        $congViec->giobatdau = $request->giobatdau . ":00";
        $congViec->gioketthuc = $request->gioketthuc . ":00";
        $congViec->id_danhmuc = $request->iddanhmuc;
        $congViec->id_user = $request->iduser;

        $congViec->save();

        $user = Auth::user();

        $user_congviec = new user_congviec();
        $user_congviec->id_congviec = $congViec->id;
        $user_congviec->id_user = $user->id;


        $user_congviec->laplai = ($request->laplai == "true" ? 1 : 0);
        $user_congviec->save();
        // return $request->banbe;
        if ($request->banbe != "") {
            $banbe = User::select("*")->where("email", $request->banbe)->get();

            if (count($banbe) != 0) {

                $user_congviec2 = new user_congviec();
                $user_congviec2->id_congviec = $congViec->id;
                $user_congviec2->id_user = $banbe[0]->id;
                $user_congviec2->save();
            }
        }



        return $congViec;
    }

    function getAllCongViec(Request $request)
    {

        $user = Auth::user();
        $res = DB::select('select cv.id,cv.tieude,ngay,giobatdau,gioketthuc,color from congviec as cv,user_congviecs as uc,danhmuc as dm where cv.id_danhmuc = dm.id and uc.id_congviec = cv.id and uc.id_user = ?  and ((ngay >= ? and ngay <= ?) or uc.laplai = 1)
        ', [$user->id, $request->ngayBatDau, $request->ngayKetThuc]);


        return  $res;
    }

    function getCongViecById($id)
    {
        $congViec = CongViec::find($id);
        return $congViec;
    }

    function deleteCongViec($id)
    {
        $user = Auth::user();
        $res = CongViec::find($id);
        if ($res != null) {
            $res->delete();
            return 1;
        }
        return 0;
    }
}
