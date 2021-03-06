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
				<form class="form-horizontal validateform" id="modifyplatformform">
					<input type="hidden" id="platformId" name="platformId"
						value="<s:property value="onePlatform.platformId"/>"/>
					<div class="control-group">
						<label class="control-label"><s:property value="result"/></label>
					</div>
					<!-- 平台名 -->
					<div class="control-group">
						<label class="control-label" for="platformName"><s:text
								name="gccp.platform.name" /></label>
						<div class="controls">
							<input type="text" id="platformName" name="platformName"
								class="required"
								value="<s:property value="onePlatform.platformName"/>"
								placeholder="<s:text name="gccp.platform.name" />" />
						</div>
						<div class='controls'>
							<s:fielderror cssStyle="color:red">
								<s:param>platformName</s:param>
							</s:fielderror>
						</div>
					</div>
					<!-- 权限 -->
					<div class="control-group">
						<label class="control-label"><s:text
								name="gccp.platform.right" /></label>
						<div class="controls" id="rightDiv">
							<label class="col-sm-2" id="describleRight">
								<s:property value="describleOfRight" />
							</label> 
							<input type="hidden" id="platformRight" name="platformRight"
								value="<s:property value="onePlatform.platformRight"/>" />
						</div>
						<div class="controls">
							<button type="button" class="btn" id="chooseRightBtn"
								onClick="chooseTheRightBtn()">
								<s:text name="gccp.platform.chooseRight" />
							</button>
						</div>
					</div>
					<!-- 游戏汇率 -->
					<div class="control-group">
						<label class="control-label" for="exchangeRate"><s:text
								name="gccp.platform.exchangeRate" /></label>
						<div class="controls">
							<input type="text" id="exchangeRate" name="exchangeRate"
								class="required"
								value="<s:property value="onePlatform.exchangeRate"/>"
								placeholder="<s:text name="gccp.platform.exchangeRate"/>" />
						</div>
						<div class='controls'>
							<s:fielderror cssStyle="color:red">
								<s:param>exchangeRate</s:param>
							</s:fielderror>
						</div>
					</div>
					<!-- 当地汇率 -->
					<div class="control-group">
						<label class="control-label" for="realRate"><s:text
								name="gccp.platform.realRate" /></label>
						<div class="controls">
							<input type="text" id="realRate" name="realRate" class="required"
								value="<s:property value="onePlatform.realRate"/>"
								placeholder="<s:text name="gccp.platform.realRate"/>" />
						</div>
						<div class='controls'>
							<s:fielderror cssStyle="color:red">
								<s:param>realRate</s:param>
							</s:fielderror>
						</div>
					</div>
					<!-- 描述 -->
					<div class="control-group">
						<label class="control-label" for="describle"><s:text
								name="gccp.platform.describle" /></label>
						<div class="controls">
							<textarea rows="5" cols="5" id="describle" name="describle"
								placeholder="<s:text name="gccp.platform.describle"/>"><s:property
									value="onePlatform.describle" /></textarea>
						</div>
						<div class='controls'>
							<s:fielderror cssStyle="color:red">
								<s:param>describle</s:param>
							</s:fielderror>
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
	var platformRight = "";
	var describleRight = "";
	$(function() {
		requiredMarker();
		validateForm();
		$("#submit").click(
				function() {
					if ($("#modifyplatformform").valid()) {
						onClickBottom(1, 'modify',
								'../platform/platformModify.action', $(
										"#modifyplatformform").serialize());
					}
				});

	});

	function chooseTheRightBtn() {
		var right = $("#platformRight").val();
		platformRight = right;
		describleRight = $("#describleRight").text();
		share.data('describleRight', describleRight);
		art.dialog.load('../platform/showPlatformRightList.action?right='+ right,
			{title : gccp_common_choose,
				ok : function(topWin) {
					$("#rightDiv").html("") ;
					$("#rightDiv").html('<label class="col-sm-2" id="describleRight">'+ share.data('describleRight')+ '</label>'
										+'<input type="hidden" id="platformRight" name="platformRight" value="'+ share.data('platformRight')+'"/>');
					share.removeData('platformRight');
					share.removeData('describleRight');
					//art.dialog('hello world');
				},
				close : function() {
					//art.dialog.tips('close')
				}
			}, true);

	}

	function platformRightForm(obj, right, describle) {
		//alert(platformRight+'['+right+']');
		if (obj.checked) {
			platformRight = platformRight + '[' + right + ']';
			describleRight = describleRight + '[' + describle + ']';
		} else {
			platformRight = platformRight.replace('[' + right + ']', '');
			describleRight = describleRight.replace('[' + describle + ']', '');
		}

		share.data('platformRight', platformRight);
		share.data('describleRight', describleRight);

	}
</script>
</html>