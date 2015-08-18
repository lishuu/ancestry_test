
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
      $('#div_newcustomer').removeClass("visible").addClass("hidden");

  	when 2 
      str = 'cd=' + currentNode.getParentNode().id + '&cc=' + currentNode.id #小区节点
      $("#DataLabel").text(" - " + currentNode.getParentNode().name + " - " + currentNode.name )
      $('#div_newcustomer').removeClass("visible").addClass("hidden");

  	when 3
      str = 'cd=' + currentNode.getParentNode().getParentNode().id + '&cc=' + currentNode.getParentNode().id + '&cb=' + currentNode.id #楼宇节点
      $("#DataLabel").text(" -" + currentNode.getParentNode().getParentNode().name + " - " + currentNode.getParentNode().name + " - " + currentNode.name + ' 号楼' )
      $('#newcustomer_label').attr('data-buildingid', currentNode.id);
      $('#newcustomer_label').attr('data-communityid', currentNode.getParentNode().id);
      ddd_id = currentNode.getParentNode().getParentNode().id
      $('#newcustomer_label').attr('data-districtid', ddd_id);
      $('#div_newcustomer').removeClass("hidden").addClass("visible");

      $('#newcustomer_label').on 'click', ->
        event.preventDefault()
        $.get $(this).attr('data-href') + '?district_id=' + ddd_id, (data) ->


  if $.fn.dataTable.isDataTable('#customer_table')
    table = $('#customer_table').DataTable()
    table.ajax.url( 'customers.json?' + str ).load()
  else
	  $('#customer_table').dataTable
	    pagingType: "full_numbers"
	    processing: true
	    serverSide: true
	    ajaxSource: 'customers.json?'+str
	    oLanguage: "sUrl": "chinese.json"

$ ->
  getJson()
  $('#div_newcustomer').removeClass("visible").addClass("hidden")

$(document).on('page:load', getJson);