<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="/struts-tags" prefix="s"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>留言列表</title>
    
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
	 var smId;
	 var flag;
	 
	 function getXhr() {
		
	var xhr = null;
	if (window.XMLHttpRequest) {
		//非ie浏览器
		xhr = new XMLHttpRequest();
	} else {
		//ie浏览器
		xhr = new ActiveXObject("Microsoft.XMLHttp");
	}
	return xhr;
}
	 function stateChanged(){
		if(xhr.readyState==4){
		if("hasSub"==unescape(xhr.responseText)){
			 str="此留言下有下属回复留言，确定删除此留言及其回复留言？";
			 flag = true;
		}else{
			 str="确定删除此留言？";
			 flag = false;
		}
		docheck(flag);
	  }
	 }
	 
	 function check(id){
		 smId = id;
	    xhr=getXhr();
		if(xhr==null){
		    alert("对不起，您的浏览器不支持Ajax");
		}else{
			//地址
			var url="bbs/bbsAction!checkBBSHasReBBS?id="+id;
			//返回的状态
			xhr.onreadystatechange=stateChanged;
			//创建一个请求
			xhr.open("post",url,true);
			//向服务器发送请求
			xhr.send("id="+id);
		} 	
	 }
	 
	 function docheck(flag){
		var sure=window.confirm(str);
   		var result=((sure==true)?"确定":"取消");
       	if(result=="确定"){
           window.location.href="bbs/bbsAction!delById?id="+smId+"&flag="+flag;
        }else{
           return;
		}
	 }
	 
	 function subPage(pageNo) {
		 document.form1.elements['pageNo'].value=pageNo;
		 document.form1.submit();
	 }
</script>
  
  </head>
  
  <body>
   <form class="tableform" name="form1" action="bbs/bbsAction!listRoot" id="form1" method="post">
     <div class="main_content" id="main" style="height: 530px; visibility: visible; opacity: 1;">
     <div class="division"><div>&nbsp;</div>
      <table cellspacing="0" cellpadding="0" border="0">
      <tbody>
        【<a href="${pageContext.request.contextPath}/oa/pages/bbs/addBBS.jsp">发表新主题】</a>
        
       <tr style="text-align:center;">
       <th style="width:4%;"></th>
      	<th style="text-align:left;width:80%;">
      		【主题】
      	</th>	
      	<th style="width:6%;">
      		【作者】
      	</th>
      	<th style="width:10%;">
      		【发表时间】
      	</th>
	     <th>
	      	  
	      	  【操作】
	      	
      	</th>
      </tr>
      
      
      <!-- 循环主题开始 -->
      <s:iterator value="bbss" var="b">
      <tr>
      	<td>
      	</td>
        <td>
        <a href="bbs/bbsAction!load?id=<s:property value="#b.id"/>"><s:property value="#b.subject"/></a>
      	</td>
      	<td>
        <s:property value="#b.uid"/>
      </td>
      <td>
        <s:date name="#b.rtime"  format="yyyy-MM-dd hh:mm:ss" />
      </td>
      <td><a href="javascript:void(0)" onclick="check(<s:property value="#b.id"/>)">删除</a></td>
       </tr>
      </s:iterator>
   <!-- 循环主题结束 -->
      
      
      </tbody>
     </table>
      <hr size="5" color="#E1E1E1">
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			 <td colspan="6" width="400">&nbsp;</td>
				<td class="STYLE4" align="left">
					&nbsp;&nbsp;共有${countPage }页，当前第 ${pageNo } 页
				</td>
				<td>
					<table border="0" align="right" cellpadding="0"
						cellspacing="0">
						<input type="hidden" name="pageNo"/>
						<tr>
							<td width="40">
								<s:if test="pageNo<=1">
								<a href="javascript:;"><img src="oa/pages/images/first.gif" width="37"
									height="15" /></a>
								</s:if>
								<s:else>
								<a href="javascript:subPage(1);"><img src="oa/pages/images/first.gif" width="37"
									height="15" /></a>
								</s:else>
							</td>
							
							<td width="45">
							
								<s:if test="pageNo<=1">
								<a href="javascript:;"><img src="oa/pages/images/back.gif" width="37"
									height="15" /></a>
								</s:if>
								<s:else>
								<a href="javascript:subPage(<s:property value="pageNo-1"/>);"><img src="oa/pages/images/back.gif" width="43"
									height="15" /></a>
								</s:else>
							</td>
							<td width="45">
								<s:if test="pageNo>=countPage">
								<a href="javascript:;"><img src="oa/pages/images/next.gif" width="37"
									height="15" /></a>
								</s:if>
								<s:else>
								<a href="javascript:subPage(<s:property value="pageNo+1"/>);"><img src="oa/pages/images/next.gif" width="43"
									height="15" /></a>
								</s:else>
							</td>
							<td width="40">
							<s:if test="pageNo>=countPage">
								<a href="javascript:;"><img src="oa/pages/images/last.gif" width="37"
									height="15" /></a>
								</s:if>
								<s:else>
								<a href="javascript:subPage(<s:property value="countPage"/>);"><img src="oa/pages/images/last.gif" width="37"
									height="15" /></a>
									</s:else>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
      
      	<s:if test="bbss==null">
      	<tr><td colspan="2" style="text-align:center;"> 无任何数据！</td></tr>
      	</s:if>
     </div>
     </div>
    </form>
  </body>
</html>
