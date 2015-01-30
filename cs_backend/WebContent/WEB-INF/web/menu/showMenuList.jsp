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
				<form class="form-horizontal panel-body" id="searchmenuform">
					<div class="control-group">
						<label class="control-label" for="menuName"><s:text
								name="gccp.menu.name" /></label>
						<div class="controls">
							<input type="text" id="menuName" name="menuName"
								placeholder="<s:text name="gccp.menu.name" />">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="direction"><s:text
								name="gccp.menu.parent" /></label>
						<div class="controls">
							<select name="direction" id="direction">
								<option value=""><s:text name="gccp.common.pleasecheck" /></option>
								<s:iterator value="dirMenusList" id="menu">
									<option value="<s:property value="#menu.getId()"/>"><s:property
											value="#menu.getMenuName()" /></option>
								</s:iterator>
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputUrl"><s:text
								name="gccp.menu.url" /></label>
						<div class="controls">
							<input type="text" id="inputUrl" name="url"
								placeholder="<s:text name="gccp.menu.url"/>">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="desc"><s:text
								name="gccp.menu.desc" /></label>
						<div class="controls">
							<textarea rows="5" cols="5" id="desc" name="describle"
								placeholder="<s:text name="gccp.menu.desc"/>"></textarea>
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
			<jsp:include page="menuList.jsp"></jsp:include>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#search").click(
				function() {
					$.post("../menu/searchMenu.action", $("#searchmenuform")
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