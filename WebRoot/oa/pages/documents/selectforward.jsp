<%@ page language="java" import="java.util.*,com.oa.model.*" pageEncoding="UTF-8"%>

<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
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
		<title>选择审批人员</title>

		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		<link rel="StyleSheet" href="oa/css/dtree.css" type="text/css" />
		<script type="text/javascript" src="oa/js/dtree.js"></script>
	<script type="text/javascript">
	function changeCommit(obj){
	var staffid=obj.value;
	var docid=document.getElementById("docid").value;
	
	window.close();
	window.location.href="docuser.do?method=addDocUser&staffid="+staffid+"&docid="+docid;
	window.opener.location.reload();
	}
	</script>
	</head>
	<body>
	<jsp:include flush="true" page="/org.do?method=findAllOrgs&mId=${requestScope.mId}"></jsp:include>
	<form action="" method="post">
	 <table align="left" valign="top">
	 <tr align="left" valign="top"><td width="20%">
	 
	<input type="hidden" name="docid" id="docid" value="${docid }"/>	
	请选择提交到的机构：
	<div id="dtree" class="dtree">
<script type="text/javascript">
		<!-- 
		d = new dTree('d');
		//oa/pages/orgs/addorgs.jsp?pid=0&pname=无父机构;oa/pages/orgs/addorgs.jsp?pid=${org.id}&pname=${org.name};oa/pages/orgs/addorgs.jsp?pid=${org.id}&pname=${org.name}
		d.add(0,-1,'OA平台',"");
		<c:forEach items="${orgs}" var="org">
		<c:if test = "${empty org.porg}">
		d.add(${org.id},0,'${org.name}',"staff.do?method=findUserByOrgId&orgId=${org.id}&docid="+${docid});
		</c:if>
		
		<c:if test = "${!empty org.porg}">
		d.add(${org.id},${org.porg.id},'${org.name}',"staff.do?method=findUserByOrgId&orgId=${org.id}&docid="+${docid});//
		</c:if>
		</c:forEach>
		
		document.write(d);
		d.openAll();
		
		//-->
	</script>
</div>   
    </td><td align="left" valign="top">
   
    <c:if test="${!empty orgId}">
     请从下列人员中选择审批人员：<br/>
     
    	<c:if test="${!empty staffs}">
 		<c:forEach items="${staffs}" var="staff">
     	<div item-id="4" class="row" style="">
							<div style="cursor: pointer;">
								<div class="span-6 span-select">
									<input type="radio" value="${staff.id }" name="staffid" class="sel"
										tags="null" onclick="changeCommit(this)"/>${staff.name }
								</div>
								</div>
								</div>
      </c:forEach>
      <div align="left">										
					
												<table width="312" border="0" align="right" cellpadding="0"
													cellspacing="0" >
													<TR>
														<TD height="28" align="left" vAlign="center" nowrap="nowrap">
															&nbsp;&nbsp;
															<pg:pager url="staff.do"
																items="${total}"
																export="currentPageNumber=pageNumber" maxPageItems="10">
																<span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong>
															${ total}</strong> 条记录,当前第 ${currentPageNumber } 页</span>
															&nbsp;&nbsp;&nbsp;&nbsp;
															<pg:param name="method" value="findUserByOrgId" />
																<pg:param name="orgId" value="${orgId}" />
																<pg:param name="docid" value="${docid}" />
																<pg:first>
																	<a href="${pageUrl}">首页</a>
																</pg:first>
																<pg:prev>
																	<a href="${pageUrl }">前页</a>
																</pg:prev>
																<pg:pages>
																	<c:choose>
																		<c:when test="${currentPageNumber eq pageNumber }">
																			<font color="red">${pageNumber }</font>
																		</c:when>
																		<c:otherwise>
																			<a href="${pageUrl }">${pageNumber }</a>
																		</c:otherwise>
																	</c:choose>
																</pg:pages>
																<pg:next>
																	<a href="${pageUrl }">后页</a>
																</pg:next>
																<pg:last>
																	<a href="${pageUrl }">尾页</a>
																</pg:last>
															</pg:pager>
														</TD>
													</TR>
												</table>	
												</div>						
      </c:if>
      <c:if test="${empty staffs}">
      <div><font color='red'>该机构暂无员工！</font></div>
      </c:if>
    </c:if>
    
    </td></tr>
    </table>
    </form>
	</body>
</html>
