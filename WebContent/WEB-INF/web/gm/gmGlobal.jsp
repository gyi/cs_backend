<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/${systemName}/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="well" style="max-width: 1000px">
				<s:form id="validationForm" namespace="/"
					action="login/login.action" enctype="multipart/form-data">

					<div class="form-horizontal">
						<div class="control-group ">
							<label class="control-label"><s:text
									name="gccp.common.serverselect" />:</label>
							<div class="controls">
								<div class="input-append">
									<button id="serversbtn" class="btn" type="button">
										<s:text name="gccp.common.serverselect" />
									</button>
								</div>
							</div>
						</div>
						<div class="control-group ">
							<label class="control-label"><s:text
									name="gccp.gm.gminsert" />:</label>
							<div class="controls">
								<input class="span3" name="gmcmd" type="text">
							</div>
						</div>
						<div class="control-group ">
							<label class="control-label"><s:text
									name="gccp.commom.playerselecttype" />:</label>
							<div class="controls">
								<select class="span3" name="roleMessageType">
									<option value="1"><s:text name="gccp.commom.roleId" /></option>
									<option value="2"><s:text name="gccp.common.roleName" /></option>
								</select>
							</div>
						</div>
						<div class="control-group ">
							<label class="control-label"><s:text
									name="gccp.player.roleMessage" />:</label>
							<div class="controls">
								<input class="span3" type="text" name="roleMessage"
									placeholder="<s:text name="gccp.player.roleMessageDescrible" />" />
							</div>
						</div>
					</div>
				</s:form>
				<input type="submit" value="<s:text name="gccp.common.submit" />"
					style="margin-left: 180px; margin-top: -10px"
					class="btn btn-primary" id="gmsubmit">
			</div>
		</div>
		<div id="resultContent"></div>
	</div>
</body>
<script type="text/javascript">
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
	$(function(){
		$("#serversbtn").click(function(){
			share.removeData('serverOneView');
			art.dialog.open('/${systemName}/common/getServerMenu.action', {
				id:"serverMenuDesk", 
				width:200, 
				height:500, 
				title:"<s:text name='gccp.common.server'/>",
				resize:false,
				follow: document.getElementById('appendedInputButton'),
				ok : function(){
					$("#appendedInputButton").val("已选择") ;
				}
			});
		}) ;
		
		$("#gmsubmit").click(function(){
			
			$.post("/${systemName}/gm/gmStart.action",
					$("#validationForm").serialize() + "&servers=" +  share.data('serverOneView')
					,function(data, texstStatus){
						var content ;
						if(data.result=="true") {
							content = createAlert("success", data.message) ;
						}else {
							content = createAlert("error", data.message) ;
						}
						$("#resultContent").html(content) ;
					}) ;
		}) ;
	}) ;
</script>
</html>