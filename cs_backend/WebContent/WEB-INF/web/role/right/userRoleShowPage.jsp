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
	<div class="span12 container-fluid">
		<form class="form-horizontal" id="adduserform" role="form">
			<!-- 角色 -->
			<div class="control-group ">
				<label class="control-label" for="role"><s:text
						name="gccp.user.role" /></label>
				<div class="controls">
					<select name="roleId" id="role"
						onchange="onClickRoleForUser(this)">
						<option value=""><s:text name="gccp.common.pleasecheck" /></option>
						<s:iterator value="rolesList" id="rolelist">
							<option value="<s:property value="#rolelist.getId()"/>"><s:property
									value="#rolelist.getRoleName()" /></option>
						</s:iterator>
					</select>
				</div>
			</div>
		</form>
		<!-- 角色 -->
		<div id="userDiv" style="padding:10px 50px 15px 130px;">
			<jsp:include page="userListShowPage.jsp"></jsp:include>
		</div>

	</div>
</body>
<script type="text/javascript">
	
</script>
</html>