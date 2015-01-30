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
				<form class="form-horizontal validateform" id="modifyuserform">
					<input type="hidden" id="userId" name="userId"
						value="<s:property value="oneUser.userId"/>"/>
					<div class="control-group">
						<label class="control-label"><s:property value="result"/></label>
					</div>
					<!-- 用户名 -->
					<div class="control-group">
						<label class="control-label" for="userName"><s:text
								name="gccp.user.name" /></label>
						<div class="controls">
							<input type="text" id="userName" name="userName" class="required"
								value="<s:property value="oneUser.userName"/>"
								placeholder="<s:text name="gccp.user.name" />" />
						</div>
						<div class='controls'>
							<s:fielderror cssStyle="color:red">
								<s:param>userName</s:param>
							</s:fielderror>
						</div>
					</div>
					<!-- 平台 -->
					<div class="control-group">
						<label class="control-label" for="platformId"><s:text
								name="gccp.user.platform" /></label>
						<div class="controls">
							<select name="thePlatformId" id="platformId">
								<s:if test="%{oneUser.platformId==0}">
									<option value="0"></option>
								</s:if>
								<s:iterator value="platformsList" id="platformslist">
									<s:if
										test="%{oneUser.platformId==#platformslist.getPlatformId()}">
										<option selected="selected"
											value="<s:property value="#platformslist.getPlatformId()"/>"><s:property
												value="#platformslist.getDescrible()" /></option>
									</s:if>
									<s:else>
										<option
											value="<s:property value="#platformslist.getPlatformId()"/>"><s:property
												value="#platformslist.getDescrible()" /></option>
									</s:else>
								</s:iterator>
							</select>
						</div>
					</div>
					<!-- 角色 -->
					<div class="control-group">
						<label class="control-label" for="role"><s:text
								name="gccp.user.role" /></label>
						<div class="controls">
							<select name="roleId" id="role">
								<s:if test="%{oneUser.roleId==0}">
									<option value="0"></option>
								</s:if>
								<s:iterator value="rolesList" id="rolelist">
									<s:if test="%{oneUser.roleId==#rolelist.getId()}">
										<option selected="selected"
											value="<s:property value="#rolelist.getId()"/>"><s:property
												value="#rolelist.getRoleName()" /></option>
									</s:if>
									<s:else>
										<option value="<s:property value="#rolelist.getId()"/>"><s:property
												value="#rolelist.getRoleName()" /></option>
									</s:else>
								</s:iterator>
							</select>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="button" class="btn btn-info" id="submit" >
								<i class="icon-edit icon-white"></i>
								<s:text name="gccp.common.submit" />
							</button>
							<button type="button" class="btn" id="modifypassword">
								<i class="icon-bell"></i>
								<s:text name="gccp.common.modifypassword" />
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
		$("#submit").live('click', function() {
			alert($("#role").val());
			if ($("#modifyuserform").valid()) {
				onClickBottom(1, 'modify',
						'../admin/userModify.action', $(
								"#modifyuserform").serialize());
			}
		}) ;
		$("#modifypassword").live('click',function() {
			onClickBottom(0, 'modify',
					'../admin/modifyPasswordShowPage.action', {userId:<s:property value='userId'/>});
		});
		
	});
</script>
</html>