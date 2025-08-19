<?php

namespace App\Http\Middleware;

use App\Enums\StatusEnum;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Http\Response as HttpResponse;



class PosModuleCheck
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next): Response
    {
        if (site_settings('pos_system', StatusEnum::true->status()) == StatusEnum::false->status()) {

            if ($request->expectsJson() || $request->isXmlHttpRequest() || $request->is('api/*')) {
                return api(['errors' => ['Pos Module Is Currently Inactive']])
                    ->fails(__('response.fail'), HttpResponse::HTTP_FORBIDDEN, 7000000);
            }
            if (Auth::guard('admin')->user()) {
                return redirect()->route('admin.dashboard')->with('error', 'Pos Module is Currently Inactive');
            }
            return redirect()->route('home')->with('error', 'Pos Module Is Currently Inactive');
        }

        return $next($request);
    }
}
