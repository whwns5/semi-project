<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="semi.member.*"%>
<jsp:useBean id="bdto" class="semi.member.MemberDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="mdao" class="semi.member.MemberDAO"/>

<%
	request.setCharacterEncoding("utf-8");
	ArrayList<MemberDTO> arr = mdao.memberFind("member_id", bdto.getMember_id());
	System.out.println(arr);


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
이름:<input type="text" placeholder="이름" name="member_name"><br>
pwd:<input type="password" placeholder="pwd" name="member_pwd"><br>
성별:<input type="radio" name="member_sex" value="남" checked="checked">남
 <input type="radio" name="member_sex" value="여">여<br>
email:<input type="text" placeholder="email" name="member_email"><br>
전화번호:<input type="text" placeholder="전화번호" name="member_tel"><br>
주소:<input type="text" placeholder="주소"name="member_addr"><br>
<input type="submit" value="수정하기">
<input type="reset" value="다시작성">
</fieldset>
</form>
</body>
</html>