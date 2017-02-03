<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="mdto" class="semi.member.MemberDTO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	
	
	<section>
		<article>
			<h2>회 원 검 색</h2>
			<hr>
			<form name="memberFind" method="post">
			<fieldset>
			
			<select name="fkey">
			<option value="member_id">아이디</option>
			<option value="member_name">이름</option>
			<option value="member_tel">전화번호</option>
			<option value="member_addr">주소</option>
		
			</select>
			<input type="text" name="fvalue">
			<input type="submit" value="검색">
			
			
			</fieldset>
			</form>
			
			<hr>
			<div>
			<%
			if(request.getMethod().equals("GET")){
				%>
				위 검색란에 검색어를 입력해주세요
				<% 
			}else{
				%>
				<jsp:include page="result.jsp"/>
				<%
			}
			%>
			</div>
			
		</article>
		<article>




</article>
	</section>
	
	
	
</body>
</html>