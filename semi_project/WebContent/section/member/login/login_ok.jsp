<%@page import="semi.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="jdto" class="semi.member.MemberDTO"/>
<jsp:setProperty property="*" name="jdto"/>
<jsp:useBean id="jdao" class="semi.member.MemberDAO"/>

<%	
	request.setCharacterEncoding("utf-8");
	
	String msg="";
	String url="";
	String member_id=request.getParameter("member_id");
	String member_pwd=request.getParameter("member_pwd");
	String ckid = request.getParameter("ckid");

	int result=jdao.loginCheck(member_id,member_pwd);
	
	if(result==1){
		msg="로그인에 실패하였습니다. 아이디를 찾을수 없습니다.";
		url="/semi_project/section/member/login/login.jsp";
	}else if(result==2){
		msg="로그인에 실패하였습니다. 비밀번호가 틀렸습니다.";
		url="/semi_project/section/member/login/login.jsp";
	}else if(result==3){
		MemberDTO vmdto[] = null;
		vmdto = jdao.userInfo(member_id);
		session.setAttribute("session_member_id", vmdto[0].getMember_id());
		session.setAttribute("session_member_name", vmdto[0].getMember_name());
		session.setAttribute("session_member_type", vmdto[0].getMember_type());
		
		if(ckid != null){ // 아이디 기억 체크시..
			Cookie ck = new Cookie("ckid", vmdto[0].getMember_id());
			ck.setMaxAge(60*60*24*30); // 한달간
			response.addCookie(ck);
		}
		/* Cookie ck = new Cookie("user_id", member_id);
		ck.setMaxAge(60*60*24*30);
		response.addCookie(ck); */
		msg = member_id+"님 반갑습니다. 환영합니다.";
		url = "/semi_project/section/home.jsp";
	}
%>
<script>
	window.alert('<%=msg%>');
	location.href = '<%=url%>';
</script>