<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!-- 用户 -->
<div>
<table class="table table-bordered table-hover"">
	<tr class="success">
		<td><label class="control-label"><s:text name="gccp.common.operate" /></label></td>
		<td><label class="control-label"><s:text name="gccp.user.id" /></label></td>
		<td><label class="control-label"><s:text name="gccp.user.name" /></label></td>
	</tr>
	<s:iterator value="usersToRoleList" id="usersToRoleList" >
		<tr>
			<td>
			<s:if test="%{#usersToRoleList.isAllot==1}">
				<input type="checkbox" name="checkbox" checked=true value="<s:property value="id" />" 
				onClick="onClickUser(this, '<s:text name="usersList.userId" />')">
			</s:if>
			<s:else>
				<input type="checkbox" name="checkbox" value="<s:property value="id" />" 
				onClick="onClickUser(this, '<s:text name="usersList.userId" />')">
			</s:else>
			</td>
			<td><s:property value="usersList.userId" /></td>
			<td><s:property value="usersList.userName" /></td>
		</tr>
	</s:iterator>
</table>
</div>

<script type="text/javascript">
	
</script>