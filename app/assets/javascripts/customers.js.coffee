
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
  	when 1  
      str = 'cd=' + currentNode.id  #片区节点
      $("#DataLabel").text(" - " + currentNode.name )
      $('#newcustomer_lable').hide()

  	when 2 
      str = 'cd=' + currentNode.getParentNode().id + '&cc=' + currentNode.id #小区节点
      $("#DataLabel").text(" - " + currentNode.getParentNode().name + " - " + currentNode.name )
      $('#newcustomer_lable').hide()

  	when 3
      str = 'cd=' + currentNode.getParentNode().getParentNode().id + '&cc=' + currentNode.getParentNode().id + '&cb=' + currentNode.id #楼宇节点
      $("#DataLabel").text(" -" + currentNode.getParentNode().getParentNode().name + " - " + currentNode.getParentNode().name + " - " + currentNode.name )
      $('#newcustomer_lable').attr('data-buildingid', currentNode.id);
      $('#newcustomer_lable').attr('data-communityid', currentNode.getParentNode().id);
      $('#newcustomer_lable').attr('data-districtid', currentNode.getParentNode().getParentNode().id);
      $('#newcustomer_lable').show()



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
  $('#newcustomer_lable').hide()


$(document).on('page:load', getJson);