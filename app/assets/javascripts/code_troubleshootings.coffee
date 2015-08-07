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
    str = $(this).text()
    console.log(str)
    $("#DataListTitle").text( "故障描述及处理意见".concat(' - ', str) )
    str = "cty/lists.json?ttid="+n
    $('#code_troubleshooting_table').data('source', str)
    $('#link_newtype').attr('data-typeid', n)
    getCodeTroubleshootings()

  $('#class_troubletype1').click()


$(document).on('page:load', getCodeTroubleshootings);


