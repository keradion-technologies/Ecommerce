

@php

    $buttons = @$filterButtons ?? [

                                        (object)[

                                            'class'       => 'col-xl-2 col-sm-3 col-6',
                                            'btn_class'   => 'btn btn-primary w-100 waves ripple-light',
                                            'type'        => 'submit',
                                            'btn_text'    =>  translate('Search'),
                                            'icon'        => 'ri-equalizer-fill me-1 align-bottom'
                                        ],
                                        (object)[

                                            'class'       => 'col-xl-2 col-sm-3 col-6',
                                            'href'        => route(Route::currentRouteName(),Route::current()->parameters()),
                                            'btn_class'   => 'btn btn-danger w-100 waves ripple-light',
                                            'btn_text'    =>  translate('Reset'),
                                            'icon'        => 'ri-refresh-line me-1 align-bottom'
                                            
                                        ]
                                                                            
                                    ];
@endphp

<form action="{{ route(Route::currentRouteName()) }}" method="get">
    @foreach (request()->input() as $name => $value )
        <input type="hidden" name="{{$name}}" value="{{$value}}">
    @endforeach
    <div class="row g-3">
         
        @foreach ($filters as $filter )

            <div class="{{ $filter->class }}">
                <div class="search-box">
                    <input type="{{ $filter->type }}" name="{{ $filter->name }}" class="form-control search"
                        value="{{request()->input($filter->name)}}"
                        placeholder="{{ $filter->placeholder }}">
                        @if(@$filter->icon)
                           <i class=" {{@$filter->icon}} "></i>
                        @endif
                </div>
            </div>

        @endforeach
    

        @foreach ($buttons as $button )

                <div class="{{$button->class}}">
                    <div>
                         @if(@$button->href) 

                            <a href="{{$button->href}}" class="{{$button->btn_class}}"> 
                                <i class="{{ $button->icon }}"></i>
                                  {{ $button->btn_text }}
                            </a>

                         @else

                            <button type="{{$button->type }}" class="{{$button->btn_class}}"> <i
                                class="{{ $button->icon }}"></i>
                                 {{ $button->btn_text }}
                            </button>

                         @endif
                        
                    </div>
                </div>
            
        @endforeach


    </div>
</form>