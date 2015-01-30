//点击按钮触发事件
function onClickRole(obj) {
	var roleId = obj.value;
	var url = "../role/right/showMenuListByRole.action";
	$.post(url, {
		roleId : roleId
	}, function(data, textStatus) {
		$("#menuDiv").html(data);
	});

}

function onClickMenu(obj, menuId) {
	var roleId = $('#role option:selected').val();// 选中的值 ;
	if (obj.checked) {
		var url = "../role/right/menuRoleAdd.action";
		$.post(url, {
			menuId : menuId,
			roleId : roleId
		}, function(data, textStatus) {
			$("#menuDiv").html(data);
		});
	} else {
		var url = "../role/right/menuRoleDelete.action";
		$.post(url, {
			menuId : menuId,
			roleId : roleId
		}, function(data, textStatus) {
			$("#menuDiv").html(data);
		});
	}

}