<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class MobileConfig extends Model
{
    protected $table = "mobileconfig";
    public $timestamps = false;

    protected $fillable = [
        'ID', 'BranchCode', 'Name', 'Description', 'Value'
    ];
}


