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
	<div id="main" class="container-fluid span8">
		<div class="panel panel-success">
			<div class="panel-heading"><span><s:text name="gccp.common.add" /></span></div>
			<form class="form-horizontal validateform panel-body" id="addserverform" method="post">
				<!-- 服务器id -->
				<div class="control-group">
					<label class="control-label" for="serverId"><s:text
							name="gccp.server.serverId" /></label>
					<div class="controls">
						<input type="text" id="serverId" name="serverId" class="required"
							placeholder="<s:text name="gccp.server.serverId"/>">
					</div>
					<div class='controls'></div>
				</div>
				<!-- 服务器iP -->
				<div class="control-group">
					<label class="control-label" for="serverIp"><s:text
							name="gccp.server.serverIp" /></label>
					<div class="controls">
						<input type="text" id="serverIp" name="serverIp" class="required"
							placeholder="<s:text name="gccp.server.serverIp"/>">
					</div>
					<div class='controls'></div>
				</div>
				<!-- 连接游戏端口 -->
				<div class="control-group">
					<label class="control-label" for="socketPort"><s:text
							name="gccp.server.socketPort" /></label>
					<div class="controls">
						<input type="text" id="socketPort" name="socketPort" class="required"
							placeholder="<s:text name="gccp.server.socketPort"/>">
					</div>
					<div class='controls'></div>
				</div>
				<!-- 服务器名 -->
				<div class="control-group">
					<label class="control-label" for="serverName"><s:text
							name="gccp.server.serverName" /></label>
					<div class="controls">
						<input type="text" id="serverName" name="serverName"
							class="required"
							placeholder="<s:text name="gccp.server.serverName" />">
					</div>
					<div class='controls'></div>
				</div>
				<!-- 区  -->
				<div class="control-group">
					<label class="control-label" for="platformId"><s:text
							name="gccp.common.quname" /></label>
					<div class="controls">
						<select name="areaId" id="areaId">
							<s:iterator value="areasList" id="areaList">
								<option
									value="<s:property value="#areaList.getId()"/>"><s:property
										value="#areaList.getDescrible()" /></option>
							</s:iterator>
						</select>
					</div>
				</div>
				<!-- 数据库用户名 -->
				<div class="control-group">
					<label class="control-label" for="dbUsername"><s:text
							name="gccp.server.dbUsername" /></label>
					<div class="controls">
						<input type="text" id="dbUsername" name="dbUsername" class="required"
							placeholder="<s:text name="gccp.server.dbUsername"/>">
					</div>
					<div class='controls'></div>
				</div>
				<!-- 数据库密码 -->
				<div class="control-group">
					<label class="control-label" for="dbPassword"><s:text
							name="gccp.server.dbPassword" /></label>
					<div class="controls">
						<input type="text" id="dbPassword" name="dbPassword" class="required"
							placeholder="<s:text name="gccp.server.dbPassword"/>">
					</div>
					<div class='controls'></div>
				</div>
				<!-- 游戏数据库IP -->
				<div class="control-group">
					<label class="control-label" for="gamedbip"><s:text
							name="gccp.server.gamedbip" /></label>
					<div class="controls">
						<input type="text" id="gamedbip" name="gamedbip" class="required"
							placeholder="<s:text name="gccp.server.gamedbip"/>">
					</div>
					<div class='controls'></div>
				</div>
				<!-- 游戏数据库端口 -->
				<div class="control-group">
					<label class="control-label" for="gamedbport"><s:text
							name="gccp.server.gamedbport" /></label>
					<div class="controls">
						<input type="text" id="gamedbport" name="gamedbport"
							class="required"
							placeholder="<s:text name="gccp.server.gamedbport"/>">
					</div>
					<div class='controls'></div>
				</div>
				<!-- 游戏库名 -->
				<div class="control-group">
					<label class="control-label" for="gamedbName"><s:text
							name="gccp.server.gamedbName" /></label>
					<div class="controls">
						<input type="text" id="gamedbName" name="gamedbName" class="required"
							placeholder="<s:text name="gccp.server.gamedbName"/>">
					</div>
					<div class='controls'></div>
				</div>
				<!-- 验证游戏数据库是否能连接 -->
				<div class="control-group">
					<div class="controls">
						<button type="button" class="btn" id="gamedbVaildateConn" onClick="gamedbVaildateConnclick()">
							<s:text name="gccp.server.gamedbVaildateConn" />
						</button>
					</div>
				</div>
				<!-- 日志库IP -->
				<div class="control-group">
					<label class="control-label" for="logdbip"><s:text
							name="gccp.server.logdbip" /></label>
					<div class="controls">
						<input type="text" id="logdbip" name="logdbip" class="required"
							placeholder="<s:text name="gccp.server.logdbip"/>">
					</div>
					<div class='controls'></div>
				</div>
				<!-- 日志库端口 -->
				<div class="control-group">
					<label class="control-label" for="logdbport"><s:text
							name="gccp.server.logdbport" /></label>
					<div class="controls">
						<input type="text" id="logdbport" name="logdbport" class="required"
							placeholder="<s:text name="gccp.server.logdbport"/>">
					</div>
					<div class='controls'></div>
				</div>
				<!-- 当前日志库数据库名 -->
				<div class="control-group">
					<label class="control-label" for="logdbName"><s:text
							name="gccp.server.logdbName" /></label>
					<div class="controls">
						<input type="text" id="logdbName" name="logdbName" class="required"
							placeholder="<s:text name="gccp.server.logdbName"/>">
					</div>
					<div class='controls'></div>
				</div>
				<!-- 验证日志数据库是否能连接 -->
				<div class="control-group">
					<div class="controls">
						<button type="button" class="btn" id="logdbVaildateConn" onClick="logdbVaildateConnclick()">
							<s:text name="gccp.server.logdbVaildateConn" />
						</button>
					</div>
				</div>
					
				<div class="control-group">
					<div class="controls">
						<button type="button" class="btn btn-info btn-lg" id="submit">
							<i class="icon-plus icon-white"></i>
							<s:text name="gccp.common.submit" />
						</button>
					</div>
				</div>
			</form>

		</div>
	</div>
</body>
<script type="text/javascript">
	var platformRight = "";
	var describleRight = "";
	$(function() {
		requiredMarker();
		validateForm();
		$("#submit").click(
				function() {
					if ($("#addserverform").valid()) {
						onClickBottom(1, 'add', '../server/serverAdd.action', $("#addserverform").serialize());
					}
				});
		
	});
</script>
</html>