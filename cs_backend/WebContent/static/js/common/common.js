//将json对象转换为json字符串数据
function convertJSONObject2JSON(data, colums, ztree) {
	if (data == null || data.length == 0 || colums.length == 0
			|| ztree.length == 0 || colums.length != ztree.length) {
		return;
	}

	var result = "[";
	for (var i = 0; i < data.length; i++) {
		var rowsLine = data[i];
		result += "{\"open\":\"true\",";
		for (var j = 0; j < colums.length; j++) {
			var col = colums[j];
			var treecol = ztree[j];
			var val = rowsLine[col] == undefined ? "" : rowsLine[col];
			result += '\"' + treecol + '\":\"' + val + '\"';
			if (colums.length != j + 1) {
				result += ",";
			}
		}
		result += "}";
		if (data.length != i + 1) {
			result += ",";
		}
	}

	result += "]";
	var json = JSON.parse(result);
	return json;
}

// 根据传入数据在网页中生成表，data-数据，title-网页的表头，column-数据Key
function createTable(data, title, colnum) {
	if (title.length != colnum.length) {
		return "";
	} else {
		var table = "<table class='table table-bordered  table-striped table-hover' ><thead><tr>";
		for (var i = 0; i < title.length; i++) {
			table = table + "<th>" + title[i] + "</th>";
		}
		table += "</tr></thead><tbody>";
		for (var i = 0; i < data.length; i++) {
			table += "<tr>";
			var res = data[i];
			for (var j = 0; j < colnum.length; j++) {
				var value = typeof (res[colnum[j]]) == "undefined" ? ""
						: res[colnum[j]];
				table += "<td>" + value + "</td>";
			}
			table += "</tr>";
		}

		if (data.length == 0) {
			table += "<tr> <td colspan=" + title.length + ">Empty !</td></tr>";
		}

		table += "</tbody></table>";
		return table;
	}

}

var isEmptyValue = function(value) {

	var type;
	if (value == null) { // 等同于 value === undefined || value === null
		return true;
	}
	type = Object.prototype.toString.call(value).slice(8, -1);
	switch (type) {
	case 'String':
		return !$.trim(value);
	case 'Array':
		return !value.length;
	case 'Object':
		return $.isEmptyObject(value); // 普通对象使用 for...in 判断，有 key 即为 false
	default:
		return false; // 其他对象均视作非空
	}
};

var createAlert=function(type, msg){
	return "<div class='alert alert-" + type + "'>" + msg + "</div>" ;
};

function in_array(array, e) {
	for (var i = 0; i < array.length; i++) {
		if (array[i] == e)
			return true;
	}
	return false;
}

function createCommonTable(data) {
	var table;
	var attrs = new Array();
	for (var i = 0; i < data.length; i++) {
		for ( var attr in data[i]) {
			// alert(attr);
			if (!in_array(attrs, attr)) {
				attrs.push(attr);
			}
		}
	}
	table = "<table class='table table-bordered  table-striped table-hover' ><thead><tr class='info'>";
	for (var i = 0; i < attrs.length; i++) {
		table = table + "<th>" + attrs[i] + "</th>";
	}
	table += "</tr></thead><tbody>";
	for (var i = 0; i < data.length; i++) {
		table += "<tr>";
		var res = data[i];
		table += '<td><input type="checkbox" name="checkbox" value="checkbox" OnCheckedChanged="onClickMenu(this,res[attrs[0]] />")"></td>';
		for (var j = 0; j < attrs.length; j++) {
			var value = typeof (res[attrs[j]]) == "undefined" ? ""
					: res[attrs[j]];
			table += "<td>" + value + "</td>";
		}
		table += "</tr>";
	}
	table += "</tbody></table>";
	return table;
}

$(document).ajaxComplete(function(event, request, settings) {
	if (request.status == 911) {
		window.location.href = "../index/index.action";
	}
	var list = art.dialog.list['loading'];
	if (!isEmptyValue(list)) {
		list.close();
	}
});

self.loading = function() {
	art.dialog({
		id : "loading",
		padding : 0,
		width : 200,
		height : 80,
		title : false,
		content : '<p>' + gccp_common_loading + '...</p>',
		lock : true,
		cancel : false
	});
};

