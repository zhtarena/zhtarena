<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>回复留言列表</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		<script type="text/javascript" src="oa/js/jquery.js">
</script>
		<style type="text/css">
<!--
a:link {
	text-decoration: none;
	color: #033d61;
}

a:visited {
	text-decoration: none;
	color: #033d61;
}

a:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none;
}
-->
</style>
		<script type="text/javascript">
function check(id, mId) {
	var sure = window.confirm("确定删除此回复留言？");
	var result = (sure == true) ? "确定" : "取消";
	if (result == "确定") {
		window.location.href = "bbs.do?method=delReBBS&id=" + id + "&mId="
				+ mId;
	} else {
		return;
	}
}

function subPage(pageNo) {
		 document.form1.elements['pageNo'].value=pageNo;
		 document.form1.submit();
	 }
</script>
	</head>
	<body>
		<form class="tableform" name="form1" action="bbs/bbsAction!load"
			id="form1" method="post">
			<input type="hidden"  name="pageNo" />
			<input type="hidden" name="id" value="${bbs.id}"/>
			<div class="main_content" id="main"
				style="height: 530px; visibility: visible; opacity: 1;">
				<div class="division">
					<div>
						&nbsp;
					</div>
					<a
						href="${pageContext.request.contextPath}/oa/pages/bbs/addReBBS.jsp?id=${bbs.id}">[添加新回复留言]</a>&nbsp;&nbsp;&nbsp;
					<a href="bbs/bbsAction!listRoot">[返回留言列表]</a>
					<table cellspacing="0" cellpadding="0" border="0">
						<tbody>


							<th style="text-align: left; height:10px">
								${bbs.uid}
							</th>
							<th style="text-align: left; width: 70%">
								&nbsp;&nbsp;&nbsp;&nbsp;${bbs.subject }
							</th>
							
							<th style="text-align: left;">
								发表时间:
								<br />
								<s:date name="bbs.rtime" format="yyyy-MM-dd hh:mm:ss" />
							</th>
							<th style="text-align: left;">
								删除主题
								<br />
							</th>

							<tr>
								<td>
									
								</td>
								<td style="text-align: left; padding-left: 20px;" colspan="3">
									${bbs.content}
								</td>
							</tr>
							
							<!-- 子贴循环开始 -->
							<s:iterator value="subBbs" var="sb">
								<tr>
									<td></td>
									<td>${sb.subject}</td>
									<td>${sb.uid}</td>
									<td>${sb.rtime}</td>
								</tr>
								<tr>
									<td></td>
									<td colspan="3">${sb.content}</td>
								</tr>
							</s:iterator>
							<!-- 子贴循环结束 -->


						</tbody>
					</table>
					<hr size="5" color="#E1E1E1">

					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="6" width="400">
								&nbsp;
							</td>
							<td class="STYLE4" align="left">
								&nbsp;&nbsp;共有${countPage } 页，当前第 ${pageNo } 页
							</td>
							<td>
								<table border="0" align="right" cellpadding="0" cellspacing="0">
									<tr>
										<td width="40">
								<s:if test="pageNo<=1">
								<a href="javascript:;"><img src="oa/pages/images/first.gif" width="37"
									height="15" /></a>
								</s:if>
								<s:else>
								<a href="javascript:subPage(1);"><img src="oa/pages/images/first.gif" width="37"
									height="15" /></a>
								</s:else>
							</td>
							
							<td width="45">
							
								<s:if test="pageNo<=1">
								<a href="javascript:;"><img src="oa/pages/images/back.gif" width="37"
									height="15" /></a>
								</s:if>
								<s:else>
								<a href="javascript:subPage(<s:property value="pageNo-1"/>);"><img src="oa/pages/images/back.gif" width="43"
									height="15" /></a>
								</s:else>
							</td>
							<td width="45">
								<s:if test="pageNo>=countPage">
								<a href="javascript:;"><img src="oa/pages/images/next.gif" width="37"
									height="15" /></a>
								</s:if>
								<s:else>
								<a href="javascript:subPage(<s:property value="pageNo+1"/>);"><img src="oa/pages/images/next.gif" width="43"
									height="15" /></a>
								</s:else>
							</td>
							<td width="40">
							<s:if test="pageNo>=countPage">
								<a href="javascript:;"><img src="oa/pages/images/last.gif" width="37"
									height="15" /></a>
								</s:if>
								<s:else>
								<a href="javascript:subPage(<s:property value="countPage"/>);"><img src="oa/pages/images/last.gif" width="37"
									height="15" /></a>
									</s:else>
							</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
      			<s:if test="subBbs==null">
					<tr>
						<td colspan="2" style="text-align: center;">
							无任何数据！
						</td>
					</tr>
				</s:if>
				</div>
			</div>
		</form>
	</body>
</html>
