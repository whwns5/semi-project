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
<table width="900" height="0" broder="0" cellpadding="0" cellspacing="0" id="Top">
<tr>
<td>
<table width="900" height="55" border="0" cellpadding="0" cellspacing="0" id="Logo_menu">

</table>
</td>
</tr>
</table>
</form>
</body>
</html>