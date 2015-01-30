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
				<form class="form-horizontal validateform" id="modifyroleform">
					<input type="hidden" id="Id" name="roleId"
						value="<s:property value="oneRole.id"/>"/>
					<div class="control-group">
						<label class="control-label"><s:property value="result"/></label>
					</div>
					<!-- 目录名 -->
					<div class="control-group">
						<label class="control-label" for="roleName"><s:text
								name="gccp.role.name" /></label>
						<div class="controls">
							<input type="text" id="roleName" name="roleName" class="required"
								value="<s:property value="oneRole.roleName"/>"
								placeholder="<s:text name="gccp.role.name" />">
						</div>
						<div class='controls'>
							<s:fielderror cssStyle="color:red">
								<s:param>roleName</s:param>
							</s:fielderror>
						</div>
					</div>
					<!-- 描述 -->
					<div class="control-group">
						<label class="control-label" for="describle"><s:text
								name="gccp.role.desc" /></label>
						<div class="controls">
							<input type="text" id="desc" name="describle"
								value="<s:property value="oneRole.describle"/>"
								placeholder="<s:text name="gccp.role.desc" />">
						</div>
						<div class='controls'>
							<s:fielderror cssStyle="color:red">
								<s:param>describle</s:param>
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
		$("#submit").click(
				function() {
					if ($("#modifyroleform").valid()) {
						onClickBottom(1, 'modify', '../role/roleModify.action',
								$("#modifyroleform").serialize());
					}
				});
	});
</script>
</html>