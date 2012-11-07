<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.oa.model.Notice"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>今日公告</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
    <script type="text/javascript" src="oa/js/jquery.js"></script>
	<style type="text/css">
<!--
body{
  font-size:14px;
}
a:link {text-decoration:none; color: #033d61;}
a:visited {text-decoration:none;color:#033d61;}
a:hover {text-decoration:none;}
a:active {text-decoration:none;}
-->
</style>
  </head>
  
  <body>
   <form class="tableform" name="form1" action="" id="form1" method="post">
     <div class="main_content" id="main" style="height: 430px; width: 1352px; visibility: visible; opacity: 1;">
     <div class="division"><div>&nbsp;</div>
     <c:if test="${!empty notices}">
      <table cellspacing="0" cellpadding="0" border="0">
      <tbody>
     <c:forEach items="${notices}" var="notice">
     	  <tr>
     	   <td>(${type })</td>
     	  </tr>
	      <tr>
	         <td style="text-align:center;padding-right:200px;">${notice.subject }&nbsp;
	      </tr>
	       <tr>
	         <td style="text-align:center;padding-right:200px;">${notice.content }</td>       
	      </tr>
	      <c:if test="${notice.describes !=null}">
	       <tr>
	         <td style="text-align:center;padding-right:200px;">${notice.describes }</td>       
	      </tr>
	      </c:if>
	      <c:if test="${notice.describes ==null}">
	      </c:if>
	      <tr>
	         <td style="text-align:right;padding-right:400px;">${orgName }</td>       
	      </tr>
	 	<tr>
	         <td style="text-align:right;padding-right:400px;">${notice.rtime }</td>       
	      </tr>	      
   	 </c:forEach>
   	 </tbody>
   	 </table>
   	 </c:if>
   	 <c:if test="${empty notices}">
   		 <div style="text-align:center;">今日无公告！</div>
   	 </c:if>
   	 </div>
     </div>
    </form>
  </body>
</html>
