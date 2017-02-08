<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdto" class="semi.member.MemberDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="semi.member.MemberDAO"/>
<%
	int result=bdao.empDel(bdto);
	String msg=result>0?"등록제거 성공":"등록제거 실패";
%>
<script>
window.alert('<%=msg%>');
location.href='customerFind.jsp'
</script>