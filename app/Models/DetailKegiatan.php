<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DetailKegiatan extends Model
{

    protected $table = 'detail_kegiatan'; //custom table name
    protected $primaryKey = 'id_detail_kegiatan'; //custom id column
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id_kegiatan', 'nama_kegiatan', 'keterangan', 'jam', 'createdAt', 'updatedAt'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];
}
