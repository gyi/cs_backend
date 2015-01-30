function startMenu(jsonStringMenu, divStatus) {
	if (jsonStringMenu != "") {
		var settingMenu = {

			data : {
				simpleData : {
					enable : true
				}
			},
			check: {
				enable: true
			},
			callback: {
				onCheck: onCheck
			},
			view: {
				showLine: false,
				showIcon: true,
				selectedMulti: false,
			}

		};
		var jsonResultMenu = convertJSONObject2JSON(JSON.parse(jsonStringMenu),
				[ "id", "menuName", "type", "isAllot", "icon"], [ "id", "name", "pId" ,"checked", "icon"]);
		var zNodesMenu = jsonResultMenu;
		$.fn.zTree.init($("#"+divStatus), settingMenu, zNodesMenu);
	}

}
function onCheck(e, treeId, treeNode) {
	var roleId = $('#role option:selected').val();// 选中的值 ;
	var json={menuId:treeNode.id, roleId:roleId};
	
	if(treeNode.checked){
		var url = "../role/right/menuRoleAdd.action";
	}
	else{
		var url = "../role/right/menuRoleDelete.action";
	}
	$.post(url, json, function(data, textStatus) {
		$("#menuDiv").html(data);
	});
}	
