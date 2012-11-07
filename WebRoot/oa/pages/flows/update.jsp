<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.DateFormat"%>
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
		<title>修改流程</title>

		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		<script type="text/javascript" src="oa/js/jquery.js"></script>
		<script type="text/javascript" src="oa/js/drag.js"></script>
		<script src="oa/js/wpCalendar.js" type="text/javascript"></script>
		<script type="text/javascript">
	var canSubmit = false;
	var canflowpic=false;
	var canflowfile=false;

    function checkFormat(filePath,checkname) {
 			var   i = filePath.lastIndexOf('.');
 			var   len = filePath.length;
 			var   str = filePath.substring(len,i+1);
 			var   extName;
			 
			 if(checkname=="pic"){
			 extName = "JPG,GIF,PNG,JPEG,BMP";
 			  	if(extName.indexOf(str.toUpperCase()) < 0) 
 			 	{     
 				alert("请选择正确的图片文件!");  
 			 	return false;   
				 } 
 				return true;  
 			  }
 			  else if(checkname=="file"){
 			   extName = "DOC,DOCX,WPS,DOT,RTF,PDF,TXT,PPT,PPTX,DPS,XLS,XLSX,ET,RAR";
 			   if(extName.indexOf(str.toUpperCase()) < 0) 
 			 	{     
 				alert("请选择正确的文件!");  
 			 	return false;   
				 } 
 				return true;
 			  }     
	  }
    function checkPicname(flow){   
          var pic=flow.value;
          var Jspan=document.getElementById("J_pic");
          if(pic==null||pic==""){      
           canflowpic = false;
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请选择图片!<font>";
               pic.focus();              
               return;
           }else{
           canflowpic=checkFormat(pic,"pic");
            return;
           }
     }
     
     function checkFile(flow){
    
          var nfile=flow.value;
          var Jspan=document.getElementById("J_file");
          if(nfile==null||nfile==""){
          canflowfile = false;
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请选择文件!<font>";
               nfile.focus();               
               return;
           }else{
           canflowfile = checkFormat(nfile,"file");
            return;
           }
     }
     function j_submit(){   
     canSubmit=canflowfile&&canflowpic;
 	if(!canSubmit){
 		alert("对不起，由于您的流程信息不完整，您还不能提交。\r\n请检查您的流程信息。");
 		return false;
 	}else{
 	return true;
 	}
     }

</script>
	</head>


	<body>
	<form class="tableform" onsubmit="return j_submit()" name="form1" action="flow.do?method=updateFlow" id="form1" method="post" enctype="MULTIPART/FORM-DATA">
    <div class="main_content" id="main" style="height: 430px; width: 1352px; visibility: visible; opacity: 1;">

<div class="division">
  <table cellspacing="0" cellpadding="0" border="0" width="100%">
  <tbody><tr>
    <th><font color="red"></font>&nbsp;流程名称：</th>
    <td>${flow.name }<input type="hidden" name="id" value="${flow.id }"/></td>
  </tr>
   <tr>
    <th><font color="red">*</font>&nbsp;请选择流程定义文件：</th>
    <td><input type="file" onchange="checkFile(this)" vtype="file" class="_x_ipt file" style="" required="true" size="20" name="appendixFile" id="flowfile" autocomplete="off" />
    <span id="J_file"><font color="red">支持DOC,DOCX,WPS,DOT,RTF,PDF,TXT,PPT,PPTX,DPS,XLS,XLSX,ET,RAR格式</font></span></td>
  </tr>
  <tr>
    <th><font color="red">*</font>&nbsp;请选择流程定义图片：</th>
    <td><input type="file" onchange="checkPicname(this)" vtype="file" class="_x_ipt file" style="" required="true" size="20" name="picFile" id="flowpic" autocomplete="off" />
    <span id="J_pic"><font color="red">支持JPG,GIF,PNG,JPEG,BMP格式</font></span></td>
  </tr>
  
    </tbody></table>
  </div>

</div>
<input type="submit" value="修改" name="__" /></form>
	</body>
</html>
