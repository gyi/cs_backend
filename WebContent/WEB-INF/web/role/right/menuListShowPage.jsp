<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
    
<link rel="stylesheet" href="/${systemName}/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<!-- 菜单 -->
<div style="float:left;padding:10px 50px 15px 130px;">
	<ul id="treeDemoOnMenu" class="ztree"></ul>
</div>
<div style="float:left;padding:10px 10px 0px 50px;">
	<ul id="treeDemoOnMenusByRole" class="ztree"></ul>
</div>
<div>
<%-- 	<div class="btn-group">
		<button type="button" class="btn btn-default dropdown-toggle btn-lg"
			data-toggle="dropdown" onClick="toHiddle('toHiddle')">
			<s:text name="gccp.menu" /><span class="caret"></span>
		</button>
	</div> --%>
<%-- 	<div id="toHiddle">
		<table class="table table-bordered table-hover">
			<tr class="success">
				<td><label class="control-label"><s:text
							name="gccp.common.operate" /></label></td>
				<td><label class="control-label"><s:text
							name="gccp.menu.id" /></label></td>
				<td><label class="control-label"><s:text
							name="gccp.menu.name" /></label></td>
				<td><label class="control-label"><s:text
							name="gccp.menu.url" /></label></td>
				<td><label class="control-label"><s:text
							name="gccp.menu.desc" /></label></td>
				<td><label class="control-label"><s:text
							name="gccp.menu.parent" /></label></td>
			</tr>
			<s:iterator value="menusToRoleList" id="menusToRoleList">
				<tr>
					<td><s:if test="%{#menusToRoleList.isAllot==1}">
							<input type="checkbox" name="checkbox" checked=true
								value="<s:property value="id" />"
								onClick="onClickMenu(this, '<s:text name="menusList.id" />')">
						</s:if> <s:else>
							<input type="checkbox" name="checkbox"
								value="<s:property value="id" />"
								onClick="onClickMenu(this, '<s:text name="menusList.id" />')">
						</s:else></td>
					<td><s:property value="menusList.id" /></td>
					<td><s:property value="menusList.menuName" /></td>
					<td><s:property value="menusList.menuUrl" /></td>
					<td><s:property value="menusList.describle" /></td>
					<td><s:property value="fathermenu" /></td>
				</tr>
			</s:iterator>
		</table>
	</div> --%>
</div>

<script type="text/javascript">
$(document).ready(function() {
	var jsonStringMenu = '${menusString}';
	var jsonStringmenusByRole = '${menusByRoleString}';
	startMenu(jsonStringMenu, 'treeDemoOnMenu');
	startMenu(jsonStringmenusByRole, 'treeDemoOnMenusByRole');
});
function toHiddle(hiddleDiv) {
	if($("#toHiddle").is(":hidden")){
		$("#toHiddle").show();
	}
	else if($("#toHiddle").is(":visible")){
		$("#toHiddle").hide();
	}
}

	
</script>