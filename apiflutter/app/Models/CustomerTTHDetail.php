<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class CustomerTTHDetail extends Model
{
    protected $table = "customertthdetail";
    public $timestamps = false;

    protected $fillable = [
        'ID',
        'TTHNo',
        'TTOTTPNo',
        'Jenis',
        'Qty',
        'Unit'
    ];
}


