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
		<title>审批公文</title>

		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		<script type="text/javascript" src="oa/js/jquery.js"></script>
		<script type="text/javascript" src="oa/js/drag.js"></script>
		<script src="oa/js/wpCalendar.js" type="text/javascript"></script>
		<script type="text/javascript">
	var obj = window.dialogArguments;
	var docid=obj.did;
	var showstatus=obj.status;
	 function init(){	 	
	 
	 document.getElementById("docid").value
			document.getElementById("docid").value=docid;    
			document.getElementById("status").value=showstatus;  
			
			if(showstatus==1){//审批成功
			document.getElementById("showcommitstatus").innerHTML="通过";
			}else if(showstatus==2){//审批失败
			document.getElementById("showcommitstatus").innerHTML="未通过";
			document.getElementById("isendstaff").style.display="none"
			}     
     }
     
     function send(){
   //  this.close();
     }
</script>
	</head>
	<body onload="init()">
		<form class="tableform" name="form1" action="docuser.do?method=updateDocUser" id="form1"
			method="post">
			<div class="main_content" id="main"
				style="height: 350px; width: 450px; visibility: visible; opacity: 1;">

				<div class="division">
					<table cellspacing="0" cellpadding="0" border="0" width="100%">
						<tbody>
							<tr>
								<td>
								
									该公文审批
									<font color="red"><span id="showcommitstatus"></span></font>
									<input type="hidden" name="status" id="status"/>
									<input type="hidden" name="docid" id="docid"/>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;审核意见：								
								<input type="text" vtype="text" value="" class="_x_ipt text" style="width: 250px; height: 200px; vertical-align: top;" size="20" name="view" autocomplete="off" />
									<br/>
									
									<span id="isendstaff">是否还需审批：
								<input type="radio" value="0" name="docstatus" class="sel"
										tags="null" checked="checked"/>是
									<input type="radio" value="1" name="docstatus" class="sel"
										tags="null"/>否
										</span>
								</td>
							</tr>
							
						</tbody>
					</table>
				</div>
			</div>
			<input type="submit" value="提交" name="__" onclick="send()"/>&nbsp;&nbsp;<input type="button" value="取消"  name="__" onclick="javascript:window.close();"/>
		</form>
	</body>
</html>
