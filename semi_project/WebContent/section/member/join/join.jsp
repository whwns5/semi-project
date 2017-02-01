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
function openCheck(){
	if(document.joinfm.member_pwd.value != document.joinfm.member_pwdCheck.value){
		window.alert('비밀번호가 일치하지 않습니다.');
		document.joinfm.member_pwd.value = '';
		document.joinfm.member_pwdCheck.value = '';
		document.joinfm.member_pwd.focus();
	}
}
function openDel(){
	var id = document.joinfm.aaa.value;
	var pwd = document.joinfm.bbb.value;
	var url = '/semi_project/section/member/join/del_ok.jsp?';
	url = url + 'member_id='+id;
	url = url + '&member_pwd='+pwd;
	location.href=url;
	
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
		<table>
		<tbody>
			<tr>
				<td>*아이디</td>
				<td><input type="text" name="member_id" readonly required="required">
				<input type="button" value="아이디 체크" onclick="openIdCheck()"></td>
			</tr>
			<tr>
				<td>*비밀번호</td>
				<td><input type="password" name="member_pwd" required="required"></td>
			</tr>
			<tr>
				<td>*비밀번호 확인</td>
				<td><input type="password" name="member_pwdCheck" required="required">입력하신 비밀번호를 한번 더 입력해주세요.</td>
			</tr>
			<tr>
				<td>*이름</td>
				<td><input type="text" name="member_name" required="required" onfocus="openCheck();"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" name="member_sex" value="남자">남자
				<input type="radio" name="member_sex" value="여자">여자</td>
			</tr>
			<tr>
				<td>*주소</td>
				<td><input type="text" name="member_addr" required="required"></td>
			</tr>
			<tr>
				<td>*휴대폰번호</td>
				<td>
				<input type="text" name="member_tel" required="required">
				</td>
			</tr>
			<tr>
				<td>*이메일</td>
				<td><input type="text" name="member_email" required="required">
				</td>
			</tr>
			</tbody>
			<tfoot>
				<td>
				<input type="submit" name="memberadd" value="회원 가입">
				<a href="/semi_project/section/home.jsp"><input type="button" value="취소하기"></a></td>
				<td>
				ID<input type="text" name="aaa">PWD<input type="text" name="bbb">
				</td>
				<td><input type="button" value="회원탈퇴" onclick="openDel()"></td>
			</tfoot>
		</table>
	</form>
</article>
</section>
<%@include file="/footer/footer.jsp" %>
</body>
</html>

















