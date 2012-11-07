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
		<title>用户详细信息</title>

		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		<style type="text/css">
<!--

a:link {text-decoration:none; color: #033d61;}
a:visited {text-decoration:none;color:#033d61;}
a:hover {text-decoration:none;}
a:active {text-decoration:none;}
-->
</style>
	</head>

	<body>
	<form class="tableform" name="form1" action="" id="form1" method="post">
	 <input type="hidden" value="${requestScope.mId }" name="mId"/>
    <div class="main_content" id="main" style="height: 450px; width: 1352px; visibility: visible; opacity: 1;">

<div class="division">
  <c:set var="u" value="${user}"></c:set>
  <table cellspacing="0" cellpadding="0" border="0" width="90%">
  <tbody>
  <tr>
    <th>&nbsp;用&nbsp;户&nbsp;名：</th>
    <td>${u.username }
    </td>
  </tr>
  
 <tr>
    <th>&nbsp;角色： </th>
    <td>      
      <c:forEach items="${roles}" var="role">   
	   ${role.name }&nbsp;&nbsp;&nbsp;&nbsp;
      </c:forEach>
    </td>
  </tr>
    </tbody>
    </table>
    <br />
     <table cellspacing="0" cellpadding="0" border="0" width="100%">
  <tbody>
  <tr>
    <th>真实姓名：fdf</th>
    <td>${u.staff.name }
    </td>
   <td  rowspan="5" ><img src="${u.staff.photo }" width="200px"/></td>
  </tr>
   <tr>
    <th>&nbsp;性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</th>
    <td >
    <c:if test="${u.staff.sex ==0}">男</c:if>
      	  <c:if test="${u.staff.sex ==1}">女</c:if>
     </td>
  </tr>
  <tr>
    <th>&nbsp;年龄：</th>
    <td>${u.staff.age } </td>
  </tr>
 <tr>
	    <th>&nbsp;角色： </th>
    <td>      
      <c:forEach items="${roles}" var="role">   
	   ${role.name }&nbsp;&nbsp;&nbsp;&nbsp;
      </c:forEach>
    </td>
  </tr>
  <tr>
    <th>所属机构：</th>
    <td>${u.staff.org.name }</td>
    </tr>
      <tr>
    <th>身份证号码：</th>
    <td>${u.staff.cardId }</td><td>员工图片</td>
    </tr>
      <tr>
    <th>QQ：</th>
    <td colspan="2">${u.staff.qq }</td>
  </tr>
       <tr>
    <th>E-mail：</th>
    <td colspan="2">${u.staff.mail }</td>
  </tr>
   
    <tr>
  <th> 联系地址：</th>
  <td colspan="2">    
  ${u.staff.address }
  </td>
  </tr>
   <tr>
  <th> 进厂时间：</th>
  <td colspan="2">    
    ${u.staff.rtime }
  </td>
  </tr>
  <tr>
  <th> 基本工资：</th>
  <td colspan="2">    
     ${u.staff.wage }￥
     </td>
  </tr>
    <tr>
  <th> 邮编：</th>
  <td colspan="2">    
     ${u.staff.zip }
  </td>
  </tr>
    <tr>
  <th> 移动电话：</th>
  <td colspan="2">    
     ${u.staff.mobilephone }
  </td>
  </tr>
    <tr>
  <th> 固定电话：</th>
  <td colspan="2">    
    ${u.staff.telephone }
  </td>
  </tr>
    <tr>
  <th> 描述：</th>
  <td colspan="2">    
    ${u.staff.describes }
  </td>
  </tr>
    </tbody>
    </table>
  </div>
</div>

<a href="user.do?method=updatePre&updId=${u.id }&mId=${requestScope.mId}">修改用户</a>
</form>
	</body>
</html>
