<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
</body>
<script type="text/javascript">
	$(function() {
		var myDialog = art.dialog({
			padding : 0,
			title : '<s:text name="gccp.common.submit"/>',
			width : 600,
			height : 500,
			cancel : false,
			lock : false,
			resize : false
		});

		$.ajax({
			url : '../admin/addUserForm.action',
			success : function(data) {
				myDialog.content(data);// 填充对话框内容
			}
		});   

		
		/* $("#reset").click(function(){
			$("#adduserform").validate().resetForm();
		}); */

	});

	function a() {
		requiredMarker();
		validateForm();
		if($("#adduserform").valid()){
			onClickBottom(1, 'add', '../admin/userAdd.action', $("#adduserform")
					.serialize());
		}
		
	}
</script>
</html>