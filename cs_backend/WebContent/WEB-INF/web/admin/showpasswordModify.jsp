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
				<span><s:text name="gccp.common.modifypassword" /></span>
			</div>
			<div class="panel-body">
				<form class="form-horizontal validateform" id="modifypasswordform">
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
							<span class="help-block" id="userName"><s:property value="oneUser.userName"/></span>
						</div>
						
					</div>
					<!-- 旧密码 -->
					<div class="control-group">
						<label class="control-label" for="oldPassWord"><s:text
								name="gccp.user.oldPassWord" /></label>
						<div class="controls">
							<input type="passWord" id="oldPassWord" name="oldPassWord"
								class="required" value=""
								placeholder="<s:text name="gccp.user.oldPassWord" />">
						</div>
						<div class='controls'>
							<s:fielderror cssStyle="color:red">
								<s:param>oldPassWord</s:param>
							</s:fielderror>
						</div>
					</div>
					<!-- 新密码 -->
					<div class="control-group">
						<label class="control-label" for="passWord"><s:text
								name="gccp.user.password" /></label>
						<div class="controls">
							<input type="passWord" id="passWord" name="passWord"
								class="required"
								placeholder="<s:text name="gccp.user.password" />">
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
								placeholder="<s:text name="gccp.user.confrimPwd" />">
						</div>
						<div class='controls'></div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="button" class="btn btn-info" id="submit">
								<i class="icon-edit"></i>
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
		$("#submit").click(
				function() {
					if ($("#modifypasswordform").valid()) {
						onClickBottom(1, 'modify',
								'../admin/passwordModify.action', $(
										"#modifypasswordform").serialize());
					}
				});
	});
</script>
</html>