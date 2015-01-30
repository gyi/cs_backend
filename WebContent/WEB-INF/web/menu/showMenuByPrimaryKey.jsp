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
	<div id="main" class="span8 container-fluid">
		<div class="panel panel-success">
			<div class="panel-heading">
				<span><s:text name="gccp.common.modify" /></span>
			</div>
			<div class="panel-body">
				<form class="form-horizontal validateform" id="modifymenuform">
					<input type="hidden" id="Id" name="Id"
						value="<s:property value="oneMenu.id"/>">
					<!-- 目录名 -->
					<div class="control-group">
						<label class="control-label"><s:property value="result"/></label>
					</div>
					<div class="control-group">
						<label class="control-label" for="menuName"><s:text
								name="gccp.menu.name" /></label>
						<div class="controls">
							<input type="text" id="menuName" name="menuName" class="required"
								value="<s:property value="oneMenu.menuName"/>"
								placeholder="<s:text name="gccp.menu.name" />">
						</div>
						<div class='controls'>
							<s:fielderror cssStyle="color:red">
								<s:param>menuName</s:param>
							</s:fielderror>
						</div>
					</div>
					<!-- 路径 -->
					<div class="control-group">
						<label class="control-label" for="url"><s:text
								name="gccp.menu.url" /></label>
						<div class="controls">
							<input type="text" id="url" name="url"
								value="<s:property value="oneMenu.menuUrl"/>"
								placeholder="<s:text name="gccp.menu.url" />">
						</div>
						<div class='controls'>
							<s:fielderror cssStyle="color:red">
								<s:param>url</s:param>
							</s:fielderror>
						</div>
					</div>
					<!-- 描述 -->
					<div class="control-group">
						<label class="control-label" for="describle"><s:text
								name="gccp.menu.desc" /></label>
						<div class="controls">
							<input type="text" id="describle" name="describle"
								value="<s:property value="oneMenu.describle"/>"
								placeholder="<s:text name="gccp.menu.desc" />">
						</div>
						<div class='controls'>
							<s:fielderror cssStyle="color:red">
								<s:param>describle</s:param>
							</s:fielderror>
						</div>
					</div>
					<!-- 上级目录 -->
					<div class="control-group">
						<label class="control-label" for="direction"><s:text
								name="gccp.menu.parent" /></label>
						<div class="controls">
							<select name="direction" id="direction">
								<s:iterator value="dirMenusList" id="dirMenusList">
									<s:if test="%{oneMenu.type==#dirMenusList.getId()}">
										<option selected="selected"
											value="<s:property value="#dirMenusList.getId()"/>"><s:property
												value="#dirMenusList.getMenuName()" /></option>
									</s:if>
									<s:else>
										<option value="<s:property value="#dirMenusList.getId()"/>"><s:property
												value="#dirMenusList.getMenuName()" /></option>
									</s:else>
								</s:iterator>
							</select>
						</div>
					</div>
					<!-- 图标 -->
					<div class="control-group">
						<label class="control-label" for="icon"><s:text
								name="gccp.menu.icon" /></label>
						<div class="controls">
							<div id="iconDiv" style="border:3px solid #CCCCCC; width: 30px; height: 29px;">
								<img id="iconshow" class="img-polaroid" src="<s:property value="oneMenu.icon"/>" onclick="chooseIcon()" width="20" height="20"/>
							</div>
							 
							 <input type="hidden" id="fileFileName" name="fileFileName" value="oneMenu.icon"/>
						</div>
						<div class='controls'>
							<s:fielderror cssStyle="color:red">
								<s:param>icon</s:param>
							</s:fielderror>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="button" class="btn btn-info" id="submit">
								<i class="icon-edit icon-white"></i>
								<s:text name="gccp.common.submit" />
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		requiredMarker();
		validateForm();
		$("#submit").live('click',
				function() {
					if ($("#modifymenuform").valid()) {
						onClickBottom(1, 'modify', '../menu/menuModify.action',
								$("#modifymenuform").serialize());
					}
				});
		$("#iconDiv").live('mouseover',
				function(){
					this.style.border="3px solid #FFAA33";
				});
		$("#iconDiv").live('mouseout',
				function(){
					this.style.border="3px solid #CCCCCC";
				});
	});
	
	function chooseIcon() {
		var id = $("#Id").val();
		$.post("../menu/modifyMenuIconShowPage.action", 
				{Id: id}, 
				function(data, textStatus) {
					var dialog = art.dialog({id: "modifyMenuIconShowPage", title: gccp_menu_chooseIcon, content: data, lock: true, ok: 
						function(){
							iconChoosed();
						}, 
						close: function(){}});
				});
		/* var list = art.dialog.list;
		for (var i in list) {
		    list[i].close();
		}; */
	}
	
	function iconChoosed(){
		
		var menuIcon = share.data('menuIcon');
		share.removeData('menuIcon');
		
		if(menuIcon!=null){
			$("#iconshow").attr("src", menuIcon);
			$("#fileFileName").attr("value", menuIcon);
			onClickBottom(1, 'modify', "../menu/menuIconAdd.action", {menuName: $("#menuName").val(), fileFileName: menuIcon});
		}
		
	}
	
</script>
</html>