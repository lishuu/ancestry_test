getUserByDistrict = (disNode) ->
  switch disNode.nodetype
    when 1 then getCustomer()
    when 2 then alert '我是小区节点！我的 ID = ' + disNode.id
    when 3 then alert '我是楼宇节点！我的 ID = ' + disNode.id


zTreeOnClick = (event, treeId, treeNode) -> 
  getUserByDistrict treeNode

setting = callback: onClick: zTreeOnClick

getJson = ->
  $.ajax
    url: 'tree.json'
    type: 'get'
    datatype: 'json'
    timeout: 1000
    error: ->
      alert '网络延时，请重试。'
      return
    success: (res) ->
      treeNodes = res
      $.fn.zTree.init $('#treeDemo'), setting, treeNodes
      return
  return

getCustomer = ->
  if $.fn.dataTable.isDataTable('#customer_table')
    table = $('#customer_table').DataTable()
    table.clear().draw()
  else
	  $('#customer_table').dataTable
	    pagingType: "full_numbers"
	    Processing: true
	    ServerSide: true
	    ajax: $('#customer_table').data('source')
	    oLanguage: "sUrl": "chinese.json"

reloadCustomer = ->
  $('#customer_table').dataTable.ajax.url()

$(document).ready ->
  getJson()
return