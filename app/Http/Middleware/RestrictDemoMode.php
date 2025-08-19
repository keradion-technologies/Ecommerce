<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Http\Services\Core\DemoService;
use Exception;
use Illuminate\Http\JsonResponse;

class RestrictDemoMode
{
    protected $demoService;

    public function __construct(DemoService $demoService)
    {
        $this->demoService = $demoService;
    }

    public function handle(Request $request, Closure $next)
    {
        try {
            if (config('demo.enabled')) {

                $feature = $this->demoService->getFeatureForRoute($request);

                if(!$feature) return $next($request);
                if($this->demoService->isFeatureEnabled($feature)) return $next($request);
                
                if($this->demoService->isRestrictedRoute($request, $feature)) {
                    
                    $response = $request->expectsJson() 
                                ? new JsonResponse([], 200) 
                                : redirect()->back();
                    return $this->demoService->appendGlobalMessage($response, $request);
                }

                $restrictedKeys = $this->demoService->getRestrictedKeys($feature);
                
                if (empty($restrictedKeys)) {
                    return $this->demoService->appendGlobalMessage($feature, $request);
                }

                $originalData = $request->all();
                $filteredData = $this->demoService->filterRestrictedKeys($originalData, $restrictedKeys);
                $hasRestrictedKeys = $this->demoService->hasRestrictedKeys($originalData, $restrictedKeys);

                $request->merge($filteredData);
                $response = $next($request);

                if ($hasRestrictedKeys && $response->getStatusCode() === 200) {
                    return $this->demoService->appendGlobalMessage($response, $request);
                }

                return $response;
            }
        } catch (Exception $e) {
            dd($e);
        }

        return $next($request);
    }
}