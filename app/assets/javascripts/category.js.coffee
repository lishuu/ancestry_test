getUsers = (disNode) ->
  switch disNode.nodetype
    when 1 then getCustomer(	)
    when 2 then alert '我是小区节点！我的 ID = ' + disNode.id + '我的父节点：' + disNode.getParentNode().name + '|' +disNode.getParentNode().id
    when 3 then alert '我是楼宇节点！我的 ID = ' + disNode.id


zTreeOnClick = (event, treeId, treeNode) -> 
  getCustomers treeNode

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

getCustomers = (currentNode) ->
  switch currentNode.nodetype
  	when 1 then str = 'cd=' + currentNode.id  #片区节点
  	when 2 then str = 'cd=' + currentNode.getParentNode().id + '&cc=' + currentNode.id #小区节点
  	when 3 then str = 'cd=' + currentNode.getParentNode().getParentNode().id + '&cc=' + currentNode.getParentNode().id + '&cb=' + currentNode.id #楼宇节点

  if $.fn.dataTable.isDataTable('#customer_table')
    table = $('#customer_table').DataTable()
    table.ajax.url( 'customer.json?'+str ).load();
  else
	  $('#customer_table').dataTable
	    pagingType: "full_numbers"
	    Processing: true
	    ServerSide: true
	    ajax: 'customer.json?'+str
	    oLanguage: "sUrl": "chinese.json"

$(document).ready ->
  getJson()
return