<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="jdto" class="semi.member.MemberDTO"/>
<jsp:setProperty property="*" name="jdto"/>
<jsp:useBean id="jdao" class="semi.member.MemberDAO"/>

<%
	int result=jdao.memberJoin(jdto);
	String msg=result>0?"회원 가입을 축하합니다!":"회원 가입에 실패하였습니다.";
%>

<script>
window.alert('<%=msg%>');
location.href='/semi_project/section/member/join/join.jsp';
</script>