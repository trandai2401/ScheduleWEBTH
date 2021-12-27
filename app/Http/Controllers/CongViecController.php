<?php

namespace App\Http\Controllers;

use App\Models\CongViec;
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

        return $congViec;
    }

    function getAllCongViec(Request $request)
    {

        $user = Auth::user();
        $res = DB::select('select cv.id,cv.tieude,ngay,giobatdau,gioketthuc,color from congviec as cv,danhmuc as dm
        where cv.id_danhmuc = dm.id and ngay >= ? and ngay <= ?
        ', [$request->ngayBatDau, $request->ngayKetThuc]);


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
