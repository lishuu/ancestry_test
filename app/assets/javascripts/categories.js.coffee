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
  $('#link_text').attr('data-pnode', curnode.id);  
  $('#link_text').attr('data-nodetype', curnode.nodetype+1); 
  

  $('#dialog h3').html("<i class='glyphicon glyphicon-plus'></i> 添加新"+s0);
  str = 'cid=' + curnode.id

  $('#community_table').data('source', 'distrcits.json?cid=' + curnode.id )

  if $.fn.dataTable.isDataTable('#community_table')
    table = $('#community_table').DataTable()
    table.ajax.url($('#community_table').data('source')).load()
  else
    $('#community_table').dataTable
      pagingType: "full_numbers"
      processing: true
      serverSide: true 
      ajaxSource: $('#community_table').data('source')
      oLanguage: "sUrl": "../chinese.json"
      columns: [
        {width: "10%"}
        {width: "35%"}
        {width: "35%", orderable: false}
        {width: "5%", className: "center", searchable: false, orderable: false}
        {width: "5%", className: "center", searchable: false, orderable: false}
      ]
  $("html, body").animate({ scrollTop: 0 }, "slow")

getNodeData = (currentNode) ->
  if currentNode.nodetype < 3
    init_D(currentNode)

zTreeOnClick = (event, treeId, treeNode) -> 
  getNodeData treeNode

setFontCss = (treeId, treeNode) ->
  if treeNode.level == 1
    color: "blue"

setting = 
  callback: onClick: zTreeOnClick
  view: fontCss: setFontCss

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
      tree = $.fn.zTree.init $('#districtTree'), setting, treeNodes
      node = tree.getNodes()[0]
      getNodeData node


defaultTreeClick = ->
  treeObj = $.fn.zTree.getZTreeObj("districtTree");
  $.fn.zTree.destroy("districtTree");


$ ->
  getDistrictTree()

$(document).on('page:load', getDistrictTree);