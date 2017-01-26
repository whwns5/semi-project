<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="jdto" class="semi.member.MemberDTO"/>
<jsp:setProperty property="*" name="jdto"/>
<jsp:useBean id="jdao" class="semi.member.MemberDAO"/>

<%

	String msg="";
System.out.println("1");
	String url="";
	System.out.println("2");
	String member_id=request.getParameter("member_id");
	System.out.println("3");
	String member_pwd=request.getParameter("member_pwd");
	System.out.println("4");
	int result=jdao.loginCheck(member_id, member_pwd);
	System.out.println(result);
	
	if(result==1){
		msg="로그인에 실패하였습니다. 아이디를 찾을수 없습니다.";
		url="/semi_project/section/home.jsp";
	}else if(result==2){
		msg="로그인에 실패하였습니다. 비밀번호가 틀렸습니다.";
		url="/semi_project/section/home.jsp";
	}else if(result==3){
		msg="로그인에 성공하셨습니다.";
		url="/semi_project/section/home.jsp?";
	}
%>
<script>
	window.alert('<%=msg%>');
	location.href='<%=url%>';
</script>