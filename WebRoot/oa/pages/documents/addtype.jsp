<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addtype.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
  </head>
  
 <body >
 <jsp:include page="/flow.do?method=findAllFlows&mId=${requestScope.mId}" flush="true"></jsp:include>
		 <div class="head_content" id="headBar">
    <div class="mainHead navBar">
<a href="">公文管理</a>
» 
  <a class="" href="">选择公文流程</a>
  </div>
			<c:if test="${!empty flows}">
			<div class="main_content" id="main" align="left"
				style="height: 237px; width: 1215px; visibility: visible; opacity: 1;">
				<div class="tableform">
					<h5>
						请从下列流程中选择
					</h5>
					<div class="division">
						<div align="center" valign="top" id="typeLoding"
							style="visibility: visible; opacity: 1;">
							<c:forEach items="${flows}" var="flow">
							<div style="width: 80px; height: 80px; float: left">
								<a href="oa/pages/documents/add.jsp?flowid=${flow.id }&flowname=${flow.name }"><img
										border="0"
										src="oa/dImgs/custom.gif">
								</a>
								<br>
								<font size="2">${flow.name }</font>
							</div>
							</c:forEach>							
							<div style="clear: both">
								<shopexfeed></shopexfeed>
							</div>
						</div>
					</div>
					<br>
					<br>
					

				</div>
			</div>
			</c:if>
			<c:if test="${empty flows}">
			<h5>
				暂无流程！<br/>
				<a href="flow.do?method=turnSave&mId=${requestScope.mId }">添加流程</a>
			</h5>
			</c:if>
			<div calss="foot_content" id="footBar"></div>
		</div>
	</body>
</html>
