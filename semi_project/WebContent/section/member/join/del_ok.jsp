<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="jdto" class="semi.member.MemberDTO"/>
<jsp:setProperty property="*" name="jdto"/>
<jsp:useBean id="jdao" class="semi.member.MemberDAO"/>

<%
String member_id = request.getParameter("member_id");
String member_pwd = request.getParameter("member_pwd");
int result=jdao.memberdel(member_id,member_pwd);

if(result==0){
	
	%>
	<script>
		window.alert('회원탈퇴에 실패하셨습니다. 비밀번호를 확인해주세요.');
		
	</script>
	<%
}else{
	%>
	<script>
		window.alert('회원탈퇴에 성공하셨습니다. 감사합니다.');
	</script>
	<%
}
%>
<script>
	location.href='/semi_project/section/home.jsp';
</script>
<%

%>