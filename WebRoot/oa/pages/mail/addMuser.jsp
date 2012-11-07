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
		<title>添加邮件用户</title>

		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		<script type="text/javascript" src="oa/js/jquery.js"></script>
		<script type="text/javascript" src="oa/js/drag.js"></script>
		<script type="text/javascript" src="oa/js/moduleChange.js"></script>
	</head>


	<body>
    
      <div class="head_content" id="headBar">
      <div class="mainHead navBar">
<a href="">邮件管理</a>» 
<a href="">开通邮件</a>
</div></div>
      <div class="main_content" id="main" style="height: 400px; width: 1352px; visibility: visible; opacity: 1;">
<form id="muserform" name="muserform" action="mail.do?method=doAddMuser" method="post">
<div class="tableform">
    <div class="division">
      <table cellspacing="0" cellpadding="0" border="0">
        <tbody>
        <tr>
          <th>用户名:</th>
          <td>
          <input type="hidden" value="${requestScope.mId }" name="mId"/>
          ${user.username }
            </td>
        </tr>
          <tr>
          <th>昵称:</th>
          <td>
          <input type="text" name="display_name" value=""/>
            </td>
        </tr>
         <tr>
          <th>默认域名:</th>
          <td>
         <select name="default_domain">
         <option value="qq.com">qq.com</option>
         <option value="yahoo.com">yahoo.com</option>
          <option value="yahoo.com.cn">yahoo.com.cn</option>
         <option value="163.com">163.com</option>
          <option value="sina.com">sina.com</option>
           <option value="sohu.com">sohu.com</option>
         <option value="wang.com">wang.com</option>
         </select>
            </td>
        </tr>
         <tr>
          <th>登陆名:</th>
          <td>
           <input type="text" name="login_name" value=""/>
            </td>
        </tr>
        <tr>
          <th>登陆密码:</th>
          <td>
           <input type="text" name="login_password" value=""/>
            </td>
        </tr>
      
     </tbody>
     </table>
     </div>
     </div>
    <input type="submit" value="开通" name="开通">  </form>
     </div>
     
	</body>
</html>
