<?php

use App\Enums\SettingKey;

/**
 * This file configures demo mode functionality, controlling restricted actions and periodic database resets.
 *
 * Structure:
 * - `enabled`: Boolean (via APP_MODE env, set to 'demo' to enable). Toggles demo mode globally.
 * - `messages`: Contains the `global` message, used as the fallback for all demo mode notifications.
 * - `database_reset_unit`: Time unit for database resets ('second', 'minute', 'hour', 'day', 'month', 'year').
 * - `database_reset_duration`: Integer duration for reset intervals (e.g., 4 for 4 hours).
 * - `feature`: Array of features (e.g., 'settings', 'admin_management'), each with:
 *   - `enabled`: Boolean to toggle restrictions for the feature. If `false`, routes and data are unrestricted.
 *   - `default`: Default message for the feature if no restriction-specific message exists.
 *   - `routes`: Array of route names to restrict for this feature when `enabled => true`.
 *   - `restrictions`: Optional array of restricted top-level keys (e.g., 'site_settings'). Sub-keys (e.g., 'site_name') are filtered if present in request data.
 *   - `messages`: Optional array of restriction-specific messages (e.g., 'site_settings' => 'Custom message').
 *
 * Restriction Logic:
 * - If `enabled => true` for a feature:
 *   - Routes in `routes` are checked. If no `restrictions` are defined, the route is blocked (returns 403 or redirects with the default/global message).
 *   - If `restrictions` exist, request data is checked for restricted keys (e.g., 'site_settings'). Matching keys are filtered out, and non-restricted data proceeds. A global message is appended if restricted keys are filtered.
 * - If `enabled => false`, the feature’s routes and data are unrestricted, and no messages are appended.
 *
 * Messaging Hierarchy:
 * - Restriction-specific message (`feature.messages[key]`) is used if defined.
 * - Feature default message (`feature.default`) is used if no restriction-specific message exists.
 * - Global message (`messages.global`) is used as the final fallback.
 *
 * Database Reset:
 * - If `enabled => true`, the database is reset using the SQL file at `storage_path('../resources/database/database.sql')`.
 * - Resets occur based on `database_reset_unit` and `database_reset_duration` (e.g., every 4 hours).
 * - Last reset time is tracked in `storage/demo_reset.json`.
 *
 * Usage:
 * - Routes in `feature.routes` are processed by the `RestrictDemoMode` middleware when demo mode is enabled.
 * - Example configuration:
 *   - For `settings` with `enabled => true` and `restrictions => ['site_settings' => ['site_name']]`, submitting `site_settings[site_name]` on `admin.general.setting.store` filters out `site_name` and appends a message.
 *   - For `admin_management` with `enabled => true` and no `restrictions`, routes like `admin.store` are blocked with a message.
 *   - For `enabled => false`, routes like `admin.general.setting.store` or `admin.store` proceed without restrictions.
 */

