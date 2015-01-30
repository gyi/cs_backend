<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<table class="table table-bordered table-hover">
	<tr class="success">
		<td><label class="control-label"><s:text
					name="gccp.role.id" /></label></td>
		<td><label class="control-label"><s:text
					name="gccp.role.name" /></label></td>
		<td><label class="control-label"><s:text
					name="gccp.role.desc" /></label></td>
		<td><label class="control-label"><s:text
					name="gccp.role.createTime" /></label></td>
		<td><label class="control-label"><s:text
					name="gccp.common.operate" /></label></td>
	</tr>
	<s:iterator value="rolesListAddTime" id="rolesListAddTime">
		<tr>
			<td><s:property value="role.Id" /></td>
			<td><s:property value="role.roleName" /></td>
			<td><s:property value="role.describle" /></td>
			<td><s:property value="createTime" /></td>
			<td>
				<div class="btn-group">
					<button type="button" class="btn" id="checkbtn"
						onClick="onClickBottom(0, '', '../role/showRoleByPrimaryKey.action', {roleId:<s:property value='role.Id'/>})">
						<s:text name="gccp.common.check" />
					</button>
					<button type="button" class="btn" id="modifybtn"
						onClick="onClickBottom(0, '', '../role/showRoleByPrimaryKey.action', {roleId:<s:property value='role.Id'/>})">
						<s:text name="gccp.common.modify" />
					</button>
					<button type="button" class="btn" id="deletebtn"
						onClick="onClickBottom(1, 'delete', '../role/roleByIdLogicDelete.action', {roleId:<s:property value='role.Id'/>})">
						<s:text name="gccp.common.delete" />
					</button>
				</div>
			</td>
		</tr>
	</s:iterator>
</table>