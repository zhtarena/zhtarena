<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.net.URLEncoder"%>
<%
	
	response.setContentType("application/x-download");//设置为下载application/x-download    
	String filedownload = "/"+request.getParameter("filename");//即将下载的文件的相对路径    
	String filedisplay = ""+request.getParameter("filename");//下载文件时显示的文件保存名称    
	System.out.println("cc1:"+filedownload);
	System.out.println("cc2:"+filedisplay);
	String filenamedisplay = URLEncoder.encode(filedisplay, "UTF-8");
	response.addHeader("Content-Disposition", "attachment;filename="+filenamedisplay);

	try {
		RequestDispatcher dis = application.getRequestDispatcher(filedownload);		
		
		if (dis != null) {
			out.clear();
			out = pageContext.pushBody(); 
			
			dis.forward(request, response);
		}
		response.flushBuffer();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		System.out.println(request.getQueryString());
	}
%>