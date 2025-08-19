<?php

namespace App\Http\Middleware;

use App\Enums\StatusEnum;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class VerifyDomain
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */

    public function handle(Request $request, Closure $next): Response
    {
        if (!is_domain_verified()) {
            if ($request->is('api/*')) {
                return api([])->fails('Domain verification failed.', Response::HTTP_FORBIDDEN);
            }
            return redirect()->route('domain.unverified')->with('error', 'Domain verification failed.');
        }
        return $next($request);
        // try {
        // } catch (\Exception $ex) {
        //     if ($request->is('api/*')) {
        //         return api([])->fails('Domain verification failed.', Response::HTTP_FORBIDDEN);
        //     }
        //     return redirect()->route('domain.unverified')->with('error', 'Domain verification failed.');
        // }
    }
}
