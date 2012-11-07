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
		<title>添加角色</title>

		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		<script type="text/javascript" src="oa/js/jquery.js"></script>
		<script type="text/javascript" src="oa/js/drag.js"></script>
		<script type="text/javascript" src="oa/js/moduleChange.js"></script>
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
				document.getElementById("j_name").innerHTML=unescape(xmlHttp.responseText);//接收
				if("<font color='green'>此角色名可以使用</font>"==unescape(xmlHttp.responseText)){
				    canSubmit=true;
				}else{
					canSubmit=false;
				}
			}
		}
     function checkname(name){
          var name=name.value;
          var Jspan=document.getElementById("j_name");
          if(!name){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入角色名!<font>";
               name.focus();
               canSubmit = false;
               return;
           }
           xmlHttp=getXmlHttp();
		   if(xmlHttp==null){
			 alert("对不起，您的浏览器不支持Ajax");
			}else{
				//地址
				var url="role.do?method=checkName&name="+encodeURI(name);
				//返回的状态
				xmlHttp.onreadystatechange=stateChanged;
				//创建一个请求
				xmlHttp.open("post",url,true);	
				//向服务器发送请求
				xmlHttp.send(null);
			} 	
     }
    
      function checkpriority(priority){
          var sort=priority.value;
          var Jspan=document.getElementById("j_priority");
          var reg=/^[1-9]\d*$/;
          if(!priority){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入排序号!<font>";
               priority.focus();
               canSubmit = false;
               return;
           }else{
            if(!priority.match(reg))
 				{
  				Jspan.innerHTML = "<font color=\"red\" size=\"2\">输入的排序号错误，应为正整数!<font>";
  				canSubmit = fales;
  					return;
				 }else{
				 	Jspan.innerHTML = "";
				 	canSubmit = true;return;
				 	
				 }
           }
     }
     
     function j_submit(){
 	if(canSubmit!=true){
 		alert("对不起，由于您填写的信息有误，您还不能提交。\r\n请根据页面上的错误提示，检查您填写的信息。");
 		return false;
 	}else{
 	return true;
 	}
     }

</script>
	</head>


	<body>
    
      <div class="head_content" id="headBar">
      <div class="mainHead navBar">
<a href="">权限管理</a>» 
<a href="">角色管理</a>
» 
  <span class="">添加角色</span>
</div></div>
      <div class="main_content" id="main" style="height: 400px; width: 1352px; visibility: visible; opacity: 1;">
<form onsubmit="javascript:return j_submit();" id="moduleform" name="moduleform" action="role.do?method=doAddRole" method="post">
<div class="tableform">
    <div class="division">
      <table cellspacing="0" cellpadding="0" border="0">
        <tbody>
        <tr>
          <th>角色名称:</th>
          <td>
          <input type="hidden" value="${requestScope.mId }" name="mId"/>
          <input onblur="checkname(this);" type="text" name="name" value=""/><span id="j_name"></span>
            </td>
        </tr>
          <tr>
          <th>优先级:</th>
          <td>
          <input onblur="checkpriority(this);" type="text" name="priority" value=""/><span id="j_priority"></span>
            </td>
        </tr>
       <tr>
  <th>角色图片：</th>
  <td>
  
					<table style="font-size: 13px; font-weight: bolder;">
					
						<tr>
							<td>
								<input type="file" name="picture" id="img" onchange="getURL(this)"/>
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
    
     </tbody>
     </table>
     </div>
     </div>
    <input type="submit" value="添加" name="添加">  </form>
     </div>
     
	</body>
</html>
