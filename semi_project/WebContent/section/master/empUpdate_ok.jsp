<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bdto" class="semi.member.MemberDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="semi.member.MemberDAO" scope="session"/>

<%
	int count = bdao.updateContent(bdto);
	
	String msg=count>0?"수정 완료":"수정 실패";
	
	%>
	<script>
	window.alert('<%=msg%>');
	location.href='customerFind.jsp';
	</script>
	<%
	


%>