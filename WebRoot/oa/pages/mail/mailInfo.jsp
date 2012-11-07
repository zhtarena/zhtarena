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
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
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
	<script type="text/javascript" src="oa/js/jquery.js"></script>
	<script type="text/javascript">

	function UpMail(msgId,mId,typeId,type){
	var typeId=typeId.value;
	
	$.ajax({
			   type: "POST",
			   url: "mail.do",
			   data: "method=doUpMail&msg_id="+msgId+"&mId="+mId+"&typeId="+typeId+"&type="+type+"&r="+Math.random(),
			   success: function(msg){
			   alert(msg);
			   		//$("#modue2").html(msg);
			   	}
		}); 
}
</script>
  </head>
  
  <body>
  ${requestScope.message }
   <div class="head_content" id="headBar">
      <div class="mainHead navBar">
<a href="">邮件管理</a>» 
<a href="">${requestScope.muser.display_name }<${requestScope.domain.login_name }@${requestScope.domain.name }></xiaojing></a>
</div></div>
 <div class="main_content" id="main" style="height: 500px; width: 1352px; visibility: visible; opacity: 1;">
   <div class="division"> 
    <form id="MailInfo" name="MailInfo" action="mail.do?method=MailInfo" method="post" enctype="multipart/form-data">
    		<table>
    		<tbody>
    		 <input type="hidden" name="mId" value="${requestScope.mId }"/>
    		 <tr>
    		<td colspan="2" style="background-color:lightblue;">
    		<c:if test="${requestScope.preMail!=null }">
    		<div >上一封邮件：
    		<a href="mail.do?method=MailInfo&msg_id=${requestScope.preMail.msg_id }&mId=${requestScope.mId }">${requestScope.preMail.subject }</a>
    		</div>
    		</c:if>
    		<div  style="background-color:lightblue;">
    		<input  type="button" name="to" value="返回"/>
    		<input onclick="javascript:window.location.href='mail.do?method=turnsendMail&send=${requestScope.send }&mId=${requestScope.mId }'" type="button" name="to" value="回复"/>
    		<input type="button" name="to" value="回复全部"/>
    		<input type="button" name="to" value="转发"/>
    		<input type="button" name="to" value="删除"/>
    		<input type="button" name="to" value="彻底删除"/>
    		
    		<select name="tagto" onchange="UpMail('${requestScope.mail.msg_id }','${requestScope.mId }',this,'1');">
    		<option value="0">标记为...
    		<option value="1">已读
    		<option value="2">未读
    		<option value="3">已回复
    		<option value="4">未回复
    		<option value="5">紧急
    		</select>
    		<select name="moveto" onchange="UpMail('${requestScope.mail.msg_id }','${requestScope.mId }',this,'2');">
    		<option value="0">移动到...
    		<option value="1">收件箱
    		<option value="2">发件箱
    		<option value="3">垃圾箱
    		<option value="4">草稿箱
    		</select>
    		</div>
    		</td>
    		</tr>
    		<tr ><td style="background-color:lightblue;">
    		<font size="+2">${requestScope.mail.subject }</font>
    		</td>
    		</tr>
    		<tr>
    		<td colspan="2" style="background-color:lightblue;">
    		发件人:${requestScope.send }</wang></br>
    		时间：${requestScope.mail.sent_date }</br>
    		收件人：${requestScope.mail.muser.id }<${requestScope.domain.login_name }@${requestScope.domain.name }></br>
    		<c:if test="${requestScope.attachsCount!=0 }">
    		附件：${requestScope.attachsCount } 个
    		<c:forEach items="${requestScope.attachments}" var="attachment">
    		(<a href="${requestScope.dir }${attachment}"> ${attachment}Java编程基础知识.doc </a>)
    		</c:forEach>
    		 
    		</c:if>
    		
    		</td>
    		</tr>
    		<tr>
    		<td colspan="2">
    		
    		<font style="color:gray;">内容：</font></br>
    		<hr style="color:yellow;">
    		${requestScope.mail.content }
    		</td>
    		</tr>
    		
    		<tr><td>
    		<c:if test="${requestScope.attachsCount!=0 }">
    		<tr>
    		<td colspan="2" >
    	<span >	<font style="color:gray;">（附件：${requestScope.attachsCount } 个）</font></br>
    	<p>	<font style="color:gray;">普通附件 (已通过卡巴斯基杀毒引擎扫描)</font>
    	 <a href=""><font style="color:gray;">
    	 <a href="mail.do?method=downLoad&msg_id=${requestScope.mail.msg_id }&mId=${reqeustScope.mId}">全部下载</a></font></a> 
    	  <a href=""><font style="color:gray;">附件预览</font></a></span></font></p>
    	  <c:forEach items="${requestScope.attachs}" var="attach">
    		<div>
    		<img src="oa/saveImgs/11.jpg" width="20px"/>
    		${attach} (875K)</br>
			<a href="mail.do?method=downLoad&filename=${attach }&mId=${reqeustScope.mId}">下载</a>  打开  预览  收藏到我的附件
    		</div>
    		</c:forEach>
    		</td>
    		</tr>
    		</c:if>
    		<tr>
    		<td colspan="2">
    		<span style="background-color:lightblue;">快捷回复给：</span>
    		<input size="80px" type="text"  name="to" value="${requestScope.send }" />
    		</td>
    		</tr>
    		<tr>
    		<td colspan="2" style="background-color:lightblue;">
    		<c:if test="${requestScope.nextMail!=null }">
    		<div >下一封邮件：
    		<a href="mail.do?method=MailInfo&msg_id=${requestScope.nextMail.msg_id }&mId=${requestScope.mId }">${requestScope.nextMail.subject }</a>
    		</div>
    		</c:if>
    		<div  style="background-color:lightblue;">
    		<input type="button" name="to" value="返回"/>
    		<input type="button" name="to" value="回复" onclick="javascript:window.location.href='mail.do?method=turnsendMail&send=${requestScope.send }&mId=${requestScope.mId }'"/>
    		<input type="button" name="to" value="回复全部"/>
    		<input type="button" name="to" value="转发"/>
    		<input type="button" name="to" value="删除"/>
    		<input type="button" name="to" value="彻底删除"/>
    		
    		<select name="biaojiwei">
    		<option value="0">标记为...
    		<option value="0">已读
    		<option value="1">未读
    		</select>
    		<select name="biaojiwei">
    		<option value="0">移动到...
    		<option value="0">收件箱
    		<option value="1">已发送
    		</select>
    		</div>
    		</td>
    		</tr>
    		</tbody>
    		</table>
	</form>
	</div>
	</div>
  </body>
</html>
