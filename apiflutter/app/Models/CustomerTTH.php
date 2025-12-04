<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerTTH extends Model
{
    protected $table = 'dbo.CustomerTTH';
    public $timestamps = false;

    protected $fillable = [
        'ID', 'TTHNo', 'SalesID', 'TTOTTPNo', 'CustID', 'DocDate', 'Received', 'ReceivedDate', 'FailedReason'
    ];
}
