<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdao" class="semi.qna.QnaDAO"/>
<jsp:useBean id="qdto" class="semi.qna.QnaDTO"/>
<jsp:setProperty property="*" name="qdto"/>
<%
	int result = qdao.qnaDel(qdto);
	String msg = result> 0 ? "삭제되었습니다." : "실패";
%>
<script>
	window.alert('<%=msg%>');
	location.href = '/semi_project/section/member/adminPage.jsp?menu=qna_list';
</script>