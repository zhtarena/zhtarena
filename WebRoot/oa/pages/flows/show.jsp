<%@ page language="java" import="java.util.*;" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
		<title>流程管理</title>
		<base href="<%=basePath%>" />
		<script type="text/javascript" src="oa/js/jquery.js"></script>
		<script type="text/javascript" src="oa/js/drag.js"></script>
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
	</head>

	<body>
		<jsp:include page="/flow.do?method=findAllFlows&mId=${requestScope.mId}" flush="true"></jsp:include>
		<div class="head_content" id="headBar">
			<div class="mainHead navBar">
				<a href="">流程管理</a> »
				<a class="" href="">流程列表</a>
			</div>

			<div id="finder-head-8adea0" class="mainHead headBox">
				<div class="finder-head">
					<div class="span-1">
						<input type="checkbox" id="finder-selAll-8adea0" />
					</div>
					<div class="span-2 pointer" title="流程名称">
						流程名称
					</div>

					<div class="span-2 pointer" title="下载模板">
						下载
					</div>
					<div class="span-2 pointer" title="查看流程">
						查看
					</div>
					<div class="span-2 pointer" title="编辑">
						编辑
					</div>
					<div class="span-2 pointer" title="删除">
						删除
					</div>

				</div>
			</div>
		</div>
		<div class="main_content" id="main"
			style="height: 300px;  visibility: visible; opacity: 1;">



			<div id="finder-8adea0" class="finder">
				<div id="finder-listForm-8adea0">
					<div id="finder-list-8adea0" class="finder-list">

						<div item-id="4" class="row">
							<c:if test="${!empty flows}">
								<c:forEach items="${flows}" var="flow">
									<div style="cursor: pointer;" class="row-line">

										<div class="span-1 span-select">
											<input type="checkbox" value="4" name="member_id[]"
												class="sel" tags="null" />

										</div>
										<div class="cell span-2" key="uname">
											${flow.name }
										</div>
										<div class="cell span-2" key="remark" align="center">
											<a href="oa/pages/flows/download.jsp?filename=${flow.appendix }"> <img border="none"
													style="width: 16px; height: 16px; background-image: url(oa/images/ImageBundle.gif); background-repeat: no-repeat; background-position: 0 -485px;"
													alt="下载" src="oa/images/transparent.gif" /> </a>
										</div>
										<div class="cell span-2" key="remark" align="center">
											<a href="flow.do?method=findFlowById&type=information&id=${flow.id }"> <img border="none"
													style="width: 16px; height: 16px; background-image: url(oa/images/ImageBundle.gif); background-repeat: no-repeat; background-position: 0 -404px;"
													alt="查看" src="oa/images/transparent.gif" /> </a>
										</div>

										<div class="cell span-2" key="remark" align="center">
											<a href="flow.do?method=findFlowById&type=update&id=${flow.id }"> <img border="none"
													style="width: 16px; height: 16px; background-image: url(oa/images/ImageBundle.gif); background-repeat: no-repeat; background-position: 0 -139px;"
													alt="编辑" src="oa/images/transparent.gif" /> </a>
										</div>

										<div class="cell span-2" key="remark" align="center">
											<a href="flow.do?method=delFlow&id=${flow.id }"> <img border="none"
													style="width: 16px; height: 16px; background-image: url(oa/images/ImageBundle.gif); background-repeat: no-repeat; background-position: 0 -91px;"
													alt="删除" src="oa/images/transparent.gif" /> </a>
										</div>

									</div>
								</c:forEach>
							</c:if>
							<c:if test="${empty flows}">
								<font color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;暂无流程</font>

							</c:if>
						</div>

					</div>
				</div>
			</div>
		</div>
	</body>
</html>
