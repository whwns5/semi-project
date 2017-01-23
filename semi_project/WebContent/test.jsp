<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="sdto" class="seung.db.DBtestDTO"/>
    <jsp:setProperty property="*" name="sdto"/>
    <jsp:useBean id="sdao" class="seung.db.DBtest"/>
    <jsp:useBean id="semi" class="semi.db.semiDB_Test"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>ff  ㅇㅇㄴㄹㄴㄹㄴㅇㄹㅇㅇㅇㄶㅇㄴㅁㅎㅇㄴㅁㅎㄴㅇㅎㄶ</h3>
	<h3>another</h3>
	<h2>dd</h2>
	
	<!-- ---------------조승동 DB test 영역 -->
	<section>
	<article>
	<table>
	<tr>
	<td>idx</td>
	<td>name</td>
	<td>email</td>
	<td>dept</td>
	</tr>
	<tr>
	<td colspan="4"><%=sdao.testDB()%></td>
	</tr>
	</table>
	</article>
	</section>
	<!-- ------------------------------ -->
	<td><%=semi.dbcpTest() %></td>
</body>
</html>