<%@page import="semi.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="jdto" class="semi.member.MemberDTO"/>
<jsp:setProperty property="*" name="jdto"/>
<jsp:useBean id="jdao" class="semi.member.MemberDAO"/>

<%	
	int result=jdao.memberChange(jdto);
	System.out.println(result);
	String msg=result>0?"회원 정보가 수정되었습니다!":"회원 정보 수정에 실패하였습니다.";
%>

<script>
window.alert('<%=msg%>');
location.href='/semi_project/section/home.jsp';
</script>