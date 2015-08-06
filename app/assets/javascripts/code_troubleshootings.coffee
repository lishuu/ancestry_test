# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

getCodeTroubleshootings = ->

  if $.fn.dataTable.isDataTable('#code_troubleshooting_table')
    table = $('#code_troubleshooting_table').DataTable()
    table.ajax.url($('#code_troubleshooting_table').data('source')).load()
  else
    $('#code_troubleshooting_table').dataTable
      pagingType: "full_numbers"
      processing: true
      serverSide: true 
      ajaxSource: $('#code_troubleshooting_table').data('source')
      oLanguage: "sUrl": "../chinese.json"
      columns: [
        {width: "10%"}
        {width: "25%", orderable: false}
        {width: "15%"}
        {widht: "25%", orderable: false}
        {width: "10%"}
        {width: "5%", className: "center", searchable: false, orderable: false}
        {width: "5%", className: "center", searchable: false, orderable: false}
      ]

$ ->
  $(document).on 'click', '.class_troubletype', (e) ->
    n = $(this).data("tid") 
    console.log(n)
    str = "cty/lists.json?ttid="+n
    console.log(str)
    $('#code_troubleshooting_table').data('source', str)
    $('#link_newtype').attr('data-typeid', n)
    console.log $('#link_newtype').attr('data-typeid')
    getCodeTroubleshootings()

$(document).on('page:load', getCodeTroubleshootings);