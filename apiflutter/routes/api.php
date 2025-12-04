<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CustomerController;
use App\Http\Controllers\Api\CustomertthController;
use App\Http\Controllers\Api\MobileconfigController;
use App\Http\Controllers\Api\CustomertthdetailController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
 

Route::get('/customers', [CustomerController::class, 'index']);
Route::get('/customertth', [CustomertthController::class, 'index']);
Route::get('/mobileconfig', [MobileconfigController::class, 'index']);
Route::get('/customertthdetail', [CustomertthdetailController::class, 'index']);