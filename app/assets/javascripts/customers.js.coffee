
zTreeOnClick = (event, treeId, treeNode) -> 
  getCustomers treeNode

setting = callback: onClick: zTreeOnClick

getJson = ->
  $.ajax
    url: 'tree_full.json'
    type: 'get'
    datatype: 'json'
    timeout: 1000
    error: ->
      alert '网络延时，请重试。'
    success: (res) ->
      treeNodes = res
      $.fn.zTree.init $('#treeDemo'), setting, treeNodes

getCustomers = (currentNode) ->
  nt = currentNode.nodetype
  switch nt 
  	when 1 then str = 'cd=' + currentNode.id  #片区节点
  	when 2 then str = 'cd=' + currentNode.getParentNode().id + '&cc=' + currentNode.id #小区节点
  	when 3 then str = 'cd=' + currentNode.getParentNode().getParentNode().id + '&cc=' + currentNode.getParentNode().id + '&cb=' + currentNode.id #楼宇节点
    

  if $.fn.dataTable.isDataTable('#customer_table')
    table = $('#customer_table').DataTable()
    table.ajax.url( 'customers.json?' + str ).load();
  else
	  $('#customer_table').dataTable
	    pagingType: "full_numbers"
	    Processing: true
	    ServerSide: true
	    ajax: 'customers.json?'+str
	    oLanguage: "sUrl": "chinese.json"

$(document).ready ->
  getJson()

$(document).on('page:load', getJson);