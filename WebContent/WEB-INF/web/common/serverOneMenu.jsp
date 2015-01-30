<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../include.jsp"></jsp:include>
<link rel="stylesheet" href="/${systemName}/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body>
	<div class="zTreeDemoBackground">
		<ul id="test" class="ztree"></ul>
	</div>
</body>
<script type="text/javascript">
	
	var setting = {
		data : {
			simpleData : {
				enable : true
			}
		},
		view: {
			showLine: false,
			showIcon: true,
			selectedMulti: false,
		},
		callback:{
			onClick : onClick
		}
	};
	var jsonString = '${serversMenu}';
	var jsonResult = convertJSONObject2JSON(JSON.parse(jsonString), 
						[ "id", "name", "pid"],
						[ "id", "name", "pId"]);
	var zNodes = jsonResult;
	$(document).ready(function() {
		treeObj = $.fn.zTree.init($("#test"), setting, zNodes);
		//获得共享的数据
		var nodeView = share.data('serverOneView') ;
		var node = treeObj.getNodeByParam("id",nodeView) ;
		treeObj.selectNode(node);
		treeObj.updateNode(node);
	});
	
	//缓存当前选中的区服
	function onClick(e,treeId,treeNode) {
		if(!treeNode.isParent){
			//获得共享的数据
			share.data('serverOneView', treeNode.id) ;
		}
	}
</script>
</html>