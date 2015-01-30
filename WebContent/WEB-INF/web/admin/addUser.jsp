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
				<span><s:text name="gccp.common.add" /></span>
			</div>
			<div class="panel-body">
				<form class="form-horizontal validateform" id="adduserform">
					<div class="control-group">
						<label class="control-label"><s:property value="result"/></label>
					</div>
					<!-- 用户名 -->
					<div class="control-group">
						<label class="control-label" for="userName"><s:text
								name="gccp.user.name" /></label>
						<div class="controls">
							<input type="text" id="userName" name="userName" class="required"
								value="<s:property value="userName"/>"
								placeholder="<s:text name="gccp.user.name" />" />
						</div>
						<div class='controls'>
							<s:fielderror cssStyle="color:red">
								<s:param>userName</s:param>
							</s:fielderror>
						</div>
					</div>
					<!-- 密码 -->
					<div class="control-group">
						<label class="control-label" for="passWord"><s:text
								name="gccp.common.password" /></label>
						<div class="controls">
							<input type="password" id="passWord" name="passWord"
								class="required"
								placeholder="<s:text name="gccp.common.password" />" />
						</div>
						<div class='controls'>
							<s:fielderror cssStyle="color:red">
								<s:param>passWord</s:param>
							</s:fielderror>
						</div>
					</div>
					<!-- 再输入一遍 -->
					<div class="control-group">
						<label class="control-label" for="confrimPwd"><s:text
								name="gccp.user.confrimPwd" /></label>
						<div class="controls">
							<input type="passWord" id="confrimPwd" name="confrimPwd"
								class="required"
								placeholder="<s:text name="gccp.user.confrimPwd" />" />

						</div>
						<div class='controls'>
							<s:fielderror cssStyle="color:red">
								<s:param>confrimPwd</s:param>
							</s:fielderror>
						</div>
					</div>
					<!-- 平台 -->
					<div class="control-group">
						<label class="control-label" for="platformId"><s:text
								name="gccp.user.platform" /></label>
						<div class="controls">
							<select name="thePlatformId" id="platformId">
								<s:iterator value="platformsList" id="platformslist">
									<s:if test="%{thePlatform!=null&&thePlatformId==#platformslist.getPlatformId()}">
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
								<s:iterator value="rolesList" id="rolelist">
									<s:if test="%{roleId&&roleId==#rolelist.getId()}">
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
							<button type="button" class="btn btn-info btn-lg" id="submit">
								<i class="icon-plus icon-white"></i>
								<s:text name="gccp.common.submit" />
							</button>
							<%-- <button type="reset" class="btn" id="reset"><s:text name="gccp.common.reset"/></button> --%>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		//给必填项后面加一个红点点
		requiredMarker();
		//表单验证
		validateForm();
		$("#submit").click(function() {
			if ($("#adduserform").valid()) {
				onClickBottom(1, 'add', '../admin/userAdd.action', $(
						"#adduserform").serialize());
			} 
		});

	});
</script>
</html>