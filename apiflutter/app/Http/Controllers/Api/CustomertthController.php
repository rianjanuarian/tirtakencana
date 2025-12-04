<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\CustomerTTH;
class CustomertthController extends Controller
{
    public function index(){
        return response()->json([
            'status' => true,
            'data' => CustomerTTH::all()
        ]);
    }
}
