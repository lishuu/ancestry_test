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
          {width: "5%" },
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

var getMeterChangingData = function() {
  var mctable;
  if ($.fn.dataTable.isDataTable('#meterchanging_table')) {
    mctable = $('#meterchanging_table').DataTable();
    return mctable.ajax.url($('#meterchanging_table').data('source')).load();
  } else {
      return $('#meterchanging_table').dataTable({
        pagingType: "full_numbers",
        processing: true,
        serverSide: true,
        ajaxSource: $('#meterchanging_table').data('source'),
        oLanguage: {
          "sUrl": "../chinese.json",
        },
        columns: [
          {width: "5%" },
          {width: "15%", orderable: false},
          {width: "10%", orderable: false},
          {widht: "25%", orderable: false},
          {widht: "20%", orderable: false},
          {widht: "3%", orderable: false},
          {widht: "3%", orderable: false},
          {widht: "3%", orderable: false},
          {width: "20%", orderable: false},
          {width: "1%", searchable: false, orderable: false},
          {width: "1%", searchable: false, orderable: false}
        ]
      });
  }
}

var getProblemCustomerData = function() {
  var pctable;
  if ($.fn.dataTable.isDataTable('#problemcustomer_table')) {
    pctable = $('#problemcustomer_table').DataTable();
    return pctable.ajax.url($('#problemcustomer_table').data('source')).load();
  } else {
    return $('#problemcustomer_table').dataTable({
      pagingType: "full_numbers",
      processing: true,
      serverSide: true,
      ajaxSource: $('#problemcustomer_table').data('source'),
      oLanguage: {
        "sUrl": "../chinese.json",
      },      
      columns: [
        {width: "5%" },
        {width: "10%", orderable: false},
        {width: "8%", orderable: false},
        {widht: "8%", orderable: false},
        {widht: "8%", orderable: false},
        {widht: "8%", orderable: false},
        {widht: "8%", orderable: false},
        {widht: "8%", orderable: false},
        {width: "9%", orderable: false},
        {widht: "10%", orderable: false},
        {width: "10%", orderable: false},        
        {width: "1%", searchable: false, orderable: false},
        {width: "1%", searchable: false, orderable: false}      
      ]
    });
  }
}

$(document).ready( function() {

  getMaintenanceData();
  getMeterChangingData();
  getProblemCustomerData();

});
