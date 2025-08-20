<div class="modal fade" id="shippingModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="shippingModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-light p-3">
                <h5 class="modal-title">{{translate('Update Shipping')}}
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                    id="close-modal"></button>
            </div>
            <form id="shipping_form" method="post">
                @csrf
                <div class="modal-body">
                    <div class="row g-3">
                        <div>
                            <label for="name" class="form-label">
                                {{translate('Shipping Charge')}} <span class="text-danger">*</span>
                            </label>
                            <input class="form-control" type="text" name="shipping_charge" id="shipping_charge">
                        </div>
                    </div>
                    <div class="modal-footer px-0 pb-0 pt-3">
                        <div class="hstack gap-2 justify-content-end">
                            <button type="button" class="btn btn-danger waves ripple-light" data-bs-dismiss="modal">
                                {{translate('Close
                                    ')}}
                            </button>
                            <button type="submit" class="btn btn-success waves ripple-light" id="apply-btn">
                                {{translate('Update')}}
                            </button>
                        </div>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>