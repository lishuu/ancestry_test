# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

init_D = (curnode)->
  switch curnode.nodetype 
    when 0 then s0 = '片区'
    when 1 then s0 = '小区'
    when 2 then s0 = '楼宇'

  title_str = curnode.name
  $('#DataListTitle').text(title_str.concat(' 的 ', s0, '信息'))
  $('#link_text').text("新增"+s0)
  $('#dialog h3').html("<i class='glyphicon glyphicon-plus'></i> 添加新"+s0);
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
  if currentNode.nodetype < 3
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