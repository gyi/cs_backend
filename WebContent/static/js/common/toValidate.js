
/**
 * 验证方法
 */
jQuery.validator.addMethod("charandnum", function(value, element) {
	return this.optional(element) || /^[A-Za-z0-9]+$/.test(value);
}, null);

/**
 * 表单验证
 */
function validateForm() {
	$(".validateform").validate({
		errorPlacement : function(error, element) {
			error.appendTo(element.parent("div").next("div"));
		},
		onfocusout : function(element) {
			$(element).valid();
		},
		focusInvalid : false,
		focusCleanup : true,
		rules : {
			userName : {
				required : true,
				maxlength : 38,
				charandnum : true
			},
			passWord : {
				required : true,
				minlength : 6,
				maxlength : 16
			},
			confrimPwd : {
				required : true,
				equalTo : "#passWord"
			},
			
			menuName : {
				required : true,
				maxlength : 38
			},
			url : {
				maxlength : 38
			},
			describle : {
				maxlength : 140
			},
			roleName : {
				required : true,
				maxlength : 38
			},
			platformName : {
				required : true,
				maxlength : 38
			},
			exchangeRate : {
				max : 100000,
				min : 0,
				required : true,
				number : true
			},
			realRate : {
				max : 100000,
				min : 0,
				required : true,
				number : true
			}

		},
		messages : {
			required : gccp_common_required,
			charandnum : gccp_common_charandnum,
			userName : {
				required : gccp_common_required,
				maxlength : jQuery.format(gccp_common_maxlength + "{0}"),
				charandnum : gccp_common_charandnum
			},
			oldPassWord : {
				required : gccp_common_required,
				minlength : jQuery.format(gccp_common_minlength + "{0}"),
				maxlength : jQuery.format(gccp_common_maxlength + "{0}"),
			},
			passWord : {
				required : gccp_common_required,
				minlength : jQuery.format(gccp_common_minlength + "{0}"),
				maxlength : jQuery.format(gccp_common_maxlength + "{0}"),
				charandnum : gccp_common_charandnum
			},
			confrimPwd : {
				required : gccp_common_required,
				maxlength : jQuery.format(gccp_common_maxlength + "{0}"),
				equalTo : gccp_common_equalTo
			},
			menuName : {
				maxlength : jQuery.format(gccp_common_maxlength + "{0}"),
				required : gccp_common_required
			},
			roleName : {
				maxlength : jQuery.format(gccp_common_maxlength + "{0}"),
				required : gccp_common_required
			},
			platformName : {
				maxlength : jQuery.format(gccp_common_maxlength + "{0}"),
				required : gccp_common_required
			},
			exchangeRate : {
				maxlength : jQuery.format(gccp_common_maxlength + "{0}"),
				max : jQuery.format(gccp_common_maxsize + "{0}"),
				required : gccp_common_required,
				number : gccp_common_number
			},
			realRate : {
				maxlength : jQuery.format(gccp_common_maxlength + "{0}"),
				max : jQuery.format(gccp_common_maxsize + "{0}"),
				required : gccp_common_required,
				number : gccp_common_number
			}
		}
	});
	/*
	 * $("#reset").click(function(){ $("#addmenuform").validate().resetForm();
	 * });
	 */
}
// 如果是必填的，则加红星标识.
function requiredMarker() {
	$("form :input.required").each(function() {
		var $required = $("<strong class='high'>*</strong>"); // 创建元素
		$(this).parent().append($required); // 然后将它追加到文档中
	});
}