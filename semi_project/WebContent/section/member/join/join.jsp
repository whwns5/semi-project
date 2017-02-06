<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>khSHOPseoul-회원가입</title>
<style>
body {
	
	margin: 0 auto;
	padding: 0 20px 20px 20px;
	
}
section{
	border: 2px solid black;
	width: 900px;
	margin: 15px auto;
}
table{
	margin: 15px auto;
	border-bottom:1px solid #ccc;
}
th{
	font-size:15px;
	text-align:left;
	border-top:1px solid #ccc;
	padding:5px 10px
}
td{
	font-size:15px;
	border-top:1px solid #ccc;
	padding:5px 10px;
}
tfoot{
	margin: 0px auto;
}
h1 {
	margin: 0;
	padding: 20px 0;
}
h3{
	
}
h5{
	text-align: right;
}
</style>
<script>
function openIdCheck(){
	window.open('idCheck.jsp','idCheck','width=400,height=150');
}

function openCheck(){
	if(document.joinfm.member_pwd.value != document.joinfm.member_pwdCheck.value){
		window.alert('비밀번호가 일치하지 않습니다.');
		document.joinfm.member_pwd.value = '';
		document.joinfm.member_pwdCheck.value = '';
		document.joinfm.member_pwd.focus();
	}
}
</script>
</head>
<body>
<%@include file="/header/header.jsp" %>
<h1>회원가입</h1>
<h3>정보 입력</h3> <h5>*표시는 필수입력 사항입니다.</h5>
<hr>
<section>
<article>
	<form name="joinfm" action="/semi_project/section/member/join/join_ok.jsp" method="post">
		<table width="700" cellpadding="0" cellspacing="0">
			<tr>
				<td>*아이디</td>
				<th><input type="text" name="member_id" readonly required="required">&nbsp;
				<input type="button" value="아이디 중복 체크" onclick="openIdCheck();"></th>
			</tr>
			<tr>
				<td>*비밀번호</td>
				<th><input type="password" name="member_pwd" required="required" maxlength="16">&nbsp;&nbsp;비밀번호는 최대 16자리로 입력해주세요.
				</th>
			</tr>
			<tr>
				<td>*비밀번호 확인</td>
				<th><input type="password" name="member_pwdCheck" required="required" maxlength="16">&nbsp;&nbsp;입력하신 비밀번호를 한번 더 입력해주세요.
				</th>
			</tr>
			<tr>
				<td>*이름</td>
				<th><input type="text" name="member_name" required="required" onfocus="openCheck();">
				</th>
			</tr>
			<tr>
				<td>성별</td>
				<th><input type="radio" name="member_sex" value="남자">남자
				<input type="radio" name="member_sex" value="여자">여자</th>
			</tr>
			<tr>
				<td>*주소</td>
				<th><input type="text" name="member_addr" required="required">
				</th>
			</tr>
			<tr>
				<td>*휴대폰번호</td>
				<th>
				<input type="text" name="member_tel" required="required">
				</th>
			</tr>
			<tr>
				<td>이메일</td>
				<th>
				<input type="text" name="member_email" required="required">
				</th>
			</tr>
			<tr>
				<td>
				<input type="submit" name="memberadd" value="회원 가입">
				<a href="/semi_project/section/home.jsp"><input type="button" value="취소하기"></a>
				</td>
			</tr>
		</table>
	</form>
</article>
</section>
<%@include file="/footer/footer.jsp" %>
</body>
</html>

















