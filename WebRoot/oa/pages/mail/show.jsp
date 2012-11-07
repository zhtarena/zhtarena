<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://jsptags.com/tags/navigation/pager"  prefix="pg"%>
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
		<title>邮件管理</title>
		<base href="<%=basePath%>" />
		<script type="text/javascript" src="oa/js/jquery.js"></script>
		<script type="text/javascript" src="oa/js/drag.js"></script>
		<link rel="stylesheet" type="text/css" href="oa/css/admin.css"></link>
	</head>

	<body> 
	${message } 
    <div class="head_content" id="headBar">
    <div class="mainHead navBar">
<a href="">信件管理</a>
» 
  <a class="" href="">收件箱</a>
  <span style="position:absolute;Z-index:91;margin-left:1100px;"><a href="mail.do?method=savaMails&mId=${requestScope.mId }" title="接收邮件">
  <img src="oa/pages/images/20081273983009.gif" width="50px"/></a></span>
  </div>
 
<div id="finder-head-8adea0" class="mainHead headBox">
<div class="finder-head">
       <div class="span-1">标志</div>
                    <div class="span-4 pointer"  title="用户名">
            发件人</div>
                  
            <div class="span-4 pointer" style="width:400px;"  title="会员等级">
               主题</div>
                    <div class="span-4 pointer"  title="会员等级">
              日期</div>
             
             <div class="span-2 pointer"  title="来源ID">
            删除</div>
            <div class="span-2 pointer"  title="来源ID">
           </div>
            
          </div>
</div></div>
<div class="main_content" id="main" style="height: 450px; width: 1352px; visibility: visible; opacity: 1;">



<div id="finder-8adea0" class="finder">
<div id="finder-listForm-8adea0">
<div id="finder-list-8adea0" class="finder-list">
<c:forEach items="${mails}" var="mail">
<div item-id="4" class="row">
    <div style="cursor: pointer;" class="row-line">

        <div class="span-1 span-select">
        <input type="hidden" name="mId" value="${requestScope.mId }"/>
        <c:if test="${mail.mail_type==3}">
        <c:if test="${mail.is_read}">
        <img src="oa/images/du.jpg" width="30px"/>
        </c:if>
         <c:if test="${!mail.is_read}">
       <img src="oa/images/shou.jpg" width="30px"/>
        </c:if>
        </c:if>
        <c:if test="${mail.mail_type==0}">
          <img src="oa/images/fa.jpg" width="30px"/>
        </c:if>
         <c:if test="${mail.mail_type==4}">
          <img src="oa/images/shancu.jpg" width="30px"/>
        </c:if>
         <c:if test="${mail.mail_type==2}">
          <img src="oa/images/caogao.jpg" width="30px"/>
        </c:if>
        </div>
         
                
          
                <div class="cell span-4" key="uname">
                <c:if test="${mail.from!=null}">
                 ${mail.from }
                </c:if>
     <c:if test="${mail.from==null}">
                --
                </c:if>
          </div>
       <div class="cell span-4" style="width:400px;" >
       <c:if test="${requestScope.ac eq 'findReceiveMail'}">
     <a href="mail.do?method=MailInfo&msg_id=${mail.msg_id }&mId=${requestScope.mId }" style="text-decoration: none;">
      <c:if test="${mail.is_emergent}">
     <font color="red"> ${mail.subject }</font>
      </c:if>
      <c:if test="${!mail.is_emergent}">
      ${mail.subject }
      </c:if>
      </a>
      </c:if>
       <c:if test="${requestScope.ac eq 'findGCMail'}">
     <a href="mail.do?method=MailInfo&msg_id=${mail.msg_id }&mId=${requestScope.mId }" style="text-decoration: none;">
      <c:if test="${mail.is_emergent}">
     <font color="red"> ${mail.subject }</font>
      </c:if>
      <c:if test="${!mail.is_emergent}">
      ${mail.subject }
      </c:if>
      </a>
      </c:if>
       <c:if test="${requestScope.ac eq 'findSendMail'}">
     <a href="mail.do?method=MailInfo&msg_id=${mail.msg_id }&mId=${requestScope.mId }" style="text-decoration: none;">
      <c:if test="${mail.is_emergent}">
     <font color="red"> ${mail.subject }</font>
      </c:if>
      <c:if test="${!mail.is_emergent}">
      ${mail.subject }
      </c:if>
      </a>
      </c:if>
       <c:if test="${requestScope.ac eq 'findDraftMail'}">
     <a href="mail.do?method=turnsendMail&msg_id=${mail.msg_id }&mId=${requestScope.mId }" style="text-decoration: none;">
      <c:if test="${mail.is_emergent}">
     <font color="red"> ${mail.subject }</font>
      </c:if>
      <c:if test="${!mail.is_emergent}">
      ${mail.subject }
      </c:if>
      </a>
      </c:if>
          </div>
          
        <div class="cell span-4" key="mobile">
         <c:if test="${mail.sent_date!=null}">
          ${mail.sent_date }
         </c:if>
       <c:if test="${mail.sent_date==null}">
         --
         </c:if>
          </div>
          
         <div class="cell span-2" key="remark" align="center">
         <c:if test="${mail.mail_type==4}">
          <a href="mail.do?method=DelMail&id=${mail.id }&mId=${requestScope.mId }">
         <img border="none" style="width:16px;height:16px;background-image:url(oa/images/ImageBundle.gif);background-repeat:no-repeat;background-position:0 -91px;" alt="删除" src="oa/images/transparent.gif"/>
        </a>
        </c:if>
        <c:if test="${mail.mail_type==3}">
          <a href="mail.do?method=upMail&msg_id=${mail.msg_id }&mId=${requestScope.mId }&ac=findReceiveMail">
         <img border="none" style="width:16px;height:16px;background-image:url(oa/images/ImageBundle.gif);background-repeat:no-repeat;background-position:0 -91px;" alt="删除" src="oa/images/transparent.gif"/>
        </a>
        </c:if>
        <c:if test="${mail.mail_type==0}">
          <a href="mail.do?method=upMail&msg_id=${mail.msg_id }&mId=${requestScope.mId }&ac=findSendMail">
         <img border="none" style="width:16px;height:16px;background-image:url(oa/images/ImageBundle.gif);background-repeat:no-repeat;background-position:0 -91px;" alt="删除" src="oa/images/transparent.gif"/>
        </a>
        </c:if>
        </div>
           
        </div>
         
  </div>
    
</c:forEach>
    
  </div>
</div>
</div>
<div style="text-align: center"><!-- 分页 -->
				<pg:pager items="${requestScope.count}" maxPageItems="8"
					export="currentNum=pageNumber" url="mail.do">
					<pg:param name="method" value="findMails"/>
					<pg:param name="ac" value="${requestScope.ac}"/>
					<pg:param name="mId" value="${requestScope.mId}"/>
					<pg:first>
						<a href="${pageUrl}">首页</a>
					</pg:first>
					<pg:prev>
						<a href="${pageUrl}">前页</a>
					</pg:prev>
					<pg:pages>
						<c:choose>
							<c:when test="${currentNum eq pageNumber}">
								<font color="red">${pageNumber}</font>
							</c:when>
							<c:otherwise>
								<a href="${pageUrl}">${pageNumber}</a>
							</c:otherwise>

						</c:choose>

					</pg:pages>
					<pg:next>
						<a href="${pageUrl}">后页</a>
					</pg:next>
					<pg:last>
						<a href="${pageUrl}">尾页</a>
					</pg:last>
				</pg:pager>
			</div>
</div>

	</body>
</html>
