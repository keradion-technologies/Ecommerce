
<div class="overview-filter d-flex gap-2 align-items-center ">

    <div class="search-box">

        <input type="text" class="form-control search" id="datePicker-new" name="date" value="{{request()->input('date')}}"  placeholder="{{translate('Filter by date')}}">

        <i class="ri-calendar-2-line search-icon"></i>

    </div>

    <button type="submit" class="btn btn-primary w-30 waves ripple-light" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{{translate('Filter')}}"> <i class="ri-equalizer-fill me-1 align-bottom"></i>

   </button>

   <a href="{{route(Route::currentRouteName(),Route::current()->parameters())}}" class="btn btn-danger w-30 waves ripple-light" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="{{translate('Reset')}}"> <i class="ri-refresh-line me-1 align-bottom"></i>

    </a>
</div>
