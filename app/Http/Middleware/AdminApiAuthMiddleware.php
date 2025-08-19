<?php

namespace App\Http\Middleware;

use App\Enums\Settings\TokenKey;
use App\Enums\StatusEnum;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response as FoundationResponse ;


class AdminApiAuthMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next) :FoundationResponse
    {
        
        $admin = auth()->guard('admin:api')->user();

        switch (true) {
            case $admin && $admin->status == StatusEnum::false->status():
                $admin->tokens()->delete();
                return api(['errors' => ['Your account has been deactivated by the system admin']])->fails(__('response.error'));
            case $admin && $admin->tokenCan('role:' . TokenKey::ADMIN_TOKEN_ABILITIES->value):
                return $next($request);
            default:
                return api(['errors' => ['Invalid token']])->fails(__('response.fail'));
        }

    }
}
