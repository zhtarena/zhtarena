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
		<title>添加模块</title>

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
				if("<font color='green'>此模块名可以使用</font>"==unescape(xmlHttp.responseText)){
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
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入模块名!<font>";
               name.focus();
               canSubmit = false;
               return;
           }
           xmlHttp=getXmlHttp();
		   if(xmlHttp==null){
			 alert("对不起，您的浏览器不支持Ajax");
			}else{
				//地址
				var url="module.do?method=checkName&name="+encodeURI(name);
				//返回的状态
				xmlHttp.onreadystatechange=stateChanged;
				//创建一个请求
				xmlHttp.open("post",url,true);
				//向服务器发送请求
				xmlHttp.send(null);
			} 
         }
     
     
		function checktarget(target){
          var target=target.value;
          var Jspan=document.getElementById("j_target");
          if(!target){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入模块链接的target!<font>";
          canSubmit = false;
               return;
           }else{
           Jspan.innerHTML = "";
           canSubmit = true;
           return;
           }
		}
   
      function checksort(sort){
          var sort=sort.value;
          var Jspan=document.getElementById("j_sort");
          var reg=/^[1-9]\d*$/;
          if(!sort){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入排序号!<font>";
               sort.focus();
               canSubmit = false;
               return;
           }else{
            if(!sort.match(reg))
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
      function checktype(type){
          var type=type.value;
          var Jspan=document.getElementById("j_type");
          var reg=/^[0-3]\d*$/;
          if(!type){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入模块的类型!<font>";
               type.focus();
               canSubmit = false;
               return;
           }else{
            if(!type.match(reg))
 				{
  				Jspan.innerHTML = "<font color=\"red\" size=\"2\">输入的类型错误!<font>";
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
      <a href="">权限管理</a>
<a href="">模块管理</a>
» 
  <span class="">添加模块</span>
</div></div>
      <div class="main_content" id="main" style="height: 400px; width: 1352px; visibility: visible; opacity: 1;">
<form onsubmit="javascript:return j_submit();" id="moduleform" name="moduleform" action="module.do?method=doAddModule" method="post">
<div class="tableform">
    <div class="division">
      <table cellspacing="0" cellpadding="0" border="0">
        <tbody>
        <tr>
          <th>模块名称:</th>
          <td>
          <input type="hidden" name="mId" value="${requestScope.mId }"/>
          <input onblur="checkname(this);" type="text" name="name" value=""/><span id="j_name"></span>
            </td>
        </tr>
        <tr>
          <th>一级模块:</th>
          <td><select onchange="changefirstModule()" selected="8" vtype="select" class="_x_ipt select" labelcolumn="cat_name" valuecolumn="cat_id" value="8" style="font-size:12px;" name="pmodule" id="pmodule" type="select">
          <option value="0" label="----无----">----无----</option>
<c:forEach items="${requestScope.fmodules}" var="fmodule">
	<option value="${fmodule.id}" label="${fmodule.name}">${fmodule.name}</option>
</c:forEach>
</select>
            <span class="notice_inline">设为一级模块请选择“无”</span></td>
        </tr>
          <tr>
          <th>二级模块:</th>
          <td><select selected="8" vtype="select" class="_x_ipt select" labelcolumn="cat_name" valuecolumn="cat_id" value="8" style="font-size:12px;" name="module2" id="module2" type="select">
          <option value="0" label="----无----">----无----</option>

		</select>
            <span class="notice_inline">设为二级模块请选择“无”</span></td>
        </tr>
          <tr>
          <th>模块的链接路径:</th>
          <td>
          <input type="text" name="url" value=""/>
            </td>
        </tr>
         <tr>
          <th>模块显示的target:</th>
           <td>
          <input onblur="checktarget(this);" type="text" name="target" value=""/><span id="j_target"></span>
            </td>
        </tr>  
         <tr>
          <th>模块的类型:</th>
          <td>
          <input onblur="checktype(this);" type="text" name="type" value=""/>
          <font size="2" color="blue">0为一级模块，1为二级模块，2为查找模块，3为添加模块</font>
          <span id="j_type"></span>
            </td>
        </tr> 
        <tr>
          <th>模块排序:</th>
           <td>
          <input onblur="checksort(this);" type="text" name="sort" value=""/><span id="j_sort"></span>
            </td>
        </tr>   
      <tr>
  <th>模块图标：</th>
  <td>
  
					<table style="font-size: 13px; font-weight: bolder;">
						<tr>
							<td>
								<input type="file" name="img" id="img" onchange="getURL(this)"/>
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
