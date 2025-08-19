<?php

namespace App\Http\Controllers\Api\Pos\Admin\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Pos\Admin\Auth\LoginRequest;
use App\Http\Services\Admin\AuthService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    


    public function __construct(protected AuthService $authService){

        
    }


    /**
     * Login a new seller 
     *
     * @param LoginRequest $request
     * @return JsonResponse
     */
    public function login(LoginRequest $request)  : JsonResponse {
        

        $admin = $this->authService->getActiveAdminByUsername($request->input("username"));


        switch (true) {
            case $admin && Hash::check($request->input("password"),$admin->password ):
                        return api([
                            'access_token' => $this->authService->getAccessToken($admin)
                        ])->success(__('response.success'));
            
            default:
                   return api(['errors' => ['Credentail Mismatch !!']])->fails(__('response.failed'));
        }
    }



  




}
