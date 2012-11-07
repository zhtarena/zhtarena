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
    
    <title>公告列表</title>
    
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
     function check(id,mId){
        var sure=window.confirm("确定删除此通讯簿？");
        var result=(sure==true)?"确定":"取消";
        if(result=="确定"){
           window.location.href="notice.do?method=delNotice&nId="+id+"&mId="+mId;
        }else{
          return;
        }
     }
</script>
  </head>
  
  <body>
   <form class="tableform" name="form1" action="" id="form1" method="post">
    <input type="hidden" value="${requestScope.mId }" name="mId" />
     <div class="main_content" id="main" style="height: 430px; visibility: visible; opacity: 1;">
     <div class="division"><div>&nbsp;</div>
     <c:if test="${requestScope.inc}">
      <a href="notice.do?method=addNoticedPre&mId=${requestScope.mId }">添加公告</a>
      </c:if>
       <a href="notice.do?method=findNotice">查看今日公告</a>
      <table cellspacing="0" cellpadding="0" border="0">
      <tbody>
	      <tr>
	        <th style="text-align:center;width:60">序号</th>
	        <th style="text-align:center;width:60">公告主题</th>
	        <th style="text-align:center;width:60">公告类型</th>
	        <th style="text-align:center;width:60">公告类型</th>
	        <th style="text-align:center;width:60">创建时间</th>
	        <th style="text-align:center;width:60">备注</th>
	         <c:if test="${requestScope.del}">
	         <th style="text-align:center;width:30">删除</th>
	         </c:if>	        
	      </tr>
	 <c:if test="${requestScope.notices!=null}">
      <c:forEach items="${notices}" var="notice">
      <tr style="text-align:center;">
      	<td>${notice.id }</td>
      	<td>${notice.subject }</td>
      	<td>
      		${notice.inforType.type  }
      	</td>
      	<td>
	      	${notice.content }
      	</td>
      	<td>
	      	<c:if test="${notice.rtime!=null}">${notice.rtime }</c:if>
	      	<c:if test="${notice.rtime==null}">--</c:if>
      	</td>
      	<td>
	      	<c:if test="${notice.describes!=null}">${notice.describes }</c:if>
	      	<c:if test="${notice.describes==null}">--</c:if>
      	</td>
      	 <c:if test="${requestScope.del}">
      	  <td>
      	   <a href="javascript:void(0)" onclick="check(${notice.id},${requestScope.mId })">
			 <img border="none" style="width:16px;height:16px;background-image:url(oa/images/ImageBundle.gif);background-repeat:no-repeat;background-position:0 -91px;" alt="删除" src="oa/images/transparent.gif"/>
			</a>
			</td>
      	   </c:if>
      </tr>
      </c:forEach>
      </tbody>
     </table>
     	<hr size="5" color="#E1E1E1">
	<pg:pager url="notice.do" items="${count}" export="currentPageNumber=pageNumber" maxPageItems="2">
		<pg:param name="method" value="findAllNotice"/>
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
      <c:if test="${requestScope.notices==null}">
      	<tr><td colspan="7"> 无任何数据！</td></tr>
      </c:if>
     </div>
     </div>
    </form>
  </body>
</html>
