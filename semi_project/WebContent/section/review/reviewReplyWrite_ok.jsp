<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="semi.review.ReviewDAO"/>
<jsp:useBean id="rdto" class="semi.review.ReviewDTO"/>
<jsp:setProperty property="*" name="rdto"/>
<% 
	int result = rdao.reviewReWrite(rdto);
%>
<%=result %>
