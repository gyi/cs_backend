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
	<div class="span20 container-fluid content">
		<div id="showList">
			<jsp:include page="serverList.jsp"></jsp:include>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#search").click(

				function() {
					$.post("../server/searchServer.action", $(
							"#searchserverform").serialize(), function(data,
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