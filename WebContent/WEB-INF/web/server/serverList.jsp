<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<div class="">
	<table class="table table-bordered table-hover">
		<tr class="success">
			<td><label class="control-label"><s:text
						name="gccp.server.id" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.server.serverName" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.common.quid" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.common.quname" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.server.openTime" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.server.gamedbip" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.server.gamedbport" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.server.socketPort" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.server.logdbip" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.server.logdbport" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.server.dbPassword" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.server.gamedbName" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.server.logdbName" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.server.dbUsername" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.server.serverIp" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.server.serverId" /></label></td>
			<td><label class="control-label"><s:text
						name="gccp.common.operate" /></label></td>
		</tr>
		<s:iterator value="serversList">
			<tr>
				<td><s:property value="id" /></td>
				<td><s:property value="serverName" /></td>
				<td><s:property value="areaId" /></td>
				<td><s:property value="areaName" /></td>
				<td><s:property value="openTime" /></td>
				<td><s:property value="gamedbip" /></td>
				<td><s:property value="gamedbport" /></td>
				<td><s:property value="socketPort" /></td>
				<td><s:property value="logdbip" /></td>
				<td><s:property value="logdbport" /></td>
				<td><s:property value="dbPassword" /></td>
				<td><s:property value="gamedbName" /></td>
				<td><s:property value="logdbName" /></td>
				<td><s:property value="dbUsername" /></td>
				<td><s:property value="serverIp" /></td>
				<td><s:property value="serverId" /></td>

				<td>
					<div class="btn-group">
						<button type="button" class="btn" id="checkbtn"
							onClick="onClickBottom(0, '', '../server/showServerByPrimaryKey.action?', {id:<s:property value='id'/>})">
							<s:text name="gccp.common.check" />
						</button>
						<button type="button" class="btn" id="modifybtn"
							onClick="onClickBottom(0, '', '../server/showServerByPrimaryKey.action', {id:<s:property value='id'/>})">
							<s:text name="gccp.common.modify" />
						</button>
						<button type="button" class="btn" id="deletebtn"
							onClick="onClickBottom(1, 'delete', '../server/serverByIdLogicDelete.action', {id:<s:property value='id'/>})">
							<s:text name="gccp.common.delete" />
						</button>
					</div>
				</td>
			</tr>
		</s:iterator>
	</table>
</div>
