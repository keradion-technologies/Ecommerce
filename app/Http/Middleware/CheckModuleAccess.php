<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Response as HttpResponse;

class CheckModuleAccess
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next , $moduleKey , $guard = 'seller')
    {
        $guard = match ($guard) {
            'seller_api', 'seller-api' => 'seller:api',
            'seller_web', 'seller-web' => 'seller',
            default => $guard,
        };

        $seller = Auth::guard($guard)->user();


        if (!$seller) {
            return $this->deny($request, 'You must be logged in.');
        }

        $subscription   = $seller->activeSubscription;
        $plan           = $subscription->plan ?? null;


        if (!$plan || empty($plan->module_access)) {
            return $this->deny($request, 'Access denied: No valid subscription or plan.');
        }

        $accessList = is_array($plan->module_access)
            ? $plan->module_access
            : json_decode($plan->module_access, true);


        if (!in_array($moduleKey, $accessList ?? [])) {
            return $this->deny($request, 'Access denied: You do not have access to this module.');
        }

        return $next($request);
    }

    protected function deny(Request $request, $message)
    {
        if ($request->expectsJson() || $request->isXmlHttpRequest() || $request->is('api/*')) {
                return api(['errors' => $message])
                    ->fails(__('response.fail'), HttpResponse::HTTP_FORBIDDEN, 7000000);
            }

        return redirect()->route('seller.dashboard')->with('error', $message);
    }
}
