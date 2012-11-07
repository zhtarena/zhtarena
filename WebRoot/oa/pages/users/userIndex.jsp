<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://jsptags.com/tags/navigation/pager"  prefix="pg"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
    <script type="text/javascript" src="js/jquery.js"></script>
	<style type="text/css">
<!--
a:link {text-decoration:none; color: #033d61;}
a:visited {text-decoration:none;color:#033d61;}
a:hover {text-decoration:none;}
a:active {text-decoration:none;}
-->
</style>
  <script type="text/javascript">
	function query(sua){
		
	    var quyArea = document.getElementById("quyArea");
	    var quy = document.getElementById("quye");		
		if(sua.selectedIndex==1){ 	
		  	 quy.setAttribute("name","name");
		  	 quy.setAttribute("value","请输入用户名");
	   	}else if(sua.selectedIndex==2){
		  	 quy.setAttribute("name","name");
		  	 quy.setAttribute("value","请输入员工姓名");
		}else if(sua.selectedIndex==3){
		     quy.setAttribute("name","sex");
		     quy.setAttribute("value","请输入男 或 女");
		}else if(sua.selectedIndex==4){
	         quy.setAttribute("name","orgId");
	         quy.setAttribute("value","请输入组织名");
		}	
    }
</script>
<script type="text/javascript">

    	 function ConfirmDel(userId,mId){
    	 var userChoice = window.confirm("确认删除该用户？"); 
 		var result = (userChoice == true) ? "确定" : "取消"; 
          if(result=="确定"){
          window.location.href=" user.do?method=delUser&delId="+userId+"&mId="+mId;
          
          }else{
            return;
          }
    	 }
     
     </script>
  </head>
  
  <body>
   <form class="tableform" name="form1" action="user.do?method=queryByParams" id="form1" method="post">
    <input type="hidden" value="${requestScope.mId }" name="mId">
     <div class="main_content" id="main" style="height: 530px; visibility: visible; opacity: 1;">
     <div class="division"><div>&nbsp;</div>
     <div style="font-size:12;">
         <span id="quyAra">查询用户
           <select name="rolename" id="quy"  onchange="query(this);">
             <option>请选择...</option>
             <option value="username">根据用户名查询</option>
             <option value="staffname">根据员工姓名查询</option>
             <option value="sex">根据性别查询</option>
             <option value="orgId">根据组织查询</option>
           </select>
           <span id="quyArea">
           		&nbsp;&nbsp;&nbsp;<input type="text" id="quye" value=""/>
           		<input type="submit" value="搜索"/>
           	</span>
           </span>
     </div>
      <table cellspacing="0" cellpadding="0" border="0" width="260px">
      <tbody>
	      <tr>
	        <th style="text-align:center;width:20">序号</th>
	        <th style="text-align:center;width:30">用户名</th>
	        <th style="text-align:center;width:20">性别</th>
	        <th style="text-align:center;width:50">所属机构</th>
	        <th style="text-align:center;width:50">查看</th>
	          <c:if test="${requestScope.del}">
	         <th style="text-align:center;width:30">删除</th>
	         </c:if>
	         <c:if test="${requestScope.upd}">
	          <th style="text-align:center;width:30">修改</th>
	          <th style="text-align:center;width:30">修改密码</th>
	           <th style="text-align:center;width:30">授权</th>
	           </c:if>
	      </tr>
	      <c:if test="${requestScope.users!=null}">
      <c:forEach items="${users}" var="user">
      <tr style="text-align:center;">
      	<td>${user.id }</td>
      	<td>${user.username }</td>
      	<td>
      	  <c:if test="${user.staff.sex ==0}">男</c:if>
      	  <c:if test="${user.staff.sex ==1}">女</c:if>
      	  <c:if test="${user.staff.sex ==null}">--</c:if>
      	</td>
      	<td><c:if test="${user.staff.org.name !=null}">${user.staff.org.name }</c:if>
      	<c:if test="${user.staff.org.name ==null}">--</c:if></td>
      	<td>      	
      	  <a href="user.do?method=findUserById&fId=${user.id }">查看详细信息</a>
      	  </td>
      	  
      	  <c:if test="${requestScope.del}">
      	  <td>
      	   <a href="javascript:void(0)" onclick="ConfirmDel(${user.id},${requestScope.mId })">
			 <img border="none" style="width:16px;height:16px;background-image:url(oa/images/ImageBundle.gif);background-repeat:no-repeat;background-position:0 -91px;" alt="删除" src="oa/images/transparent.gif"/>
			</a>
			</td>
      	   </c:if>
      	   
      	   <c:if test="${requestScope.upd}">
      	 <td>
      	    <a href="user.do?method=updatePre&updId=${user.id }&mId=${requestScope.mId }">
			  <img  border="none" style="width:16px;height:16px;background-image:url(oa/images/ImageBundle.gif);background-repeat:no-repeat;background-position:0 -139px;" alt="编辑" src="oa/images/transparent.gif"/>
			</a>
			</td>
			<td>
      	    <a href="user.do?method=updatePassPre&updId=${user.id }&mId=${requestScope.mId }">
			  <img  border="none" style="width:16px;height:16px;background-image:url(oa/images/ImageBundle.gif);background-repeat:no-repeat;background-position:0 -139px;" alt="编辑" src="oa/images/transparent.gif"/>
			</a>
			</td>
			<td>
      	      <a href="user.do?method=findUserAcl&id=${user.id }&mId=${requestScope.mId }">用户授权</a>
      	      </td>
      	      </c:if>
      </tr>
      </c:forEach>
       </tbody>
     </table>
    <hr size="5" color="#E1E1E1">
	<pg:pager url="user.do" items="${count}" export="currentPageNumber=pageNumber" maxPageItems="8">
		<pg:param name="method" value="findAllUser"/>
		<pg:param name="mId" value="${requestScope.mId}"/>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			 <td colspan="4" width="400">&nbsp;</td>
				<td class="STYLE4" align="left">
					&nbsp;&nbsp;共有 ${count} 条记录，当前第 ${currentPageNumber } 页
				</td>
				<td>
					<table border="0" align="right" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="40">
							<pg:first>
								<a href="${pageUrl}"><img src="oa/pages/images/first.gif" width="37"
									height="15" /></a>
							</pg:first>
							</td>
							<td width="45">
							<pg:prev>
								<a href="${pageUrl}"><img src="oa/pages/images/back.gif" width="43"
									height="15" /></a>
							</pg:prev>
							</td>
							<td width="45">
							<pg:next>
								<a href="${pageUrl}"><img src="oa/pages/images/next.gif" width="43"
									height="15" /></a>
							</pg:next>
							</td>
							<td width="40">
							<pg:last>
								<a href="${pageUrl}"><img src="oa/pages/images/last.gif" width="37"
									height="15" /></a>
							</pg:last>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</pg:pager>
      </c:if>
       <c:if test="${requestScope.users==null}">
           无任何数据！
      </c:if>
     </div>
     </div>
    </form>
  </body>
</html>
