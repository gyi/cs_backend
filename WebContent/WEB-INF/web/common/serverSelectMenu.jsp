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
	Array.prototype.remove=function(dx){
	    if(isNaN(dx)||dx>this.length){return false;}
	    for(var i=0,n=0;i<this.length;i++){
	        if(this[i]!=this[dx])
	        {
	            this[n++]=this[i] ;
	        }
	    }
	    this.length-=1 ;
	};
	//在数组中获取指定值的元素索引
	Array.prototype.getIndexByValue= function(value){
	    var index = -1;
	    for (var i = 0; i < this.length; i++){
	        if (this[i] == value){
	            index = i;
	            break;
	        }
	    }
	    return index;
	};
	
	var setting = {
		data : {
			simpleData : {
				enable : true
			}
		},
		check: {
			enable: true
		},
		view: {
			showLine: false,
			showIcon: true,
			selectedMulti: false,
		},
		callback:{
			onCheck:onCheck
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
		var nodesView = share.data('serversMenuView') ;
		var nodesAll = treeObj.getNodes();
		var childNodes = treeObj.transformToArray(nodesAll);
		if(!isEmptyValue(nodesView)) {
			for(var i=0; i<childNodes.length;i++){    
			    var node = childNodes[i].id ;
			    for(var j=0;j<nodesView.length;j++) {
			    	var nodeView = nodesView[j] ;
			    	if(node == nodeView) {
			    		childNodes[i].checked=true ;
			    		treeObj.updateNode(childNodes[i]);
			    		break ;
			    	}
			    }
	        } 
		}
	});
	
	//缓存当前选中的区服
	function onCheck(e,treeId,treeNode){
		//获得共享的数据
		var nodes = share.data('serversMenu') ;
		var nodesView = share.data('serversMenuView') ;
		if(!nodes||!nodesView) {
			nodes = new Array();
			nodesView = new Array();
		}
		//获得所有菜单区服
		var childNodes = treeObj.transformToArray(treeNode);
		 for(var i = 0; i < childNodes.length; i++) {
			 var objMenuView = childNodes[i].id ;
			if(treeNode.checked){
				if(!childNodes[i].isParent) {
					var indexView= nodes.getIndexByValue(objMenuView) ;
					if(indexView==-1) {
						nodes.push(childNodes[i].id) ;
					}
				}
				var indexView= nodesView.getIndexByValue(objMenuView) ;
				if(indexView==-1) {
					nodesView.push(objMenuView) ;
				}
			}else {
				if(!childNodes[i].isParent) {
					var index= nodes.getIndexByValue(childNodes[i].id) ;
					nodes.remove(index) ;
				}
				var indexView= nodesView.getIndexByValue(objMenuView) ;
				nodesView.remove(indexView) ;
			}
		 }
		 share.data('serversMenu', nodes);
		 share.data('serversMenuView', nodesView);
    }
</script>
</html>