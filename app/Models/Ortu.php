<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ortu extends Model
{

    protected $table = 'ortu'; //custom table name
    public $timestamps = false;
    protected $primaryKey = 'id_ortu'; //custom id column
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'nama_lengkap', 'email', 'alamat', 'nomor_handphone', 'pekerjaan', 'usia', 'agama', 'foto', 'token'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];
}
