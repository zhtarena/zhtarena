<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:hidden;
}
-->
</style></head>

<body>
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="8" bgcolor="#353c44">&nbsp;</td>													
    <td width="147" valign="top">
    <s:action name="moduleList!findAll" namespace="/module" executeResult="true">
    </s:action>
    
    <!--
    <iframe height="100%" width="100%" border="0" frameborder="0" src="/oas/oa/left.jsp" name="leftFrame" id="leftFrame" title="leftFrame">
    </iframe>
    -->
    </td>
    <td width="10" bgcolor="#add2da">&nbsp;</td>
    <td valign="top"><iframe id="rightFrame" height="100%" width="100%" border="0" frameborder="0" src="/oa/oa/notice.jsp" name="rightFrame" id="rightFrame" title="rightFrame"></iframe></td>
    <td width="8" bgcolor="#353c44">&nbsp;</td>
  </tr>
</table>

</body>

</html>
