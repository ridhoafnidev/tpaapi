<?php

namespace App\Http\Controllers;
use App\Models\Tpa;
use Illuminate\Http\Request;
class TpaController extends Controller
{

    public function __construct()
    {
        $this->middleware("login");
    }

    // Mendapatkan semua data barang -> select
    public function index() {
        $tpa = Tpa::all();
        return response()->json($tpa);
    }

    // Mendapatkan databarang dengan id tertentu -> select where id=
    public function show($id) {
        $tpa = Tpa::find($id);
        return response()->json($tpa);
    }

    // Menambahkan data ke database -> insert into
    public function create(Request $request) {
        $tpa = new Tpa;

        $tpa->npsn = $request->npsn;
        $tpa->nama_lokasi = $request->nama_lokasi;
        $tpa->alamat = $request->alamat;
        $tpa->foto_1 = $request->foto_1;
        $tpa->foto_2 = $request->foto_2;
        $tpa->foto_3 = $request->foto_3;
        $tpa->latitude = $request->latitude;
        $tpa->longitude = $request->longitude;
        $tpa->status = $request->status;
        $tpa->id_pengelola = $request->id_pengelola;
        
        $tpa->save();

        return response()->json($tpa, 201);
    }

    // Melakukan update data -> update where id=
    public function update(Request $request, $id) { 
        $tpa= Tpa::findOrFail($id);
        
        $tpa->npsn = $request->input('npsn');
        $tpa->nama_lokasi = $request->input('nama_lokasi');
        $tpa->alamat = $request->input('alamat');
        $tpa->foto_1 = $request->input('foto_1');
        $tpa->foto_2 = $request->input('foto_2');
        $tpa->foto_3 = $request->input('foto_3');
        $tpa->latitude = $request->input('latitude');
        $tpa->longitude = $request->input('longitude');
        $tpa->status = $request->input('status');
        $tpa->id_pengelola = $request->input('id_pengelola');
        $tpa->save();

        return response()->json($tpa, 200);
    }

    // Menghapus data dari database -> delete from where id=
    public function destroy($id) {
        $tpa = Tpa::find($id);
        $tpa->delete();
        return response()->json('Data TPA berhasil dihapus', 200);
    }

}
