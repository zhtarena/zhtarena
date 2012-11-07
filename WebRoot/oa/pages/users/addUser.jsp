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
				document.getElementById("j_username").innerHTML=unescape(xmlHttp.responseText);//接收
				if("<font color='green'>此用户名可以使用</font>"==unescape(xmlHttp.responseText)){
				    canSubmit=true;
				}else{
					canSubmit=false;
				}
			}
		}
     function checkUsername(user){
          var uname=user.value;
          var Jspan=document.getElementById("j_username");
          if(!uname){
        	   Jspan.innerHTML = "<font color=\"red\" size=\"2\">用户名不能为空，请输入用户名!<font>";
               uname.focus();
               canSubmit = false;
               return;
           }
           xmlHttp=getXmlHttp();
		   if(xmlHttp==null){
			 alert("对不起，您的浏览器不支持Ajax");
			}else{
				//地址
				var url="user.do?method=checkUserName&name="+encodeURI(uname);
				//返回的状态
				xmlHttp.onreadystatechange=stateChanged;
				//创建一个请求
				xmlHttp.open("post",url,true);
				//	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");	
				//向服务器发送请求
				xmlHttp.send(null);
			} 	
           
     }
     
     function checkPassword1(password){
          var password=password.value;
          var Jspan=document.getElementById("j_password");
          if(!password){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入密码!<font>";
          canSubmit = false;
               return;
           }else{
           Jspan.innerHTML = "";
           canSubmit = true;
           return;
           }
		}

     function checkPassword2(password2){
        var password1=document.getElementById("password").value;
       
          var password2=password2.value;
          var Jspan=document.getElementById("j_password2");
          
           if(!password2){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请再次输入密码!<font>";
               password2.focus();
               canSubmit = false;
               return;
           }else{
           		if(password1!=password2){
          			Jspan.innerHTML = "<font color=\"red\" size=\"2\">前后两次输入的密码不一致!<font>";
          			canSubmit = false;
          			return;
         		 }else{
         		 Jspan.innerHTML = "";
         		 canSubmit = true;return;
         		 }
           }   
     }
      function checkstaffName(staffName){
          var rname=staffName.value;
          var Jspan=document.getElementById("j_staffName");
          if(!rname){
          	   Jspan.innerHTML = "<font color=\"red\" size=\"2\">真实名不能为空，请输入真实名!<font>";
               runame.focus();
               canSubmit = false;
               return;
           } 
           xmlHttp=getXmlHttp();
		   if(xmlHttp==null){
			 alert("对不起，您的浏览器不支持Ajax");
			}else{
				//地址
				var url="user.do?method=checkStaffName&name="+encodeURI(rname);
				//返回的状态
				xmlHttp.onreadystatechange=stateChanged1;
				//创建一个请求
				xmlHttp.open("post",url,true);	
				//向服务器发送请求
				xmlHttp.send(null);
			} 	
     }
     function stateChanged1(){
			if(xmlHttp.readyState==4){
				document.getElementById("j_staffName").innerHTML=unescape(xmlHttp.responseText);//接收
				if("<font color='green'>有此员工，可添加此员工用户</font>"==unescape(xmlHttp.responseText)){
				    canSubmit=true;
				}else{
					canSubmit=false;
				}
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
	<form class="tableform" name="form1" action="user.do?method=addUser" id="form1" method="post">
    <div class="main_content" id="main" style="height: 430px; width: 1352px; visibility: visible; opacity: 1;">
 <input type="hidden" value="${requestScope.mId }" name="mId" />
<div class="division">
  <table cellspacing="0" cellpadding="0" border="0" width="100%">
  <tbody><tr>
    <th><font color="red">*</font>&nbsp;用&nbsp;户&nbsp;名：</th>
    <td><input onblur="checkUsername(this);" type="text" vtype="text" class="_x_ipt text" required="true" size="20" style="width:136px" name="username" autocomplete="off" />
    <span id="j_username"></span></td>
  </tr>
   <tr>
    <th><font color="red">*</font>&nbsp;密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</th>
    <td><input onblur="checkPassword1(this);" type="password" vtype="password" class="_x_ipt password" style="" required="true" size="20" name="password" id="password" autocomplete="off" />
    <span id="j_password"></span></td>
  </tr>
  <tr>
    <th><font  color="red">*</font>&nbsp;确认密码：</th>
    <td><input onblur="checkPassword2(this);" type="password" vtype="password" class="_x_ipt password" style="" required="true" size="20" name="password2" autocomplete="off" />
    <span id="j_password2"></span></td>
  </tr>
  <tr>
    <th><font color="red">*</font>&nbsp;真实姓名：</th>
    <td>
    <input onblur="checkstaffName(this)" type="text" vtype="text" class="_x_ipt_text" required="true" size="20" style="widht:136px" name="staffName" autocomplete="off"  />
    <span id="j_staffName"></span></td>
  </tr>
 <tr>
    <th>角色设置：</th>
    <td>   
    <c:forEach items="${roles}" var="role">
    <c:if test="${role.name=='普通员工'}">
       <input type="checkbox" vtype="text" class="_x_ipt_text" size="20" style="widht:136px" name="userRoles" autocomplete="off" value="${role.name }" checked="checked" />
    ${role.name }
    </c:if>
    <c:if test="${role.name!='普通员工'}">
    <input type="checkbox" vtype="text" class="_x_ipt_text" size="20" style="widht:136px" name="userRoles" autocomplete="off" value="${role.name }"  />
    ${role.name }
    </c:if>
    </c:forEach>
    </td>
  </tr>    
    </tbody></table>
  </div>

</div>
<input type="submit" value="添加" name="__" /></form>
	</body>
</html>
