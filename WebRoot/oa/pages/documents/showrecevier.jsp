<%@ page language="java" import="java.util.*;" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ 
	request.getServerName() + ":" + 
	request.getServerPort()+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>公文管理</title>
		<base href="<%=basePath%>" />
		<script type="text/javascript" src="oa/js/jquery.js"></script>
		<script type="text/javascript" src="oa/js/drag.js"></script>
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		
		<script type="text/javascript" language="javascript">
		function checkshow(docurl){		
		var docmenujs=document.getElementById("docmenu")
		docmenujs.innerHTML="";
		if(docurl=="myself"){//我的公文
		document.getElementById("myselfdoc").innerHTML="<a href='doc.do?method=findDocsBySender&docurl=myself'>【我的公文】</a>"
		document.getElementById("waitingdoc").innerHTML="<a href='docuser.do?method=findDocUsersByRecevier&docurl=waiting&status=0'>待审批公文</a>"
		document.getElementById("haveddoc").innerHTML="<a href='docuser.do?method=findDocUsersByRecevier&docurl=haved&status=1'>已审批公文</a>"
		docmenujs.innerHTML="<a href='doc.do?method=findDocsBySenderStatus&status=0&docurl=myselfstatus0'>新建的公文</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='doc.do?method=findDocsBySenderStatus&status=1&docurl=myselfstatus1'>等待审批的公文</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='doc.do?method=findDocsBySenderStatus&status=2&docurl=myselfstatus2'>审批成功的公文</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='doc.do?method=findDocsBySenderStatus&status=3&docurl=myselfstatus3'>审批失败的公文</a>";
		}
		else if(docurl=="myselfstatus0"){//我的公文--新建
		document.getElementById("myselfdoc").innerHTML="<a href='doc.do?method=findDocsBySender&docurl=myself'>【我的公文】</a>"
		document.getElementById("waitingdoc").innerHTML="<a href='docuser.do?method=findDocUsersByRecevier&docurl=waiting&status=0'>待审批公文</a>"
		document.getElementById("haveddoc").innerHTML="<a href='docuser.do?method=findDocUsersByRecevier&docurl=haved&status=1'>已审批公文</a>"
		docmenujs.innerHTML="<a href='doc.do?method=findDocsBySenderStatus&status=0&docurl=myselfstatus0'>【新建的公文】</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='doc.do?method=findDocsBySenderStatus&status=1&docurl=myselfstatus1'>等待审批的公文</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='doc.do?method=findDocsBySenderStatus&status=2&docurl=myselfstatus2'>审批成功的公文</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='doc.do?method=findDocsBySenderStatus&status=3&docurl=myselfstatus3'>审批失败的公文</a>";
		}
		else if(docurl=="myselfstatus1"){//我的公文--等待审批的公文
		document.getElementById("myselfdoc").innerHTML="<a href='doc.do?method=findDocsBySender&docurl=myself'>【我的公文】</a>"
		document.getElementById("waitingdoc").innerHTML="<a href='docuser.do?method=findDocUsersByRecevier&docurl=waiting&status=0'>待审批公文</a>"
		document.getElementById("haveddoc").innerHTML="<a href='docuser.do?method=findDocUsersByRecevier&docurl=haved&status=1'>已审批公文</a>"
		docmenujs.innerHTML="<a href='doc.do?method=findDocsBySenderStatus&status=0&docurl=myselfstatus0'>新建的公文</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='doc.do?method=findDocsBySenderStatus&status=1&docurl=myselfstatus1'>【等待审批的公文】</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='doc.do?method=findDocsBySenderStatus&status=2&docurl=myselfstatus2'>审批成功的公文</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='doc.do?method=findDocsBySenderStatus&status=3&docurl=myselfstatus3'>审批失败的公文</a>";
		}
		else if(docurl=="myselfstatus2"){//我的公文--审批成功的公文
		document.getElementById("myselfdoc").innerHTML="<a href='doc.do?method=findDocsBySender&docurl=myself'>【我的公文】</a>"
		document.getElementById("waitingdoc").innerHTML="<a href='docuser.do?method=findDocUsersByRecevier&docurl=waiting&status=0'>待审批公文</a>"
		document.getElementById("haveddoc").innerHTML="<a href='docuser.do?method=findDocUsersByRecevier&docurl=haved&status=1'>已审批公文</a>"
		docmenujs.innerHTML="<a href='doc.do?method=findDocsBySenderStatus&status=0&docurl=myselfstatus0'>新建的公文</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='doc.do?method=findDocsBySenderStatus&status=1&docurl=myselfstatus1'>等待审批的公文</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='doc.do?method=findDocsBySenderStatus&status=2&docurl=myselfstatus2'>【审批成功的公文】</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='doc.do?method=findDocsBySenderStatus&status=3&docurl=myselfstatus3'>审批失败的公文</a>";
		}
		else if(docurl=="myselfstatus3"){//我的公文--审批失败的公文
		document.getElementById("myselfdoc").innerHTML="<a href='doc.do?method=findDocsBySender&docurl=myself'>【我的公文】</a>"
		document.getElementById("waitingdoc").innerHTML="<a href='docuser.do?method=findDocUsersByRecevier&docurl=waiting&status=0'>待审批公文</a>"
		document.getElementById("haveddoc").innerHTML="<a href='docuser.do?method=findDocUsersByRecevier&docurl=haved&status=1'>已审批公文</a>"
		docmenujs.innerHTML="<a href='doc.do?method=findDocsBySenderStatus&status=0&docurl=myselfstatus0'>新建的公文</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='doc.do?method=findDocsBySenderStatus&status=1&docurl=myselfstatus1'>等待审批的公文</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='doc.do?method=findDocsBySenderStatus&status=2&docurl=myselfstatus2'>审批成功的公文</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='doc.do?method=findDocsBySenderStatus&status=3&docurl=myselfstatus3'>【审批失败的公文】</a>";
		}
		else if(docurl=="waiting"){//待审批公文
		document.getElementById("myselfdoc").innerHTML="<a href='doc.do?method=findDocsBySender&docurl=myself'>我的公文</a>"
		document.getElementById("waitingdoc").innerHTML="<a href='docuser.do?method=findDocUsersByRecevier&docurl=waiting&status=0'>【待审批公文】</a>"
		document.getElementById("haveddoc").innerHTML="<a href='docuser.do?method=findDocUsersByRecevier&docurl=haved&status=1'>已审批公文</a>"
		docmenujs.innerHTML="";
		}
		else if(docurl=="haved"){//已审批公文
		document.getElementById("myselfdoc").innerHTML="<a href='doc.do?method=findDocsBySender&docurl=myself'>我的公文</a>"
		document.getElementById("waitingdoc").innerHTML="<a href='docuser.do?method=findDocUsersByRecevier&docurl=waiting&status=0'>待审批公文</a>"
		document.getElementById("haveddoc").innerHTML="<a href='docuser.do?method=findDocUsersByRecevier&docurl=haved&status=1'>【已审批公文】</a>"
		docmenujs.innerHTML="";
		}
	
		}
		
		function opwindow(docid){
		var obj=new Object();
		obj.did=docid;
		showModalDialog('oa/pages/documents/selectstaff.jsp',obj,'dialogWidth:500px;dialogHeight:400px;dialogLeft:200px;dialogTop:150px;center:yes;help:yes;resizable:yes;status:yes')
		}
		
		function opwindowhistory(docid){
		var obj=new Object();
		obj.did=docid;
		
		showModalDialog('oa/pages/documents/forward.jsp',obj,'dialogWidth:500px;dialogHeight:400px;dialogLeft:200px;dialogTop:150px;center:yes;help:yes;resizable:yes;status:yes')
		}
		
		function opwindowcommit(docid,status){
		var obj=new Object();
		obj.did=docid;
		obj.status=status;
		showModalDialog('oa/pages/documents/commiting.jsp',obj,'dialogWidth:500px;dialogHeight:400px;dialogLeft:200px;dialogTop:150px;center:yes;help:yes;resizable:yes;status:yes')
		}
		
		function comitting(docid){//审批
		if(confirm("审批是否通过？(确定--通过，取消--不通过)")){
			opwindowcommit(docid,1);
		}else{
			opwindowcommit(docid,2);		
		}		
		}
		
	
		</script>
		
	</head>

	<body onload="checkshow('<%=request.getAttribute("docurl")%>')">
		<div class="head_content" id="headBar">
			<div class="mainHead navBar">
				<a href="">公文管理</a> »
				<a class="" href="">公文列表</a>
			</div>

					<div class="tableform">
					
					<h5>
						<span id="myselfdoc"><a href="doc.do?method=findDocsBySender&docurl=myself">我的公文</a></span>&nbsp;&nbsp;
						<span id="waitingdoc"><a href="docuser.do?method=findDocUsersByRecevier&docurl=waiting&status=0">待审批公文</a></span>&nbsp;&nbsp;
						<span id="haveddoc"><a href="docuser.do?method=findDocUsersByRecevier&docurl=haved&status=1">已审批公文</a></span>&nbsp;&nbsp;
						
						
						
					</h5>
					<br/>
					<span align="right" id="docmenu"></span>
					</div>
			<div id="finder-head-8adea0" class="mainHead headBox">
				<div class="finder-head">
					<div class="span-1">
						<input type="checkbox" id="finder-selAll-8adea0" />
					</div>
					<div class="span-2 pointer" title="公文名称">
						公文名称
					</div>

					<div class="span-4 pointer" title="公文描述">
						公文描述
					</div>
					<div class="span-4 pointer" title="创建时间">
						发送时间
					</div>
					<div class="span-2 pointer" title="审批状态">
						审批状态
					</div>
					<div class="span-2 pointer" title="流程名称">
						流程名称
					</div>
					<div class="span-8 pointer" title="附件">
						附件
					</div>
					<div class="span-4 pointer" title="审批历史">
						审批历史
					</div>

					<div class="span-4 pointer" title="相关操作">
