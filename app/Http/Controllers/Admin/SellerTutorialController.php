<?php

namespace App\Http\Controllers\Admin;

use App\Enums\TutorialAudience;
use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\SellerTutorialRequest;
use App\Http\Services\Admin\TutorialService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class SellerTutorialController extends Controller
{
    /**
     * Summary of __construct
     * @param \App\Http\Services\Admin\TutorialService $tutorialService
     */
    public function __construct(protected TutorialService $tutorialService)
    {
        $this->middleware(['permissions:view_seller']);
    }

    /**
     * Summary of index
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function index(): View
    {
        return $this->tutorialService->index(audience: TutorialAudience::SELLER->value);
    }

    /**
     * Summary of store
     * @param \App\Http\Requests\Admin\SellerTutorialRequest $request
     * @return RedirectResponse
     */
    public function store(SellerTutorialRequest $request): RedirectResponse
    {
        return $this->tutorialService->save(audience: TutorialAudience::SELLER->value, data: $request->all());
    }

    /**
     * Summary of update
     * @param \App\Http\Requests\Admin\SellerTutorialRequest $request
     * @param string|int|null $identifier
     * @return RedirectResponse
     */
    public function update(SellerTutorialRequest $request, string|int|null $identifier = null): RedirectResponse
    {
        return $this->tutorialService->save(audience: TutorialAudience::SELLER->value, data: $request->all(), identifier: $identifier);
    }

    /**
     * Summary of destroy
     * @param string|int|null $identifier
     * @return RedirectResponse
     */
    public function destroy(string|int|null $identifier = null): RedirectResponse
    {
        return $this->tutorialService->destroy(identifier: $identifier, audience: TutorialAudience::SELLER->value);
    }
}