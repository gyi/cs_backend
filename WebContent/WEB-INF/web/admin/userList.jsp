<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div class="">
	<table class="table table-bordered table-hover">
		<tr class="success">
			<td><label class="control-label"><s:text
						name="gccp.user.id" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.user.name" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.user.role" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.user.platform" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.common.operate" /></label></td>
		</tr>
		<s:iterator value="usersList">
			<tr>
				<td><s:property value="userId" /></td>
				<td><s:property value="userName" /></td>
				<td><s:property value="roleId" /></td>
				<td><s:property value="platformId" /></td>
				<td>
					<div class="btn-group">
						<button type="button" class="btn" id="checkbtn"
							onClick="onClickBottom(0, '', '../admin/showUserByPrimaryKey.action', {userId:<s:property value='userId'/>})">
							<i class="icon-eye-open"></i>
							<s:text name="gccp.common.check" />
						</button>
						<button type="button" class="btn" id="modifybtn"
							onClick="onClickBottom(0, '', '../admin/showUserByPrimaryKey.action', {userId:<s:property value='userId'/>})">
							<i class="icon-edit"></i>
							<s:text name="gccp.common.modify" />
						</button>
						<button type="button" class="btn" id="deletebtn"
							onClick="onClickBottom(1, 'delete', '../admin/userByIdLogicDelete.action', {userId:<s:property value='userId'/>})">
							<i class="icon-trash"></i>
							<s:text name="gccp.common.delete" />
						</button>
					</div>
				</td>
			</tr>
		</s:iterator>
	</table>
</div>
