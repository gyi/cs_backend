<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div id="main" class="span8 container-fluid">
		<div class="panel panel-success">
			<div class="panel-heading">
				<span><s:text name="gccp.common.modify" /></span>
			</div>
			<div class="panel-body">
				<form class="form-horizontal validateform" id="modifyserverform">
					<input type="hidden" id="id" name="id"
						value="<s:property value="oneServer.id"/>" />
					<!-- 服务器id -->
					<div class="control-group">
						<label class="control-label" for="serverId"><s:text
								name="gccp.server.serverId" /></label>
						<div class="controls">
							<input type="text" id="serverId" name="serverId"
								value="<s:property value="oneServer.serverId"/>"
								placeholder="<s:text name="gccp.server.serverId"/>" />
						</div>
					</div>
					<!-- 服务器iP -->
					<div class="control-group">
						<label class="control-label" for="serverIp"><s:text
								name="gccp.server.serverIp" /></label>
						<div class="controls">
							<input type="text" id="serverIp" name="serverIp"
								value="<s:property value="oneServer.serverIp"/>"
								placeholder="<s:text name="gccp.server.serverIp"/>">
						</div>
					</div>
					<!-- 连接游戏端口 -->
					<div class="control-group">
						<label class="control-label" for="socketPort"><s:text
								name="gccp.server.socketPort" /></label>
						<div class="controls">
							<input type="text" id="socketPort" name="socketPort"
								value="<s:property value="oneServer.socketPort"/>"
								placeholder="<s:text name="gccp.server.socketPort"/>">
						</div>
					</div>
					<!-- 服务器名 -->
					<div class="control-group">
						<label class="control-label" for="serverName"><s:text
								name="gccp.server.serverName" /></label>
						<div class="controls">
							<input type="text" id="serverName" name="serverName"
								class="required"
								value="<s:property value="oneServer.serverName"/>"
								placeholder="<s:text name="gccp.server.serverName" />" />
						</div>
					</div>
					<!-- 区 -->
					<div class="control-group">
						<label class="control-label" for="platformId"><s:text
								name="gccp.common.quname" /></label>
						<div class="controls">
							<select name="areaId" id="areaId">
								<s:iterator value="areasList" id="arealist">
									<s:if
										test="%{oneServer.areaId==#arealist.getId()}">
										<option selected="selected"
											value="<s:property value="#arealist.getId()"/>"><s:property
												value="#arealist.getDescrible()" /></option>
									</s:if>
									<s:else>
										<option
											value="<s:property value="#arealist.getId()"/>"><s:property
												value="#arealist.getDescrible()" /></option>
									</s:else>
								</s:iterator>
							</select>
						</div>
					</div>
					<!-- 数据库用户名 -->
					<div class="control-group">
						<label class="control-label" for="dbUsername"><s:text
								name="gccp.server.dbUsername" /></label>
						<div class="controls">
							<input type="text" id="dbUsername" name="dbUsername"
								value="<s:property value="oneServer.dbUsername"/>"
								placeholder="<s:text name="gccp.server.dbUsername"/>">
						</div>
					</div>
					<!-- 数据库密码 -->
					<div class="control-group">
						<label class="control-label" for="dbPassword"><s:text
								name="gccp.server.dbPassword" /></label>
						<div class="controls">
							<input type="text" id="dbPassword" name="dbPassword"
								value="<s:property value="oneServer.dbPassword"/>"
								placeholder="<s:text name="gccp.server.dbPassword"/>">
						</div>
					</div>
					<!-- 游戏数据库IP -->
					<div class="control-group">
						<label class="control-label" for="gamedbip"><s:text
								name="gccp.server.gamedbip" /></label>
						<div class="controls">
							<input type="text" id="gamedbip" name="gamedbip" class="required"
								value="<s:property value="oneServer.gamedbip"/>"
								placeholder="<s:text name="gccp.server.gamedbip"/>">
						</div>
					</div>
					<!-- 游戏数据库端口 -->
					<div class="control-group">
						<label class="control-label" for="gamedbport"><s:text
								name="gccp.server.gamedbport" /></label>
						<div class="controls">
							<input type="text" id="gamedbport" name="gamedbport"
								class="required"
								value="<s:property value="oneServer.gamedbport"/>"
								placeholder="<s:text name="gccp.server.gamedbport"/>">
						</div>
					</div>
					<!-- 游戏库名 -->
					<div class="control-group">
						<label class="control-label" for="gamedbName"><s:text
								name="gccp.server.gamedbName" /></label>
						<div class="controls">
							<input type="text" id="gamedbName" name="gamedbName"
								value="<s:property value="oneServer.gamedbName"/>"
								placeholder="<s:text name="gccp.server.gamedbName"/>">
						</div>
					</div>
					<!-- 验证游戏数据库是否能连接 -->
					<div class="control-group">
						<div class="controls">
							<button type="button" class="btn" id="gamedbVaildateConn"
								onClick="gamedbVaildateConnclick()">
								<s:text name="gccp.server.gamedbVaildateConn" />
							</button>
						</div>
					</div>
					<!-- 日志库IP -->
					<div class="control-group">
						<label class="control-label" for="logdbip"><s:text
								name="gccp.server.logdbip" /></label>
						<div class="controls">
							<input type="text" id="logdbip" name="logdbip"
								value="<s:property value="oneServer.logdbip"/>"
								placeholder="<s:text name="gccp.server.logdbip"/>">
						</div>
					</div>
					<!-- 日志库端口 -->
					<div class="control-group">
						<label class="control-label" for="logdbport"><s:text
								name="gccp.server.logdbport" /></label>
						<div class="controls">
							<input type="text" id="logdbport" name="logdbport"
								value="<s:property value="oneServer.logdbport"/>"
								placeholder="<s:text name="gccp.server.logdbport"/>">
						</div>
					</div>
					<!-- 当前日志库数据库名 -->
					<div class="control-group">
						<label class="control-label" for="logdbName"><s:text
								name="gccp.server.logdbName" /></label>
						<div class="controls">
							<input type="text" id="logdbName" name="logdbName"
								value="<s:property value="oneServer.logdbNam"/>"
								placeholder="<s:text name="gccp.server.logdbName"/>">
						</div>
					</div>
					<!-- 验证日志数据库是否能连接 -->
					<div class="control-group">
						<div class="controls">
							<button type="button" class="btn" id="logdbVaildateConn"
								onClick="logdbVaildateConnclick()">
								<s:text name="gccp.server.logdbVaildateConn" />
							</button>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="button" class="btn btn-info" id="submit">
								<i class="icon-edit icon-white"></i>
								<s:text name="gccp.common.submit" />
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		requiredMarker();
		validateForm();
		$("#submit").click(
				function() {
					if ($("#modifyserverform").valid()) {
						onClickBottom(1, 'modify',
								'../server/serverModify.action', $(
										"#modifyserverform").serialize());
					}
				});

	});
</script>
</html>