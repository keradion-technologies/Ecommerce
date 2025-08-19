<div class="hold-card">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="card-title">{{ translate('Held Orders') }}</h5>
        <button class="btn btn-sm btn-secondary" data-bs-dismiss="modal">
            {{ translate('Close') }}
        </button>
    </div>

    <div class="card-body">
        {{-- Summary Header --}}
        
        <div class="mb-3">
            <div class="d-flex justify-content-between">
                <div><strong>{{ translate('Total Held Orders:') }}</strong> {{ $heldOrders->count() }}</div>
                <div><strong>{{ translate('Total Amount:') }}</strong> 
                    {{ number_format($heldOrders->sum(fn($o) => $o->summary_meta->total ?? 0), 2) }}
                </div>
            </div>
        </div>

        

        {{-- Order List --}}
        @forelse($heldOrders as $order)
            @php $summary = $order->summary_meta; @endphp

            <div class="border rounded p-3 mb-3">
                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <div><strong>{{ $summary->order_id ?? $order->id }}</strong></div>
                        <div>{{ $summary->date ?? '' }}</div>
                        <div>{{ translate('Customer:') }} {{ $summary->customer_name?? '' }}</div>
                        <div>{{ $summary->item_count ?? '' }} - {{ $summary->item_summary ?? '' }}</div>
                    </div>
                    <div class="text-end">
                        <div><strong>{{ translate('Total:') }}</strong> 
                            {{ number_format($summary->total ?? 0, 2) }}
                        </div>
                        <a href="{{ route('admin.pos.system.restore.cart', $order->uid) }}" class="btn btn-sm btn-success mt-2">
                            {{ translate('Resume') }}
                        </a>
                    </div>
                </div>
            </div>
        @empty
            <div class="text-muted text-center">
                {{ translate('No held orders available.') }}
            </div>
        @endforelse
    </div>
</div>
