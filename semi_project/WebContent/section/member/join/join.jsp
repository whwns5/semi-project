<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function openIdCheck(){
	window.open('idCheck.jsp','idCheck','width=400,height=150');
}
</script>
</head>
<body>
<%@include file="/header/header.jsp" %>
<h1>회원가입</h1>
<h3>정보 입력</h3>
<hr>
<section>
<article>
	<form name="fm" action="/semi_project/section/member/join/join_ok" method="post">
		<table>
		<tbody>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="member_id">
				<input type="button" value="아이디 체크" onclick="openIdCheck()"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="member_pwd"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="text" name="member_pwdCheck">입력하신 비밀번호를 한번 더 입력해주세요.</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="member_name"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="sex" value="남자">남자
				<input type="radio" name="sex" value="여자">여자</td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" readonly><input type="button" value="우편번호검색"><br>
				<input type="text" name="member_addr"><br>
				<input type="text" name="member_addr1"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>
				<select name="member_tel">
				<option>02</option>
				<option>031</option>
				<option>041</option>
				<option>051</option>
				<option>061</option>
				</select>&nbsp-&nbsp<input type="text">&nbsp-&nbsp<input type="text">
				</td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td>
				<select name="selectbox1">
				<option>010</option>
				<option>011</option>
				<option>018</option>
				<option>019</option>
				</select>&nbsp-&nbsp<input type="text">&nbsp-&nbsp<input type="text">
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="member_email">
				<input type="button" value="중복확인" onclick="openEmailCheck"></td>
			</tr>
			</tbody>
			<tfoot>
				<td>
				<input type="submit" value="회원 가입">
				<a href="/semi_project/section/home.jsp"><input type="button" value="취소하기"></a>
				</td>
			</tfoot>
		</table>
	</form>
</article>
</section>
<%@include file="/footer/footer.jsp" %>
</body>
</html>

















