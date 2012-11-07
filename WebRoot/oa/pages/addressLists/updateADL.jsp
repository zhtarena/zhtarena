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
		<title>修改用户信息</title>

		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		<script type="text/javascript" src="oa/js/jquery.js"></script>
		<script type="text/javascript" src="oa/js/drag.js"></script>
		<script src="oa/js/wpCalendar.js" type="text/javascript"></script>		
		<link rel="StyleSheet" href="oa/css/dtree.css" type="text/css" />
		<script type="text/javascript" src="oa/js/dtree.js"></script>
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
				if("<font color='green'>此用户无通讯簿，可以添加</font>"==unescape(xmlHttp.responseText)){
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
				var url="addressList.do?method=checkUsername&name="+encodeURI(uname);
				//返回的状态
				xmlHttp.onreadystatechange=stateChanged;
				//创建一个请求
				xmlHttp.open("post",url,true);	
				//向服务器发送请求
				xmlHttp.send(null);
			} 	
           
     }
     
     function checklinkman(user){
          var uname=user.value;
          var Jspan=document.getElementById("j_linkman");
          if(!uname){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入联系人姓名!<font>";
               uname.focus();
               canSubmit = false;
               return;
           }else{
            Jspan.innerHTML = "";
            canSubmit = true;
            return;
           }
     }
     function checkmail(email){
          var email=email.value;
          var Jspan=document.getElementById("j_mail");
          var reg = /^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@(([0-9a-zA-Z])+([-\w]*[0-9a-zA-Z])*\.)+[a-zA-Z]{2,9})$/;
          if(!email){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入邮箱名!<font>";
               email.focus();
               canSubmit = false;
               return;
           }else{
            if(!email.match(reg))
 				{
  				Jspan.innerHTML = "<font color=\"red\" size=\"2\">邮件地址无效!<font>";
  				canSubmit = false;
  					return;
				 }else{
				 Jspan.innerHTML = "";
				 canSubmit = true;return;
				 }
           }
     }
       function checkzip(zip){
          var zip1=zip.value;
          var Jspan=document.getElementById("j_zip");
          var reg = /^[1-9]\d{5}(?!\d)$/;
          if(!zip1){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入邮编!<font>";
               zip.focus();
               canSubmit = false;
               return;
           }else{
            if(!zip1.match(reg))
 				{
  				Jspan.innerHTML = "<font color=\"red\" size=\"2\">输入的邮编无效!<font>";
  				canSubmit = false;
  					return;
				 }else{
				 Jspan.innerHTML = "";
				 canSubmit = true;return;
				 }
           }
     }
      function checktel(tel){
          var tel=tel.value;
          var Jspan=document.getElementById("j_tel");
          var reg=/^(0(10|2\d|[3-9]\d\d)[- ]{0,3}\d{7,8}|0?1[358]\d{9})$/;
          if(!tel){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入移动电话号码!<font>";
              tel.focus();
               canSubmit = false;
               return;
           }else{
            if(!tel.match(reg))
 				{
  				Jspan.innerHTML = "<font color=\"red\" size=\"2\">输入的号码无效!<font>";
  				canSubmit =false;
  					return;
				 }else{
				 	Jspan.innerHTML = "";
				 	canSubmit = true;return;
				 }
           }
     }
      function checktel2(tel2){
          var tel2=tel2.value;
          var Jspan=document.getElementById("j_tel2");
          var reg=/^(0(10|2\d|[3-9]\d\d)[- ]{0,3}\d{7,8}|0?1[358]\d{9})$/;
          if(!tel2){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入固定电话号码!<font>";
               tel2.focus();
               canSubmit = false;
               return;
           }else{
            if(!tel2.match(reg))
 				{
  				Jspan.innerHTML = "<font color=\"red\" size=\"2\">输入的号码无效!<font>";
  				canSubmit =false;
  					return;
				 }else{
				 	Jspan.innerHTML = "";
				 	canSubmit = true;return;
				 }
           }
     }
       function checkaddress(address){
          var address=address.value;
          var Jspan=document.getElementById("j_address");
          if(!address){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入联系地址!<font>";
               address.focus();
               canSubmit = false;
               return;
           }else{
				 	Jspan.innerHTML = "";
				 	canSubmit = true;return;
				 }
     } function checkmsn(msn){
          var msn=msn.value;
          var Jspan=document.getElementById("j_msn");
          if(!msn){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入MSN!<font>";
               msn.focus();
               canSubmit = false;
               return;
           }else{
				Jspan.innerHTML = "";
				canSubmit = true;return;
				 }
     }
       function checkqq(qq){
          var qq=qq.value;
          var Jspan=document.getElementById("j_qq");
          if(!qq){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入QQ!<font>";
               qq.focus();
               canSubmit = false;
               return;
           }else{
				Jspan.innerHTML = "";
				canSubmit = true;return;
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
	<form class="tableform" name="form1" action="addressList.do?method=updADL" id="form1" method="post">
    <div class="main_content" id="main" style="height: 530px; width: 1352px; visibility: visible; opacity: 1;">
   <input type="hidden" value="${requestScope.mId }" name="mId" />
<div class="division">
  <table cellspacing="0" cellpadding="0" border="0" width="100%">
  <tbody>
  <c:set var="a" value="${adl}"></c:set>
  <tr>
    <input type="hidden" name="id" value="${a.id }" />
    <th><font color="red">*</font>&nbsp;用&nbsp;户&nbsp;名：</th>
    <td>${a.user.username }</td>
  </tr>
  <tr>
    <th><font  color="red">*</font>&nbsp;&nbsp;联系人姓名：</th>
    <td><input onblur="checklinkman(this);" value="${a.linkman}" type="text" vtype="text" class="_x_ipt text" style="" required="true" size="20" name="linkman" autocomplete="off" />
    <span id="j_linkman"></span></td>
  </tr>
      <tr>
    <th><font  color="red">*</font>&nbsp;&nbsp;QQ：</th>
    <td><input onblur="checkqq(this);" value="${a.qq }" type="text" vtype="text" class="_x_ipt text" style="" required="true" size="20" name="qq" autocomplete="off" />
    <span id="j_qq"></span></td>
  </tr>
       <tr>
    <th><font  color="red">*</font>&nbsp;&nbsp;E-mail：</th>
    <td><input onblur="checkmail(this);" value="${a.mail }" type="text" vtype="text" class="_x_ipt text" style="" required="true" size="20" name="mail" autocomplete="off" />
    <span id="j_mail"></span></td>
  </tr>
    <tr>
  <th> <font  color="red">*</font>&nbsp;&nbsp;联系地址：</th>
  <td>    
     <input onblur="checkaddress(this);" value="${a.address }" type="text" name="address" /><span id="j_address"></span>
  </td>
  </tr>
    <tr>
  <th><font  color="red">*</font>&nbsp;&nbsp; 邮编：</th>
  <td>    
     <input onblur="checkzip(this);" value="${a.zip }" type="text" name="zip"><span id="j_zip"></span>
  </td>
  </tr>
    <tr>
  <th><font  color="red">*</font>&nbsp;&nbsp; 移动电话：</th>
  <td>    
     <input onblur="checktel(this);" value="${a.mobilephone }" type="text" name="mobilephone"><span id="j_tel"></span>
  </td>
  </tr>
    <tr>
  <th><font  color="red">*</font>&nbsp;&nbsp; 固定电话：</th>
  <td>    
     <input onblur="checktel2(this);"  value="${a.telephone }" type="text" name="telephone"><span id="j_tel2"></span>
  </td>
  </tr>
    <tr>
  <th><font  color="red">*</font>&nbsp;&nbsp; MSN：</th>
  <td>    
     <input onblur="checkmsn(this);"   value="${a.msn }" type="text" name="msn"><span id="j_msn"></span>
  </td>
  </tr>
    
    </tbody>
    </table>
  </div>
</div>
<input type="submit" value="修改" name="__"></form>
	</body>
</html>
