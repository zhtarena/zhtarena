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
		<title>审批信息</title>

		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="admin/css/admin.css"></link>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="admin/js/drag.js"></script>
			<script type="text/javascript">

		var obj = window.dialogArguments;
	//	  alert("您传递的参数为：" + obj.did);
		var docid=obj.did;
		 function init(){
			window.location.href="docuser.do?method=findDocUserByDocId&docid="+docid;     
        }
			</script>
	</head>


	<body onload="init()">
	 
	<table>
	
	</table>
	</body>
</html>
