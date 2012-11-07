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
		<title>流程信息</title>

		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="admin/css/admin.css"></link>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="admin/js/drag.js"></script>
			
	</head>


	<body>
	<div class="main_content" id="main" style="height: 430px; width: 1352px; visibility: visible; opacity: 1;">

<div class="division">
  <table cellspacing="0" cellpadding="0" border="0" width="100%">
  <tbody><tr>
    <th align="left">&nbsp;&nbsp;${flow.name }</th>
  </tr>
   <tr>
   
     <td>
     <img border="none" style="width: 460px; height: 360px;" alt="流程信息" src="${flow.pic }" />
     </td>
  </tr>
 
    </tbody></table>
  </div>

</div>

	</body>
</html>
