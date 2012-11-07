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
		<title>角色列表</title>
		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		<script type="text/javascript" src="oa/js/jquery.js"></script>
		<script type="text/javascript" src="oa/js/drag.js"></script>
		<script type="text/javascript" src="oa/js/moduleChange.js"></script>
		<script type="text/javascript">

    	 function ConfirmDel(roleId,mId){
    	 var userChoice = window.confirm("确认删除该角色？"); 
 		var result = (userChoice == true) ? "确定" : "取消"; 
          if(result=="确定"){
          window.location.href="role.do?method=delRole&id="+roleId+"&mId="+${requestScope.mId };
          
          }else{
            return;
          }
    	 }
     
     </script>
	</head>

	<body>
	${message }
		<div id="all">
		 <div class="head_content" id="headBar"><div class="mainHead navBar"> 
		 <a class="" href="">权限管理</a>
   » 
  <a class="" href="">角色管理</a>
   » 
  <span class="">角色列表</span>
  </div><div style="text-align:center!important" class="finder-head mainHead">
       <div class="span-8">角色名称</div>
       <div class="span-4">优先级</div>
         <div class="span-4">显示的图标</div>
          <c:if test="${requestScope.upd}">
           <div class="span-2">编辑</div>
          </c:if>
       <c:if test="${requestScope.del}">
           <div class="span-2">删除</div>
          </c:if>
       <c:if test="${requestScope.upd}">
           <div class="span-2">修改权限</div>
          </c:if>
   </div></div>
      <div class="main_content" id="main" style="height: 450px; width: 1349px; visibility: visible; opacity: 1;">
<form method="post" id="roleShow" action="">
<div class="finder">

<div style="text-align:center!important" class="finder-list">

<div pid="0" cid="8" id="module1" class="clear_cat row" depath="1">
<c:forEach items="${requestScope.roles}" var="role">
<div class="row-line" style="height:100px;vertical-align:middle;">

  
    <div class="span-8" style="height:100px;">
  <span style="font-weight:normal;padding:0 5px" class="quiet">${role.name }</span>
  </div>
  <div class="span-4" style="height:100px;">
  <span style="font-weight:normal;padding:0 5px" class="quiet">${role.priority }</span>
  </div>
<div class="span-4" style="height:100px;">
  <span style="height:100px" class="quiet"><img width="100px" height="100px" src="${role.picture }"/></span>
  </div>
   <c:if test="${requestScope.upd}">
  <div class="span-2" style="height:100px;">
  <span style="cursor:pointer"  >
  <a href="role.do?method=upRole&id=${role.id }&mId=${requestScope.mId }">
  <img border="none" style="width:16px;height:16px;background-image:url(oa/images/ImageBundle.gif);background-repeat:no-repeat;background-position:0 -139px;" alt="编辑" src="oa/images/transparent.gif"/>
    </a>
  </span>

  </div>
  </c:if>
   <c:if test="${requestScope.del}">
  <div class="span-2" style="height:100px;">
  <span style="cursor:pointer">
   <a href="javascript:ConfirmDel(${role.id },${requestScope.mId });">
       <img border="none" style="width:16px;height:16px;background-image:url(oa/images/ImageBundle.gif);background-repeat:no-repeat;background-position:0 -91px;" alt="删除" src="oa/images/transparent.gif"/>
       </a>
       </span>
  </div>
</c:if>
 <c:if test="${requestScope.upd}">
  <div class="span-2" style="height:100px;">
  <span style="cursor:pointer">
   <a href="role.do?method=findRoleAcl&id=${role.id }&mId=${requestScope.mId }">
   授权
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
