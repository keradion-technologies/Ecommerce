<?php

namespace App\Http\Services\Admin;

use App\Enums\Settings\TokenKey;
use App\Enums\StatusEnum;
use App\Models\Admin;

class AuthService
{
    /**
     * Get active admin by username.
     *
     * @param string $username
     * @return Admin|null
     */
    public function getActiveAdminByUsername(string $username): ?Admin
    {
        return Admin::where('user_name', $username)
                    ->where('status', StatusEnum::true->status())
                    ->first();
    }

    /**
     * Generate access token for admin.
     *
     * @param Admin $admin
     * @return string
     */
    public function getAccessToken(Admin $admin): string
    {
        return $admin->createToken(
            TokenKey::ADMIN_AUTH_TOKEN->value,
            ['role:' . TokenKey::ADMIN_TOKEN_ABILITIES->value]
        )->plainTextToken;
    }
}
