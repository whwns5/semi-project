<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdao" class="semi.qna.QnaDAO"/>
<jsp:useBean id="qdto" class="semi.qna.QnaDTO"/>
<jsp:setProperty property="*" name="qdto"/>
<%
	int result = qdao.qnaWrite(qdto);
%>
<%=result %>
