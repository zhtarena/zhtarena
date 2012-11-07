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
    
    <title>通讯簿列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
	<script type="text/javascript" src="oa/js/drag.js"></script>
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
     function check(id,mId){
        var sure=window.confirm("确定删除此通讯簿？");
        var result=(sure==true)?"确定":"取消";
        if(result=="确定"){
           window.location.href="addressList.do?method=delADL&id="+id+"&mId="+mId;
        }else{
          return;
        }
     }
     function query(sua){
	    var quyArea = document.getElementById("quyArea");
	    var quy = document.getElementById("quye");		
		if(sua.selectedIndex==1){ 	
		  	 quy.setAttribute("value","请输入用户名");
	   	}else if(sua.selectedIndex==2){
		  	 quy.setAttribute("value","请输入联系人姓名");
		}
    }
</script>
  </head>
  
  <body>
   <form class="tableform" name="form1" action="addressList.do?method=queryByParams" id="form1" method="post">
    <input type="hidden" value="${requestScope.mId }" name="mId" />
     <div class="main_content" id="main" style="height: 430px; visibility: visible; opacity: 1;">
     <div class="division"><div>&nbsp;</div>
      <a href="addressList.do?method=addPre&mId=${requestScope.mId }">添加通讯簿</a>
      <span id="quyAra">查询通讯簿
           <select name="rolename" id="quy"  onchange="query(this);">
             <option>请选择...</option>
             <option value="linkman">根据联系人姓名查询</option>
           </select>
           <span id="quyArea">
           		&nbsp;&nbsp;&nbsp;<input type="text" name="name" id="quye" value=""/>
           		<input type="submit" value="搜索"/>
           	</span>
           </span>
      <table cellspacing="0" cellpadding="0" border="0">
      <tbody>
	      <tr>
	        <th style="text-align:center;width:60">序号</th>
	        <th style="text-align:center;width:60">联系人姓名</th>
	        <th style="text-align:center;width:60">联系电话</th>
	        <th style="text-align:center;width:60">固定电话</th>
	        <th style="text-align:center;width:60">电子邮件</th>
	        <th style="text-align:center;width:60">QQ</th>
	        <th style="text-align:center;width:60">MSN</th>
	        <th style="text-align:center;width:60">邮编</th>
	        <th style="text-align:center;width:60">联系地址</th>
	         <c:if test="${requestScope.del}">
	         <th style="text-align:center;width:30">删除</th>
	         </c:if>
	         <c:if test="${requestScope.upd}">
	          <th style="text-align:center;width:30">修改</th>
	           </c:if>
	      </tr>
	 <c:if test="${requestScope.adls!=null}">
      <c:forEach items="${adls}" var="adl">
      <tr style="text-align:center;">
      	<td>${adl.id }</td>
      
      	<td>
      		<c:if test="${adl.linkman!=null}">${adl.linkman }</c:if>
      	 	<c:if test="${adl.linkman==null}">--</c:if>
      	</td>
      	<td>
	      	<c:if test="${adl.mobilephone!=null}">${adl.mobilephone }</c:if>
	      	<c:if test="${adl.mobilephone==null}">--</c:if>
      	</td>
      	<td>
	      	<c:if test="${adl.telephone!=null}">${adl.telephone }</c:if>
	      	<c:if test="${adl.telephone==null}">--</c:if>
      	</td>
      	<td>
	      	<c:if test="${adl.mail!=null}">${adl.mail }</c:if>
	      	<c:if test="${adl.mail==null}">--</c:if>
      	</td>
      	<td>
	      	<c:if test="${adl.qq!=null}">${adl.qq }</c:if>
	      	<c:if test="${adl.qq==null}">--</c:if>
      	</td>
      	<td>
	      	<c:if test="${adl.msn!=null}">${adl.msn }</c:if>
	      	<c:if test="${adl.msn==null}">--</c:if>
      	</td>
      	<td>
      		<c:if test="${adl.zip!=null}">${adl.zip }</c:if>
			<c:if test="${adl.zip==null}">--</c:if>
		</td>
      	<td>
      		<c:if test="${adl.address!=null}">${adl.address }</c:if>
      		<c:if test="${adl.address==null}">--</c:if>
      	</td>
      	 <c:if test="${requestScope.del}">
      	  <td>
      	   <a href="javascript:void(0)" onclick="check(${adl.id},${requestScope.mId })">
			 <img border="none" style="width:16px;height:16px;background-image:url(oa/images/ImageBundle.gif);background-repeat:no-repeat;background-position:0 -91px;" alt="删除" src="oa/images/transparent.gif"/>
			</a>
			</td>
      	   </c:if>
      	   
      	   <c:if test="${requestScope.upd}">
      	 <td>
      	    <a href="addressList.do?method=updPre&id=${adl.id }&mId=${requestScope.mId }">
			  <img  border="none" style="width:16px;height:16px;background-image:url(oa/images/ImageBundle.gif);background-repeat:no-repeat;background-position:0 -139px;" alt="编辑" src="oa/images/transparent.gif"/>
			</a>
			</td>
      	      </c:if>
      </tr>
      </c:forEach>
      </tbody>
     </table>
      	<hr size="5" color="#E1E1E1">
	<pg:pager url="addressList.do" items="${count}" export="currentPageNumber=pageNumber" maxPageItems="8">
		<pg:param name="method" value="findAllADL"/>
		<pg:param name="mId" value="${requestScope.mId}"/>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			 <td colspan="6" width="400">&nbsp;</td>
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
      <c:if test="${requestScope.adls==null}">
      	<tr><td colspan="11"> 无任何数据！</td></tr>
      </c:if>
     </div>
     </div>
    </form>
  </body>
</html>
