<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerTTH extends Model
{
    protected $table = 'customertth';
    public $timestamps = false;

    protected $fillable = [
        'ID',
        'TTHNo',
        'SalesID',
        'TTOTTPNo',
        'CustID',
        'DocDate',
        'Received',
        'ReceivedDate',
        'FailedReason'
    ];
    public function customer()
    {
        return $this->belongsTo(Customer::class, 'CustID', 'CustID');
    }
}
