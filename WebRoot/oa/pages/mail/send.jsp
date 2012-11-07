<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'send.jsp' starting page</title>
    <base href="<%=basePath%>" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
	<script type="text/javascript" src="oa/js/jquery.js"></script>
	<script type="text/javascript" src="oa/ckeditor/ckeditor.js"></script>
	<style type="text/css">
		.email_row{
			float:left;
			width:80%;
			padding-bottom:5px;
		}
		.email_input1{
			width:60%;
			height:15px;
		}
	</style>
<script type="text/javascript">
	
function showMail(mail)
{
	document.getElementById("linkMan").value=mail.value;
}
	</script>
  </head>
  
  <body>
   <div class="head_content" id="headBar">
      <div class="mainHead navBar">
<a href="">邮件管理</a>» 
<a href="">发送邮件</a>
</div></div>
 <div class="main_content" id="main" style="height: 500px; width: 1352px; visibility: visible; opacity: 1;">
    <form id="sendMail" name="sendMail" action="mail.do?method=sendMail" method="post" enctype="multipart/form-data">
    		<div class="tableform">
    		<div class="division">
    		<table>
    		<tr>
    		<td><input type="hidden" name="mId" value="${requestScope.mId }"/>
    		发件人：<input type="text" name="from" style="width:60%;height:20px;" value="${requestScope.domain.login_name }@${requestScope.domain.name }" />
			<!-- 	<select name="from" style="width:60%;height:20px; border:1px solid #666666;" >
					<c:forEach var="e" items="${list }">
						<option value="${e.name }">${e.name }@${e.smtpString }</option>
					</c:forEach>
					 
				</select>
				-->
    		</td>
    		<td rowspan="4">联系人列表
    		<div><select onchange="showMail(this);" id="checkLinkMan" name="checkLinkMan">
    		<c:forEach items="${requestScope.ads}" var="ad">
    		<option value="${ad.mail }">${ad.linkman }--${ad.mail }
    		 </c:forEach>
    		
    		</select></div>
    		</td>
    		</tr>
    		<tr>
    		<td>
    			收件人：<input id="linkMan" type="text" name="to" value="${requestScope.send }" style="width:60%;height:20px;"/>
    		</td>
    		</tr>
    		<tr>
    		<td>
    		主&nbsp;&nbsp;&nbsp;&nbsp;题：<input type="text" name="subject" value="${requestScope.mail.subject }" style="width:60%;height:20px; " />
    		</td>
    		</tr>
    		<tr>
    		<td id="att">
    		
    		<input  type="hidden" name="attachCount" value="1" id="count"/>
    		附件[1]：<input type="file" name="attachs_1"  />
    		<span><input type="button" value="再添加一个附件" onclick="addNewFile()"></br></span>
    		<script type="text/javascript"> 
	var fileNum=1;  
	function $(id){       
	   return document.getElementById(id);      
	}	
	function addNewFile(){
		fileNum++;
		var frm=$("att");
		var count=$("count");
		count.value=fileNum;
		frm.appendChild(document.createElement("br"));
		var no=document.createTextNode("附件["+fileNum+"]:");
		var input=document.createElement("input");
		var err=document.createElement("span");
		input.setAttribute("type","file");
		input.setAttribute("id","id_"+fileNum);
		input.setAttribute("name","attachs_"+fileNum);
		err.setAttribute("id","err_"+fileNum);
		frm.appendChild(no);
		frm.appendChild(input);
		frm.appendChild(err);
		frm.appendChild(document.createElement("br"));
	}
	</script> 
    		</td>
    		</tr>
    		</table>
    		<div>
				内&nbsp;&nbsp;&nbsp;&nbsp;容：
			<textarea cols="80" id="editor1" name="content" rows="10">${requestScope.mail.content }</textarea>
			<script type="text/javascript">
			//<![CDATA[

				CKEDITOR.replace( 'editor1',
					{
						fullPage : true,
						extraPlugins : 'docprops'
					});

			//]]>
			</script>
			</div>
			
				<input type="submit" value="发送" />
			</div>
			</div>
	</form>
	
	</div>
  </body>
</html>
