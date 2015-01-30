<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../include.jsp"></jsp:include>
</head>
<body>
<div id="main" class="container-fluid ">
	 <div class="tabbable">
		  <ul class="nav nav-tabs">
		  	<s:iterator value="menus" id="menu">
		  		<li><a href="#tab<s:property value="#menu.getId()"/>" url="<s:property value="#menu.getMenuUrl()"/>" class="tab-clk" data-toggle="tab"><s:property value="#menu.getMenuName()"/></a></li>
		  	</s:iterator>
		  </ul>
		  <div class="tab-content" >
		  		<s:iterator value="menus" id="menu" >
			  		<div class="tab-pane" id="tab<s:property value="#menu.getId()"/>"></div>
		  		</s:iterator>
		  </div>
	 </div>
</div>
<script type="text/javascript">
	$(function(){
		$(".tab-clk").click(function(){
			
			var url = $(this).attr("url") ;
			var tab = $(this).attr("href") ;
			if(isEmptyValue(url))return ;
			$.post(url, {},
					function(data, textStatus){
						$(".tab-pane").html("");
						$(".tab-pane").removeClass("content");
						$(tab).html(data) ;
						$(tab).addClass("content");
					});
		}) ;
		$($(".nav").find(".tab-clk")[0]).trigger("click");
	}) ;
</script>
</body>