相关操作
					</div>					
				</div>
			</div>
		</div>
		<div class="main_content" id="main"
			style="height: 260px; width: 1352px; visibility: visible; opacity: 1;">



			<div id="finder-8adea0" class="finder">
				<div id="finder-listForm-8adea0">
					<div id="finder-list-8adea0" class="finder-list">
					<c:if test="${!empty docusers}">
 	<c:forEach items="${docusers}" var="docuser">
     <div item-id="4" class="row">
							<div style="cursor: pointer;" class="row-line">

								<div class="span-1 span-select">
									<input type="checkbox" value="4" name="member_id[]" class="sel"
										tags="null" />
									<input type="hidden" value="${docuser.id }" name="id" class="sel"
										tags="null" />
								</div>
								<div class="cell span-2" key="uname">
									${docuser.document.name }&nbsp;
								</div>
								<div class="cell span-4" key="describes">
									${docuser.document.describes }&nbsp;
								</div>

								<div class="cell span-4" key="ctime">
									<fmt:formatDate pattern="yyyy年MM月dd日   HH:mm:ss" value="${docuser.ctime }"
												var="dateline"></fmt:formatDate>${ dateline}
												
								</div>
								<div class="cell span-2" key="dstatus">
								
								
								<c:if test="${docuser.status==0}">待审批</c:if>
								<c:if test="${docuser.status==1}">审批通过</c:if>
								<c:if test="${docuser.status==2}">审批失败</c:if>
		
								</div>

								<div class="cell span-2" key="flowname">
									${docuser.document.flow.name }&nbsp;
								</div>
								<div class="cell span-8" key="appendix">
								<c:if test="${docurl=='waiting'}">
								<c:if test="${!empty docuser.document.flow.appendix}">
								<a href="oa/pages/flows/download.jsp?filename=${docuser.document.appendix }"> <img border="none"
													style="width: 16px; height: 16px; background-image: url(oa/images/ImageBundle.gif); background-repeat: no-repeat; background-position: 0 -485px;"
													alt="下载" src="oa/images/transparent.gif" /> </a>
													</c:if>
								</c:if>
								<c:set var="appendix" value="${docuser.document.appendix }"></c:set>
							 <c:forEach items="${fn:split(appendix,'_')}" var="splitapp" begin="1" end="1">
   <c:out value="${splitapp}"></c:out>
   </c:forEach>
							
									&nbsp;
								</div>
								<div class="cell span-4" key="sex">
								
									<c:if test="${docurl=='waiting'}">
									<a href='javascript:new opwindowhistory(${docuser.document.id });void(0);'>审批历史</a>
									</c:if>
									<c:if test="${docurl=='haved'}">
									<a href='javascript:new opwindowhistory(${docuser.document.id });void(0);'>审批历史</a>
									</c:if>
									&nbsp;
									
								</div>
								
								
									<div class="cell span-4" key="remark" align="left">
									
									<c:if test="${docurl=='waiting'}">									
									<a href="javascript:new comitting(${docuser.document.id });void(0)">审批</a>
									</c:if>
									&nbsp;
									</div>

								</div>


							</div>
     
      </c:forEach>
      <div align="left">
												
													
												

												<table width="312" border="0" align="right" cellpadding="0"
													cellspacing="0">
													<TR>
														<TD height="28" align="right" vAlign="center" nowrap="nowrap">
															&nbsp;&nbsp;
															<pg:pager url="${actionmethod}"
																items="${total}"
																export="currentPageNumber=pageNumber" maxPageItems="10">
																<span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong>
															${ total}</strong> 条记录,当前第 ${currentPageNumber } 页</span>
															&nbsp;&nbsp;&nbsp;&nbsp;
																<pg:param name="method" value="${docaction}" />
																<pg:param name="docurl" value="${docurl}" />
																<pg:param name="status" value="${status}" />
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
      <c:if test="${empty docusers}">
      <div><font color='red'>暂无记录！</font></div>
      </c:if>
						
						</div>

					</div>
				</div>
		</div>
	</body>
</html>
