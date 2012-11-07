<%@ page language="java" import="java.util.*,java.io.*"	pageEncoding="utf-8" contentType= "application/x-msdownload; "%>
<%@page import="java.net.URLDecoder"%>
<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String path = URLDecoder.decode(request.getParameter("filename"));
		System.out.println(path);
		int index=path.indexOf('_');
		String dispString=path.substring(index+1);	
		System.out.println("dispaly::::"+dispString);
       File file = new File(this.getServletContext().getRealPath("/")+path);   
       response.setContentType("application/x-msdownload");   
        response.setContentLength((int) file.length());   
        response.setHeader("Content-Disposition", "attachment;filename="+dispString); 
       BufferedInputStream input = new BufferedInputStream(new FileInputStream(file));        
        try {   
  			
            byte buffBytes[] = new byte[1024];   
            int allLength = 0;   
            System.out.println("*********************"+this.getServletContext().getRealPath("/")+path);   
           System.out.println("开始下载");   
            OutputStream output = response.getOutputStream();   
            System.out.println("获得流之前");   
            int read=0;   
           while ((read=input.read(buffBytes))!=-1) {                 
                allLength += read;   
               output.write(buffBytes, 0, read);   
            }   
           System.out.println("获得流之后"+allLength);   
           output.flush();   
           output.close();   
            input.close();     
           System.out.println("正常关闭文件流");  
         
		response.flushBuffer(); 
       } catch (IOException e) {   
           System.out.println("取消下载"+e.getMessage());             
       }    
       System.out.println("********************");   
	
%>