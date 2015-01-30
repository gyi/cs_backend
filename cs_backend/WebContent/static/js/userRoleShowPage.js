//点击按钮触发事件
function onClickRoleForUser(obj) {
	var roleId = obj.value;
	var url = "../role/user/showUserListByRole.action";
	$.post(url, {
		roleId : roleId
	}, function(data, textStatus) {
		$("#userDiv").html(data);
	});

}

function onClickUser(obj, userId) {
	var roleId = $('#role option:selected').val();// 选中的值 ;
	if (obj.checked) {
		var url = "../role/user/userRoleAdd.action";
		$.post(url, {
			userId : userId,
			roleId : roleId
		}, function(data, textStatus) {
			$("#userDiv").html(data);
		});
	} else {
		var url = "../role/user/userRoleDelete.action";
		$.post(url, {
			userId : userId,
			roleId : roleId
		}, function(data, textStatus) {
			$("#userDiv").html(data);
		});
	}

}