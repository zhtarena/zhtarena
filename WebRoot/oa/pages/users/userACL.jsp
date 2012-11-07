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
		<title>角色授权</title>

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

     function checkname(name){
          var name=name.value;
          var Jspan=document.getElementById("j_name");
          if(!name){
          Jspan.innerHTML = "<font color=\"red\" size=\"2\">请输入模块名!<font>";
               name.focus();
               canSubmit = false;
               return;
           }else{
            Jspan.innerHTML = "";
            canSubmit = true;
            return;
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
<script type="text/javascript">

	function checkAcl(acl){
	var acl=acl.value;
	$.ajax({
			   type: "POST",
			   url: "acl.do",
			   data: "method=changeAcl&changeId="+acl+"&type=user&r="+Math.random(),
			   success: function(msg){
			   alert(msg);
			   		//$("#module2").html(msg);
			   	}
		}); 
}
function checkAll(acls){
	var acls=acls.value;
	if(document.getElementById("acls"+acls).checked){
	document.getElementById("inc"+acls).checked = true;
	document.getElementById("del"+acls).checked = true;
	document.getElementById("upd"+acls).checked = true;
	document.getElementById("rea"+acls).checked = true;
	}else{
	document.getElementById("inc"+acls).checked = false;
	document.getElementById("del"+acls).checked = false;
	document.getElementById("upd"+acls).checked = false;
	document.getElementById("rea"+acls).checked = false;
	}
	acl=acls+"_"+${requestScope.user.id}
	var checked
	if(document.getElementById("acls"+acls).checked){
	checked=0;
	}else{
	checked=1;
	}
	$.ajax({
			   type: "POST",
			   url: "acl.do",
			   data: "method=changeAcls&changeId="+acl+"&checked="+checked+"&type=user&r="+Math.random(),
			   success: function(msg){
			   alert(msg);
			   		//$("#module2").html(msg);
			   	}
		}); 
	return;
}
</script>
	</head>


	<body>
    
      <div class="head_content" id="headBar">
      <div class="mainHead navBar">
<a href="">权限管理</a>» 
<a href="">角色管理</a>
» 
  <span class=""><a href="user.do?method=findAllUser&mId=${requestScope.mId }">用户列表</a></span>
  >><span class="">用户授权</span>
</div></div>
      <div class="main_content" id="main" style="height: 500px; width: 1352px; visibility: visible; opacity: 1;">
<form onsubmit="javascript:return j_submit();" id="ACLform" name="ACLform" action="user.do?method=doAddACL" method="post">
<div class="tableform">
<div style="text-align:center;height:50px;"><font size="+2">给用户【${requestScope.user.username }】授权</font></div>
	<table bgcolor="lightblue">
		<tr bgcolor="silver">
		<td>顶级模块</td><td>二级模块</td><td>权限</td><td>全选</td>
		</tr>
		<c:forEach items="${requestScope.fmodules}" var="fmodule">
		<c:set value="0" var="p"></c:set>
		
		<tr>
		<td>${fmodule.name } </td>
		<td></td>
		<td>
		<c:forEach items="${requestScope.acls}" var="acl">
		
		<c:if test="${acl.module.id==fmodule.id}">
		<c:set value="1" var="p"></c:set>
		<c:if test="${acl.inc==0}">
		<span>C<input  onchange="checkAcl(this);" type="checkbox" id="inc${fmodule.id }" name="acl${fmodule.id }" value="${fmodule.id }_inc_${requestScope.user.id }" checked/></span>
		</c:if>
		<c:if test="${acl.inc==1}">
		<span>C<input onchange="checkAcl(this);" type="checkbox" id="inc${fmodule.id }" name="acl${fmodule.id }" value="${fmodule.id }_inc_${requestScope.user.id }"/></span>
		</c:if>
		<c:if test="${acl.rea==0}">
		<span>R<input onchange="checkAcl(this);" type="checkbox" id="rea${fmodule.id }" name="acl${fmodule.id }" value="${fmodule.id }_rea_${requestScope.user.id }" checked/></span>
		</c:if>
		<c:if test="${acl.rea==1}">
		<span>R<input onchange="checkAcl(this);" type="checkbox" id="rea${fmodule.id }" name="acl${fmodule.id }" value="${fmodule.id }_rea_${requestScope.user.id }" /></span>
		</c:if>
		<c:if test="${acl.upd==0}">
			<span>U<input onchange="checkAcl(this);" type="checkbox" id="upd${fmodule.id }" name="acl${fmodule.id }" value="${fmodule.id }_upd_${requestScope.user.id }" checked/></span>
		</c:if>
		<c:if test="${acl.upd==1}">
			<span>U<input onchange="checkAcl(this);" type="checkbox" id="upd${fmodule.id }" name="acl${fmodule.id }" value="${fmodule.id }_upd_${requestScope.user.id }" /></span>
		</c:if>
		<c:if test="${acl.del==0}">
		<span>D<input onchange="checkAcl(this);" type="checkbox" id="del${fmodule.id }" name="acl${fmodule.id }" value="${fmodule.id }_del_${requestScope.user.id }" checked/></span>
		</c:if>
		<c:if test="${acl.del==1}">
		<span>D<input onchange="checkAcl(this);" type="checkbox" id="del${fmodule.id }" name="acl${fmodule.id }" value="${fmodule.id }_del_${requestScope.user.id }" /></span>
		</c:if>
		</c:if>
		</c:forEach>
		<c:if test="${p==0}">
		<c:set value="1" var="p"></c:set>
		<span>C<input onchange="checkAcl(this);" type="checkbox" id="inc${fmodule.id }" name="acl${fmodule.id }" value="${fmodule.id }_inc_${requestScope.user.id }"/></span>
		<span>R<input onchange="checkAcl(this);" type="checkbox" id="rea${fmodule.id }" name="acl${fmodule.id }" value="${fmodule.id }_rea_${requestScope.user.id }" /></span>
		<span>U<input onchange="checkAcl(this);" type="checkbox" id="upd${fmodule.id }" name="acl${fmodule.id }" value="${fmodule.id }_upd_${requestScope.user.id }" /></span>
		<span>D<input onchange="checkAcl(this);" type="checkbox" id="del${fmodule.id }" name="acl${fmodule.id }" value="${fmodule.id }_del_${requestScope.user.id }" /></span>
		</c:if>
		</td>
		<td><span style="margin-left:0px"><input type="checkbox" onclick="checkAll(this);" name="acls" id="acls${fmodule.id }" value="${fmodule.id }" /></span></td>
		</tr>
		<c:forEach items="${requestScope.cmodules}" var="cmodule">
		<c:set value="0" var="c"></c:set>
		<c:if test="${cmodule.pmodule.id==fmodule.id}">
		<tr>
		<td></td>
		<td>${cmodule.name }</td>
		<td>
		<c:forEach items="${requestScope.acls}" var="acl">
		<c:if test="${acl.module.id==cmodule.id}">
		<c:set value="1" var="c"></c:set>
		<c:if test="${acl.inc==0}">
		<span>C<input onchange="checkAcl(this);" type="checkbox" id="inc${cmodule.id }" name="acl${cmodule.id }" value="${cmodule.id }_inc_${requestScope.user.id }" checked/></span>
		</c:if>
		<c:if test="${acl.inc==1}">
		<span>C<input onchange="checkAcl(this);" type="checkbox" id="inc${cmodule.id }" name="acl${cmodule.id }" value="${cmodule.id }_inc_${requestScope.user.id }"/></span>
		</c:if>
		<c:if test="${acl.rea==0}">
		<span>R<input onchange="checkAcl(this);" type="checkbox" id="rea${cmodule.id }" name="acl${cmodule.id }" value="${cmodule.id }_rea_${requestScope.user.id }" checked/></span>
		</c:if>
		<c:if test="${acl.rea==1}">
		<span>R<input onchange="checkAcl(this);" type="checkbox" id="rea${cmodule.id }" name="acl${cmodule.id }" value="${cmodule.id }_rea_${requestScope.user.id }" /></span>
		</c:if>
		<c:if test="${acl.upd==0}">
			<span>U<input onchange="checkAcl(this);" type="checkbox" id="upd${cmodule.id }" name="acl${cmodule.id }" value="${cmodule.id }_upd_${requestScope.user.id }" checked/></span>
		</c:if>
		<c:if test="${acl.upd==1}">
			<span>U<input onchange="checkAcl(this);" type="checkbox" id="upd${cmodule.id }" name="acl${cmodule.id }" value="${cmodule.id }_upd_${requestScope.user.id }" /></span>
		</c:if>
		<c:if test="${acl.del==0}">
		<span>D<input onchange="checkAcl(this);" type="checkbox" id="del${cmodule.id }" name="acl${cmodule.id }" value="${cmodule.id }_del_${requestScope.user.id }" checked/></span>
		</c:if>
		<c:if test="${acl.del==1}">
		<span>D<input onchange="checkAcl(this);" type="checkbox"id="del${cmodule.id }" name="acl${cmodule.id }" value="${cmodule.id }_del_${requestScope.user.id }" /></span>
		</c:if>
		</c:if>
		
		</c:forEach>
		<c:if test="${c==0}">
		<c:set value="1" var="c"></c:set>
		<span>C<input onchange="checkAcl(this);" type="checkbox" id="inc${cmodule.id }" name="inc${cmodule.id }" value="${cmodule.id }_inc_${requestScope.user.id }"/></span>
		<span>R<input onchange="checkAcl(this);" type="checkbox" id="rea${cmodule.id }" name="rea${cmodule.id }" value="${cmodule.id }_rea_${requestScope.user.id }" /></span>
		<span>U<input onchange="checkAcl(this);" type="checkbox" id="upd${cmodule.id }" name="upd${cmodule.id }" value="${cmodule.id }_upd_${requestScope.user.id }" /></span>
		<span>D<input onchange="checkAcl(this);" type="checkbox" id="del${cmodule.id }" name="del${cmodule.id }" value="${fmodule.id }_del_${requestScope.user.id }" /></span>
		</c:if>
		</td>
		<td><span style="margin-left:0px"><input onclick="checkAll(this);" type="checkbox" id="acls${cmodule.id }" name="acls" value="${cmodule.id }" /></span></td>
		</tr>
		</c:if>
		</c:forEach>
		</c:forEach>
		
		
	</table>
     </div> <input type="hidden" value="${requestScope.mId }" name="mId"/> 
    <input type="hidden" value="授权" name="授权"/>  </form>
     </div>
     
	</body>
</html>
