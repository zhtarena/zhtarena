<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
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
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入用户名!<font>";
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
       // alert("343"+document.getElementById("form1").value);
        var password1=document.getElementById("password").value;
          //var password1=form1.password.value;
       
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
      function checkname(name){
          var rname=name.value;
          var Jspan=document.getElementById("j_name");
          if(!rname){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入真实名!<font>";
               runame.focus();
               canSubmit = false;
               return;
           }  xmlHttp=getXmlHttp();
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
      function checkage(age){
          var age=age.value;
          var Jspan=document.getElementById("j_age");
          var reg=/^120|((1[0-1]|\d)?\d)$/;
          if(!age){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入年龄!<font>";
               age.focus();
               canSubmit = false;
               return;
           }else{
            if(!age.match(reg))
 				{
  				Jspan.innerHTML = "<font color=\"red\" size=\"2\">输入的年龄无效!<font>";
  				canSubmit = fales;
  					return;
				 }else{
				 	Jspan.innerHTML = "";
				 	canSubmit = true;return;
				 	
				 }
           }
     }
      function checkwage(wage){
          var wage=wage.value;
          var Jspan=document.getElementById("j_wage");
          var reg=/^[1-9]\d*$/;
          if(!wage){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入基本工资!<font>";
               wage.focus();
               canSubmit = false;
               return;
           }else{
            if(!wage.match(reg))
 				{
  				Jspan.innerHTML = "<font color=\"red\" size=\"2\">输入的工资无效!<font>";
  				canSubmit = fales;
  					return;
				 }else{
				 	Jspan.innerHTML = "";
				 	canSubmit = true;return;
				 	
				 }
           }
     }
      function checkcardId(cardId){
          var card=cardId.value;
          var Jspan=document.getElementById("j_cardId");
          var reg=/^\d{15}|\d{18}$/;
          if(!card){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入身份证号码!<font>";
               card.focus();
               canSubmit = false
               return;
           }else{
            if(!card.match(reg))
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
           }
     }
      function checkmsn(msn){
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
       function checkdescribes(describes){
          var describes=describes.value;
          var Jspan=document.getElementById("j_describes");
          if(!describes){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入描述信息!<font>";
               describes.focus();
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
	<form class="tableform" name="form1" action="user.do?method=updateUser" id="form1" method="post">
    <div class="main_content" id="main" style="height: 500px; width: 1352px; visibility: visible; opacity: 1;">
 <input type="hidden" value="${requestScope.mId }" name="mId" />
<div class="division">
  <table cellspacing="0" cellpadding="0" border="0" width="100%">
  <tbody>
  <c:set var="u" value="${user}"></c:set>
  
    <input type="hidden" name="staffName" value="${user.staff.name }" />
    <input type="hidden" name="id" value="${user.id }" />
    <input type="hidden" name="staffId" value="${user.staff.id }" />
  <tr>
    <th><font color="red">*</font>&nbsp;用&nbsp;户&nbsp;名：</th>
    <td>${u.username }</td>
  </tr>
    <tr>
    <th>所属机构：</th>
    <td><input type="hidden" id="orgId" name="orgId" value="${u.staff.org.id }" />
    <span id="pname">${u.staff.org.name }</span>
    
     <a href="javascript:void(0);" onclick="javascript:document.getElementById('dtree').style.display='block'">选择机构</a>
									
									<div id="dtree" class="dtree" style="display: none">


										<script type="text/javascript">
		<!-- 

function getPorg(porgid, porgname){
document.getElementById("dtree").style.display="none";
document.getElementById("pname").innerHTML=porgname;
document.getElementById("orgId").value=porgid;
ischeckOrgporg=true;
}
		d = new dTree('d');
		d.add(0,-1,'OA平台');
		<c:forEach items="${orgs}" var="org">
		<c:if test = "${empty org.porg}">
		d.add(${org.id},0,'${org.name}',"javascript:new getPorg(${org.id},'${org.name}');void(0);");//
		</c:if>
		
		<c:if test = "${!empty org.porg}">
		d.add(${org.id},${org.porg.id},'${org.name}',"javascript:new getPorg(${org.id},'${org.name}');void(0);");//
		</c:if>
		</c:forEach>
		
		document.write(d);
		d.openAll();
		
		//-->
	</script>
	</div></td>
  </tr>
    </tbody>   
  <table cellspacing="0" cellpadding="0" border="0" width="100%">
    <tbody>
  <tr>
  <th><font  color="red">*</font>&nbsp;&nbsp;真实姓名：</th>
  <td> <input type="hidden" value="${requestScope.mId }" name="mId">
  <input onblur="checkname(this);" value="${u.staff.name }" name="name" type="text" vtype="text" class="_x_ipt text" style="" required="true" size="20" name="age" autocomplete="off" /></td>
  </tr>
    <tr>
  <th> 性别：</th>
  <td>    
  <c:if test="${u.staff.sex==0}">
     <input type="radio" value="1" name="sex" checked />男 &nbsp; 
  <input type="radio" value="0" name="sex" />女
  </c:if>
   <c:if test="${u.staff.sex==1}">
     <input type="radio" value="1" name="sex" /><label>男</label> &nbsp; 
  <input type="radio" value="0" name="sex" checked /><label>女</label>
  </c:if>
  </td>
  </tr>
     <tr>
    <th><font  color="red">*</font>&nbsp;&nbsp;年龄：</th>
    <td><input onblur="checkage(this);" value="${u.staff.age }" type="text" vtype="text" class="_x_ipt text" style="" required="true" size="20" name="age" autocomplete="off" />
    <span id="j_age"></span></td>
  </tr>
      <tr>
    <th><font  color="red">*</font>&nbsp;&nbsp;身份证号码：</th>
    <td><input onblur="checkcardId(this);" value="${u.staff.cardId }" type="text" vtype="text" class="_x_ipt text" style="" required="true" size="20" name="cardId" autocomplete="off" />
    <span id="j_cardId"></span></td></tr>   
     <tr>
    <th>角色设置： </th>
    <td>   
    <c:forEach items="${rolesAll}" var="roleAll">
      <c:set var="num" value="0"></c:set>
       <c:set var="ite" value="0"></c:set>
      <c:forEach items="${roles}" var="role">
       <c:set var="ite" value="${ite+1}"></c:set>
	    <c:if test="${roleAll.id == role.id}">
	       <input type="checkbox" vtype="text" class="_x_ipt_text" size="20" style="widht:136px" name="userRoles" autocomplete="off"
	        value="${roleAll.name }" checked="checked" />
	    ${roleAll.name }
	    </c:if>
	   <c:if test="${roleAll.id != role.id}">
	      <c:set var="num" value="${num+1}"></c:set>
	    </c:if>
      </c:forEach>
      <c:if test="${num==ite}">
        <input type="checkbox" vtype="text" class="_x_ipt_text" size="20" style="widht:136px" name="userRoles" autocomplete="off" value="${roleAll.name}"  />
	    ${roleAll.name }
      </c:if>
    </c:forEach>
    </td>
  </tr>
      <tr>
    <th>QQ：</th>
    <td><input onblur="checkqq(this);" value="${u.staff.qq }" type="text" vtype="text" class="_x_ipt text" style="" required="true" size="20" name="qq" autocomplete="off" />
    <span id="j_qq"></span></td>
  </tr>
       <tr>
    <th>E-mail：</th>
    <td><input onblur="checkmail(this);" value="${u.staff.mail }" type="text" vtype="text" class="_x_ipt text" style="" required="true" size="20" name="mail" autocomplete="off" />
    <span id="j_mail"></span></td>
  </tr>
    <tr>
  <th>联系地址：</th>
  <td>    
     <input onblur="checkaddress(this);" value="${u.staff.address }" type="text" name="address" /><span id="j_address"></span>
  </td>
  </tr>
  <%
   java.text.SimpleDateFormat format=new java.text.SimpleDateFormat("yyyy-M-d");
   com.oa.model.User user=(com.oa.model.User)request.getAttribute("user");
   String date=format.format(user.getStaff().getRtime());
   
   %>
   <tr>
  <th>进厂时间：</th>
  <td>    
     <input type="text" name="rtime" value="<%=date %>" onfocus="showCalendar(this)" readonly />
  </td>
  </tr>
  <tr>
  <th>基本工资：</th>
  <td>    
     <input onblur="checkwage(this);" value="${u.staff.wage }" type="text" name="wage" value="1" />￥
  <span id="j_wage"></span></td>
  </tr>
    <tr>
  <th>邮编：</th>
  <td>    
     <input onblur="checkzip(this);" value="${u.staff.zip }" type="text" name="zip" /><span id="j_zip"></span>
  </td>
  </tr>
    <tr>
  <th>移动电话：</th>
  <td>    
     <input onblur="checktel(this);" value="${u.staff.mobilephone }" type="text" name="mobilephone" /><span id="j_tel"></span>
  </td>
  </tr>
    <tr>
  <th>固定电话：</th>
  <td>    
     <input onblur="checktel2(this);"  value="${u.staff.telephone }" type="text" name="telephone" /><span id="j_tel2"></span>
  </td>
  </tr>
    <tr>
  <th>描述：</th>
  <td>    
     <input onblur="checkdescribes(this);"   value="${u.staff.describes }" type="text" name="describes" /><span id="j_describes"></span>
  </td>
  <tr><td colspan="2"> <input type="submit" value="修改" name="__" /></td></tr>
  </tr>
   
    </tbody></table>
    </table>
  </div>

</div>
</form>
	</body>
</html>
