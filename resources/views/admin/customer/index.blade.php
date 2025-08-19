@extends('admin.layouts.app')


@push('style-push')

   <style>
       .top-customer{
         max-height: 300px !important;
         overflow-y:auto !important;
       }
   </style>


@endpush



@push('style-include')
<link href="{{asset('assets/global/css/datepicker/daterangepicker.css')}}" rel="stylesheet" type="text/css" />
@endpush

@section('main_content')
<div class="page-content">
    <div class="container-fluid">

        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
            <h4 class="mb-sm-0">
                {{translate($title)}}
            </h4>
            <div class="page-title-right">
                <ol class="breadcrumb m-0">
                    <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">
                        {{translate('Home')}}
                    </a></li>
                    <li class="breadcrumb-item active">
                        {{translate("Customers")}}
                    </li>
                </ol>
            </div>

        </div>

        <div  class="text-end">
            <a href="{{route('admin.customer.create')}}" class="btn btn-danger btn-sm mb-3  waves ripple-light overview-controller">

                {{translate('Hide overview')}}
            </a>
        </div>

        <div class="row overview-section">
            <div class="col-xxl-4">
                <div class="card card-height-100">
                    <div class="card-header border-0 align-items-center d-flex">
                        <h4 class="card-title mb-0 flex-grow-1">
                             {{translate('Customer Overview')}}
                        </h4>

                    </div>
                    <div class="card-body">

                        <div id="customerStats"  data-colors='[  "--ig-secondary", "--ig-danger"]'>



                        </div>


                          <h5  class="mt-2">
                             {{
                                 translate('Top 10 customers')
                             }}
                          </h5>
                        <ul class="list-group list-group-flush border-dashed mb-0 mt-3 pt-2  top-customer ">

                            @forelse ($overview->top_customers as $user)

                                <li class="list-group-item px-0">
                                    <div class="d-flex">
                                        <div class="flex-shrink-0 avatar-xs">
                                            <span class="avatar-title bg-light p-1 rounded-circle material-shadow">

                                                <img src="{{show_image(file_path()['profile']['user']['path'].'/'.$user->image,file_path()['profile']['user']['size'])}}" alt="{{$user->image}}" class="img-fluid">
                                            </span>
                                        </div>
                                        <div class="flex-grow-1 ms-2">
                                            <h6 class="mb-1">
                                                {{ limit_text($user->username ?? $user->email ?? 'Guest')}}
                                            </h6>
                                            <p class="fs-12 mb-0 text-muted"><i class="mdi mdi-circle fs-10 align-middle text-primary me-1"></i>
                                                {{translate('Orders')}}
                                            </p>
                                        </div>
                                        <div class="flex-shrink-0 text-end me-2">
                                            <h6 class="mb-1" data-bs-toggle="tooltip" data-bs-placement="top" title="{{translate('Wallet Balance')}}">
                                                {{show_amount(($user->balance))}}
                                            </h6>
                                            <p data-bs-toggle="tooltip" data-bs-placement="top" title="{{translate('No of order')}}" class="text-success fs-12 mb-0">
                                                {{$user->order_count}}
                                            </p>
                                        </div>
                                    </div>
                                </li>

                            @empty

                              <li class="text-center">
                                  {{translate('No data found')}}
                              </li>

                            @endforelse


                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-xxl-8 order-xxl-0 order-first">
                <div class="d-flex flex-column h-100">


                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card">
                                <div class="card-header border-0 align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">
                                        {{ translate('Customer Growth') }}
                                    </h4>
                                    <div>
                                        <form action="{{route(Route::currentRouteName())}}" method="get">
                                              @include('admin.partials.overview_filter')
                                        </form>

                                    </div>
                                </div>
                                <div class="card-body p-0">
                                    <div class="bg-light-subtle border-top-dashed border border-start-0 border-end-0 border-bottom-dashed py-3 px-4">
                                        <div class="row">


                                            <div class="col-lg-4 col-md-6">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center">
                                                            <div class="avatar-sm flex-shrink-0">
                                                                <span class="avatar-title bg-light text-primary rounded-circle fs-3 material-shadow">
                                                                    <i class="ri-money-dollar-circle-fill align-middle"></i>
                                                                </span>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <p class="text-uppercase fw-semibold fs-12 text-muted mb-1">{{ translate('Total Orders') }}</p>
                                                                <h4 class=" mb-0"><span class="counter-value" data-target="{{$orderStats->total_orders}}"></span></h4>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-8 col-md-6">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center">
                                                            <div class="avatar-sm flex-shrink-0">
                                                                <span class="avatar-title bg-light text-primary rounded-circle fs-3">
                                                                    <i class="ri-arrow-up-circle-fill align-middle"></i>
                                                                </span>
                                                            </div>
                                                            <div class="flex-grow-1 ms-3">
                                                                <p class="text-uppercase fw-semibold fs-12 text-muted mb-1">{{ translate('Total Purchase Amount') }}</p>
                                                                <h4 class=" mb-0">$<span class="counter-value" data-target="{{$orderStats->total_amount}}"></span></h4>
                                                            </div>

                                                        </div>
                                                    </div><!-- end card body -->
                                                </div><!-- end card -->
                                            </div><!-- end col -->
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body p-0 pb-3">

                                      <div id="customerChart">

                                      </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header border-0">
                <div class="row g-4 align-items-center">
                    <div class="col-lg-4">
                        <h5 class="card-title mb-0 flex-grow-1">
                            {{translate('Customer List')}}
                        </h5>
                    </div>
                    <div class="col-lg-8 d-flex align-items-end justify-content-end">
                        <div class="d-flex flex-wrap  align-items-end justify-content-end  gap-2">
                            <a href="javascript:void(0)" class="btn btn-danger btn-sm  waves ripple-light configuration"> <i
                                class="ri-settings-4-line me-1 align-bottom"></i>
                            {{translate('Configuration')}}
                            </a>
                            <a href="{{route('admin.customer.export.csv')}}" class="btn btn-info btn-sm  waves ripple-light"> <i
                                class="ri-download-line me-1 align-bottom"></i>

                            {{translate('Export CSV')}}
                            </a>
                            <a href="{{route('admin.customer.create')}}" class="btn btn-success btn-sm  waves ripple-light"> <i
                                class="ri-add-line me-1 align-bottom"></i>
                            {{translate('Create')}}
                            </a>
                        </div>
                    </div>
                </div>
            </div>


            <div class="card-body border border-dashed border-end-0 border-start-0">

                @php
                   $filters =  [
                       (object) [

                            'class'       => 'col-xl-4 col-sm-6',
                            'name'        => 'search',
                            'type'        => 'text',
                            'placeholder' =>  translate('Search by name , email ,username or phone'),
                            'icon'        => 'ri-search-line search-icon'
                        ],

                    ];
                @endphp

                @include('admin.partials.filter_input')



            </div>

            <div class="card-body pt-0">
                <ul class="nav nav-tabs nav-tabs-custom nav-primary mb-3" role="tablist">

                    <li class="nav-item">
                        <a class="nav-link {{request()->routeIs('admin.customer.index') && ! request()->input('status') ? 'active' :'' }} All py-3"  id="All"
                            href="{{route('admin.customer.index')}}" >
                            <i class="ri-group-fill me-1 align-bottom"></i>
                            {{translate('All
                            Customer')}}
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link {{request()->input('status') == App\Models\User::ACTIVE ? 'active' :''}}   py-3"  id="Placed"
                            href="{{route('admin.customer.index',['status'=> App\Models\User::ACTIVE])}}" >

                            <i class="ri-user-follow-line me-1 align-bottom"></i>
                            {{translate('Active Customer')}}

                        </a>
                    </li>
                    <li class="nav-item">
                        <a class='nav-link {{request()->input('status') == App\Models\User::BANNED ? 'active' :''}} Confirmed py-3'  id="Confirmed"
                            href="{{route('admin.customer.index',['status'=> App\Models\User::BANNED])}}" >

                            <i class="ri-user-unfollow-line me-1 align-bottom"></i>
                            {{translate("Banned Customer")}}

                        </a>
                    </li>
                </ul>

                <div class="table-responsive table-card">
                    <table class="table table-hover table-nowrap align-middle mb-0" >
                        <thead class="text-muted table-light">
                            <tr class="text-uppercase">
                                <th>{{translate('Customer - Username')}}</th>
                                <th>{{translate('Email - Phone')}}</th>
                                <th>{{translate('Balance')}}
                                </th>
                                <th>{{translate('Point')}}
                                </th>

                                <th>{{translate('Number of Orders')}}</th>
                                <th>{{translate('Status')}}</th>
                                <th>{{translate('Joined At')}}</th>
                                <th>{{translate('Action')}}</th>
                            </tr>
                        </thead>

                        <tbody class="list form-check-all">
                            @forelse($customers as $customer)
                                <tr>
                                    <td data-label='{{translate("Customer - Username")}}'>
                                        <span class="fw-bold">
                                            {{($customer->name ?? '-')}}
                                        </span>
                                            <br>
                                        {{($customer->username ?? '-')}}
                                    </td>

                                    <td data-label="{{translate('Email - Phone')}}">
                                        {{($customer->email)}}<br>
                                        {{($customer->phone ?? '-')}}
                                    </td>

                                    <td data-label="{{translate('Balance')}}">
                                        <div>
                                            <a href="javascript:void(0)" data-id="{{$customer->id}}" class="update-balance"  data-bs-toggle="tooltip" data-bs-placement="top" title="{{translate('Update Balance')}}"><span><i class="fs-4 lar la-edit"></i></span></a>
                                            <span>{{num_format(($customer->balance))}} {{default_currency()->name}}</span>

                                        </div>
                                   </td>


                                   <td data-label="{{translate('Rewards')}}">

                                        <a   title="{{translate('View rewards')}}" data-bs-toggle="tooltip" data-bs-placement="top" href="{{route('admin.customer.rewards',['user_id' => $customer->id])}}">
                                            {{
                                                $customer->rewards->sum("point")
                                               }}
                                        </a>
                                   </td>

                                    <td class="text-start" data-label="{{translate('Number of Orders')}}">
                                        {{$customer->order->count()}}
                                    </td>

                                    <td data-label="{{translate('Status')}}">

                                        @if($customer->status == 1)
                                           <span class="badge badge-soft-success">{{translate('Active')}}</span>
                                        @else
                                            <span class="badge badge-soft-danger">{{translate('Banned')}}</span>
                                        @endif
                                    </td>

                                    <td data-label="{{translate('Joined At')}}">
                                        {{diff_for_humans($customer->created_at)}}<br>
                                        {{get_date_time($customer->created_at)}}
                                    </td>

                                    <td data-label="{{translate('Action')}}">
                                        <div class="hstack justify-content-center gap-3">

                                            <a target="_blank" class="link-success fs-18 " data-bs-toggle="tooltip" data-bs-placement="top" title="Login" href="{{route('admin.customer.login', $customer->id)}}"><i class="ri-login-box-line"></i></a>

                                            <a class="link-info fs-18 " data-bs-toggle="tooltip" data-bs-placement="top" title="Details"  href="{{route('admin.customer.details', $customer->id)}}"><i class="ri-list-check"></i></a>


                                            <a href="javascript:void(0);"  title="{{translate('Delete')}}" data-bs-toggle="tooltip" data-bs-placement="top" data-href="{{route('admin.customer.delete',$customer->id)}}" class="delete-item fs-18 link-danger">
                                                <i class="ri-delete-bin-line"></i></a>
                                        </div>
                                    </td>
                                </tr>
                                @empty
                                    <tr>
                                        <td class="border-bottom-0" colspan="100">
                                            @include('admin.partials.not_found')
                                        </td>
                                    </tr>
                                @endforelse
                        </tbody>
                    </table>
                </div>

                <div class="pagination-wrapper d-flex justify-content-end mt-4 ">
                    {{$customers ->appends(request()->all())->links()}}
                </div>
            </div>
        </div>

    </div>
</div>
@include('admin.modal.delete_modal')

<div class="modal fade" id="balanceupdate" tabindex="-1" aria-labelledby="balanceupdate" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header bg-light p-3">
				<h5 class="modal-title" >{{translate('Update Blance')}}
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close" id="close-modal"></button>
			</div>
			<form action="{{route('admin.customer.balance.update')}}" method="POST">
				@csrf
				<input type="hidden" name="user_id" id="userID" value="">
				<div class="modal-body">

					<div class="mb-3">
						<label for="balance_type" class="form-label">{{translate('Balance Type')}} <span class="text-danger">*</span></label>
						<select class="form-select" name="balance_type" id="balance_type" required>
							<option value="1">{{translate('Add Balance')}}</option>
							<option value="2">{{translate('Subtract Balance')}}</option>
						</select>
					</div>

					<div class="mb-3">
						<label for="amount" class="form-label">{{translate('Amount')}} <span class="text-danger">*</span></label>
						<div class="input-group">
							<input type="text" class="form-control" id="amount" name="amount" placeholder="{{translate('Enter amount')}}" >
							<span class="input-group-text" >{{default_currency()->name}}</span>
						</div>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{{translate('Cancel')}}</button>
					<button type="submit" class="btn btn-success waves ripple-light">{{translate('Update')}}</button>
				</div>
			</form>
		</div>
	</div>
</div>



<div class="modal fade" id="configuration" tabindex="-1" aria-labelledby="configuration" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header bg-light p-3">
				<h5 class="modal-title" >{{translate('Configuration')}}
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close" id="close-modal"></button>
			</div>

            @include('admin.setting.partials.customer_setting')

		</div>
	</div>
</div>





@endsection

@push('script-include')
  <script src="{{asset('assets/global/js/apexcharts.js')}}"></script>
  <script src="{{asset('assets/global/js/datepicker/moment.min.js')}}"></script>
  <script src="{{asset('assets/global/js/datepicker/daterangepicker.min.js')}}"></script>
  @include('admin.partials.js.date_picker_js')
@endpush


@push('script-push')

<script>
	(function($){
       	"use strict";

		$(document).on('click','.update-balance', function(e){

			e.preventDefault();


			var modal = $('#balanceupdate');

			modal.find('#userID').val($(this).attr('data-id'));

			modal.modal('show');
		})

        $(document).on('click','.overview-controller', function(e){
			e.preventDefault();

            $(this).toggleClass('btn-success btn-danger');

            if ($(this).hasClass('btn-danger')) {
                $(this).text('Hide overview');
            } else {
                $(this).text('Show overview');
            }
			$('.overview-section').slideToggle()
		})

		$(document).on('click','.configuration', function(e){
			e.preventDefault();
			var modal = $('#configuration')
			modal.modal('show');
		})

        $(document).on('submit','.settingsForm',function(e){

            e.preventDefault();
            var data =   new FormData(this)
            var route = $(this).attr('data-route')
            var submitButton = $(e.originalEvent.submitter);
            $.ajax({
            method:'post',
            url: route,
            dataType: 'json',
            cache: false,
            processData: false,
            contentType: false,
            data: data,
            beforeSend: function() {
                    submitButton.find(".note-btn-spinner").remove();

                    submitButton.append(`<div class="ms-1 spinner-border spinner-border-sm text-white note-btn-spinner " role="status">
                            <span class="visually-hidden"></span>
                        </div>`);
                },
            success: function(response){
                var className = 'success';
                if(!response.status){
                    className = 'danger';
                }
                toaster( response.message,className)

                if(response.status && response.preview_html){
                    $('.wp-preview-section').html(response.preview_html)
                }

            },
            error: function (error){
                if(error && error.responseJSON){
                    if(error.responseJSON.errors){
                        for (let i in error.responseJSON.errors) {
                            toaster(error.responseJSON.errors[i][0],'danger')
                        }
                    }
                    else{
                        if((error.responseJSON.message)){
                            toaster(error.responseJSON.message,'danger')
                        }
                        else{
                            toaster( error.responseJSON.error,'danger')
                        }
                    }
                }
                else{
                    toaster(error.message,'danger')
                }
            },
            complete: function() {
                    submitButton.find(".note-btn-spinner").remove();
                },
            })

        });



    //customer stats graph
    var options = {
            chart: {
                height: 250,
                type: "donut"
            },
            colors: ['var(--ig-success)' , 'var(--ig-danger)'],
            dataLabels: {
                enabled: false
            },


            plotOptions: {
                pie: {
                donut: {
                    labels: {
                    show: true,
                    name: {
                        show: true,
                        fontSize: "22px",
                        fontFamily: "Rubik",
                        color: "#dfsda",
                        offsetY: -10
                    },
                    value: {
                        show: true,
                        fontSize: "16px",
                        fontFamily: "Helvetica, Arial, sans-serif",
                        color: undefined,
                        offsetY: 16,
                        formatter: function (val) {
                        return val;
                        }
                    },
                    total: {
                        show: true,
                        label: "Total",
                        color: "#373d3f",
                        formatter: function (w) {
                        return w.globals.seriesTotals.reduce((a, b) => {
                            return a + b;
                        }, 0);
                        }
                    }
                    }
                }
                }
            },
            series: @json(array_values($overview->customer_stats)),
            labels: @json(array_keys($overview->customer_stats)),

            legend: {
                show: false
            }
    };

    var chart = new ApexCharts(document.querySelector("#customerStats"), options);

    chart.render();

    function getChartColorsArray(e) {
        if (null !== document.getElementById(e)) {
            e = document.getElementById(e).getAttribute("data-colors");
            if (e)
                return (e = JSON.parse(e)).map(function (e) {
                    var t = e.replace(" ", "");
                    return -1 === t.indexOf(",")
                        ? getComputedStyle(document.documentElement).getPropertyValue(t) || t
                        : 2 == (e = e.split(",")).length
                            ? "rgba(" +
                            getComputedStyle(document.documentElement).getPropertyValue(e[0]) +
                            "," +
                            e[1] +
                            ")"
                            : t;
                });
        }
    }





    var options = {
        chart: {
        height: 420,
        type: "line",
        },
        dataLabels: {
        enabled: false,
        },



        series: [
            {
                name: "{{ translate('Total Registered Customer') }}",
                data:  @json(array_values($overview->graph_data)),
            },

        ],
        xaxis: {
            categories:  @json(array_keys($overview->graph_data)),
        },
        yaxis: {
            labels: {
                formatter: function (value) {
                    // Return the value as an integer (no decimals)
                    return Math.round(value);
                }
            }
        },
        tooltip: {
            shared: false,
            intersect: true,

        },

        markers: {
        size: 6,
        },
        stroke: {
        width: [4, 4],
        },
        legend: {
        horizontalAlign: "center",
        },
    };

    var chart = new ApexCharts(document.querySelector("#customerChart"), options);
    chart.render();


	})(jQuery);
</script>
@endpush

