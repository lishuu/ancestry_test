$ = jQuery

zTreeNodes = null;
zTreeObj = null;

setting = {
  async: {
   	enable: true,
   	dataType: "json",
   	type: "get",
   	url: "/tree.json", 
   	dataFilter: ajaxDataFilter
  }, 

  callback: {
    onAsyncSuccess: zTreeOnAsyncSuccess
    onClick: zTreeOnClick 
  }
}


zTreeOnAsyncSuccess = (event, treeId, treeNode, msg) ->
  if(not msg || msg.length ==0)
    alert("no data return")
    return
  zTreeNodes = msg
  if treeNode
    totalCount = treeNode.count
    if(treeNode.children.length < totalCount)
      ajaxGetNodes(treeNode)

ajaxGetNodes = (treeNode, reloadType) ->
  zTree = $.fn.zTree.getZtreeObj("treeDemo")
  if(reloadType is "refresh")
    treeNode.icon = "assets/ztree/zTreeStyle/img/loading.gif"
    zTree.updateNode(treeNode)
  zTree.reAsyncChildNodes(treeNode, reloadType, true)
  return

zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zTreeNodes);
