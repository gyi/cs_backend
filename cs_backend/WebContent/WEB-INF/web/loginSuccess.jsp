<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
    <%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="gccp.common.program" /></title>
<jsp:include page="include.jsp"></jsp:include>
<style type="text/css">
	.flowheight{
		margin-top: 50px ;
	}
	.error{
		color: red ;
	}
	.high{
		color: red ;
	}
</style>

<script type="text/javascript">

	$(function(){
		$("#modifypsd").live("click",
				function() {
					var userId = $('#userId').val();
					onClickBottom(0, 'modify',
							'../admin/modifyPasswordShowPage.action', {userId:userId});
				});
		
		$(".menuSecond").live("click",function(){
			var obj = $(this) ;
			var value = obj.attr("value") ;
			$.post("/${systemName}/login/findMenuModule.action", {menuId: value}, 
					function(data, textStatus){
						$("#menuContent").html(data) ;
						$(".menuSecond").removeClass("active") ;
						obj.addClass("active") ;
					}) ;
		}) ;
		
		$("#switchWindow").live("click", function() {
			var state = $(this).attr("value") ;
			page(state) ;
		}) ;
		
		  $(".pagination").live("click",function() {
			  var index = $(this).attr("index") ;
			  var obj = $(".dock-pagination") ;
			  var className = obj.attr("class") ;
			  var passIndex = className.substring(className.length-1,className.length) ;
			  obj.removeClass().addClass("dock-pagination current-pagination-" + index) ;
			  $('#desk-' + passIndex).animate({'left':-1920},'normal',function(){
				  $(this).css('left', 1920);
                $('#desk-' + index).animate({'left':0}, 'normal');
            }) ;
		  }) ;
		  
		  /* $(".appbtn").live("click", function(){
			  var data = $(this).attr("appid") ;
			  var title = $(this).attr("title") ;
			  art.dialog.open("/${systemName}/manage/manage.action?id="+data , {id : data,title: title, width:1280, height:782}) ;
		  }) ; */
		  
		  $("#setting").live("click", function(){
			  if($("#startmenu-container").css("display")=="block"){
				  $("#startmenu-container").css("display", "none") ;
			  }else {
				  $("#startmenu-container").css("display", "block") ;
			  }
		  }) ;
		  
	    $(".close").live("click", function(){
			 $("#copyright").css("display", "none") ;
			 $("#maskbox-copyright").css("display", "none") ;
		 });
		 
		 $(".exit").live("click",function(){
				 $("#copyright").css("display", "block") ;
				 $("#maskbox-copyright").css("display", "block") ;
		 });
		 
		 $("#closeBtnSession").live("click", function(){
			 window.location.href="../login/loginOut.action" ;
		 });
		 
		 page('<shiro:principal property="model"/>') ;
	}) ;
	
	function page(state){
		var dialog = art.dialog({
		    lock: true,
		    background: '#600', // 背景色
		    opacity: 0.87,	// 透明度
		    content: '<s:text name="gccp.common.loadswitch"/>',
		    icon: 'face-smile',
		    cancel: false,
		    drag: false
		});
		$.ajax({
			type: "POST",
			url : "/${systemName}/login/desktopPage.action",
			global:false,
			data: "state=" + state,
			success: function(data, textStatus){
				$("body").html("") ;
				$("body").html(data) ;
			}
		}) ;
	}
	
</script>
</head>
<body>
</body>
</html>