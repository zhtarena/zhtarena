<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

		<title>My JSP 'index.jsp' starting page</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="StyleSheet" href="oa/css/dtree.css" type="text/css" />
		<script type="text/javascript" src="oa/js/dtree.js"></script>
		
	</head>

	<body>
		<div class="dtree">

			<p>
				<a href="javascript:;">open all</a> |
				<a href="javascript:;">close all</a>
			</p>

			<s:iterator value="modules" var="m1">
				<s:if test="#m1.pmodule==0">
					<img src="${pageContext.request.contextPath}/oa/${m1.img}" />
					<s:property value="#m1.name" />
					<br />
					<s:iterator value="modules" var="m2">
						<s:if test="#m2.pmodule==#m1.id">
							<s:if test="#m2.isLeaf==1">
								<s:property value="#m2.name" />
							</s:if>
							<s:else>
								<a target="rightFrame" href="${pageContext.request.contextPath}/${m2.url}" onclick=show(${pageContext.request.contextPath}/${m2.url},<s:property value="#m2.name" />)> 
									<s:property value="#m2.name" />
								</a>
							</s:else>
							<br />
							<s:iterator value="modules" var="m3">
								<s:if test="#m3.pmodule==#m2.id">
									<a target="rightFrame" href="${pageContext.request.contextPath}/${m3.url}"> 
										<s:property value="#m3.name" />
									</a>
									<br />
								</s:if>
							</s:iterator>
						</s:if>
					</s:iterator>
				</s:if>




			</s:iterator>

			<%-- 
	<script type="text/javascript">
		<!--
		d = new dTree('d');
		d.add(0,-1,'OA平台');
		<c:forEach items="${modules}" var="module">
		<c:if test = "${module.isLeaf==1}">
		<c:if test = "${empty module.pmodule}">
		d.add(${module.id},0,'${module.name}','${module.url}');
		</c:if>
		<c:if test = "${!empty module.pmodule}">
		d.add(${module.id},${module.pmodule.id},'${module.name}','${module.url}');
		</c:if>
		</c:if> 
		<c:if test = "${module.isLeaf!=1}">
		d.add(${module.id},${module.pmodule.id},'${module.name}','${module.url}&mId=${module.pmodule.id}','','${module.target}','${module.img}');
		</c:if>
		</c:forEach>
		
		document.write(d);
		
		//-->
	</script>
--%>
		</div>
	</body>
</html>
