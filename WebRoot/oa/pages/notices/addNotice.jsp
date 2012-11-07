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
		<title>添加公告</title>

		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		<script type="text/javascript" src="oa/js/jquery.js"></script>
		<script type="text/javascript" src="oa/js/drag.js"></script>
		<script src="oa/js/wpCalendar.js" type="text/javascript"></script>
		<script type="text/javascript">
		var canSubmit = false;
		
     	function checkSubject(subject){
          var subject=subject.value;
          var Jspan=document.getElementById("j_subject");
          if(!subject){
        	   Jspan.innerHTML = "<font color=\"red\" size=\"2\">主题不能为空，请输入主题!<font>";
               subject.focus();
               canSubmit = false;
               return;
           }else{
            Jspan.innerHTML = "";
            canSubmit = true;
            return;
           }
           
     }
     
     function checkType(type){
          var type=type.value;
          var Jspan=document.getElementById("j_type");
          if(!type){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">类型不能为空!<font>";
               type.focus();
               canSubmit = false;
               return;
           }else{
            Jspan.innerHTML = "";
            canSubmit = true;
            return;
           }
     }
      function checkContent(content){
          var content=content.value;
          var Jspan=document.getElementById("j_content");
          if(!content){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入内容!<font>";
               content.focus();
               canSubmit = false;
               return;
           }else{
            Jspan.innerHTML = "";
            canSubmit = true;
            return;
           }
     }
      function checkdescribes(describes){
          var describes=describes.content;
          var Jspan=document.getElementById("j_describes");
          if(!describes){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入内容!<font>";
               describes.focus();
               canSubmit = false;
               return;
           }else{
            Jspan.innerHTML = "";
            canSubmit = true;
            return;
           }
     }
     function j_submit(){
 	if(canSubmit!=true){
 		alert("对不起，由于您的添加信息有误，您还不能提交。\r\n请根据页面上的错误提示，检查您的添加信息。");
 		return false;
 	}else{
 	return true;
 	}
     }

</script>
	</head>
  <body>
	<form class="tableform" name="form1" action="notice.do?method=addNotice" id="form1" method="post">
    <div class="main_content" id="main" style="height:500px; width: 1352px; visibility: visible; opacity: 1;">

<div class="division">
  <table cellspacing="0" cellpadding="0" border="0" width="100%">
  <tbody> <input type="hidden" value="${requestScope.mId }" name="mId" />
  <tr>
    <th><font color="red">*</font>&nbsp;公告主题：</th>
    <td><input onblur="checkSubject(this);" type="text" vtype="text" class="_x_ipt text" required="true" size="20" style="width:136px" name="subject" autocomplete="off" />
    <span id="j_subject"></span></td>
  </tr>
  <tr>
    <th><font  color="red">*</font>&nbsp;&nbsp;公告类型：</th>
    <td>
   <c:forEach items="${inforList}" var="infor">
    <input onblur="checkType(this);" type="radio" required="true" size="20" name="typename" autocomplete="off" value="${infor.type }" />${infor.type }
    </c:forEach>
    <span id="j_type"></span></td>
  </tr>
      <tr>
    <th><font color="red">*</font>&nbsp;&nbsp;公告内容：</th>
    <td><input onblur="checkContent(this);" type="text" required="true" style="width:400px;height:200px;vertical-align:top;" name="content" />
    <span id="j_content"></span></td>
  </tr>
       <tr>
    <th>备注：</th>
    <td><input onblur="checkdescribes(this);" type="text" style="width:400px;height:50px;vertical-align:top;" name="describes" autocomplete="off" />
    <span id="j_describes"></span></td>
  </tr>
    </tbody>
    </table>
  </div>
</div>
<input type="submit" value="添加" name="__" /></form>
	</body>
</html>
