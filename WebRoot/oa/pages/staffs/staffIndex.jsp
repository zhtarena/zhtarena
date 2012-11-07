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
    
    <title>员工列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
	<script type="text/javascript" src="oa/js/jquery.js"></script>
		<style type="text/css">
<!--
a:link {text-decoration:none; color: #033d61;}
a:visited {text-decoration:none;color:#033d61;}
a:hover {text-decoration:none;}
a:active {text-decoration:none;}
-->
</style>
<script type="text/javascript">

    	 function ConfirmDel(staffId,mId){
    	 var userChoice = window.confirm("确认删除该角色？"); 
 		var result = (userChoice == true) ? "确定" : "取消"; 
          if(result=="确定"){
          window.location.href="staff.do?method=delStaff&id="+staffId+"&mId="+mId;
          
          }else{
            return;
          }
    	 }
     
     </script>
  </head>
  
  <body>
     <form class="tableform" name="form1" action="" id="form1" method="post">
    <input type="hidden" value="${requestScope.mId }" name="mId">
     <div class="main_content" id="main" style="height: 530px; visibility: visible; opacity: 1;">
      <div class="division"> 
      <table cellspacing="0" cellpadding="0" border="0">
	      <tr>
	        <th style="text-align:center;width:10">序号</th>
	        <th style="text-align:center;width:20">姓名</th>
	        <th style="text-align:center;width:40">照片</th>
	        <th style="text-align:center;width:10">性别</th>
	        <th style="text-align:center;width:10">年龄</th>
	        <th style="text-align:center;width:40">身份证号码</th>
	        <th style="text-align:center;width:30">联系电话</th>
	        <th style="text-align:center;width:30">固定电话</th>
	        <th style="text-align:center;width:20">QQ</th>
	        <th style="text-align:center;width:20">Email</th>
	        <th style="text-align:center;width:40">家庭地址</th>	        
	        <th style="text-align:center;width:30">所属机构</th>
	        <th style="text-align:center;width:40">描述</th>
	        	<c:if test="${requestScope.upd}">
	        	<th style="text-align:center;width:100">修改</th> 
	        	 </c:if>
	        	 <c:if test="${requestScope.del}">
	        	<th style="text-align:center;width:100">删除</th> 
	        	 </c:if>
	         
	      </tr>
	      <c:if test="${requestScope.staffs!=null}">
      <c:forEach items="${staffs}" var="staff">
      <tr style="text-align:center;">
      	<td>${staff.id }</td>
      	<td>
      	<c:if test="${staff.name!=null}"> 
      	    ${staff.name }
      	</c:if>
      	<c:if test="${staff.name==null}"> 
      	   --
      	</c:if>
      	</td>
      	<td>
      	 <c:if test="${staff.photo!=null}">
      	  <img src="${staff.photo }" width="100px"/>
      	  </c:if>
      	  <c:if test="${staff.photo==null}">
      	  --
      	  </c:if></td>
      	<td>
      	  <c:if test="${staff.sex ==0}">男</c:if>
      	  <c:if test="${staff.sex ==1}">女</c:if>
      	   <c:if test="${staff.sex ==null}">--</c:if>
      	</td>
      	<td>
      	<c:if test="${staff.age!=null}">${staff.age }</c:if>
      	<c:if test="${staff.age==null}">--</c:if>
      	</td>
      	<td>
      	<c:if test="${staff.cardId!=null}">
      	   ${staff.cardId }
      	</c:if>
      	<c:if test="${staff.cardId==null}">
      	  --
      	</c:if>
      	</td>
      	<td><c:if test="${staff.mobilephone!=null}">${staff.mobilephone }</c:if>
      	<c:if test="${staff.mobilephone==null}">--</c:if></td>
      	<td><c:if test="${staff.telephone!=null}">${staff.telephone }</c:if>
      	<c:if test="${staff.telephone==null}">--</c:if></td>
      	<td><c:if test="${staff.qq!=null}">${staff.qq }</c:if>
      	<c:if test="${staff.qq==null}">--</c:if></td>
      	<td><c:if test="${staff.mail!=null}">${staff.mail }</c:if>
      	<c:if test="${staff.mail==null}">--</c:if></td>
      	<td><c:if test="${staff.address!=null}">${staff.address }</c:if>
      	<c:if test="${staff.address==null}">--</c:if></td>	 
      	<td><c:if test="${staff.org.name!=null}">${staff.org.name}</c:if>
      	<c:if test="${staff.org.name==null}">--</c:if>
      	</td>
        <td><c:if test="${staff.describes!=null}">${staff.describes }</c:if>
        <c:if test="${staff.describes==null}">--</c:if></td>
      	<c:if test="${requestScope.upd}">
			 <td><a href="staff.do?method=updatePre&id=${staff.id }&mId=${mId}">
			  <img border="none" style="width:16px;height:16px;background-image:url(oa/images/ImageBundle.gif);background-repeat:no-repeat;background-position:0 -139px;" alt="编辑" src="oa/images/transparent.gif"/>
			  
			 </a></td>
			</c:if>
			<c:if test="${requestScope.del}">
			 <td><a href="javascript:void(0)" onclick="ConfirmDel(${staff.id },${requestScope.mId });">
			  <img border="none" style="width:16px;height:16px;background-image:url(oa/images/ImageBundle.gif);background-repeat:no-repeat;background-position:0 -91px;" alt="删除" src="oa/images/transparent.gif"/>
			 </a></td>
			</c:if>
      </tr>
      </c:forEach>
     </table>
     <hr size="5" color="#E1E1E1">
	<pg:pager url="staff.do" items="${count}" export="currentPageNumber=pageNumber" maxPageItems="4">
		<pg:param name="method" value="findAllStaff"/>
		<pg:param name="mId" value="${requestScope.mId}"/>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr><td colspan="8" width="400">&nbsp;</td>
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
      <c:if test="${requestScope.staffs==null}">
        无任何数据！
      </c:if>
    </form>
  </body>
</html>
