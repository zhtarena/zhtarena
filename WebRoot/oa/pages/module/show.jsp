<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
		<title>模块列表</title>
		<base href="<%=basePath%>" />
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
		<script type="text/javascript" src="oa/js/jquery.js">
</script>
		<script type="text/javascript" src="oa/js/drag.js">
</script>
		<script type="text/javascript" src="oa/js/moduleChange.js">
</script>
		<script type="text/javascript">

function checkIsHavaCmodules(isLeaf, moduleId, mId) {
	if (isLeaf == 0) {
		window.location.href = "module.do?method=delModule&id=" + moduleId
				+ "&mId=" + mId;
	} else {
		alert("请确认没有子模块再删除！");
		return;
	}

}
function checkVisible1(moduleId) {
	var cmodules = document.getElementById("module2" + moduleId).style.display;
	if (cmodules == "none") {
		document.getElementById("hmodule1" + moduleId).style.display = "block";
		document.getElementById("smodule1" + moduleId).style.display = "none";
		document.getElementById("module2" + moduleId).style.display = "block";
	} else {
		document.getElementById("smodule1" + moduleId).style.display = "block";
		document.getElementById("hmodule1" + moduleId).style.display = "none";
		document.getElementById("module2" + moduleId).style.display = "none";
	}

}
function checkVisible2(moduleId) {
	var cmodules = document.getElementById("module3" + moduleId).style.display;
	if (cmodules == "none") {
		document.getElementById("hmodule1" + moduleId).style.display = "block";
		document.getElementById("smodule1" + moduleId).style.display = "none";

		document.getElementById("module3" + moduleId).style.display = "block";
	} else {
		document.getElementById("smodule1" + moduleId).style.display = "block";
		document.getElementById("hmodule1" + moduleId).style.display = "none";
		document.getElementById("module3" + moduleId).style.display = "none";
	}

}
</script>
	</head>
	<body>
		${message }
		<div id="all">
			<div class="head_content" id="headBar" tid="gg"
				style="display: block">
				<div class="mainHead navBar">
					<a class="" href="">权限管理</a> »
					<a class="" href="">模块管理</a> »
					<span class="">模块列表</span>
				</div>
				<div style="text-align: center !important"
					class="finder-head mainHead">
					<div class="span-8">
						模块名称
					</div>
					<div class="span-4">
						类型
					</div>
					<div class="span-4">
						链接URL
					</div>
					<%--
        <div class="span-4">target</div>
         --%>

					<div class="span-4">
						显示的图标
					</div>
					<div class="span-4">
						排序
					</div>
					<%--<c:if test="${requestScope.upd}">
           --%>
					<div class="span-2">
						编辑
					</div>
					<%--</c:if>
       <c:if test="${requestScope.del}">
           --%>
					<div class="span-2">
						删除
					</div>
					<%--
          </c:if>
   --%>

				</div>
			</div>
			<div class="main_content" id="main"
				style="height: 500px; width: 1349px; visibility: visible; opacity: 1;">
				<form method="post" id="catEditor" action="">

					<div class="finder">

						<div style="text-align: center !important" class="finder-list"
							id="cat_tree">

							<div pid="0" cid="8" id="module1" class="clear_cat row"
								depath="1">
								<s:iterator value="modules" var="module">
								<s:if test="#module.pmodule==0">
									<div class="row-line">
										
											<div style="text-align: left !important" class="span-8">

												<div style="margin-left: 35px;">
												<s:if test="#module.isLeaf==1">
													<span
														style="width: 12px; line-height: 12px; margin: 5px 4px; overflow: hidden; display: block; float: left; padding: 0; cursor: pointer">
														<img onclick="checkVisible1(${module.id})"
															id="hmodule1${module.id}" border="none"
															style="width: 12px; height: 12px; background-image: url(oa/images/ImageBundle.gif); background-repeat: no-repeat; background-position: 0 -171px; display: none;"
															title="收起子分类" alt="收起子分类" src="oa/images/transparent.gif" />
														<img onclick="checkVisible1(${module.id})"
															id="smodule1${module.id}" border="none"
															style="width: 12px; height: 12px; background-image: url(oa/images/ImageBundle.gif); background-repeat: no-repeat; background-position: 0 -183px; display: block;"
															title="展开子分类" alt="收起子分类" src="oa/images/transparent.gif" />
													</span>
													</s:if>
													<s:else>
													<span
																	style="width: 12px; line-height: 12px; margin: 5px 4px; overflow: hidden; display: block; float: left; padding: 0; cursor: pointer">
																	|__ </span>
													</s:else>
													 排序
													<input type="number" value="1" name="p_order[8]" size="2"
														class="orderTextStyle" />
													<span style="color: #369; padding-right: 15px;" class="lnk">${module.name}</span>
												</div>
											</div>
											<div class="span-4">
												<span style="font-weight: normal; padding: 0 5px"
													class="quiet">[一级模块]</span>
											</div>
											<div class="span-4">
												<span style="font-weight: normal; padding: 0 5px"
													class="quiet">${module.url}</span>
											</div>
											
											<div class="span-4">
												<span style="font-weight: normal; padding: 0 5px"
													class="quiet"><img src="${module.img }" />
												</span>
											</div>
											<div class="span-4">
												<span style="font-weight: normal; padding: 0 5px"
													class="quiet">${module.sort}</span>
											</div>
												<div class="span-2">
												<span style="cursor: pointer"> <a
													href="module/moduleList!load?id=${module.id}&pmodule=${module.pmodule}">
														<img border="none"
															style="width: 16px; height: 16px; background-image: url(oa/images/ImageBundle.gif); background-repeat: no-repeat; background-position: 0 -139px;"
															alt="编辑" src="oa/images/transparent.gif">
												</a> </span>
										
									</div>
									
								<div class="span-2">
										<span style="cursor: pointer"> <a
											href="javascript:checkIsHavaCmodules(${module.isLeaf },${module.id },${requestScope.mId });">
												<img border="none"
													style="width: 16px; height: 16px; background-image: url(oa/images/ImageBundle.gif); background-repeat: no-repeat; background-position: 0 -91px;"
													alt="删除" src="oa/images/transparent.gif">
										</a> </span>

									</div>
									
 
							</div>
							
							<div pid="8" cid="9" style="display: none"
								id="module2${module.id }" depath="2">
								
								<s:iterator value="modules" var="cmodule">
									<s:if test="#cmodule.pmodule==#module.id">
										<div class="row-line">
											<div style="text-align: left !important" class="span-8">
												<div style="margin-left: 70px;">
												<s:if test="#cmodule.isLeaf==1">
													<span
														style="width: 12px; line-height: 12px; margin: 5px 4px; overflow: hidden; display: block; float: left; padding: 0; cursor: pointer">
														<img onclick="checkVisible2(${cmodule.id})"
															id="hmodule1${cmodule.id}" border="none"
															style="width: 12px; height: 12px; background-image: url(oa/images/ImageBundle.gif); background-repeat: no-repeat; background-position: 0 -171px; display: none;"
															title="收起子分类" alt="收起子分类" src="oa/images/transparent.gif" />
														<img onclick="checkVisible2(${cmodule.id})"
															id="smodule1${cmodule.id}" border="none"
															style="width: 12px; height: 12px; background-image: url(oa/images/ImageBundle.gif); background-repeat: no-repeat; background-position: 0 -183px; display: block;"
															title="展开子分类" alt="收起子分类" src="oa/images/transparent.gif" />
													</span>
													</s:if>
													<s:else>
													<span style="width: 12px; line-height: 12px; margin: 5px 4px; overflow: hidden; display: block; float: left; padding: 0; cursor: pointer">
														|__ </span>
													</s:else>
													 排序
													<input type="number" value="2" name="p_order[9]" size="2"
														class="orderTextStyle">
														<span style="color: #369; padding-right: 15px;"
															class="lnk">${cmodule.name}</span>
												</div>
											</div>
											<div class="span-4">
												<span style="font-weight: normal; padding: 0 5px"
													class="quiet">[二级模块]</span>
											</div>
											<div class="span-4">
												<span style="font-weight: normal; padding: 0 5px"
													class="quiet">${cmodule.url}</span>
											</div>
											<div class="span-4">
												<span style="font-weight: normal; padding: 0 5px"
													class="quiet"><img src="${cmodule.img }" />
												</span>
											</div>
											<div class="span-4">
												<span style="font-weight: normal; padding: 0 5px"
													class="quiet">${cmodule.sort}</span>
											</div>
										
												<div class="span-2">
													<span style="cursor: pointer"> <a
														href="module.do?method=upModule&id=${cmodule.id }&mId=${requestScope.mId }">
															<img border="none"
																style="width: 16px; height: 16px; background-image: url(oa/images/ImageBundle.gif); background-repeat: no-repeat; background-position: 0 -139px;"
																alt="编辑" src="oa/images/transparent.gif">
													</a> </span>
												</div>
											
											
												<div class="span-2">
													<span style="cursor: pointer"> <a
														href="javascript:checkIsHavaCmodules(${cmodule.isLeaf },${cmodule.id },${requestScope.mId });">
															<img border="none"
																style="width: 16px; height: 16px; background-image: url(oa/images/ImageBundle.gif); background-repeat: no-repeat; background-position: 0 -91px;"
																alt="删除" src="oa/images/transparent.gif">
													</a> </span>
												</div>
										</div>
									
										<div style="display: none" pid="8" cid="9"
											id="module3${cmodule.id }" class="clear_cat row" depath="2">
											<s:iterator value="modules" var="cmodule2">
											
												
												<s:if test="#cmodule2.pmodule==#cmodule.id">
													<div class="row-line">
														<div style="text-align: left !important" class="span-8">
															<div style="margin-left: 110px;">
																<span
																	style="width: 12px; line-height: 12px; margin: 5px 4px; overflow: hidden; display: block; float: left; padding: 0; cursor: pointer">
																	|__ </span> 排序
																<input type="number" value="3" name="p_order[9]"
																	size="2" class="orderTextStyle">
																	<span style="color: #369; padding-right: 15px;"
																		class="lnk">${cmodule2.name}</span>
															</div>
														</div>
														<div class="span-4">
															<span style="font-weight: normal; padding: 0 5px"
																class="quiet">[三级模块]</span>
														</div>
														<div class="span-4">
															<span style="font-weight: normal; padding: 0 5px"
																class="quiet">${cmodule2.url}</span>
														</div>
														
														<div class="span-4">
															<span style="font-weight: normal; padding: 0 5px"
																class="quiet"><img src="${cmodule2.img }" />
															</span>
														</div>
														<div class="span-4">
															<span style="font-weight: normal; padding: 0 5px"
																class="quiet">${cmodule2.sort}</span>
														</div>
														
															<div class="span-2">
																<span style="cursor: pointer"> <a
																	href="module.do?method=upModule&id=${cmodule2.id }&mId=${requestScope.mId }">
																		<img border="none"
																			style="width: 16px; height: 16px; background-image: url(oa/images/ImageBundle.gif); background-repeat: no-repeat; background-position: 0 -139px;"
																			alt="编辑" src="oa/images/transparent.gif">
																</a> </span>

															</div>
														
													
															<div class="span-2">
																<span style="cursor: pointer"> <a
																	href="module.do?method=delModule&id=${cmodule2.id }&mId=${requestScope.mId }">
																		<img border="none"
																			style="width: 16px; height: 16px; background-image: url(oa/images/ImageBundle.gif); background-repeat: no-repeat; background-position: 0 -91px;"
																			alt="删除" src="oa/images/transparent.gif">
																</a> </span>

															</div>
														
													</div>

												</s:if>
											
											</s:iterator>
										</div>
									
									</s:if>
									</s:iterator>
							</div>
							</s:if>
							</s:iterator>
						</div>
					</div>
			</div>

			<input type="hidden" value="1" name="__">
			</form>
		</div>
		</div>

	</body>
</html>
