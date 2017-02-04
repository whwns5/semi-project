<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>   
<%
	String savepath = "D:/uploadtemp";
	int totalSize = 1024 * 1024 * 10; // 10MB
	try{
		MultipartRequest mr = 
				new MultipartRequest(request, savepath, totalSize, "utf-8");
	} catch(Exception e) {
		
	}
%>
