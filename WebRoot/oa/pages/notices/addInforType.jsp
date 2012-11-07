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
		<title>添加用户</title>

		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		<script type="text/javascript" src="oa/js/jquery.js"></script>
		<script type="text/javascript" src="oa/js/drag.js"></script>
		<script src="oa/js/wpCalendar.js" type="text/javascript"></script>
		<script type="text/javascript">
		var canSubmit = false;
		function getXmlHttp(){
			var xmlHttp=null;
			try{
			    xmlHttp=new XMLHttpRequest();
			}catch(e){
		    	xmlHttp=null;
			}
		    	return xmlHttp;
			}
		function stateChanged(){
			if(xmlHttp.readyState==4){
				document.getElementById("j_type").innerHTML=unescape(xmlHttp.responseText);//接收
				if("<font color='green'>此类型可以使用</font>"==unescape(xmlHttp.responseText)){
				    canSubmit=true;
				}else{
					canSubmit=false;
				}
			}
		}
     function checkType(type){
          var type=type.value;
          var Jspan=document.getElementById("j_type");
          if(!type){
        	   Jspan.innerHTML = "<font color=\"red\" size=\"2\">类型不能为空，请输入类型!<font>";
               type.focus();
               canSubmit = false;
               return;
           }
           xmlHttp=getXmlHttp();
		   if(xmlHttp==null){
			 alert("对不起，您的浏览器不支持Ajax");
			}else{
				//地址
				var url="addressList.do?method=checkUsername&name="+encodeURI(type);
				//返回的状态
				xmlHttp.onreadystatechange=stateChanged;
				//创建一个请求
				xmlHttp.open("post",url,true);	
				//向服务器发送请求
				xmlHttp.send(null);
			} 	
           
     }
     
     function checkdescribes(user){
          var describes=user.value;
          var Jspan=document.getElementById("j_describes");
          if(!describes){
      	    Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入描述!<font>";
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
	<form class="tableform" name="form1" action="notice.do?method=addInforType&mId=${requestScope.mId  }" id="form1" method="post">
    <div class="main_content" id="main" style="height: 100px; width: 1352px; visibility: visible; opacity: 1;">

<div class="division">
  <table cellspacing="0" cellpadding="0" border="0" width="100%">
  <tbody> 
   <input type="hidden" value="${requestScope.mId }" name="mId" />
  <tr>
    <th><font color="red">*</font>&nbsp;类型：</th>
    <td><input onblur="checkType(this);" type="text" vtype="text" class="_x_ipt text" required="true" size="20" style="width:136px" name="type" autocomplete="off" />
    <span id="j_type"></span></td>
  </tr>
  <tr>
    <th>描述：</th>
    <td><input onblur="checkdescribes(this);" type="text" vtype="text" class="_x_ipt text" style="" size="20" name="describes" autocomplete="off" />
    <span id="j_describes"></span></td>
  </tr>
    </tbody>
    </table>
  </div>
</div>
<input type="submit" value="添加" name="__" /></form>
	</body>
</html>
