<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdto" class="semi.qna.QnaDTO"/>
<jsp:setProperty property="*" name="qdto"/>
<jsp:useBean id="qdao" class="semi.qna.QnaDAO" scope="session"/>
<%
	int result = qdao.qnaReWrite(qdto);
	String msg = result > 0 ? "등록 완료" : "등록 실패";
%>
<script>
	window.alert('<%=msg%>');
	location.href = '/semi_project/section/member/adminPage.jsp?menu=qna_list';
</script>