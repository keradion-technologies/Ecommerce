<div class="pt-3">

    <button class="badge bg-success mb-3" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTax" aria-expanded="false" aria-controls="collapseTax">
        {{translate('View taxes')}}
    </button>
    <div class="collapse" id="collapseTax">

            <ul class="list-group list-group-flush">

                @forelse ($product->taxes as $tax )
                
                    <li class="list-group-item d-flex align-items-center justify-content-between bg-tax-light">
                        
                        {{$tax->name}}
                        : <span>
                            
                            @if($tax->pivot->type == 0)
                               {{$tax->pivot->amount}}%
                            @else
                              {{short_amount($tax->pivot->amount)}}
                            @endif
                            
                            
                        </span>
                    </li>

                
                @empty

                 <li>
                    {{translate("Nothing tax configuration added for this product")}}
                 </li>
                    
                @endforelse
            

            </ul>

    </div>
    
</div>