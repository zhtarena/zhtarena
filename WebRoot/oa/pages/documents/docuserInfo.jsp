<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>审批信息</title>

		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="admin/css/admin.css"></link>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="admin/js/drag.js"></script>
			
	</head>


	<body>
	 <c:forEach var="docuser" items="${docusers}" begin="0" end="0">
	<font color='red'>公文  ${docuser.document.name } 的审批历史：</font>	
	</c:forEach>
	<br/>
	<table>
	
	<c:forEach items="${docusers}" var="docuser">
	<fmt:formatDate pattern="yyyy年MM月dd日   HH:mm:ss" value="${docuser.ctime }"
												var="dateline"></fmt:formatDate> <font color="blue">${ dateline}</font>, 该公文被发给 <font color="blue">${docuser.org.name }</font> 的<font color="blue">${docuser.staff.name }</font>
	<c:if test="${!empty docuser.etime}">
	<br/>${docuser.etime },该公文被审批，审批 
	<c:if test="${docuser.status==1}"> <font color="red"> 通过</font></c:if>
	<c:if test="${docuser.status==2}"> <font color="red"> 失败</font></c:if>
	<br/>
	</c:if>
	</c:forEach>
	</table>
	</body>
</html>
