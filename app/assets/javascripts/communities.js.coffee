# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

init_D = (curnode)->
  $('#DataListTitle').text(curnode.name)
  str = 'cid=' + curnode.id

  if $.fn.dataTable.isDataTable('#community_table')
    table = $('#community_table').DataTable()
    table.ajax.url('../distrcits.json?' + str).load()
  else
    $('#community_table').dataTable
      pagingType: "full_numbers"
      Processing: true
      ServerSide: true
      ajax: '../distrcits.json?'+str
      oLanguage: "sUrl": "../chinese.json"


getNodeData = (currentNode) ->
  init_D(currentNode)

zTreeOnClick = (event, treeId, treeNode) -> 
  getNodeData treeNode

setting = callback: onClick: zTreeOnClick

getDistrictTree = ->
  $.ajax
    url: '../tree_full.json'
    type: 'get'
    datatype: 'json'
    timeout: 1000
    error: ->
      alert '网络延时，请重试。'
    success: (res) ->
      treeNodes = res
      $.fn.zTree.init $('#districtTree'), setting, treeNodes

$ ->
  getDistrictTree()

$(document).on('page:load', getDistrictTree);