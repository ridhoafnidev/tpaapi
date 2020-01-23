<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\DetailKegiatan;
class Kegiatan extends Model
{

    protected $table = 'kegiatan'; //custom table name
    protected $primaryKey = 'id_kegiatan'; //custom id column
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'npsn', 'tanggal_kegiatan', 'createdAt', 'updatedAt'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];

}
