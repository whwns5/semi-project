<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>   
<%
	//String uploadFileName = request.getParameter("uploadFileName");
	//System.out.println(uploadFileName);
	System.out.println("request getContentType : " + request.getContentType());
 	String savepath = "D:/uploadtemp";
 	
	int totalSize = 1024 * 1024 * 10; // 10MB
	try{
		MultipartRequest mr =  
				new MultipartRequest(request, savepath, totalSize, "utf-8");
		
	 System.out.println("member_id : " + mr.getParameter("member_id"));
	} catch(Exception e) {
		e.printStackTrace();
	} 
	
	//System.out.println(request.getParameter("upload_file"));
	
%>
