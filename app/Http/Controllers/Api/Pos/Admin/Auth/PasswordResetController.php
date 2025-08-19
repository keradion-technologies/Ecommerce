<?php

namespace App\Http\Controllers\Api\Pos\Admin\Auth;

use App\Http\Controllers\Controller;
use App\Http\Services\Admin\AuthService;
use App\Jobs\SendMailJob;
use App\Models\Admin;
use App\Models\AdminPasswordReset;
use App\Models\SellerPasswordReset;
use Carbon\Carbon;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
class PasswordResetController extends Controller
{

    public function __construct(protected AuthService $authService){

        
    }

    /**
     * Verify email for password reset
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function verifyEmail(Request $request): JsonResponse
    {


        $validator = Validator::make($request->all(), [
            'email' => 'required|exists:admins,email',
        ]);

        if ($validator->fails()) {
            return api(['errors' => $validator->errors()->all()])->fails(__('response.fail'));
        }


        $admin = Admin::where('email', $request->input('email'))->first();


        if (!$admin)
            return api(['errors' => [translate("Admin not found")]])
                ->fails(__('response.fail'));


        AdminPasswordReset::where('email', $admin->email)->delete();
        $adminPasswordReset = AdminPasswordReset::create([
            'email' => $admin->email,
            'token' => random_number(),
        ]);

        $mailCode = [
            'code' => $adminPasswordReset->token,
            'time' => $adminPasswordReset->created_at,
        ];

        SendMailJob::dispatch($admin, 'ADMIN_PASSWORD_RESET', $mailCode);

        return api(
            [
                'message' => translate('Check your email password reset code sent successfully'),

            ]
        )->success(__('response.success'));



    }



    /**
     * Verify otp code 
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function verifyCode(Request $request): JsonResponse
    {

        $validator = Validator::make($request->all(), [
            'email' => 'required|exists:admins,email',
            'code' => 'required|exists:admin_password_resets,token',
        ]);


        if ($validator->fails())
            return api(['errors' => $validator->errors()->all()])->fails(__('response.fail'));


        $adminResetToken = AdminPasswordReset::where('email', $request->input('email'))
            ->where('token', $request->input('code'))
            ->first();


        if (!$adminResetToken)
            return api(['errors' => [translate("Invalid OTP code")]])
                ->fails(__('response.fail'));


        return api(
            [
                'message' => translate('OTP verification successuly completed'),

            ]
        )->success(__('response.success'));

    }



    /**
     * Update password
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function passwordReset(Request $request): JsonResponse
    {

        $validator = Validator::make($request->all(), [
            'email' => 'required|exists:admins,email',
            'code' => 'required|exists:admin_password_resets,token',
            'password' => 'required|confirmed|min:6',
        ]);


        if ($validator->fails())
            return api(['errors' => $validator->errors()->all()])->fails(__('response.fail'));


        $email = $request->input('email');
        $adminResetToken = AdminPasswordReset::where('email', $email)
            ->where('token', $request->input('code'))
            ->first();
        if (!$adminResetToken)
            return api(['errors' => [translate("Invalid OTP code")]])
                ->fails(__('response.fail'));

        $admin = Admin::where('email', $email)->first();


        if (!$admin)
            return api(['errors' => [translate("Invalid seller email")]])
                ->fails(__('response.fail'));

        $admin->password = Hash::make($request->input('password'));
        $admin->save();

        SendMailJob::dispatch($admin, 'ADMIN_PASSWORD_RESET_CONFIRM', [
            'time' => Carbon::now(),
        ]);
        $adminResetToken->delete();



        return api(
            [
                'message'       => translate('Password updated'),
                'access_token'  => $this->authService->getAccessToken($admin),

            ]
        )->success(__('response.success'));


    }
}
