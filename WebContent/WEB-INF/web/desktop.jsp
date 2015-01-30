<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Map"%>
<%@page import="com.cs.backend.db.model.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
    <%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<link href="/${systemName}/static/img/hoorayos/index.css" rel="stylesheet">
<style>
#draggable
  {
      width:200px;
      height:30px;
      line-height:30px;
      z-index: 1000000px;
      position: absolute;
      top:70px;
      left:700px;
      border-radius: 3px;
      background-color:#099; 
      background: linear-gradient(top, #333, #312121); 
      background: -moz-linear-gradient(top, #333, #312121); 
      background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#333), to(#312121)); 
      filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#333', endColorstr='#312121');
      cursor: pointer; 
  }
  
</style>
<script type="text/javascript">
	$(function(){
		if("${result}"=="true") {
			 //拖拽函数
		     $('#draggable').draggable();
		}else {
			alert("切换失败") ;
		}
	}) ;
</script>
<body>
<div id="zoomWallpaperGrid" style="position:absolute;z-index:-10;top:0;left:0;height:100%;width:100%;background: #000000 url('/${systemName}/static/artDialog/skins/icons/wallpaper3.jpg') no-repeat 50% 50%"></div>
<div id="desk">
	<%
		Map<Integer, List<Menu>> menuMap = (Map<Integer, List<Menu>>)request.getAttribute("resultMap") ;
		int num = 0 ;
		for(Entry<Integer, List<Menu>> entry : menuMap.entrySet()) {
			num++ ;
			int key = entry.getKey() ;
			int length = 1920 ;
			if(num==1) {
				length = 0;
			}
			%>
			<div id="desk-<%=num %>" class="desktop-container" style="width: 1920px; height: 768px; left: <%=length%>px; top: 80px;">
				<div class="desktop-apps-container">
				<%
				List<Menu> menusNext = entry.getValue() ;
				int liLeft = 0 ;
				int liTop = 0 ;
				int styleLeft = 0 ;
				int styleTop = 0 ;
				for(int i=0; i < menusNext.size(); i++) {
					Menu menu = menusNext.get(i) ;
					int row = i % 8 ;
					liTop = 107 + 100 * row ;
					styleTop = 27 +  100 * row ;
					int col = i / 8 ;
					liLeft = 36 + col * 120 ;
					styleLeft = 36 + col * 120 ;
				%>
				<shiro:hasPermission name="<%=String.valueOf(menu.getId()) %>">
					<li id="d_<%=String.valueOf(menu.getId()) %>" class="appbtn" title="<%=menu.getMenuName()%>" appid="<%=String.valueOf(menu.getId()) %>" opening="0" realappid="<%=String.valueOf(menu.getId()) %>" type="window" left="<%=liLeft %>" top="<%=liTop %>" style="top: <%=styleTop%>px; left: <%=styleLeft%>px;">
						<div>
							<img src="/${systemName}/static/img/hoorayos/<%=String.valueOf(menu.getId()) %>.png" alt="<%=menu.getMenuName()%>">
						</div>
						<span><%=menu.getMenuName()%></span>
					</li>
				</shiro:hasPermission>
				<%
			    }
				%>
				</div>
			<div class="scrollbar scrollbar-x" style="display: none;"></div><div class="scrollbar scrollbar-y" style="display: none;"></div>
			</div>
	<%
		}
	%>
	<div id="draggable" class="ui-widget-content">
	   <div class="dock-pagination current-pagination-1">
	  		 <%
				List<Menu> menuTitle = (List<Menu>)request.getAttribute("menuTile") ;
	  		 	for(int i=1; i<= menuTitle.size() ; i++) {
	  		 		Menu title = menuTitle.get(i-1) ;
	  		 		%>
	  		 		<a class="pagination pagination-<%=i %> deskSecond" href="javascript:;"  index="<%=i %>" value="<%=title.getId() %>" title="<%=title.getMenuName() %>">
						<span class="pagination-icon-bg"></span>
						<span class="pagination-icon pagination-icon-<%=i %>"><%=i %></span>
					</a>
	  		 		<%
	  		 	}
	  		 %>
	  		 <%
			 %>
			<div class="dock-tools">
			  <a class="dock-tool-setting" id="setting" title="<s:text name="gccp.desktop.setting"/>" href="#">
			  </a>
			</div>
			<div id="startmenu-container" style="left: -25px;top:30px; bottom: auto; display: none;">
				<ul class="startmenu">
					<li><a href="javascript:;" class="switch" id="switchWindow" value="1"><s:text name="gccp.desktop.toNormal"/></a></li>
					<li><a href="javascript:;" class="exit" title="<s:text name="gccp.desktop.exit"/>"><s:text name="gccp.desktop.exit"/></a></li>
				</ul>
			</div>
	   </div>
	</div>
	<div id="copyright" style="display:none">
		<a href="javascript:;" class="close" title="<s:text name="gccp.desktop.close"/>"></a>
		<div class="title"><s:text name="gccp.desktop.exit"/></div>
		<div class="body">
			<p style="text-align: center;height:70px;line-height: 70px"><s:text name="gccp.desktop.checkexit"/></p>
			<span style="margin:80px 0 0 220px;"><button class="btn btn-small" id="closeBtnSession"><s:text name="gccp.desktop.check"/></button></span>
		</div>
	</div>
	<div id="maskbox-copyright" style="display:none"></div>
	<div id="task-bar">
		<div id="task-next"><a href="javascript:;" id="task-next-btn" hidefocus="true"></a></div>
		<div id="task-content">
		</div>
		<div id="task-pre"><a href="javascript:;" id="task-pre-btn" hidefocus="true"></a></div>
	</div>
</div>
</body>