<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'top.jsp' starting page</title>
    <base href="<%=basePath%>" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 12px;
	color: #000000;
}
.STYLE5 {font-size: 12}
.STYLE7 {font-size: 12px; color: #FFFFFF; }
.STYLE7 a{font-size: 12px; color: #FFFFFF; }
a img {
	border:none;
}
-->
</style>
  </head>
  
  <body>
 
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="57" background="oa/images/main_03.gif">
    <div style="float:left;position:absolute;z-index:91;">
   <a href="role.do?method=changeRole" target="rightFrame"> <img title="角色转换" src="${role.picture }" height="65px"/></a>
    </div>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="57"><img height="57" src="oa/images/main_01.png"/></td>
        <td width="281" valign="bottom">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="33" height="27"><img src="oa/images/main_05.gif" width="33" height="27" /></td>
            <td width="248" background="oa/images/main_06.gif">
            <table width="225" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
              <td><div align="right"><a href="user.do?method=updatePassPre&updId=${user.id }" target="rightFrame">
                <img src="oa/images/pass.gif" alt=" " width="69" height="17" /></a></div></td>
                <td><div align="right"><a href="user.do?method=exit" target="_top">
                <img src="oa/images/quit.gif" alt=" " width="69" height="17" /></a></div></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="40" background="oa/images/main_10.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="194" height="40" background="oa/images/main_10.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="21"><img src="oa/images/main_13.gif" width="19" height="14" /></td>
            <td width="35" class="STYLE7"><div align="center"><a href="oa/welcome.html" target="rightFrame">首页</a></div></td>
            <td width="21" class="STYLE7"><img src="oa/images/main_15.gif" width="19" height="14" /></td>
            <td width="35" class="STYLE7"><div align="center"><a href="javascript:history.go(-1);">后退</a></div></td>
            <td width="21" class="STYLE7"><img src="oa/images/main_17.gif" width="19" height="14" /></td>
            <td width="35" class="STYLE7"><div align="center"><a href="javascript:history.go(1);">前进</a></div></td>
            <td width="21" class="STYLE7"><img src="oa/images/main_19.gif" width="19" height="14" /></td>
            <td width="35" class="STYLE7"><div align="center"><a href="javascript:window.parent.location.reload();">刷新</a></div></td>
            <td width="21" class="STYLE7"><img src="oa/images/main_21.gif" width="19" height="14" /></td>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="30" background="oa/images/main_31.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" height="30"><img src="oa/images/main_28.gif" width="8" height="30" /></td>
        <td width="147" background="oa/images/main_29.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="24%">&nbsp;</td>
            <td width="43%" height="20" valign="bottom" class="STYLE1">管理菜单</td>
            <td width="33%">&nbsp;</td>
          </tr>
        </table></td>
        <td width="39"><img src="oa/images/main_30.gif" width="39" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="20" valign="bottom"><span class="STYLE1">当前登录用户：<font color="red"><a href="user.do?method=findUserById&fId=${user.id }" target="rightFrame">${user.username }</a></font>&nbsp;用户角色：
           <font color="red">${role.name }
            </font>
            </span></td>
            <%
            Date date=new Date();
		   %>
            <td valign="bottom" class="STYLE1">系统当前时间：<%=date.getYear()+1900 %>年<%=date.getMonth()+1 %>月<%=date.getDate() %>日&nbsp;&nbsp;
			<div align="right"></div></td>
          </tr>
        </table></td>
        <td width="17"><img src="oa/images/main_32.gif" width="17" height="30" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
