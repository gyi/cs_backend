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
	<div>
		<table class="table table-bordered table-hover">
			<s:iterator value="platformsListCRight" id="platformsListCRight">
				<tr>
					<td>
						<s:if test="%{#platformsListCRight.isRight==1}">
							<input type="checkbox" name="checkbox"  checked=true value="<s:property value="platformId" />" onClick="platformRightForm('<s:text name="platfrom.platformId" />', '<s:text name="platfrom.describle" />')"/>
						</s:if> <s:else>
							<input type="checkbox" name="checkbox" value="<s:property value="platformId" />" onClick="platformRightForm('<s:text name="platfrom.platformId" />', '<s:text name="platfrom.describle" />')"/>
						</s:else></td>
					<td><s:property value="platfrom.describle" /></td>
				</tr>
			</s:iterator>
		</table>
	</div>
</body>
<script type="text/javascript">
var platformRight = '<s:property value="right" />';
var describleRight = share.data('describleRight');

function platformRightForm(right, describle) {
	platformRight = platformRight + '[' + right + ']';
	describleRight = describleRight + '[' + describle + ']';
	
	share.data('platformRight', platformRight);
	share.data('describleRight', describleRight);

}
</script>
</html>