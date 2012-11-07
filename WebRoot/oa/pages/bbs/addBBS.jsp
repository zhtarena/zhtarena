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
		<title>添加留言</title>

		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		<script type="text/javascript" src="oa/js/jquery.js"></script>
		<script type="text/javascript" src="oa/js/drag.js"></script>
		<script src="oa/js/wpCalendar.js" type="text/javascript"></script>
		<script type="text/javascript" src="oa/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
		<script type="text/javascript">
		var canSubmit = false;
	    function checkSubject(subject){
          var subject=subject.value;
          var Jspan=document.getElementById("j_subject");
          if(!subject){
        	   Jspan.innerHTML = "<font color=\"red\" size=\"2\">主题不能为空，请输入主题内容!<font>";
               subject.focus();
               canSubmit = false;
               return;
           }else{
          	   Jspan.innerHTML = "";
          	   canSubmit=true;
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
	<form class="tableform" name="form1" action="bbs/bbsAction!openTopic" id="form1" method="post">
    <div class="main_content" id="main" style="height: 480px; visibility: visible; opacity: 1;">
<div class="division">
<a href="bbs/bbsAction!listRoot">[返回留言列表]</a>
  <table cellspacing="0" cellpadding="0" border="0" width="100%">
  <tbody> 
  <tr>
    <th style="width:30px;"><font color="red">*</font>&nbsp;主题：</th>
    <td><input onblur="checkSubject(this);" type="text" vtype="text" class="_x_ipt text" required="true" size="30" name="bbs.subject" autocomplete="off" />
    <span id="j_subject"></span></td>
  </tr>
  <tr>
    <th style="width:30px;"><font color="red">*</font>&nbsp;&nbsp;内容：</th>
    <td>
    <textarea cols="70" id="editor1" name="bbs.content" rows="10"></textarea>
			<script type="text/javascript">
			//<![CDATA[

				CKEDITOR.replace( 'editor1',
					{
						fullPage : true,
						extraPlugins : 'docprops'
					});

			//]]>
			</script>
	</td>
  </tr>    
    </tbody>
    </table>
    <input type="submit" value="添加" name="__" />
  </div>
</div>
</form>
	</body>
</html>
