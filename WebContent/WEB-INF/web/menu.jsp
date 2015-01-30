<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="gccp.login.success" /></title>
<link rel="stylesheet" href="/${systemName}/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body>
	<ul id="treeDemo" class="ztree"></ul>
</body>
<style type="text/css">
</style>
<script type="text/javascript">

	var setting = {
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			onClick : onClick
			
		},
		view: {
			showLine: false,
			showIcon: true,
			selectedMulti: false,
		}
	};
	
	function onClick(event, treeId, treeNode, clickFlag) {
		var url = treeNode.menuUrl ;
		//判断是否为空
		if(isEmptyValue(url))return;
		$.post(url,{},
				function(data, textStatus){
					$("#content").html(data) ;
				}) ;
	}

	var jsonString = '${menus}';
	var jsonResult = convertJSONObject2JSON(JSON.parse(jsonString), [ "id",
			"menuName", "menuUrl", "type", "icon"], [ "id", "name", "menuUrl", "pId", "icon"]);
	var zNodes = jsonResult;
	$(function() {
		treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
	});
</script>
</html>