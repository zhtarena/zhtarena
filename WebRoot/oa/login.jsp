<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>OA自动办公系统登录页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" type="text/css" href="oa/css/style.css"/>
<script type="text/javascript" src="oa/js/js.js"></script>
  </head>
  
  <body background="oa/images/b.jpg">
   ${message }
  <div align="center" style="margin-top:160px;">
    <table background="oa/images/login.png" width="847px" height="318px">
    <tr><td width="400px"></td><td>
    <form id="login" name="login" action="user/userAction!login" method="post">
  <div id="center" ><div id="center_middle">
      <div class="user">
        <label>用户名：
        <input name="user.username" id="user" />
        <s:property value="#session.noUser"/>
        <s:set scope="session" var="noUser" value=""/>
        </label>
      </div>
      <div class="user">
        <label>密　码：
        <input type="password" name="user.password" id="pwd" />
        <s:property value="#session.wrongPwd"/>
        <s:set scope="session" var="wrongPwd" value=""/>
        </label>
      </div>
    </div>
    <div></div>
    <div id="center_submit" style="margin-top:48px;">
    <div> <img src="oa/images/dl.gif" width="57" height="20" onclick="form_submit();" /> </div>
      <div> <img src="oa/images/cz.gif" width="57" height="20" onclick="form_reset();"/> </div>
      
    </div>
    <div id="center_right"></div>
  </div>
</form>
    </td></tr>
    </table>
    </div>
  </body>
</html>
