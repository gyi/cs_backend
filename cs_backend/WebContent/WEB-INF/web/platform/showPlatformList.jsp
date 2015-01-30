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
				<form class="form-horizontal" id="searchplatformform">
					<!-- 平台名 -->
					<div class="control-group">
						<label class="control-label" for="platformName"><s:text
								name="gccp.platform.name" /></label>
						<div class="controls">
							<input type="text" id="platformName" name="platformName"
								placeholder="<s:text name="gccp.platform.name" />">
						</div>
					</div>
					<!-- 游戏汇率 -->
					<div class="control-group">
						<label class="control-label" for="exchangeRate"><s:text
								name="gccp.platform.exchangeRate" /></label>
						<div class="controls">
							<input type="text" id="exchangeRate" name="exchangeRate"
								placeholder="<s:text name="gccp.platform.exchangeRate"/>">
							</textarea>
						</div>
					</div>
					<!-- 当地汇率 -->
					<div class="control-group">
						<label class="control-label" for="realRate"><s:text
								name="gccp.platform.realRate" /></label>
						<div class="controls">
							<input type="text" id="realRate" name="realRate"
								placeholder="<s:text name="gccp.platform.realRate"/>">
							</textarea>
						</div>
					</div>
					<!-- 描述 -->
					<div class="control-group">
						<label class="control-label" for="describle"><s:text
								name="gccp.platform.describle" /></label>
						<div class="controls">
							<textarea rows="5" cols="5" id="describle" name="describle"
								placeholder="<s:text name="gccp.platform.describle"/>"></textarea>
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
			<jsp:include page="platformList.jsp"></jsp:include>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#search").click(
				function() {
					$.post("../platform/searchPlatform.action", $(
							"#searchplatformform").serialize(), function(data,
							textStatus) {
						$("#showList").html(data);
					});
				});
		$("#showSearch").click(function() {
			toHiddle();

		});
	});
</script>
</html>