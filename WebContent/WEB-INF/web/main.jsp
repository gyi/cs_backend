<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript">
	$(function(){
		$("body").layout(  
				{     
				    applyDefaultStyles: true,//应用默认样式  
				    north__closable:true,//可以被关闭 
				    resizable:false,//可以改变大小 
				}  
				);
	}) ;
</script>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="navbar-header">
				<a class="brand" href="#">&nbsp;&nbsp;<s:text name="gccp.common.program" /></a>
				<ul class="nav">
					<li class="menuSecond active" value="21"><a href="#">首页</a></li>
					<s:iterator value="menuTile" id="menu">
						<li class="menuSecond" value="<s:property value="#menu.getId()"/>"><a href="#"><s:property value="#menu.getMenuName()"/></a></li>
					</s:iterator>
			    </ul>
			</div>
			<div class="nav-collapse collapse text-right" style="float:right;">
				<ul class="nav navbar-nav text-left">
					<li><a><s:text name="gccp.common.welcome" /></a></li>
					<li class="dropdown">
					<input type="hidden" id="userId" name="userId" value="<s:property value="userId"/>">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<s:property value="username" />
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<!-- <li class="divider"></li> -->
						<li><a href="#" id="modifypsd"><s:text name="gccp.common.modifypassword" /></a></li>
						<li><a href="#" id="switchWindow" value="2"><s:text name="gccp.common.switchWindow" /></a></li>
					</ul>
					</li>
					<li><a>|</a></li>
					<li><a href="../login/loginOut.action"><s:text
							name="gccp.common.quit" />&nbsp;&nbsp;</a></li>
					<li><a>&nbsp;</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="ui-layout-west">
		<div class="flowheight"></div>
		<div id="menuContent">
			<jsp:include page="menu.jsp"></jsp:include>
		</div>
		
	</div>
	<div class="ui-layout-center">
		<div class="flowheight"></div>
		<div id="content" class="content"></div>
	</div>