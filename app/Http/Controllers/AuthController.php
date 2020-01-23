<?php

namespace App\Http\Controllers;
use App\Models\Ortu;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
class AuthController extends Controller
{
    public function login(Request $request){
        $this->validate($request, [
            'nomor_handphone' => 'required',
            'password' => 'required | min:6'
        ]);

            $no_hp = $request->input("nomor_handphone");
            $password = $request->input("password");

            $ortu = Ortu::where("nomor_handphone", $no_hp)->first();

            if(!$ortu){
                $out = [
                    "message" => "login_valid",
                    "code" => 401,
                    "result" => [
                        "token" => null,
                    ]
                ];
                return response()->json($out, $out['code']);
            }

            if(Hash::check($password, $ortu->password)){
                $newToken = $this->generateRandomString();

                $ortu->update([
                    'token' => $newToken
                ]);

                $out = [
                    "message" => "login_success",
                    "code"    => 200,
                    "result"  => [
                        "token" => $newToken,
                    ]
                ];

            }else{
                $out = [
                    "message" => "login_vailed",
                    "code"    => 401,
                    "result"  => [
                        "token" => null,
                    ]
                ];
            }
            return response()->json($out, $out['code']);
    }

    function generateRandomString($length = 80)
    {
        $karakkter = '012345678dssd9abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $panjang_karakter = strlen($karakkter);
        $str = '';
        for ($i = 0; $i < $length; $i++) {
            $str .= $karakkter[rand(0, $panjang_karakter - 1)];
        }
        return $str;
    }

}
