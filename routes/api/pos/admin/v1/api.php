<?php

use App\Http\Controllers\Api\Pos\Admin\Auth\LoginController;
use App\Http\Controllers\Api\Pos\Admin\Auth\PasswordResetController;
use App\Http\Controllers\Api\Pos\Admin\CartController;
use App\Http\Controllers\Api\Pos\Admin\CheckoutController;
use App\Http\Controllers\Api\Pos\Admin\CustomerController;
use App\Http\Controllers\Api\Pos\Admin\HomeController;
use App\Http\Controllers\Api\Pos\Admin\OrderController;
use App\Http\Controllers\Api\Pos\Admin\ProductController;
use App\Http\Controllers\Api\Pos\Admin\ReceiptController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/



Route::group(['middleware' => ['api.lang', 'api.currency', 'sanitizer', 'maintenance.mode','posModule.status.check', 'handle.exception']], function () {

    
    # PUBLIC ROUTE 
    Route::post('/login', [LoginController::class, 'login']);
    Route::get('/config', [HomeController::class, 'config']);


    # PASSWORD RESET ROUTE
    Route::post('/verify/email', [PasswordResetController::class, 'verifyEmail']);
    Route::post('/verify/otp/code', [PasswordResetController::class, 'verifyCode']);
    Route::post('/password/reset', [PasswordResetController::class, 'passwordReset']);

    


    # PROTECTED ROUTE
    Route::group(['middleware' => ['auth:sanctum', 'admin.api.token']], function () {

        Route::get('/dashboard',[HomeController::class, 'dashboard'])->name('dashboard');

        # PRODUCT
        Route::get('/products', [ProductController::class, 'list'])->name('products.list');

        # CUSTOMER
        Route::get('/customers', [CustomerController::class, 'index'])->name('customers.index');
        Route::post('/customers', [CustomerController::class, 'store'])->name('customers.store');

        # CART
        Route::post('/cart/add', [CartController::class, 'add'])->name('cart.add');
        Route::post('/cart/update', [CartController::class, 'update'])->name('cart.update');
        Route::get('/cart', [CartController::class, 'show'])->name('cart.show');
        Route::get('/cart/remove/{cartId}', [CartController::class, 'remove'])->name('cart.remove');
        
        Route::get('/cart/hold', [CartController::class, 'hold'])->name('cart.hold');
        Route::get('/cart/restore/{holdUid}', [CartController::class, 'restore'])->name('cart.restore');
        Route::get('/cart/hold/list', [CartController::class, 'holdList'])->name('cart.hold.list');

        #COUPON
        Route::post('apply/coupon' , [CartController::class,'applyCoupon'])->name('check.coupon');

        # CHECKOUT
        Route::post('/address/store', [CheckoutController::class, 'storeAddress'])->name('checkout.address.create');
        Route::get('/address/list/{userId}', [CheckoutController::class, 'getAddressList'])->name('checkout.address.list');

        Route::post('/checkout', [CheckoutController::class, 'processCheckout'])->name('checkout.store');

        # ORDERS
        Route::get('/orders' , [OrderController::class,'list'])->name('order.list');
        Route::get('/orders/{id}', [OrderController::class, 'show'])->name('orders.show');
        

        # RECEIPT
        Route::get('/orders/{id}/receipt', [ReceiptController::class, 'show'])->name('orders.receipt');

    });



});




