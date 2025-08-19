<div class="modal fade" id="addCustomerModal" tabindex="-1" aria-labelledby="addCustomerModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        @php
            $route = Route::is('admin.*')
                ? route('admin.pos.system.customer.store')
                : route('seller.pos.system.customer.store');
        @endphp
        <form data-route="{{ $route }}" id="addCustomerForm">
            @csrf
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addCustomerModalLabel">{{ translate('Add Customer') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="{{ translate('Close') }}"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="customer-name" class="form-label">{{ translate('Name') }}</label>
                        <input type="text" class="form-control" id="customer-name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="customer-phone" class="form-label">{{ translate('Phone') }}</label>
                        <input type="text" class="form-control" id="customer-phone" name="phone" required>
                    </div>
                    <div class="mb-3">
                        <label for="customer-email" class="form-label">{{ translate('Email') }}</label>
                        <input type="email" class="form-control" id="customer-email" name="email">
                    </div>
                    <div class="mb-3">
                        <label for="customer-address" class="form-label">{{ translate('Address') }}</label>
                        <textarea class="form-control" id="customer-address" name="address" rows="2"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">{{ translate('Save') }}</button>
                    <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">{{ translate('Cancel') }}</button>
                </div>
            </div>
        </form>
    </div>
</div>