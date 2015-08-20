var getMaintenanceData = function() {
    var table;
    if ($.fn.dataTable.isDataTable('#maintenance_table')) {
      table = $('#maintenance_table').DataTable();
      return table.ajax.url($('#maintenance_table').data('source')).load();
    } else {
      return $('#maintenance_table').dataTable({
        pagingType: "full_numbers",
        processing: true,
        serverSide: true,
        ajaxSource: $('#maintenance_table').data('source'),
        oLanguage: {
          "sUrl": "../chinese.json",
        },
        columns: [
          {width: "5%",  orderable: false},
          {width: "15%", orderable: false},
          {width: "10%", orderable: false},
          {widht: "25%", orderable: false},
          {widht: "20%", orderable: false},
          {widht: "3%", orderable: false},
          {width: "20%", orderable: false},
          {width: "1%", searchable: false, orderable: false},
          {width: "1%", searchable: false, orderable: false}
        ]
      });
    }
};

$(document).ready( function() {

  getMaintenanceData();

  $('#date_time_picker').datetimepicker({
      autoclose: true,
      todayBtn: true,
      pickerPosition: "bottom-left",
      format: 'yyyy-mm-dd'
  });

});
