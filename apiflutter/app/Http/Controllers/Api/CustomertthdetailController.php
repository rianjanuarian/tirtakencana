<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
 use App\Models\CustomerTTHDetail;

class CustomertthdetailController extends Controller
{
     public function index()
    {
        return response()->json([
            'status' => true,
            'data' => CustomerTTHDetail::all()
        ]);
    }
}