return [
    
    'enabled' => env('APP_MODE', 'live') == "demo",
    'messages' => [
        'global' => 'This is a demo environment. Some actions are restricted.',
    ],

    'database_reset_unit' => 'second',
    'database_reset_duration' => 4,

    'feature' => [

        'admin_authentication' => [
            'enabled' => true,
            'default' => 'Admin authentication is restricted in demo mode.',
            'routes' => [
                'admin.password.reset.update',
                'admin.authenticate',
                'admin.password.email',
                'admin.email.password.verify.code',
            ],
        ],

        'settings' => [
            'enabled' => false,
            'default' => 'Demo Mode restrictions.',
            'routes' => [
                'admin.general.setting.store',
                'admin.general.setting.logo.store',
            ],
            'restrictions' => [
                'site_settings' => [
                    'copyright_text',
                    'mail_from',
                    'phone',
                    'address',
                    'country',
                    'time_zone',
                    'latitude',
                    'longitude',
                    'primary_color',
                    'secondary_color',
                    'font_color',
                    'order_prefix',
                    'wp_order_message',
                    'wp_digital_order_message'
                ],
            ],
            'messages' => [],
        ],

        'admin_password_reset' => [
            'enabled' => false,
            'default' => 'Admin password update is restricted in demo mode.',
            'routes' => [
                'admin.password.reset.update',
            ],
        ],

        'admin_profile_management' => [
            'enabled' => false,
            'default' => 'Admin Profile update is restricted in demo mode.',
            'routes' => [
                'admin.profile.update',
                'admin.password.update',
            ],
        ],

        'staff_management' => [
            'enabled' => false,
            'default' => 'Staff management is restricted in demo mode.',
            'routes' => [
                'admin.store',
                'admin.update',
                'admin.status.update',
                'admin.destroy'
            ],
        ],

        'inhouse_order_management' => [

            'enabled' => false,
            'default' => 'Inhouse order is restricted in demo mode.',
            'routes' => [
                'admin.store',
                'admin.update',
                'admin.status.update',
                'admin.destroy'
            ],
        ],

        'category_management' => [
            'enabled' => false,
            'default' => 'Category management is restricted in demo mode.',
            'routes' => [
                'admin.item.category.store',
                'admin.item.category.update',
                'admin.item.category.delete',
                'admin.item.category.top',
            ],
        ],

        'brand_management' => [
            'enabled' => true,
            'default' => 'Brand management is restricted in demo mode.',
            'routes' => [
                'admin.item.brand.store',
                'admin.item.brand.update',
                'admin.item.brand.delete',
                'admin.item.brand.top',
            ],
        ],

        'attribute_management' => [
            'enabled' => true,
            'default' => 'Attribute management is restricted in demo mode.',
            'routes' => [
                'admin.item.attribute.store',
                'admin.item.attribute.update',
                'admin.item.attribute.delete',
                'admin.item.attribute.value.store',
                'admin.item.attribute.value.update',
                'admin.item.attribute.value.delete',
            ],
        ],

        'product_management' => [
            'enabled' => true,
            'default' => 'Product management is restricted in demo mode.',
            'routes' => [
                'admin.product.reviews.delete',
                'admin.item.product.inhouse.create',
                'admin.item.product.inhouse.replicate',
            ],
        ],

        'order_management' => [
            'enabled' => true,
            'default' => 'Order management is restricted in demo mode.',
            'routes' => [
                'admin.inhouse.order.delete',
                'admin.inhouse.order.status.update',
                'admin.inhouse.order.product.status.update',
                'admin.order.assign',
                'admin.seller.order.return',
                'admin.digital.order.payment.status',
            ],
        ],

        'seller_management' => [
            'enabled' => true,
            'default' => 'Seller management is restricted in demo mode.',
            'routes' => [
                'admin.seller.store',
                'admin.seller.update',
                'admin.seller.status.update',
                'admin.seller.destroy',
            ],
        ],

        'customer_management' => [
            'enabled' => true,
            'default' => 'Customer management is restricted in demo mode.',
            'routes' => [
                'admin.customer.store',
                'admin.customer.update',
                'admin.customer.status.update',
                'admin.customer.destroy',
            ],
        ],

        'payment_management' => [
            'enabled' => true,
            'default' => 'Payment management is restricted in demo mode.',
            'routes' => [
                'admin.gateway.update',
                'admin.default.gateway',
                'admin.global.template.store',
                'admin.gateway.payment.update',
                'admin.gateway.payment.delete',
                'admin.deposit.update',
            ],
        ],

        'report_management' => [
            'enabled' => true,
            'default' => 'Report management is restricted in demo mode.',
            'routes' => [
                'admin.report.kyc.log.update',
            ],
        ],

        'frontend_management' => [
            'enabled' => true,
            'default' => 'Frontend management is restricted in demo mode.',
            'routes' => [
                'admin.frontend.section.update',
                'admin.frontend.element.store',
                'admin.frontend.element.update',
                'admin.frontend.section.banner.store',
                'admin.frontend.section.banner.update',
                'admin.frontend.section.banner.delete',
                'admin.frontend.section.banner.status',
                'admin.frontend.testimonial.store',
                'admin.frontend.testimonial.update',
                'admin.frontend.testimonial.status.update',
                'admin.frontend.testimonial.delete',
            ],
        ],

        'subscriber_management' => [
            'enabled' => true,
            'default' => 'Subscriber management is restricted in demo mode.',
            'routes' => [
                'admin.subscriber.send.mail.submit',
                'admin.subscriber.delete',
            ],
        ],

        'language_management' => [
            'enabled' => true,
            'default' => 'Language management is restricted in demo mode.',
            'routes' => [
                'admin.language.store',
                'admin.language.status.update',
                'admin.language.make.default',
                'admin.language.destroy',
                'admin.language.tranlateKey',
                'admin.language.destroy.key',
            ],
        ],

        'role_management' => [
            'enabled' => true,
            'default' => 'Role management is restricted in demo mode.',
            'routes' => [
                'admin.role.store',
                'admin.role.update',
                'admin.role.status.update',
                'admin.role.destroy',
            ],
        ],

        'page_management' => [
            'enabled' => true,
            'default' => 'Page management is restricted in demo mode.',
            'routes' => [
                'admin.page.store',
                'admin.page.update',
                'admin.page.delete',
                'admin.page.status.update',
            ],
        ],

        'blog_management' => [
            'enabled' => true,
            'default' => 'Blog management is restricted in demo mode.',
            'routes' => [
                'admin.blog.store',
                'admin.blog.update',
                'admin.blog.delete',
                'admin.blog.status.update',
            ],
        ],

        'campaign_management' => [
            'enabled' => true,
            'default' => 'Campaign management is restricted in demo mode.',
            'routes' => [
                'admin.campaign.store',
                'admin.campaign.update',
            ],
        ],

        'security_management' => [
            'enabled' => true,
            'default' => 'Security management is restricted in demo mode.',
            'routes' => [
                'admin.security.ip.store',
                'admin.security.ip.update.status',
                'admin.security.ip.destroy',
                'admin.security.dos.update',
            ],
        ],

        'system_update' => [
            'enabled' => true,
            'default' => 'System update is restricted in demo mode.',
            'routes' => [
                'admin.system.update.init',
                'admin.system.update',
                'admin.system.install.update',
            ],
        ],

        'support_ticket_management' => [
            'enabled' => true,
            'default' => 'Support ticket management is restricted in demo mode.',
            'routes' => [
                'admin.support.ticket.reply',
                'admin.support.ticket.closeds',
            ],
        ],

        'withdraw_management' => [
            'enabled' => true,
            'default' => 'Withdraw management is restricted in demo mode.',
            'routes' => [
                'admin.withdraw.method.store',
                'admin.withdraw.method.update',
                'admin.withdraw.method.delete',
                'admin.withdraw.log.approvedby',
                'admin.withdraw.log.rejectedby',
            ],
        ],

        'contact_management' => [
            'enabled' => true,
            'default' => 'Contact management is restricted in demo mode.',
            'routes' => [
                'admin.contact.send.mail',
                'admin.contact.destory',
            ],
        ],

        'sms_management' => [
            'enabled' => true,
            'default' => 'SMS management is restricted in demo mode.',
            'routes' => [
                'admin.sms.template.update',
            ],
        ],
    ],
];