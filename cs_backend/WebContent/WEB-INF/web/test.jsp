<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>get file input full path</title>
<script type="text/javascript" src="/${systemName}/static/artDialog/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/${systemName}/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" language='javascript'>
	function getFullPath(obj) {
		var newPreview = document.getElementById("img");
		if (obj) {
			//ie 
			if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
				obj.select();
				newPreview.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);";
				newPreview.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = document.selection
						.createRange().text;
				return;
			}
			//firefox 
			else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
				if (obj.files) {
					newPreview.src = window.URL.createObjectURL(obj.files
							.item(0));
					return;
				}
				newPreview.src = obj.value;
				return;
			}
			newPreview.src = obj.value;
			return;
		}
	}
</script>
<link href="/${systemName}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>
	
</body>
</html>

