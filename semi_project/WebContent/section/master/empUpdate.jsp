<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="semi.member.*"%>
<jsp:useBean id="bdto" class="semi.member.MemberDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="mdao" class="semi.member.MemberDAO"/>

<%
	request.setCharacterEncoding("utf-8");
    String member_idx=request.getParameter("Member_idx");
    

	ArrayList<MemberDTO> arr = mdao.memberFind("member_idx",member_idx);
	
	for(int i=0; i<arr.size(); i++){
		System.out.println("test=-"+arr.get(i).getMember_name());
	}

%>




<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>수정하기</h1>
<form name="update" action="empUpdate_ok.jsp" method="post">
<fieldset style="width:700px;">
회원번호:<input type="text" name="member_idx" value="<%=arr.get(0).getMember_idx()%>" readonly><br>
id:<input type="text" name="member_id" value="<%=arr.get(0).getMember_id()%>" readonly><br>
이름:<input type="text"  name="member_name" value="<%=arr.get(0).getMember_name()%>"><br>
pwd:<input type="password"  name="member_pwd" value="<%=arr.get(0).getMember_pwd()%>"><br>
성별:<input type="text" name="member_sex" value="<%=arr.get(0).getMember_sex()%>">
email:<input type="text"  name="member_email" value="<%=arr.get(0).getMember_email()%>"><br>
전화번호:<input type="text" name="member_tel" value="<%=arr.get(0).getMember_tel()%>"><br>
주소:<input type="text" name="member_addr" value="<%=arr.get(0).getMember_addr()%>"><br>
<input type="submit" value="수정하기">
<input type="reset" value="다시작성">
</fieldset>
</form>
</body>
</html>