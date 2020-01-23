<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Anak extends Model
{

    protected $table = 'anak'; //custom table name
    protected $primaryKey = 'id_anak'; //custom id column
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'nama_lengkap', 'ttl', 'jenis_kelamin', 'no_akta_kelahiran', 'id_ortu', 'createdAt', 'updatedAt'
    ];

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];
}
