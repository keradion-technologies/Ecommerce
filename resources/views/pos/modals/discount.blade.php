<div class="modal fade" id="discountModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="shippingModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-light p-3">
                <h5 class="modal-title">{{translate('Discount')}}
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                    id="close-modal"></button>
            </div>
            <form id="discont_form" method="post">
                @csrf
                <div class="modal-body">

                    <div class="row g-3">
                        <label class="form-label small text-muted mb-1">{{ translate('Discount Type') }}</label>
                        <div class="btn-group w-100" role="group" aria-label="{{ translate('Discount Type') }}">
                            <input type="radio" class="btn-check" name="discount_type" id="flatAmount" value="flat"
                                autocomplete="off" checked>
                            <label class="btn btn-outline-primary btn-sm"
                                for="flatAmount">{{ translate('Flat') }}</label>

                            <input type="radio" class="btn-check" name="discount_type" id="percentageAmount"
                                value="percentage" autocomplete="off">
                            <label class="btn btn-outline-primary btn-sm"
                                for="percentageAmount">{{ translate('Percentage') }}</label>
                        </div>
                    </div>
                    <div class="row g-3">
                        <div>
                            <label for="name" class="form-label">
                                {{translate('Amount')}} <span class="text-danger">*</span>
                            </label>
                            <input class="form-control" type="text" name="discount_amount" id="discount_amount">
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