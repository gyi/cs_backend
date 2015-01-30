<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<table class="table table-bordered table-hover">
	<tr class="success">
		<td><label class="control-label"><s:text
					name="gccp.platform.id" /></label></td>
		<td><label class="control-label"><s:text
					name="gccp.platform.name" /></label></td>
		<td><label class="control-label"><s:text
					name="gccp.platform.right" /></label></td>
		<td><label class="control-label"><s:text
					name="gccp.platform.exchangeRate" /></label></td>
		<td><label class="control-label"><s:text
					name="gccp.platform.realRate" /></label></td>
		<td><label class="control-label"><s:text
					name="gccp.platform.describle" /></label></td>
		<td><label class="control-label"><s:text
					name="gccp.common.operate" /></label></td>
	</tr>
	<s:iterator value="platformsListCRight" id="platformsListCRight">
		<tr>
			<td><s:property value="platform.platformId" /></td>
			<td><s:property value="platform.platformName" /></td>
			<td><select name="right" id="right">
					<s:iterator value="#platformsListCRight.platfromRightList"
						id="platfromRightList">
						<option
							value="<s:property value="#platfromRightList.getPlatformId()"/>"><s:property
								value="#platfromRightList.getDescrible()" /></option>
					</s:iterator>
			</select></td>
			<td><s:property value="platform.exchangeRate" /></td>
			<td><s:property value="platform.realRate" /></td>
			<td><s:property value="platform.describle" /></td>
			<td>
				<div class="btn-group">
					<button type="button" class="btn" id="checkbtn"
						onClick="onClickBottom(0, '', '../platform/showPlatformByPrimaryKey.action', {platformId:<s:property value='platform.platformId'/>})">
						<s:text name="gccp.common.check" />
					</button>
					<button type="button" class="btn" id="modifybtn"
						onClick="onClickBottom(0, '', '../platform/showPlatformByPrimaryKey.action', {platformId:<s:property value='platform.platformId'/>})">
						<s:text name="gccp.common.modify" />
					</button>
					<button type="button" class="btn" id="deletebtn"
						onClick="onClickBottom(1, 'delete', '../platform/platformByIdLogicDelete.action', {platformId:<s:property value='platform.platformId'/>})">
						<s:text name="gccp.common.delete" />
					</button>
				</div>
			</td>
		</tr>
	</s:iterator>
</table>
