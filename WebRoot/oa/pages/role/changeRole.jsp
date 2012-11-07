<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<title>转换角色</title>
		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		<script type="text/javascript" src="oa/js/jquery.js"></script>
		<script type="text/javascript" src="oa/js/drag.js"></script>
		<script type="text/javascript" src="oa/js/moduleChange.js"></script>
	</head>

	<body>
	${message }
		<div id="all">
		 <div class="head_content" id="headBar"><div class="mainHead navBar"> 
		 <a class="" href="">角色转换</a>
  </div><div style="text-align:center!important" class="finder-head mainHead">
       <div class="span-8">角色名称</div>
       <div class="span-4">优先级</div>
         <div class="span-4">显示的图标</div>
           <div class="span-2">确认转换</div>
   </div></div>
      <div class="main_content" id="main" style="height: 500px; width: 1349px; visibility: visible; opacity: 1;">
<form method="post" id="roleShow" action="">
<div class="finder">

<div style="text-align:center!important" class="finder-list">

<div pid="0" cid="8" id="module1" class="clear_cat row" depath="1">
<c:forEach items="${requestScope.uroles}" var="urole">
<div class="row-line" style="height:100px;vertical-align:middle;">

  
    <div class="span-8" style="height:100px;">
  <span style="font-weight:normal;padding:0 5px" class="quiet">${urole.name }</span>
  </div>
  <div class="span-4" style="height:100px;">
  <span style="font-weight:normal;padding:0 5px" class="quiet">${urole.priority }</span>
  </div>
<div class="span-4" style="height:100px;">
  <span style="height:100px" class="quiet"><img width="100px" height="100px" src="${urole.picture }"/></span>
  </div>
  
 <c:if test="${urole.id==role.id}">
  <div class="span-2" style="height:100px;">
  <span style="cursor:pointer">
   当前登录角色
       </span>

  </div>
</c:if>
<c:if test="${urole.id!=role.id}">
  <div class="span-2" style="height:100px;">
  <span style="cursor:pointer">
   <a href="user.do?method=login&roleId=${urole.id }&uId=${user.id}" target="_top">
   转换
       </a>
       </span>

  </div>
</c:if>
 </div>
   
</c:forEach>

</div>
</div>
</div>
  
<input type="hidden" value="1" name="__"></form>
</div>
		</div>

	</body>
</html>
