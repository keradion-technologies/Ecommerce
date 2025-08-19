<div class="app-menu navbar-menu">
    <div class="brand-logo">
        <a href="{{route('admin.dashboard')}}" class="logo logo-light">
            <span class="logo-sm">
                <img src="{{show_image(file_path()['site_logo']['path'] . '/' . site_settings('admin_logo_sm'), file_path()['loder_logo']['size'])}}"
                    alt="{{site_settings('admin_logo_lg')}}">
            </span>
            <span class="logo-lg">
                <img src="{{show_image(file_path()['site_logo']['path'] . '/' . site_settings('admin_logo_lg'), file_path()['admin_site_logo']['size'])}}"
                    alt="{{site_settings('admin_logo_lg')}}">
            </span>
        </a>
        <button type="button" class="btn btn-sm p-0 fs-20 header-item float-end btn-vertical-sm-hover"
            id="vertical-hover">
            <i class="ri-record-circle-line"></i>
        </button>
    </div>

    <div id="scrollbar" class="scroll-bar" data-simplebar>
        <div class="container-fluid">
            <ul class="navbar-nav" id="navbar-nav">
                {{-- Search --}}
                <li class="nav-item sticky-top">
                    <input type="text" class="form-control mb-3" placeholder="Search menus..." id="menu-search-input">
                </li>

                <!-- Dashboard -->
                @if(permission_check('view_dashboard') || permission_check('view_seller'))
                    <li class="nav-item">
                        <a class="nav-link menu-link {{request()->routeIs('admin.dashboard') ? 'active' : ''}}"
                            href="{{route('admin.dashboard')}}">
                            <i class="bx bxs-dashboard"></i> <span>{{translate('Dashboard')}}</span>
                        </a>
                    </li>
                @endif

                <!-- E-commerce Management -->
                <li class="menu-title"><span>{{translate('E-commerce Management')}}</span></li>
                
                @if(permission_check('view_order'))
                    <li class="nav-item">
                        <a class="nav-link menu-link {{request()->routeIs('admin.inhouse.order.*') || request()->routeIs('admin.seller.order.*') || request()->routeIs('admin.digital.order.*') ? 'active' : ''}}"
                            href="#orderManagement" data-bs-toggle="collapse" role="button" aria-expanded="false"
                            aria-controls="orderManagement">
                            <i class='bx bxs-shopping-bags'></i> <span>{{translate('Orders')}}
                                @if($physical_product_order_count > 0 || $physical_product_seller_order_count > 0)
                                    <i class="text-danger las la-exclamation"></i>
                                @endif
                            </span>
                        </a>
                        <div class="pt-1 collapse {{request()->routeIs('admin.inhouse.order.*') || request()->routeIs('admin.seller.order.*') || request()->routeIs('admin.digital.order.*') ? 'show' : ''}} menu-dropdown mega-dropdown-menu"
                            id="orderManagement">
                            <ul class="nav nav-sm flex-column gap-1">
                                <li class="nav-item">
                                    <a class="nav-link {{request()->routeIs('admin.inhouse.order.*') || request()->routeIs('admin.seller.order.*') ? 'active' : ''}}"
                                        href="#physicalOrders" data-bs-toggle="collapse" role="button" aria-expanded="false"
                                        aria-controls="physicalOrders">
                                        <span>{{translate('Physical')}}
                                            @if($physical_product_order_count > 0 || $physical_product_seller_order_count > 0)
                                                <i class="text-danger las la-exclamation"></i>
                                            @endif
                                        </span>
                                    </a>
                                    <div class="pt-1 collapse {{request()->routeIs('admin.inhouse.order.*') || request()->routeIs('admin.seller.order.*') ? 'show' : ''}} menu-dropdown"
                                        id="physicalOrders">
                                        <ul class="nav nav-sm flex-column gap-1">
                                            <li class="nav-item">
                                                <a href="{{route('admin.inhouse.order.index')}}"
                                                    class="nav-link {{request()->routeIs('admin.inhouse.order.*') ? 'active' : ''}}">
                                                    <span>{{translate('Inhouse')}}
                                                        @if($physical_product_order_count > 0)
                                                            <small title="{{translate('Placed Order')}}" data-bs-toggle="tooltip"
                                                                data-bs-placement="top" class="badge bg-danger ms-2">
                                                                {{$physical_product_order_count}}
                                                            </small>
                                                        @endif
                                                    </span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="{{route('admin.seller.order.index')}}"
                                                    class="nav-link {{request()->routeIs('admin.seller.order.*') ? 'active' : ''}}">
                                                    <span>{{translate('Seller')}}
                                                        @if($physical_product_seller_order_count > 0)
                                                            <small title="{{translate('Seller Placed Order')}}"
                                                                data-bs-toggle="tooltip" data-bs-placement="top"
                                                                class="badge bg-danger ms-2">
                                                                {{$physical_product_seller_order_count}}
                                                            </small>
                                                        @endif
                                                    </span>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link {{request()->routeIs('admin.digital.order.*') ? 'active' : ''}}"
                                        href="#digitalOrders" data-bs-toggle="collapse" role="button" aria-expanded="false"
                                        aria-controls="digitalOrders">
                                        <span>{{translate('Digital')}}</span>
                                    </a>
                                    <div class="pt-1 collapse {{request()->routeIs('admin.digital.order.*') ? 'show' : ''}} menu-dropdown"
                                        id="digitalOrders">
                                        <ul class="nav nav-sm flex-column gap-1">
                                            <li class="nav-item">
                                                <a href="{{route('admin.digital.order.product.inhouse')}}"
                                                    class="nav-link {{request()->routeIs('admin.digital.order.product.inhouse') ? 'active' : ''}}">
                                                    {{translate('Inhouse')}}
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="{{route('admin.digital.order.product.seller')}}"
                                                    class="nav-link {{request()->routeIs('admin.digital.order.product.seller') ? 'active' : ''}}">
                                                    {{translate('Seller')}}
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                @if(permission_check('view_brand') || permission_check('view_category') || permission_check('view_product') || permission_check('manage_taxes'))
                    <li class="nav-item">
                        <a class="nav-link menu-link {{request()->routeIs('admin.item.*') || request()->routeIs('admin.product.*') || request()->routeIs('admin.tax.*') || request()->routeIs('admin.digital.product.*') ? 'active' : ''}}"
                            href="#productManagement" data-bs-toggle="collapse" role="button" aria-expanded="false"
                            aria-controls="productManagement">
                            <i class='bx bxl-product-hunt'></i> <span>{{translate('Products')}}
                                @if($seller_new_digital_product_count > 0 || $seller_new_physical_product_count > 0)
                                    <i class="text-danger las la-exclamation"></i>
                                @endif
                            </span>
                        </a>
                        <div class="pt-1 collapse {{request()->routeIs('admin.item.*') || request()->routeIs('admin.product.*') || request()->routeIs('admin.tax.*') || request()->routeIs('admin.digital.product.*') ? 'show' : ''}} menu-dropdown mega-dropdown-menu"
                            id="productManagement">
                            <ul class="nav nav-sm flex-column gap-1">
                                @if(permission_check('view_product'))
                                    <li class="nav-item">
                                        <a class="nav-link {{request()->routeIs('admin.item.product.inhouse.*') || request()->routeIs('admin.product.seller.*') || request()->routeIs('admin.product.reviews') ? 'active' : ''}}"
                                            href="#physicalProducts" data-bs-toggle="collapse" role="button"
                                            aria-expanded="false" aria-controls="physicalProducts">
                                            {{translate('Physical')}}
                                            @if($seller_new_physical_product_count > 0)
                                                <i class="text-danger las la-exclamation"></i>
                                            @endif
                                        </a>
                                        <div class="pt-1 collapse {{request()->routeIs('admin.item.product.inhouse.*') || request()->routeIs('admin.product.seller.*') || request()->routeIs('admin.product.reviews') ? 'show' : ''}} menu-dropdown"
                                            id="physicalProducts">
                                            <ul class="nav nav-sm flex-column gap-1">
                                                <li class="nav-item">
                                                    <a href="{{route('admin.item.product.inhouse.index')}}"
                                                        class="nav-link {{request()->routeIs('admin.item.product.inhouse.*') || request()->routeIs('admin.product.reviews') ? 'active' : ''}}">
                                                        {{translate('Inhouse')}}
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="{{route('admin.product.seller.index')}}"
                                                        class="nav-link {{request()->routeIs('admin.product.seller.*') ? 'active' : ''}}">
                                                        {{translate('Seller')}}
                                                        @if($seller_new_physical_product_count > 0)
                                                            <span title="{{translate('Seller New Product')}}"
                                                                data-bs-toggle="tooltip" data-bs-placement="top"
                                                                class="badge bg-danger">
                                                                {{$seller_new_physical_product_count}}
                                                            </span>
                                                        @endif
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link {{request()->routeIs('admin.digital.product.*') ? 'active' : ''}}"
                                            href="#digitalProducts" data-bs-toggle="collapse" role="button"
                                            aria-expanded="false" aria-controls="digitalProducts">
                                            {{translate('Digital')}}
                                            @if($seller_new_digital_product_count > 0)
                                                <i class="text-danger las la-exclamation"></i>
                                            @endif
                                        </a>
                                        <div class="pt-1 collapse {{request()->routeIs('admin.digital.product.*') ? 'show' : ''}} menu-dropdown"
                                            id="digitalProducts">
                                            <ul class="nav nav-sm flex-column gap-1">
                                                <li class="nav-item">
                                                    <a href="{{route('admin.digital.product.index')}}"
                                                        class="nav-link {{request()->routeIs('admin.digital.product.index') || request()->routeIs('admin.digital.product.create') || request()->routeIs('admin.digital.product.edit') || request()->routeIs('admin.digital.product.attribute') || request()->routeIs('admin.digital.product.attribute.*') ? 'active' : ''}}">
                                                        {{translate('Inhouse')}}
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="{{route('admin.digital.product.seller')}}"
                                                        class="nav-link {{request()->routeIs('admin.digital.product.seller') || request()->routeIs('admin.digital.product.seller.*') ? 'active' : ''}}">
                                                        {{translate('Seller')}}
                                                        @if($seller_new_digital_product_count > 0)
                                                            <span title="{{translate('Seller New Product')}}"
                                                                data-bs-toggle="tooltip" data-bs-placement="top"
                                                                class="badge bg-danger">
                                                                {{$seller_new_digital_product_count}}
                                                            </span>
                                                        @endif
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                @endif
                                <li class="nav-item">
                                    <a class="nav-link {{request()->routeIs('admin.item.category.*') || request()->routeIs('admin.item.brand.*') || request()->routeIs('admin.item.attribute.*') || request()->routeIs('admin.tax.*') ? 'active' : ''}}"
                                        href="#catalogManagement" data-bs-toggle="collapse" role="button"
                                        aria-expanded="false" aria-controls="catalogManagement">
                                        {{translate('Catalogs')}}
                                    </a>
                                    <div class="pt-1 collapse {{request()->routeIs('admin.item.category.*') || request()->routeIs('admin.item.brand.*') || request()->routeIs('admin.item.attribute.*') || request()->routeIs('admin.tax.*') ? 'show' : ''}} menu-dropdown"
                                        id="catalogManagement">
                                        <ul class="nav nav-sm flex-column gap-1">
                                            @if(permission_check('view_category'))
                                                <li class="nav-item">
                                                    <a href="{{route('admin.item.category.index')}}"
                                                        class="nav-link {{request()->routeIs('admin.item.category.*') ? 'active' : ''}}">
                                                        {{translate('Categories')}}
                                                    </a>
                                                </li>
                                            @endif
                                            @if(permission_check('view_brand'))
                                                <li class="nav-item">
                                                    <a href="{{route('admin.item.brand.index')}}"
                                                        class="nav-link {{request()->routeIs('admin.item.brand.*') ? 'active' : ''}}">
                                                        {{translate('Brands')}}
                                                    </a>
                                                </li>
                                            @endif
                                            @if(permission_check('view_product'))
                                                <li class="nav-item">
                                                    <a href="{{route('admin.item.attribute.index')}}"
                                                        class="nav-link {{request()->routeIs('admin.item.attribute.*') ? 'active' : ''}}">
                                                        {{translate('Attributes')}}
                                                    </a>
                                                </li>
                                            @endif
                                            @if(permission_check('manage_taxes'))
                                                <li class="nav-item">
                                                    <a href="{{route('admin.tax.list')}}"
                                                        class="nav-link {{request()->routeIs('admin.tax.*') ? 'active' : ''}}">
                                                        {{translate('Taxes')}}
                                                    </a>
                                                </li>
                                            @endif
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                <!-- User Management -->
                <li class="menu-title"><span>{{translate('User Management')}}</span></li>
                
                @if(permission_check('manage_customer'))
                    <li class="nav-item">
                        <a class="nav-link menu-link {{request()->routeIs('admin.customer.*') ? 'active' : ''}}"
                            href="#customerManagement" data-bs-toggle="collapse" role="button" aria-expanded="false"
                            aria-controls="customerManagement">
                            <i class='bx bxs-user-detail'></i> <span>{{translate('Customer')}}</span>
                        </a>
                        <div class="pt-1 collapse {{request()->routeIs('admin.customer.*') ? 'show' : ''}} menu-dropdown"
                            id="customerManagement">
                            <ul class="nav nav-sm flex-column gap-1">
                                <li class="nav-item">
                                    <a href="{{route('admin.customer.index')}}"
                                        class="nav-link {{request()->routeIs('admin.customer.index') ? 'active' : ''}}">
                                        {{translate('List')}}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{route('admin.customer.wallet')}}"
                                        class="nav-link {{request()->routeIs('admin.customer.wallet') ? 'active' : ''}}">
                                        {{translate('Wallet')}}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{route('admin.customer.rewards')}}"
                                        class="nav-link {{request()->routeIs('admin.customer.rewards') ? 'active' : ''}}">
                                        {{translate('Rewards Program')}}
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                @if(permission_check('view_seller') && site_settings('multi_vendor', App\Enums\StatusEnum::true->status()) == App\Enums\StatusEnum::true->status())
                    <li class="nav-item">
                        <a class="nav-link menu-link {{request()->routeIs('admin.seller.*') || request()->routeIs('admin.plan.*') ? 'active' : ''}}"
                            href="#sellerManagement" data-bs-toggle="collapse" role="button" aria-expanded="false"
                            aria-controls="sellerManagement">
                            <i class='bx bxs-store'></i> <span>{{translate('Seller')}}</span>
                        </a>
                        <div class="pt-1 collapse {{request()->routeIs('admin.seller.*') || request()->routeIs('admin.plan.*') ? 'show' : ''}} menu-dropdown mega-dropdown-menu"
                            id="sellerManagement">
                            <ul class="nav nav-sm flex-column gap-1">
                                <li class="nav-item">
                                    <a href="{{route('admin.seller.shop')}}"
                                        class="nav-link {{request()->routeIs('admin.seller.shop') ? 'active' : ''}}">
                                        {{translate('Shop Analytics')}}
                                    </a>
                                </li>
                                @if(permission_check('view_seller'))
                                    <li class="nav-item">
                                        <a href="{{route('admin.seller.info.index')}}"
                                            class="nav-link {{request()->routeIs('admin.seller.info.*') ? 'active' : ''}}">
                                            {{translate('Seller Accounts')}}
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link {{request()->routeIs('admin.plan.*') ? 'active' : ''}}"
                                            href="#subscriptionManagement" data-bs-toggle="collapse" role="button"
                                            aria-expanded="false" aria-controls="subscriptionManagement">
                                            {{translate('Subscription Plans')}}
                                        </a>
                                        <div class="pt-1 collapse {{request()->routeIs('admin.plan.*') ? 'show' : ''}} menu-dropdown"
                                            id="subscriptionManagement">
                                            <ul class="nav nav-sm flex-column gap-1">
                                                <li class="nav-item">
                                                    <a href="{{route('admin.plan.subscription')}}"
                                                        class="nav-link {{request()->routeIs('admin.plan.subscription') ? 'active' : ''}}">
                                                        {{translate('Active Subscriptions')}}
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="{{route('admin.plan.index')}}"
                                                        class="nav-link {{request()->routeIs('admin.plan.index') ? 'active' : ''}}">
                                                        {{translate('Pricing Plans')}}
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                @endif
                            </ul>
                        </div>
                    </li>
                @endif

                @if(permission_check('manage_delivery_man'))
                    <li class="nav-item">
                        <a class="nav-link menu-link {{request()->routeIs('admin.delivery-man.*') || request()->routeIs('admin.general.deliveryman.setting') ? 'active' : ''}}"
                            href="#deliveryManagement" data-bs-toggle="collapse" role="button" aria-expanded="false"
                            aria-controls="deliveryManagement">
                            <i class='bx bxs-truck'></i> <span>{{translate('Delivery')}}</span>
                        </a>
                        <div class="pt-1 collapse {{request()->routeIs('admin.delivery-man.*') || request()->routeIs('admin.general.deliveryman.setting') ? 'show' : ''}} menu-dropdown"
                            id="deliveryManagement">
                            <ul class="nav nav-sm flex-column gap-1">
                                <li class="nav-item">
                                    <a href="{{route('admin.delivery-man.list')}}"
                                        class="nav-link {{request()->routeIs('admin.delivery-man.*') && !request()->routeIs('admin.delivery-man.configuration') && !request()->routeIs('admin.delivery-man.kyc.configuration') && !request()->routeIs('admin.delivery-man.rewards') && !request()->routeIs('admin.delivery-man.referral') ? 'active' : ''}}">
                                        {{translate('Delivery Personnel')}}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{route('admin.delivery-man.rewards')}}"
                                        class="nav-link {{request()->routeIs('admin.delivery-man.rewards') ? 'active' : ''}}">
                                        {{translate('Rewards Program')}}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{route('admin.delivery-man.referral')}}"
                                        class="nav-link {{request()->routeIs('admin.delivery-man.referral') ? 'active' : ''}}">
                                        {{translate('Referral Program')}}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link {{request()->routeIs('admin.delivery-man.configuration') || request()->routeIs('admin.delivery-man.kyc.configuration') || request()->routeIs('admin.general.deliveryman.setting') ? 'active' : ''}}"
                                        href="#deliverySettings" data-bs-toggle="collapse" role="button"
                                        aria-expanded="false" aria-controls="deliverySettings">
                                        {{translate('Configuration')}}
                                    </a>
                                    <div class="pt-1 collapse {{request()->routeIs('admin.delivery-man.configuration') || request()->routeIs('admin.delivery-man.kyc.configuration') || request()->routeIs('admin.general.deliveryman.setting') ? 'show' : ''}} menu-dropdown"
                                        id="deliverySettings">
                                        <ul class="nav nav-sm flex-column gap-1">
                                            <li class="nav-item">
                                                <a href="{{route('admin.delivery-man.configuration')}}"
                                                    class="nav-link {{request()->routeIs('admin.delivery-man.configuration') ? 'active' : ''}}">
                                                    {{translate('Configuration')}}
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="{{route('admin.delivery-man.kyc.configuration')}}"
                                                    class="nav-link {{request()->routeIs('admin.delivery-man.kyc.configuration') ? 'active' : ''}}">
                                                    {{translate('KYC Configuration')}}
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="{{route('admin.general.deliveryman.setting')}}"
                                                    class="nav-link {{request()->routeIs('admin.general.deliveryman.setting') ? 'active' : ''}}">
                                                    {{translate('App Settings')}}
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                @if(permission_check('view_admin') || permission_check('view_roles'))
                    <li class="nav-item">
                        <a class="nav-link menu-link {{request()->routeIs('admin.role.*') || request()->routeIs('admin.index') || request()->routeIs('admin.edit') || request()->routeIs('admin.create') ? 'active' : ''}}"
                            href="#staffManagement" data-bs-toggle="collapse" role="button" aria-expanded="false"
                            aria-controls="staffManagement">
                            <i class='bx bx-user-circle'></i> <span>{{translate('Staff')}}</span>
                        </a>
                        <div class="pt-1 collapse {{request()->routeIs('admin.role.*') || request()->routeIs('admin.index') || request()->routeIs('admin.edit') || request()->routeIs('admin.create') ? 'show' : ''}} menu-dropdown"
                            id="staffManagement">
                            <ul class="nav nav-sm flex-column gap-1">
                                @if(permission_check('view_admin'))
                                    <li class="nav-item">
                                        <a href="{{route('admin.index')}}"
                                            class="nav-link {{request()->routeIs('admin.index') || request()->routeIs('admin.edit') || request()->routeIs('admin.create') ? 'active' : ''}}">
                                            {{translate('Staff List')}}
                                        </a>
                                    </li>
                                @endif
                                @if(permission_check('view_roles'))
                                    <li class="nav-item">
                                        <a href="{{route('admin.role.index')}}"
                                            class="nav-link {{request()->routeIs('admin.role.*') ? 'active' : ''}}">
                                            {{translate('Roles & Permissions')}}
                                        </a>
                                    </li>
                                @endif
                            </ul>
                        </div>
                    </li>
                @endif

                <!-- Business Operations -->
                <li class="menu-title"><span>{{translate('Business Operations')}}</span></li>

                @if(permission_check('manage_pos_system'))
                    <li class="nav-item">
                        <a class="nav-link menu-link {{request()->routeIs('admin.pos.system.*') ? 'active' : ''}}"
                            href="#posManagement" data-bs-toggle="collapse" role="button" aria-expanded="false"
                            aria-controls="posManagement">
                            <i class='bx bx-receipt'></i> <span>{{translate('POS System')}}</span>
                        </a>
                        <div class="pt-1 collapse {{request()->routeIs('admin.pos.system.*') ? 'show' : ''}} menu-dropdown"
                            id="posManagement">
                            <ul class="nav nav-sm flex-column gap-1">
                                <li class="nav-item">
                                    <a href="{{route('admin.pos.system.dashboard')}}"
                                        class="nav-link {{request()->routeIs('admin.pos.system.dashboard') ? 'active' : ''}}">
                                        {{translate('POS Dashboard')}}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{route('admin.pos.system.index')}}"
                                        class="nav-link {{request()->routeIs('admin.pos.system.index') ? 'active' : ''}}">
                                        {{translate('Point of Sale')}}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{route('admin.pos.system.inhouse.order.index')}}"
                                        class="nav-link {{request()->routeIs('admin.pos.system.inhouse.order.index') ? 'active' : ''}}">
                                        {{translate('POS Orders')}}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{route('admin.gateway.payment.pos.method')}}"
                                        class="nav-link {{request()->routeIs('admin.gateway.payment.pos.method') ? 'active' : ''}}">
                                        {{translate('Payment Methods')}}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="{{route('admin.pos.system.payment.index')}}"
                                        class="nav-link {{request()->routeIs('admin.pos.system.payment.*') ? 'active' : ''}}">
                                        {{translate('Payment Logs')}}
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                @if(permission_check('manage_deal') || permission_check('manage_offer') || permission_check('manage_cuppon') || permission_check('manage_campaign') || permission_check('manage_frontend'))
                    <li class="nav-item">
                        <a class="nav-link menu-link {{request()->routeIs('admin.promote.*') || request()->routeIs('admin.campaign.*') ? 'active' : ''}}"
                            href="#marketingPromotion" data-bs-toggle="collapse" role="button" aria-expanded="false"
                            aria-controls="marketingPromotion">
                            <i class='bx bx-volume-low'></i> <span>{{translate('Marketing')}}</span>
                        </a>
                        <div class="pt-1 collapse {{request()->routeIs('admin.promote.*') || request()->routeIs('admin.campaign.*') ? 'show' : ''}} menu-dropdown"
                            id="marketingPromotion">
                            <ul class="nav nav-sm flex-column gap-1">
                                @if(permission_check('manage_cuppon'))
                                    <li class="nav-item">
                                        <a href="{{route('admin.promote.coupon.index')}}"
                                            class="nav-link {{request()->routeIs('admin.promote.coupon.*') ? 'active' : ''}}">
                                            {{translate('Coupon Management')}}
                                        </a>
                                    </li>
                                @endif
                                @if(permission_check('manage_campaign'))
                                    <li class="nav-item">
                                        <a href="{{route('admin.campaign.index')}}"
                                            class="nav-link {{request()->routeIs('admin.campaign.*') ? 'active' : ''}}">
                                            {{translate('Campaign Management')}}
                                        </a>
                                    </li>
                                @endif
                                @if(permission_check('manage_offer'))
                                    <li class="nav-item">
                                        <a href="{{route('admin.promote.flash.deals.index')}}"
                                            class="nav-link {{request()->routeIs('admin.promote.flash.deals.*') ? 'active' : ''}}">
                                            {{translate('Flash Deals')}}
                                        </a>
                                    </li>
                                @endif
                            </ul>
                        </div>
                    </li>
                @endif

                <!-- Support & Analytics -->
                <li class="menu-title"><span>{{translate('Support & Analytics')}}</span></li>

                @if(permission_check('view_support'))
                    <li class="nav-item">
                        <a class="nav-link menu-link {{request()->routeIs('admin.support.*') ? 'active' : ''}}"
                            href="{{route('admin.support.ticket.index')}}">
                            <i class='bx bx-support'></i>
                            <span>{{translate('Support Tickets')}}
                                @if($running_ticket > 0)
                                    <small title="{{translate('Running Ticket')}}" data-bs-toggle="tooltip"
                                        data-bs-placement="top" class="badge bg-danger ms-2">
                                        {{$running_ticket}}
                                    </small>
                                @endif
                            </span>
                        </a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link menu-link {{request()->routeIs('admin.report.*') || request()->routeIs('admin.payment.*') || request()->routeIs('admin.deposit.*') || request()->routeIs('admin.withdraw.log.*') ? 'active' : ''}}"
                            href="#reportsAnalytics" data-bs-toggle="collapse" role="button" aria-expanded="false"
                            aria-controls="reportsAnalytics">
                            <i class='bx bxs-report'></i> <span>{{translate('Reports & Analytics')}}
                                @if($withdraw_pending_log_count > 0 || $deposit_pending_log_count > 0)
                                    <i class="text-danger las la-exclamation"></i>
                                @endif
                            </span>
                        </a>
                        <div class="pt-1 collapse {{request()->routeIs('admin.report.*') || request()->routeIs('admin.payment.*') || request()->routeIs('admin.deposit.*') || request()->routeIs('admin.withdraw.log.*') ? 'show' : ''}} menu-dropdown"
                            id="reportsAnalytics">
                            <ul class="nav nav-sm flex-column gap-1">
                                <li class="nav-item">
                                    <a class="nav-link {{request()->routeIs('admin.report.*.transaction') || request()->routeIs('admin.payment.*') ? 'active' : ''}}"
                                        href="#financialReports" data-bs-toggle="collapse" role="button"
                                        aria-expanded="false" aria-controls="financialReports">
                                        {{translate('Financial Reports')}}
                                    </a>
                                    <div class="pt-1 collapse {{request()->routeIs('admin.report.*.transaction') || request()->routeIs('admin.payment.*') ? 'show' : ''}} menu-dropdown"
                                        id="financialReports">
                                        <ul class="nav nav-sm flex-column gap-1">
                                            <li class="nav-item">
                                                <a href="{{route('admin.report.user.transaction')}}"
                                                    class="nav-link {{request()->routeIs('admin.report.*.transaction') ? 'active' : ''}}">
                                                    {{translate('Transaction Reports')}}
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="{{route('admin.payment.index')}}"
                                                    class="nav-link {{request()->routeIs('admin.payment.*') ? 'active' : ''}}">
                                                    {{translate('Payment Reports')}}
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link {{request()->routeIs('admin.deposit.*') || request()->routeIs('admin.withdraw.log.*') ? 'active' : ''}}"
                                        href="#walletManagement" data-bs-toggle="collapse" role="button"
                                        aria-expanded="false" aria-controls="walletManagement">
                                        {{translate('Wallet Management')}}
                                        @if($withdraw_pending_log_count > 0 || $deposit_pending_log_count > 0)
                                            <i class="text-danger las la-exclamation"></i>
                                        @endif
                                    </a>
                                    <div class="pt-1 collapse {{request()->routeIs('admin.deposit.*') || request()->routeIs('admin.withdraw.log.*') ? 'show' : ''}} menu-dropdown"
                                        id="walletManagement">
                                        <ul class="nav nav-sm flex-column gap-1">
                                            <li class="nav-item">
                                                <a href="{{route('admin.deposit.index')}}"
                                                    class="nav-link {{request()->routeIs('admin.deposit.*') ? 'active' : ''}}">
                                                    {{translate('Deposits')}}
                                                    @if($deposit_pending_log_count > 0)
                                                        <span title="{{translate('Pending Deposit')}}" data-bs-toggle="tooltip"
                                                            data-bs-placement="top" class="badge bg-danger">
                                                            {{$deposit_pending_log_count}}
                                                        </span>
                                                    @endif
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="{{route('admin.withdraw.log.index')}}"
                                                    class="nav-link {{request()->routeIs('admin.withdraw.log.*') ? 'active' : ''}}">
                                                    {{translate('Withdrawals')}}
                                                    @if($withdraw_pending_log_count > 0)
                                                        <span title="{{translate('Pending Withdraw')}}" data-bs-toggle="tooltip"
                                                            data-bs-placement="top" class="badge bg-danger">
                                                            {{$withdraw_pending_log_count}}
                                                        </span>
                                                    @endif
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a href="{{route('admin.report.kyc.log')}}"
                                        class="nav-link {{request()->routeIs('admin.report.kyc.*') ? 'active' : ''}}">
                                        @if($requested_kyc_log > 0)
                                        {{translate('KYC Verifications')}}
                                            <span title="{{translate('Requested KYC log')}}" data-bs-toggle="tooltip"
                                                data-bs-placement="top" class="badge bg-danger">
                                                {{$requested_kyc_log}}
                                            </span>
                                        @endif
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                <!-- Website & Content -->
                <li class="menu-title"><span>{{translate('Website & Content')}}</span></li>

                @if(permission_check('manage_frontend') || permission_check('manage_blog') || permission_check('manage_deal') || permission_check('manage_offer') || permission_check('manage_cuppon') || permission_check('manage_campaign'))
                    <li class="nav-item">
                        <a class="nav-link menu-link {{request()->routeIs('admin.frontend.*') || request()->routeIs('admin.menu.*') || request()->routeIs('admin.page.*') || request()->routeIs('admin.faq.*') || request()->routeIs('admin.blog.*') || request()->routeIs('admin.home.category') ? 'active' : ''}}"
                            href="#websiteManagement" data-bs-toggle="collapse" role="button" aria-expanded="false"
                            aria-controls="websiteManagement">
                            <i class='bx bx-world'></i> <span>{{translate('Website Management')}}</span>
                        </a>
                        <div class="pt-1 collapse {{request()->routeIs('admin.frontend.*') || request()->routeIs('admin.menu.*') || request()->routeIs('admin.page.*') || request()->routeIs('admin.faq.*') || request()->routeIs('admin.blog.*') || request()->routeIs('admin.home.category') ? 'show' : ''}} menu-dropdown"
                            id="websiteManagement">
                            <ul class="nav nav-sm flex-column gap-1">
                                <li class="nav-item">
                                    <a class="nav-link {{request()->routeIs('admin.frontend.section') || request()->routeIs('admin.frontend.testimonial.*') || request()->routeIs('admin.home.category') ? 'active' : ''}}"
                                        href="#frontendContent" data-bs-toggle="collapse" role="button"
                                        aria-expanded="false" aria-controls="frontendContent">
                                        {{translate('Frontend Content')}}
                                    </a>
                                    <div class="pt-1 collapse {{request()->routeIs('admin.frontend.section') || request()->routeIs('admin.frontend.testimonial.*') || request()->routeIs('admin.home.category') ? 'show' : ''}} menu-dropdown"
                                        id="frontendContent">
                                        <ul class="nav nav-sm flex-column gap-1">
                                            <li class="nav-item">
                                                <a href="{{route('admin.frontend.section')}}"
                                                    class="nav-link {{request()->routeIs('admin.frontend.section') ? 'active' : ''}}">
                                                    {{translate('Frontend Sections')}}
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="{{route('admin.frontend.testimonial.index')}}"
                                                    class="nav-link {{request()->routeIs('admin.frontend.testimonial.*') ? 'active' : ''}}">
                                                    {{translate('Testimonials')}}
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="{{route('admin.home.category')}}"
                                                    class="nav-link {{request()->routeIs('admin.home.category') ? 'active' : ''}}">
                                                    {{translate('Home Categories')}}
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link {{request()->routeIs('admin.frontend.promotional.*') || request()->routeIs('admin.frontend.section.*') ? 'active' : ''}}"
                                        href="#bannerManagement" data-bs-toggle="collapse" role="button"
                                        aria-expanded="false" aria-controls="bannerManagement">
                                        {{translate('Banner Management')}}
                                    </a>
                                    <div class="pt-1 collapse {{request()->routeIs('admin.frontend.promotional.*') || request()->routeIs('admin.frontend.section.*') ? 'show' : ''}} menu-dropdown"
                                        id="bannerManagement">
                                        <ul class="nav nav-sm flex-column gap-1">
                                            <li class="nav-item">
                                                <a href="{{route('admin.frontend.promotional.banner')}}"
                                                    class="nav-link {{request()->routeIs('admin.frontend.promotional.*') ? 'active' : ''}}">
                                                    {{translate('Promotional Banners')}}
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="{{route('admin.frontend.section.banner')}}"
                                                    class="nav-link {{request()->routeIs('admin.frontend.section.*') ? 'active' : ''}}">
                                                    {{translate('Section Banners')}}
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link {{request()->routeIs('admin.menu.*') || request()->routeIs('admin.page.*') || request()->routeIs('admin.faq.*') || request()->routeIs('admin.blog.*') ? 'active' : ''}}"
                                        href="#contentManagement" data-bs-toggle="collapse" role="button"
                                        aria-expanded="false" aria-controls="contentManagement">
                                        {{translate('Content Management')}}
                                    </a>
                                    <div class="pt-1 collapse {{request()->routeIs('admin.menu.*') || request()->routeIs('admin.page.*') || request()->routeIs('admin.faq.*') || request()->routeIs('admin.blog.*') ? 'show' : ''}} menu-dropdown"
                                        id="contentManagement">
                                        <ul class="nav nav-sm flex-column gap-1">
                                            <li class="nav-item">
                                                <a href="{{route('admin.menu.index')}}"
                                                    class="nav-link {{request()->routeIs('admin.menu.*') ? 'active' : ''}}">
                                                    {{translate('Navigation Menus')}}
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="{{route('admin.page.index')}}"
                                                    class="nav-link {{request()->routeIs('admin.page.*') ? 'active' : ''}}">
                                                    {{translate('Custom Pages')}}
                                                </a>
                                            </li>
                                            @if(permission_check('manage_blog'))
                                                <li class="nav-item">
                                                    <a href="{{route('admin.blog.index')}}"
                                                        class="nav-link {{request()->routeIs('admin.blog.*') ? 'active' : ''}}">
                                                        {{translate('Blog Posts')}}
                                                    </a>
                                                </li>
                                            @endif
                                            <li class="nav-item">
                                                <a href="{{route('admin.faq.index')}}"
                                                    class="nav-link {{request()->routeIs('admin.faq.*') ? 'active' : ''}}">
                                                    {{translate('FAQ Management')}}
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                @if(permission_check('manage_frontend'))
                                    <li class="nav-item">
                                        <a class="nav-link {{request()->routeIs('admin.subscriber.*') || request()->routeIs('admin.contact.*') ? 'active' : ''}}"
                                            href="#customerEngagement" data-bs-toggle="collapse" role="button"
                                            aria-expanded="false" aria-controls="customerEngagement">
                                            {{translate('Customer Engagement')}}
                                        </a>
                                        <div class="pt-1 collapse {{request()->routeIs('admin.subscriber.*') || request()->routeIs('admin.contact.*') ? 'show' : ''}} menu-dropdown"
                                            id="customerEngagement">
                                            <ul class="nav nav-sm flex-column gap-1">
                                                <li class="nav-item">
                                                    <a href="{{route('admin.subscriber.index')}}"
                                                        class="nav-link {{request()->routeIs('admin.subscriber.*') ? 'active' : ''}}">
                                                        {{translate('Newsletter Subscribers')}}
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="{{route('admin.contact.index')}}"
                                                        class="nav-link {{request()->routeIs('admin.contact.index') ? 'active' : ''}}">
                                                        {{translate('Contact Messages')}}
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </li>
                                @endif
                            </ul>
                        </div>
                    </li>
                @endif

                <!-- System Configuration -->
                <li class="menu-title"><span>{{translate('System Configuration')}}</span></li>

                <!-- Settings -->
                @if(permission_check('view_settings') || permission_check('view_languages') || permission_check('view_method') || permission_check('manage_countries') || permission_check('manage_states') || permission_check('manage_cities') || permission_check('manage_zones'))
                    <li class="nav-item">
                        <a class="nav-link menu-link {{request()->routeIs('admin.general.*') || request()->routeIs('admin.seo.*') || request()->routeIs('admin.language.*') || request()->routeIs('admin.gateway.payment.*') || request()->routeIs('admin.withdraw.method.*') || request()->routeIs('admin.mail.*') || request()->routeIs('admin.sms.*') || request()->routeIs('admin.notification.templates.*') || request()->routeIs('admin.security.*') ? 'active' : ''}}"
                            href="#settingsManagement" data-bs-toggle="collapse" role="button" aria-expanded="false"
                            aria-controls="settingsManagement">
                            <i class='bx bx-cog'></i> <span>{{translate('Settings')}}</span>
                        </a>
                        <div class="pt-1 collapse {{request()->routeIs('admin.general.*') || request()->routeIs('admin.seo.*') || request()->routeIs('admin.language.*') || request()->routeIs('admin.gateway.payment.*') || request()->routeIs('admin.withdraw.method.*') || request()->routeIs('admin.mail.*') || request()->routeIs('admin.sms.*') || request()->routeIs('admin.notification.templates.*') || request()->routeIs('admin.security.*') ? 'show' : ''}} menu-dropdown mega-dropdown-menu"
                            id="settingsManagement">
                            <ul class="nav nav-sm flex-column gap-1">
                                <!-- System Settings -->
                                <li class="nav-item">
                                    <a class="nav-link {{request()->routeIs('admin.general.*') || request()->routeIs('admin.seo.*') ? 'active' : ''}}"
                                        href="#systemSettings" data-bs-toggle="collapse" role="button"
                                        aria-expanded="false" aria-controls="systemSettings">
                                        {{translate('System')}}
                                    </a>
                                    <div class="pt-1 collapse {{request()->routeIs('admin.general.*') || request()->routeIs('admin.seo.*') ? 'show' : ''}} menu-dropdown"
                                        id="systemSettings">
                                        <ul class="nav nav-sm flex-column gap-1">
                                            <li class="nav-item">
                                                <a href="{{route('admin.general.setting.index')}}"
                                                    class="nav-link {{request()->routeIs('admin.general.setting.index') ? 'active' : ''}}">
                                                    {{translate('General')}}
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="{{route('admin.general.setting.kyc')}}"
                                                    class="nav-link {{request()->routeIs('admin.general.setting.kyc') ? 'active' : ''}}">
                                                    {{translate('Vendor KYC')}}
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="{{route('admin.general.app.setting')}}"
                                                    class="nav-link {{request()->routeIs('admin.general.app.setting') ? 'active' : ''}}">
                                                    {{translate('Mobile App')}}
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="{{route('admin.seo.index')}}"
                                                    class="nav-link {{request()->routeIs('admin.seo.index') ? 'active' : ''}}">
                                                    {{translate('SEO')}}
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="{{route('admin.general.setting.currency.index')}}"
                                                    class="nav-link {{request()->routeIs('admin.general.setting.currency.index') ? 'active' : ''}}">
                                                    {{translate('Currency')}}
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>

                                <!-- Language Management -->
                                @if(permission_check('view_languages'))
                                    <li class="nav-item">
                                        <a href="{{route('admin.language.index')}}"
                                            class="nav-link {{request()->routeIs('admin.language.*') ? 'active' : ''}}">
                                            {{translate('Language')}}
                                        </a>
                                    </li>
                                @endif

                                <!-- Payment Configuration -->
                                <li class="nav-item">
                                    <a class="nav-link {{request()->routeIs('admin.gateway.payment.*') || request()->routeIs('admin.withdraw.method.*') ? 'active' : ''}}"
                                        href="#paymentConfiguration" data-bs-toggle="collapse" role="button" 
                                        aria-expanded="false" aria-controls="paymentConfiguration">
                                        {{translate('Payment')}}
                                    </a>
                                    <div class="pt-1 collapse {{request()->routeIs('admin.gateway.payment.*') || request()->routeIs('admin.withdraw.method.*') ? 'show' : ''}} menu-dropdown"
                                        id="paymentConfiguration">
                                        <ul class="nav nav-sm flex-column gap-1">
                                            @if(permission_check('view_method'))
                                                <li class="nav-item">
                                                    <a href="{{route('admin.gateway.payment.method')}}"
                                                        class="nav-link {{request()->routeIs('admin.gateway.payment.*') ? 'active' : ''}}">
                                                        <span>{{translate('Payment Gateways')}}</span>
                                                    </a>
                                                </li>
                                                <li class="nav-item">
                                                    <a href="{{route('admin.withdraw.method.index')}}"
                                                        class="nav-link {{request()->routeIs('admin.withdraw.method.*') ? 'active' : ''}}">
                                                        <span>{{translate('Withdrawal Methods')}}</span>
                                                    </a>
                                                </li>
                                            @endif
                                        </ul>
                                    </div>
                                </li>

                                <!-- Communication Settings -->
                                <li class="nav-item">
                                    <a class="nav-link {{request()->routeIs('admin.mail.*') || request()->routeIs('admin.sms.*') || request()->routeIs('admin.notification.templates.*') ? 'active' : ''}}"
                                        href="#communicationSettings" data-bs-toggle="collapse" role="button" 
                                        aria-expanded="false" aria-controls="communicationSettings">
                                        {{translate('Communication')}}
                                    </a>
                                    <div class="pt-1 collapse {{request()->routeIs('admin.mail.*') || request()->routeIs('admin.sms.*') || request()->routeIs('admin.notification.templates.*') ? 'show' : ''}} menu-dropdown"
                                        id="communicationSettings">
                                        <ul class="nav nav-sm flex-column gap-1">
                                            <li class="nav-item">
                                                <a href="{{route('admin.notification.templates.index')}}"
                                                    class="nav-link {{request()->routeIs('admin.notification.templates.*') ? 'active' : ''}}">
                                                    {{translate('Notification Templates')}}   
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link {{request()->routeIs('admin.mail.*') ? 'active' : ''}}"
                                                    href="#emailConfiguration" data-bs-toggle="collapse" role="button"
                                                    aria-expanded="false" aria-controls="emailConfiguration">
                                                    {{translate('Email Configuration')}}
                                                </a>
                                                <div class="pt-1 collapse {{request()->routeIs('admin.mail.*') ? 'show' : ''}} menu-dropdown"
                                                    id="emailConfiguration">
                                                    <ul class="nav nav-sm flex-column gap-1">
                                                        <li class="nav-item">
                                                            <a href="{{route('admin.mail.configuration')}}"
                                                                class="{{request()->routeIs('admin.mail.configuration') || request()->routeIs('admin.mail.edit') ? 'active' : ''}} nav-link">
                                                                {{translate('Mail Gateway')}}
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="{{route('admin.mail.global.template')}}"
                                                                class="{{request()->routeIs('admin.mail.global.template') ? 'active' : ''}} nav-link">
                                                                {{translate('Global Template')}}
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link {{request()->routeIs('admin.sms.*') ? 'active' : ''}}"
                                                    href="#smsConfiguration" data-bs-toggle="collapse" role="button"
                                                    aria-expanded="false" aria-controls="smsConfiguration">
                                                    {{translate('SMS Configuration')}}
                                                </a>
                                                <div class="pt-1 collapse {{request()->routeIs('admin.sms.*') ? 'show' : ''}} menu-dropdown"
                                                    id="smsConfiguration">
                                                    <ul class="nav nav-sm flex-column gap-1">
                                                        <li class="nav-item">
                                                            <a href="{{route('admin.sms.gateway.index')}}"
                                                                class="{{request()->routeIs('admin.sms.gateway.index') || request()->routeIs('admin.sms.gateway.edit') ? 'active' : ''}} nav-link">
                                                                {{translate('SMS Gateway')}}
                                                            </a>
                                                        </li>
                                                        <li class="nav-item">
                                                            <a href="{{route('admin.sms.global.template')}}"
                                                                class="{{request()->routeIs('admin.sms.global.template') ? 'active' : ''}} nav-link">
                                                                {{translate('Global Template')}}
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </li>

                                <!-- Security Settings -->
                                <li class="nav-item">
                                    <a class="nav-link {{request()->routeIs('admin.security.*') ? 'active' : ''}}"
                                        href="#securitySettings" data-bs-toggle="collapse" role="button" 
                                        aria-expanded="false" aria-controls="securitySettings">
                                        {{translate('Security')}}
                                    </a>
                                    <div class="pt-1 collapse {{request()->routeIs('admin.security.*') ? 'show' : ''}} menu-dropdown"
                                        id="securitySettings">
                                        <ul class="nav nav-sm flex-column gap-1">
                                            <li class="nav-item">
                                                <a href="{{route('admin.security.ip.list')}}"
                                                    class="nav-link {{request()->routeIs('admin.security.ip.list') ? 'active' : ''}}">
                                                    {{translate('Visitor Management')}}
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="{{route('admin.security.dos')}}"
                                                    class="nav-link {{request()->routeIs('admin.security.dos') ? 'active' : ''}}">
                                                    {{translate('DoS Protection')}}
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

                <!-- Miscellaneous -->
                <li class="nav-item">
                    <a class="nav-link menu-link {{request()->routeIs('admin.shipping.*') || request()->routeIs('admin.general.ai.configuration') ? 'active' : ''}}"
                        href="#miscellaneousManagement" data-bs-toggle="collapse" role="button" aria-expanded="false"
                        aria-controls="miscellaneousManagement">
                        <i class='bx bx-extension'></i> <span>{{translate('Miscellaneous')}}</span>
                    </a>
                    <div class="pt-1 collapse {{request()->routeIs('admin.shipping.*') || request()->routeIs('admin.general.ai.configuration') ? 'show' : ''}} menu-dropdown"
                        id="miscellaneousManagement">
                        <ul class="nav nav-sm flex-column gap-1">
                            <!-- Shipping Configuration -->
                            @if(permission_check('view_settings') || permission_check('manage_countries') || permission_check('manage_states') || permission_check('manage_cities') || permission_check('manage_zones'))
                                <li class="nav-item">
                                    <a class="nav-link {{request()->routeIs('admin.shipping.*') ? 'active' : ''}}"
                                        href="#shippingConfiguration" data-bs-toggle="collapse" role="button" 
                                        aria-expanded="false" aria-controls="shippingConfiguration">
                                        {{translate('Shipping Configuration')}}
                                    </a>
                                    <div class="pt-1 collapse {{request()->routeIs('admin.shipping.*') ? 'show' : ''}} menu-dropdown"
                                        id="shippingConfiguration">
                                        <ul class="nav nav-sm flex-column gap-1">
                                            <li class="nav-item">
                                                <a href="{{route('admin.shipping.configuration.index')}}"
                                                    class="nav-link {{request()->routeIs('admin.shipping.configuration.*') ? 'active' : ''}}">
                                                    {{translate('General Configuration')}}
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link {{request()->routeIs('admin.shipping.country.*') || request()->routeIs('admin.shipping.state.*') || request()->routeIs('admin.shipping.city.*') || request()->routeIs('admin.shipping.zone.*') ? 'active' : ''}}"
                                                    href="#locationManagement" data-bs-toggle="collapse" role="button"
                                                    aria-expanded="false" aria-controls="locationManagement">
                                                    {{translate('Location Management')}}
                                                </a>
                                                <div class="pt-1 collapse {{request()->routeIs('admin.shipping.country.*') || request()->routeIs('admin.shipping.state.*') || request()->routeIs('admin.shipping.city.*') || request()->routeIs('admin.shipping.zone.*') ? 'show' : ''}} menu-dropdown"
                                                    id="locationManagement">
                                                    <ul class="nav nav-sm flex-column gap-1">
                                                        @if(permission_check('manage_countries'))
                                                            <li class="nav-item">
                                                                <a href="{{route('admin.shipping.country.index')}}"
                                                                    class="nav-link {{request()->routeIs('admin.shipping.country.*') ? 'active' : ''}}">
                                                                    {{translate('Countries')}}
                                                                </a>
                                                            </li>
                                                        @endif
                                                        @if(permission_check('manage_states'))
                                                            <li class="nav-item">
                                                                <a href="{{route('admin.shipping.state.index')}}"
                                                                    class="nav-link {{request()->routeIs('admin.shipping.state.*') ? 'active' : ''}}">
                                                                    {{translate('States/Provinces')}}
                                                                </a>
                                                            </li>
                                                        @endif
                                                        @if(permission_check('manage_cities'))
                                                            <li class="nav-item">
                                                                <a href="{{route('admin.shipping.city.index')}}"
                                                                    class="nav-link {{request()->routeIs('admin.shipping.city.*') ? 'active' : ''}}">
                                                                    {{translate('Cities')}}
                                                                </a>
                                                            </li>
                                                        @endif
                                                        @if(permission_check('manage_zones'))
                                                            <li class="nav-item">
                                                                <a href="{{route('admin.shipping.zone.index')}}"
                                                                    class="nav-link {{request()->routeIs('admin.shipping.zone.*') ? 'active' : ''}}">
                                                                    {{translate('Shipping Zones')}}
                                                                </a>
                                                            </li>
                                                        @endif
                                                    </ul>
                                                </div>
                                            </li>
                                            <li class="nav-item">
                                                <a href="{{route('admin.shipping.delivery.index')}}"
                                                    class="nav-link {{request()->routeIs('admin.shipping.delivery.*') ? 'active' : ''}}">
                                                    {{translate('Delivery Methods')}}
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                            @endif

                            <!-- AI Configuration -->
                            <li class="nav-item">
                                <a class="nav-link {{request()->routeIs('admin.general.ai.configuration') ? 'active' : ''}}"
                                    href="{{route('admin.general.ai.configuration')}}">
                                    {{translate('AI Configuration')}}
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                

                <!-- System Maintenance -->
                <li class="menu-title"><span>{{translate('System Maintenance')}}</span></li>

                <li class="nav-item">
                    <a class="nav-link menu-link {{request()->routeIs('admin.system.update.init') ? 'active' : ''}}"
                        href="{{route('admin.system.update.init')}}">
                        <i class="ri-refresh-line"></i> <span>{{translate('System Updates')}}</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link menu-link {{request()->routeIs('admin.addon.manager') ? 'active' : ''}}"
                        href="{{route('admin.addon.manager')}}">
                        <i class="ri-sound-module-fill"></i> <span>{{translate('Addon Manager')}}</span>
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link menu-link {{request()->routeIs('admin.system.info') ? 'active' : ''}}"
                        href="{{route('admin.system.info')}}">
                        <i class='bx bx-info-circle'></i> <span>{{translate('System Information')}}</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="sidebar-background"></div>
</div>

<div class="vertical-overlay"></div>