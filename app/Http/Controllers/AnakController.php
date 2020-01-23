<?php

namespace App\Http\Controllers;
use App\Models\Anak;
use Illuminate\Http\Request;
class AnakController extends Controller
{

    public function __construct()
    {
        $this->middleware("login");
    }

    // Mendapatkan semua data barang -> select
    public function index() {
        $anak = Anak::all();
        return response()->json($anak);
    }

    // Mendapatkan databarang dengan id tertentu -> select where id=
    public function show($id) {
        $anak = Anak::find($id);
        return response()->json($anak);
    }

    // Menambahkan data ke database -> insert into
    public function create(Request $request) {
        $anak = new Anak;

        $anak->nama_lengkap = $request->nama_lengkap;
        $anak->ttl = $request->ttl;
        $anak->jenis_kelamin = $request->jenis_kelamin;
        $anak->no_akta_kelahiran = $request->no_akta_kelahiran;
        $anak->id_ortu = $request->id_ortu;
        
        $anak->save();

        return response()->json($anak, 201);
    }

    // Melakukan update data -> update where id=
    public function update(Request $request, $id) { 
        $anak= Anak::findOrFail($id);
        
        $anak->nama_lengkap = $request->input('nama_lengkap');
        $anak->ttl = $request->input('ttl');
        $anak->jenis_kelamin = $request->input('jenis_kelamin');
        $anak->no_akta_kelahiran = $request->input('no_akta_kelahiran');
        $anak->id_ortu = $request->input('id_ortu');
        $anak->save();

        return response()->json($anak, 200);
    }

    // Menghapus data dari database -> delete from where id=
    public function destroy($id) {
        $anak = Anak::find($id);
        $anak->delete();
        return response()->json('Data Ortu berhasil dihapus', 200);
    }

}
