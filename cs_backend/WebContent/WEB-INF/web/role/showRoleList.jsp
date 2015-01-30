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
				<form class="form-horizontal" id="searchroleform">
					<!-- 角色名 -->
					<div class="control-group">
						<label class="control-label" for="roleName"><s:text
								name="gccp.role.name" /></label>
						<div class="controls">
							<input type="text" id="roleName" name="roleName"
								placeholder="<s:text name="gccp.role.name" />">
						</div>
					</div>
					<!-- 描述 -->
					<div class="control-group">
						<label class="control-label" for="desc"><s:text
								name="gccp.role.desc" /></label>
						<div class="controls">
							<textarea rows="5" cols="5" id="desc" name="describle"
								placeholder="<s:text name="gccp.role.desc"/>"></textarea>
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
			<jsp:include page="roleList.jsp"></jsp:include>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#search").click(
				function() {
					$.post("../role/searchRole.action", $("#searchroleform")
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