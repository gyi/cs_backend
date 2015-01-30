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
		<div class="panel panel-success">
			<div id="showSearch" class="panel-heading">
				<span><s:text name="gccp.common.search" /></span>
				<a href="#" id="hiddleHit" class="text-success">[<s:text name="gccp.common.hiddlehit" />]</a>
			</div>
			<div id="toHiddle" class="panel-body">
				<form class="form-horizontal" id="searchuserform">
					<div class="control-group">
						<label class="control-label" for="userName"><s:text
								name="gccp.user.name" /></label>
						<div class="controls">
							<input type="text" id="userName" name="userName"
								placeholder="<s:text name="gccp.user.name" />">
						</div>
					</div>
					<!-- 平台  -->
					<div class="control-group">
						<label class="control-label" for="platformId"><s:text
								name="gccp.common.platformName" /></label>
						<div class="controls">
							<select name="thePlatformId" id="platformId">
								<option value="0"><s:text name="gccp.common.pleasecheck" /></option>
								<s:iterator value="platformsList" id="platformsList">
									<option
										value="<s:property value="#platformsList.getPlatformId()"/>"><s:property
											value="#platformsList.getDescrible()" /></option>
								</s:iterator>
							</select>
						</div>
					</div>
					<!-- 角色 -->
					<div class="control-group">
						<label class="control-label" for="roleId"><s:text
								name="gccp.user.role" /></label>
						<div class="controls">
							<select name="roleId" id="roleId">
								<option value="0"><s:text name="gccp.common.pleasecheck" /></option>
								<s:iterator value="rolesList" id="rolelist">
									<option value="<s:property value="#rolelist.getId()"/>"><s:property
											value="#rolelist.getRoleName()" /></option>
								</s:iterator>
							</select>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="button" class="btn" id="search">
								<i class="icon-search"></i>
								<s:text name="gccp.common.search" />
							</button>
						</div>
					</div>
				</form>
			</div>

		</div>
		<div id="showList">
			<jsp:include page="userList.jsp"></jsp:include>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#search").click(function() {
			$.post("../admin/searchUser.action", $("#searchuserform")
					.serialize(), function(data, textStatus) {
				$("#showList").html(data);
			});
		});
		$("#showSearch").click(function() {
			toHiddle();
			
		});
	});
</script>
</html>