// $(document).ajaxError(function(event, request, settings){
// if(request.status == 601 || request.status == 602){
// if (self != top) {
// window.open("../index/index.action","_top");
// }
// }else{
// window.open("../index/index.action");
// }
// });

$(document).ajaxStart(function() {
	self.loading();
});

function closeList() {
	var list = art.dialog.list;
	for ( var i in list) {
		list[i].close();
	}
}

/**
 * 共享数据
 */
var share = {

	/**
	 * 跨框架数据共享接口
	 * 
	 * @param {String}
	 *            存储的数据名
	 * @param {Any}
	 *            将要存储的任意数据(无此项则返回被查询的数据)
	 */
	data : function(name, value) {
		var top = window.top, cache = top['_CACHE'] || {};
		top['_CACHE'] = cache;

		return value !== undefined ? cache[name] = value : cache[name];
	},

	/**
	 * 数据共享删除接口
	 * 
	 * @param {String}
	 *            删除的数据名
	 */
	removeData : function(name) {
		var cache = window.top['_CACHE'];
		if (cache && cache[name])
			delete cache[name];
	}

};

function gamedbVaildateConnclick() {
	onClickBottom(1, 'validateConn', '../server/serverValidateConn.action', {
		dbIp : $("#gamedbip").val(),
		dbPort : $("#gamedbport").val(),
		dbName : $("#gamedbName").val(),
		dbUsername : $("#dbUsername").val(),
		dbPassword : $("#dbPassword").val()
	});
}
function logdbVaildateConnclick() {
	onClickBottom(1, 'validateConn', '../server/serverValidateConn.action', {
		dbIp : $("#gamedbip").val(),
		dbPort : $("#gamedbport").val(),
		dbName : $("#gamedbName").val(),
		dbUsername : $("#dbUsername").val(),
		dbPassword : $("#dbPassword").val()
	});
}

// 隐藏
function toHiddle() {
	if ($("#toHiddle").is(":hidden")) {
		$("#toHiddle").show();
		$("#hiddleHit").html("[" + gccp_common_hiddlehit + "]");
	} else if ($("#toHiddle").is(":visible")) {
		$("#toHiddle").hide();
		$("#hiddleHit").html("[" + gccp_common_showhit + "]");
	}
}

/*function fileclick() {
	$("#iconfile").click();
	
}

function showIcon(){
	//var img = $("#iconfile").val();
	//window.open(img);
    //$("#iconshow").attr("src", "F:\workspace\maveneclipse\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\cs_backend\static\ztree\css\zTreeStyle\img\diy\1_close.png");
	$("#iconUrl").val($("#iconfile").val());
}

function uploadIconBtn(){
	art.dialog({
	    content: gccp_common_isupload,
	    ok: function () {
	    	$.ajaxFileUpload({
	        	//用于文件上传的服务器端请求地址
	            url:'../menu/uploadIconCache.action',
	            //一般设置为false
	            secureuri:false,
	          	//文件上传空间的id属性  <input type="file" id="file" name="file" />
	            fileElementId:'iconfile',
	          	//返回值类型 一般设置为json
	            dataType: 'jsonp',
	          	//服务器成功响应处理函数
	            success: function (data, status){
	            	data = data.replace(/<\/?[^>]*>/g,''); //去除HTML tag
	            	data = data.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
	            	data = eval('(' + data + ')');
	                //从服务器返回的json中取出message中的数据,其中message为在struts2中定义的成员变量
	                if(data.result!=null&&data.result){
	                	$("#iconshow").attr("src", "../static/ztree/css/zTreeStyle/img/diy/cache/"+data.fileFileName);
		                $("#fileFileName").val(data.fileFileName);
		            	art.dialog.tips(gccp_common_uploaded);
	                }
	            },
	            error: function (data, status, e){
	            	art.dialog.tips(gccp_common_uploaderror);
	            }
	        });
	    },
	    cancelVal: '关闭',
	    cancel: true //为true等价于function(){}
	});
}*/


