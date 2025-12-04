<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\MobileConfig;

class MobileconfigController extends Controller
{
    public function index()
    {
        return response()->json([
            'status' => true,
            'data' => MobileConfig::all()
        ]);
    }
}
