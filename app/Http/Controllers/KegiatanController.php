<?php

namespace App\Http\Controllers;
use App\Models\Kegiatan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class KegiatanController extends Controller
{

    public function __construct()
    {
        $this->middleware("login");
    }

    // Mendapatkan semua data kegiatan -> select
    public function index() {
        $kegiatan = Kegiatan::all();
        return response()->json($kegiatan);
    }

    // public function indexDetail() {
    //     $kegiatan = Kegiatan::where('kegiatan.id_kegiatan', 2)
    //     ->leftJoin('detail_kegiatan', 'kegiatan.id_kegiatan', '=', 'detail_kegiatan.id_kegiatan')
    //     ->select('kegiatan.*','detail_kegiatan.*')->first();
    //     return response()->json($kegiatan);
    // }

    // Mendapatkan data kegiatan dengan id tertentu -> select where id=
    public function show($id) {
        $kegiatan = Kegiatan::find($id);
        return response()->json($kegiatan);
    }

    // Menambahkan data ke database -> insert into
    public function create(Request $request) {
        $kegiatan = new Kegiatan;

        $kegiatan->npsn = $request->npsn;
        $kegiatan->tanggal_kegiatan = $request->tanggal_kegiatan;
        $kegiatan->alamat = $request->alamat;
        
        $kegiatan->save();

        return response()->json($kegiatan, 201);
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
        $kegiatan = Kegiatan::find($id);
        $kegiatan->delete();
        return response()->json('Data kegiatan berhasil dihapus', 200);
    }

}
