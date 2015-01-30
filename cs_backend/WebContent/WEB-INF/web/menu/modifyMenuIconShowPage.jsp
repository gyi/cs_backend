<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<script type="text/javascript"
	src="/${systemName}/static/artDialog/jquery.layout.min.js"></script>
</head>
<body>

	<div class="ui-layout-center" style="min-width: 400px;">
		<div class="flowheight"></div>
		<div id="iconChooseContent" class="container-fluid">
			<ul class="nav nav-tabs" id="myTab">
				<li class="active"><a href="#defaultIcon" data-toggle="tab"><s:text
							name="gccp.menu.default" /></a></li>
				<li><a href="#defineIcon" data-toggle="tab"><s:text
							name="gccp.menu.define" /></a></li>
			</ul>
			<table>
				<tr>
					<th>
						<div class="tab-content" style="margin-top: 0px;">
							<div class="tab-pane active" id="defaultIcon"
								style="height: 226px;">
								<table>
									<s:iterator value="icons" status="st">
										<s:if test="!#st.First&&#st.index%7==0">
											</tr>
										</s:if>
										<s:if test="!#st.Last&&#st.index%7==0">
											<tr>
										</s:if>
										<th>
											<div id="imgDiv_<s:property value="#st.index+1"/>"
												class="imgDiv"
												style="margin: 5px, 5px, 5px, 5px; border: 3px solid #CCCCCC; width: 40px; height: 39px;">
												<img id="img_<s:property value="#st.index+1"/>"
													src="<s:property value="url"/>"
													alt="<s:property value="name"/>" class="img-polaroid"
													width="30" height="30">
											</div>
										</th>

									</s:iterator>
								</table>
							</div>
							<div class="tab-pane" id="defineIcon">
								<div class="controls">
									<input type="file" id="iconfile" name="file"
										onchange="showIcon()" style="display: none;"> <input
										id="iconUrl" type="text" disabled>
									<button type="button" class="btn" onclick="fileclick()">
										<s:text name="gccp.menu.view" />
									</button>
									<button type="button" class="btn" id="uploadIcon"
										onclick="uploadIconBtn()">
										<s:text name="gccp.menu.upload" />
									</button>
								</div>
							</div>
						</div>
					</th>
					<th>
						<div style="padding-left: 20px; margin-top: 0px;">
							<div class="flowheight"></div>
							<div id="iconShowContent" style="padding-bottom: 20px;">
								<img src="<s:property value="oneMenu.icon" />"
									style="width: 16px; height: 16px;"
									class="img-polaroid menuIcon">
							</div>
							<div id="iconShowContent" style="padding-top: 20px;">
								<img src="<s:property value="oneMenu.icon" />"
									style="width: 80px; height: 80px;"
									class="img-polaroid menuIcon">
							</div>

						</div>
					</th>
				</tr>
			</table>
		</div>
	</div>



</body>
<script type="text/javascript">
	$(function() {
		$("body").layout({
			applyDefaultStyles : true,//应用默认样式  
			north__closable : false,//可以被关闭 
			resizable : false,//可以改变大小 
		});

		$(".imgDiv").live('click', function() {
			var imgDiv = document.getElementsByClassName("imgDiv");
			for (var i = 0; i < imgDiv.length; i++) {
				imgDiv[i].style.border = "3px solid #CCCCCC";
			}
			this.style.border = "3px solid #FFAA33";
			var chooseIcon = $(this).attr("id").split("_")[1];
			$(".menuIcon").attr("src", $("#img_" + chooseIcon).attr("src"));
			submitIcon();
		});
	});

	function submitIcon() {
		share.removeData('menuIcon');
		share.data('menuIcon', $(".menuIcon").attr("src"));

	}

	function fileclick() {
		$("#iconfile").click();

	}

	function showIcon() {
		$("#iconUrl").val($("#iconfile").val());
	}

	function uploadIconBtn() {
		$.ajaxFileUpload({
			//用于文件上传的服务器端请求地址
			url : '../menu/uploadIconCache.action',
			//一般设置为false
			secureuri : false,
			//文件上传空间的id属性  <input type="file" id="file" name="file" />
			fileElementId : 'iconfile',
			//返回值类型 一般设置为json
			dataType : 'jsonp',
			//服务器成功响应处理函数
			success : function(data, status) {
				data = data.replace(/<\/?[^>]*>/g, ''); //去除HTML tag
				data = data.replace(/[ | ]*\n/g, '\n'); //去除行尾空白
				data = eval('(' + data + ')');
				//从服务器返回的json中取出message中的数据,其中message为在struts2中定义的成员变量
				if (data.result != null && data.result) {
					$(".menuIcon").attr(
							"src",
							"../static/ztree/css/zTreeStyle/img/define/"
									+ data.fileFileName);
					submitIcon();
					art.dialog.tips(gccp_common_uploaded);
				}
			},
			error : function(data, status, e) {
				art.dialog.tips(gccp_common_uploaderror);
			}
		});
	}
</script>
</html>