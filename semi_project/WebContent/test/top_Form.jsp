<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String MemberId = (String) session.getAttribute("MEMBERID");
boolean login = MemberId == null? false : true;
String content=null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "login_check.jsp" method="post">
<table width="900" height="0" border="0" cellpadding="0" cellspacing="0" id="Top">
<tr>
<td>
<table width="900" height="55" border="0" cellpadding="0" cellspacing="0" id="Logo_menu">
<tr>
<td width="10" rowspan="2">&nbsp;</td>
<td width="94" height="55" rowspan="2"><a href="../main_Form.jsp" target="mainFrame" onfocus='this.blur()'><img alt="logo" src="/semi_project/test/image/logo.gif" width="94" height="55" border="0"></a></td>
<td width="768" align="right"><font size="2"><a href="main_Form.jsp" target="mainFrame">Main</a>
<% if(login==false){ %>
<a href="../member_agreement_Form.jsp" target="mainFrame">회원가입</a> | 
<%}%>

<% if(login==true) {%>
<a href="myshop.jsp" target="mainFrame">MyShop</a>
<a href="cart.jsp" target="mainFrame">장바구니</a> | <a href="../category_Form.jsp" target="mainFrame">내 뭂품팔기</a>
| 
<%}%>
<a href="faq.jsp" target="mainFrame">고객센터</a></font></td>
<td width="10">&nbsp;</td>
</tr>
<%
if(login){
%>
<tr height="5">
<td valign="Default">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2"></font>
<input type="hidden" name="session_check" value="2">
<%=MemberId %> 님이 로그인 하셨습니다. <font size="2"> 즐거운 쇼핑 되세요</font>&nbsp;&nbsp;<input type="image" src="/semi_project/test/image/login_logout.gif">&nbsp;&nbsp;<a href="MemberUpdate_Form.jsp" target="mainFrame" onfocus='this.blur()'><img src="image/MemberUpdate/ico_org.gif" border="0"></a>
</td>
<td>&nbsp;</td>
</tr>
<%
}else{
%>
<tr>
<input type="hidden" name="session_check" value="1">
<td valign="bottom">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2">아이디
:</font> <input name="id" type="text" size="12"><font size="2">비밀번호
:</font> <input name="password" type="password" size="12"><input type="image" src="image/login_button.gif" width="55" height="18">
</td>
<td>&nbsp;</td>
</tr>
<%}%>
</table>
<table width="900" height="10" border="0" cellpadding="0" cellspacing="0" id="top_between_1">
<tr>
<td></td>
</tr>
</table>
<table width="900" height="10" border="0" cellpadding="0" cellspacing="0" id="top_between_2">
<tr>
<td></td>
</tr>
</table>
</td>
</tr>
</table>
</form>
</body>
</html>