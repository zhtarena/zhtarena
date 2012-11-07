<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.DateFormat"%>
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
		<title>添加员工</title>

		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		<script type="text/javascript" src="oa/js/jquery.js"></script>
		<script type="text/javascript" src="oa/js/drag.js"></script>
		<script src="oa/js/wpCalendar.js" type="text/javascript"></script>		
		<link rel="StyleSheet" href="oa/css/dtree.css" type="text/css" />
		<script type="text/javascript" src="oa/js/dtree.js"></script>
		<script type="text/javascript">
var canSubmit = false;

     function checkUsername(user){
          var uname=user.value;
          var Jspan=document.getElementById("j_username");
          if(!uname){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入用户名!<font>";
               uname.focus();
               canSubmit = false;
               return;
           }else{
            Jspan.innerHTML = "";
            canSubmit = true;
            return;
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
           }else{
            Jspan.innerHTML = "";
            canSubmit = true;return;
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
      function checkidCard(idCard){
          var card=idCard.value;
          var Jspan=document.getElementById("j_idCard");
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
     function j_submit(){
 	if(canSubmit!=true){
 		alert("对不起，由于您的注册信息有误，您还不能提交。\r\n请根据页面上的错误提示，检查您的注册信息。");
 		return false;
 	}else{
 	return true;
 	}
     }

</script>
<script type="text/javascript">
	function getURL(obj)
	  	{
	  	
	  		var fileURL;
	  		if(obj)
	            {
	                if($.browser.mozilla)
	                {
	                     fileURL = obj.files.item(0).getAsDataURL();
	                }
	                else{
	                	 fileURL=obj.value;
	                }
	            } 
	            
	        $("#show").html("");
	  		$("<img>",{src:fileURL,id:"myimg"}).appendTo("#show");
	  		$('#uploadimg').val(fileURL);
	  		$("#myimg").Jcrop({
					onChange: showCoords,
					onSelect: showCoords
				});
	  	}
	  	function showCoords(c)
			{
				$('#x').val(c.x);
				$('#y').val(c.y);
				$('#x2').val(c.x2);
				$('#y2').val(c.y2);
				$('#w').val(c.w);
				$('#h').val(c.h);
				
			};	    
</script>
	</head>


	<body>
	<form class="tableform" name="form1" action="staff.do?method=addStaff" id="form1" method="post">
	 <input type="hidden" value="${requestScope.mId }" name="mId">
    <div class="main_content" id="main" style="height: 430px; width: 1352px; visibility: visible; opacity: 1;">
<div class="division">
  <table cellspacing="0" cellpadding="0" border="0" width="100%">
  <tbody><tr>
    <th><font color="red">*</font>&nbsp;姓名：</th>
    <td><input onblur="checkUsername(this);" type="text" vtype="text" class="_x_ipt text" required="true" size="20" style="width:136px" name="name" autocomplete="off" />
    <span id="j_username"></span></td>
  </tr>
   <tr>
    <th>所属机构：</th>
    <td><input type="hidden" id="orgId" name="orgId" />
     <a href="javascript:void(0);" onclick="javascript:document.getElementById('dtree').style.display='block'">选择机构</a>
									<span id="pname"></span>
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
    </tbody></table></div>
<div class="division">
  <table cellspacing="0" cellpadding="0" border="0" width="100%">
    <tbody>
    <tr>
  <th> 性别：</th>
  <td>    
     <input type="radio" value="1" name="sex" checked><label>男</label> &nbsp; 
  <input type="radio" value="0" name="sex"><label>女</label>
  </td>
  </tr>
     <tr>
    <th><font  color="red">*</font>&nbsp;&nbsp;年龄：</th>
    <td><input onblur="checkage(this);" type="text" vtype="text" class="_x_ipt text" style="" required="true" size="20" name="age" autocomplete="off" />
    <span id="j_age"></span></td>
  </tr>
   <tr>
  <th>员工照片：</th>
  <td>
  
					<table style="font-size: 13px; font-weight: bolder;">
					
						<tr>
							<td>
								<input type="file" name="photo" id="photo" onchange="getURL(this)"/>
								<input type="hidden" value="addphoto" name="method" />
								<input type="hidden" name="left" id="x"/>
						    	<input type="hidden" name="top" id="y"/>
						    	<input type="hidden" name="x2" id="x2"/>
						    	<input type="hidden" name="y2" id="y2"/>
						    	<input type="hidden" name="width" id="w"/>
						    	<input type="hidden" name="height" id="h"/>
						    	</td>
						    	</tr>
					</table>


			<div id="show"></div>
		<div id="msgpal">
			<div id="pal_close"
				onClick="$('#msgpal').css('display','none');$('#zhezao').css('display','none')"></div>
			<div id="showmsg"></div>
		</div>
		<div id="zhezao"></div>
		<c:if test="${!empty msg}">
			<script>
		$("#msgpal").css("display","block");
		$("#zhezao").css("display","block");
		$("#showmsg").html("${msg}");
	</script>
		</c:if>
  </td>
</tr> 
    
      <tr>
    <th><font  color="red">*</font>&nbsp;&nbsp;身份证号码：</th>
    <td><input onblur="checkcardId(this);" type="text" vtype="text" class="_x_ipt text" style="" required="true" size="20" name="cardId" autocomplete="off" />
    <span id="j_idCard"></span></td>
      <tr>
    <th><font  color="red">*</font>&nbsp;&nbsp;QQ：</th>
    <td><input onblur="checkqq(this);" type="text" vtype="text" class="_x_ipt text" style="" required="true" size="20" name="qq" autocomplete="off" />
    <span id="j_qq"></span></td>
  </tr>
   
       <tr>
    <th><font  color="red">*</font>&nbsp;&nbsp;E-mail：</th>
    <td><input onblur="checkmail(this);" type="text" vtype="text" class="_x_ipt text" style="" required="true" size="20" name="mail" autocomplete="off" />
    <span id="j_mail"></span></td>
  </tr>
   
    <tr>
  <th> 联系地址：</th>
  <td>    
     <input onblur="checkaddress(this);" type="text" name="address"><span id="j_address"></span>
  </td>
  </tr>
   <tr>
  <th> 进厂时间：</th>
  <td>    
     <input type="text" name="rtime" onfocus="showCalendar(this)" readonly><font color="red">*</font>
  </td>
  </tr>
  <tr>
  <th> 基本工资：</th>
  <td>    
     <input onblur="checkwage(this);" type="text" name="wage" value="1" />￥
  <span id="j_wage"></span></td>
  </tr>
    <tr>
  <th> 邮编：</th>
  <td>    
     <input onblur="checkzip(this);" type="text" name="zip"><span id="j_zip"></span>
  </td>
  </tr>
    <tr>
  <th> 移动电话：</th>
  <td>    
     <input onblur="checktel(this);" type="text" name="mobilephone"><span id="j_tel"></span>
  </td>
  </tr>
    <tr>
  <th> 固定电话：</th>
  <td>    
     <input onblur="checktel2(this);" type="text" name="telephone"><span id="j_tel2"></span>
  </td>
  </tr>
    <tr>
  <th> 描述：</th>
  <td>    
     <input onblur="checktedescribes(this);" type="text" name="describes"><span id="j_describes"></span>
  </td>
  </tr>
    
    </tbody></table>
  </div>

</div>
<input type="submit" value="添加" name="__"></form>
	</body>
</html>
