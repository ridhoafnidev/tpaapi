<?php

namespace App\Http\Controllers;
use App\Models\Ortu;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
class OrtuController extends Controller
{

    public function __construct()
    {
        $this->middleware("login");
    }

    // Mendapatkan semua data barang -> select
    public function index() {
        $ortu = Ortu::all();
        return response()->json($ortu);
    }

    // Mendapatkan databarang dengan id tertentu -> select where id=
    public function show($id) {
        $ortu = Ortu::find($id);
        return response()->json($ortu);
    }

    // Menambahkan data ke database -> insert into
    public function create(Request $request) {
        $ortu = new Ortu;
        $ortu->nama_lengkap = $request->nama_lengkap;
        $ortu->email = $request->email;
        $ortu->password = Hash::make($request->password);
        $ortu->alamat = $request->alamat;
        $ortu->nomor_handphone = $request->nomor_handphone;
        $ortu->pekerjaan = $request->pekerjaan;
        $ortu->usia = $request->usia;
        $ortu->agama = $request->agama;
        $ortu->foto = $request->foto;
        $ortu->token = "";
        
        $ortu->save();

        return response()->json($ortu, 201);
    }

    // Melakukan update data -> update where id=
    public function update(Request $request, $id) { 
        $ortu= Ortu::findOrFail($id);
        
        $ortu->nama_lengkap = $request->input('nama_lengkap');
        $ortu->email = $request->input('email');
        $ortu->password = $request->input('password');
        $ortu->alamat = $request->input('alamat');
        $ortu->nomor_handphone = $request->input('nomor_handphone');
        $ortu->pekerjaan = $request->input('pekerjaan');
        $ortu->usia = $request->input('usia');
        $ortu->agama = $request->input('agama');
        $ortu->foto = $request->input('foto');
        $ortu->save();

        return response()->json($ortu, 200);
    }

    // Menghapus data dari database -> delete from where id=
    public function destroy($id) {
        $ortu = Ortu::find($id);
        $ortu->delete();
        return response()->json('Data Ortu berhasil dihapus', 200);
    }

}
