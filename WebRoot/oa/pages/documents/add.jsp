<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="java.net.URLDecoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>添加公文</title>

		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		<script type="text/javascript" src="oa/js/jquery.js"></script>
		<script type="text/javascript" src="oa/js/drag.js"></script>
		<script src="oa/js/wpCalendar.js" type="text/javascript"></script>
		<script type="text/javascript">
	var canSubmit = false;
	var candocname=false;
	var candocfile=false;
	function checkDocname(docname) {
		var dname = docname.value;
		var Jspan = document.getElementById("j_docname");
		if (!dname) {
			Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入公文名!<font>";
			dname.focus();
			candocname=false;
			return;
		} else {
			Jspan.innerHTML = "";
			candocname=true;
			return;
		}
	}

	function checkFormat(filePath) {
	
 			var   i = filePath.lastIndexOf('.');
 			var   len = filePath.length;
 			var   str = filePath.substring(len,i+1);
 			var   extName= "DOC,DOCX,WPS,DOT,RTF,PDF,TXT,PPT,PPTX,DPS,XLS,XLSX,ET,RAR";
 			   if(extName.indexOf(str.toUpperCase()) < 0) 
 			 	{    
 			 		alert("请选择正确的文件!");    				
 			 		return false;   
				 } 
 				return true;
 			    
	  }
	function checkDocfile(docfile) {
		var dfile = docfile.value;
		 var Jspan=document.getElementById("j_docfile");
          if(dfile==null||dfile==""){
          candocfile = false;
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请选择文件!<font>";
               dfile.focus();               
               return;
           }else{
           candocfile = checkFormat(dfile);
            return;
           }
		}
	function j_submit(){   
     canSubmit=candocname&&candocfile;
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
		<form class="tableform" enctype="MULTIPART/FORM-DATA" onsubmit="return j_submit()" name="form1" action="doc.do?method=addDoc" id="form1"
			method="post">
			<div class="main_content" id="main"
				style="height: 430px; width: 1352px; visibility: visible; opacity: 1;">

				<div class="division">
					<table cellspacing="0" cellpadding="0" border="0" width="100%">
						<tbody>
							<tr>
								<td colspan="2">
									您要创建的公文是
									<font color="red">【<%=URLDecoder.decode(request.getParameter("flowname")) %>】</font>
									<input type="hidden" name="flowid" value="<%=request.getParameter("flowid") %>" />
									<input type="hidden" name="mId" value="<%=request.getParameter("mId") %>" />
								</td>
							</tr>
							<tr>
								<th>
									<font color="red">*</font>&nbsp;公文名称：
								</th>
								<td>
									<input onblur="checkDocname(this)" type="text" vtype="text"
										class="_x_ipt text" required="true" size="20"
										style="width: 136px" name="name" autocomplete="off" />
									<span id="j_docname"></span>
								</td>
							</tr>
							<tr>
								<th>
									<font color="red"></font>&nbsp;公文描述：
								</th>
								<td>
									<input type="text" vtype="text" class="_x_ipt text" style="width: 500px; height: 200px; vertical-align: top;" required="true" size="20" name="describesString" autocomplete="off" />
									
								</td>
							</tr>

							<tr>
								<th>
									<font color="red">*</font>&nbsp;&nbsp;附件：
								</th>
								<td>
									<input type="file" vtype="file"	class="_x_ipt file" style="" required="true" size="20"	name="appendixformfile" autocomplete="off" onchange="checkDocfile(this);"/>
										<font color="blue">支持DOC,DOCX,WPS,DOT,RTF,PDF,TXT,PPT,PPTX,DPS,XLS,XLSX,ET,RAR格式</font>
									<span id="j_docfile"></span>
								</td>
							</tr>


						</tbody>
					</table>
				</div>
			</div>
			<input type="submit" value="添加" name="__" />
		</form>
	</body>
</html>
