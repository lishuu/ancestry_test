# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $('#customer_table').dataTable
    pagingType: "full_numbers"
    Processing: true
    ServerSide: true
    ajax: $('#customer_table').data('source')
    oLanguage: "sUrl": "chinese.json"
