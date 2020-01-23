<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tpa extends Model
{

    protected $table = 'tpa'; //custom table name
    protected $primaryKey = 'id_tpa'; //custom id column
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'npsn', 'nama_lokasi', 'alamat', 'foto_1', 'foto_2', 'foto_3', 'latitude', 'longitude', 'status', 'id_pengelola', 'createdAt', 'updatedAt'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];
}
