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
    
    <title>信息类型列表</title>
    
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
		var str;
		var sid;
		var smid;
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
				if("<font color='green'>此类型无公告</font>"==unescape(xmlHttp.responseText)){
				    str="确定删除此类型？";
				}else{
				    str="此类型有下属公文，确定删除此类型及其公文？";
				}
				docheck();
			}
		}
		function docheck(){
		
     	   var sure=window.confirm(str);
      	   var result=(sure==true)?"确定":"取消";
           if(result=="确定"){
             window.location.href="notice.do?method=delInforType&iId="+sid+"&mId="+smId;
           }else{
            return;
          }
        }
	     function check(id,mId){
	     	  sid=id;
	     	  smId=mId;
   		  xmlHttp=getXmlHttp();
		   if(xmlHttp==null){
			 alert("对不起，您的浏览器不支持Ajax");
			}else{
				//地址
				var url="notice.do?method=findInfoHasNotice&iId="+encodeURI(id)+"&mId="+mId;
				//返回的状态
				xmlHttp.onreadystatechange=stateChanged;
				//创建一个请求
				xmlHttp.open("post",url,true);
				//向服务器发送请求
				xmlHttp.send(null);
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
     
     
      <a href="notice.do?method=addPre&mId=${requestScope.mId }">添加信息类型</a>&nbsp;&nbsp;&nbsp;&nbsp;
      </c:if>
      <a href="notice.do?method=findAllNotice&mId=${requestScope.mId }">查看公告</a>
      <table cellspacing="0" cellpadding="0" border="0">
      <tbody>
	      <tr>
	        <th style="text-align:center;width:60">序号</th>
	        <th style="text-align:center;width:60">类型</th>
	        <th style="text-align:center;width:60">备注</th>
	         <c:if test="${requestScope.del}">
	         <th style="text-align:center;width:30">删除</th>
	         </c:if>
	         <!-- 
	         <c:if test="${requestScope.upd}">
	          <th style="text-align:center;width:30">修改</th>
	           </c:if>
	            -->
	      </tr>
	 <c:if test="${requestScope.inforTypes!=null}">
      <c:forEach items="${inforTypes}" var="inforType">
      <tr style="text-align:center;">
      	<td>${inforType.id }</td>
      	<td>${inforType.type }</td>    	
      	<td>
      		<c:if test="${inforType.describes!=null}">${inforType.describes }</c:if>
      		<c:if test="${inforType.describes==null}">--</c:if>
      	</td>
      	 <c:if test="${requestScope.del}">
      	  <td>
      	   <a href="javascript:void(0)" onclick="check(${inforType.id},${requestScope.mId })">
			 <img border="none" style="width:16px;height:16px;background-image:url(oa/images/ImageBundle.gif);background-repeat:no-repeat;background-position:0 -91px;" alt="删除" src="oa/images/transparent.gif"/>
			</a>
			</td>
      	   </c:if>
      	    <!-- 
      	   <c:if test="${requestScope.upd}">
      	 <td>
      	    <a href="notice.do?method=updInfoPre&iId=${inforType.id }&mId=${requestScope.mId }">
			  <img  border="none" style="width:16px;height:16px;background-image:url(oa/images/ImageBundle.gif);background-repeat:no-repeat;background-position:0 -139px;" alt="编辑" src="oa/images/transparent.gif"/>
			</a>
			</td>
      	      </c:if>
      	      -->
      </tr>
      </c:forEach>
      </tbody>
     </table>
      <hr size="5" color="#E1E1E1">
	<pg:pager url="notice.do" items="${count}" export="currentPageNumber=pageNumber" maxPageItems="2">
		<pg:param name="method" value="findAllInforType"/>
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
      <c:if test="${requestScope.inforTypes==null}">
      	<tr><td colspan="4"> 无任何数据！</td></tr>
      </c:if>
     </div>
     </div>
    </form>
  </body>
</html>
