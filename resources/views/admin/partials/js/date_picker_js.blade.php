<script>

(function () {
    ("use strict");

    var start = moment().startOf('year');  
    var end = moment().endOf('year');

    @if(request()->input('date'))    
        start = null;
        end  = null
    @endif

    $('#datePicker-new').daterangepicker({
        autoUpdateInput: false,
        
                 
        ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
            'This Year': [moment().startOf('year'), moment().endOf('year')]  // Add "This Year" option
        }
    });


    
    $('#datePicker-new').on('apply.daterangepicker', function(ev, picker) {

 
        $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
    });

    $('#datePicker-new').on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });


    @if(!request()->input('date'))
       $('#datePicker-new').val(start.format('MM/DD/YYYY') + ' - ' + end.format('MM/DD/YYYY'));
    @endif


})();

</script>