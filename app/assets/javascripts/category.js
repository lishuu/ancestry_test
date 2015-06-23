function getUserByDistrict(disNode) {
	alert("我是小区节点！我的 ID =  " + disNode.id)
	$.post(url, { email: emailVal, password: passwordVal }, callback, "json").error(errorHandler);
	
	var params = '{"district_id": disNode.id}';
	$.get('', params, function(data){
		alert(data);
	});

	var $userList = $('#user_List');  //div id = 'userTable'

}

function zTreeOnClick(event, treeId, treeNode) {
	if (treeNode.nodetype == 2) {
		getUserByDistrict(treeNode)
	}
}

var setting = {
	// async: {
 //   	enable: true,
 //   	dataType: "json",
 //   	type: "get",
 //   	url: "/tree.json", 
	// },

	callback: {
		onClick: zTreeOnClick
	}
}

// $(document).ready(function(){
// 	$.fn.zTree.init($("#treeDemo"), setting );
// })

var treeNodes;
function getJson() {
	$.ajax({
		url : 'tree.json',
		type : 'get',
		datatype : 'json',
		timeout : 1000,
		error : function() {
			alert("网络延时，请重试.");
		},
		success : function(res) {
			// console.log(res);
			treeNodes = res;
			$.fn.zTree.init($("#treeDemo"), setting, treeNodes);
		}
	})
}

$(document).ready(function(){
	getJson();
})