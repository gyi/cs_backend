<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<table class="table table-bordered table-hover">
	<tr class="success">
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
		<td><label class="control-label"><s:text
					name="gccp.common.operate" /></label></td>
	</tr>
	<s:iterator value="menusListCDir">
		<tr>
			<td><s:property value="menu.id" /></td>
			<td><s:property value="menu.menuName" /></td>
			<td><s:property value="menu.menuUrl" /></td>
			<td><s:property value="menu.describle" /></td>
			<td><s:property value="fathermenu" /></td>
			<td>
				<div class="btn-group">
					<button type="button" class="btn" id="checkbtn"
						onClick="onClickBottom(0, '', '../menu/showMenuByPrimaryKey.action', {Id:<s:property value='menu.id'/>})">
						<s:text name="gccp.common.check" />
					</button>
					<button type="button" class="btn" id="modifybtn"
						onClick="onClickBottom(0, '', '../menu/showMenuByPrimaryKey.action', {Id:<s:property value='menu.id'/>})">
						<s:text name="gccp.common.modify" />
					</button>
					<button type="button" class="btn" id="deletebtn"
						onClick="onClickBottom(1, 'delete', '../menu/menuByIdLogicDelete.action', {Id:<s:property value='menu.id'/>})">
						<s:text name="gccp.common.delete" />
					</button>
				</div>
			</td>
		</tr>
	</s:iterator>
</table>
