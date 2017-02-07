<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>khSHOPseoul-회원가입</title>
<style type="text/css">
.m_title    { BACKGROUND-COLOR: #F7F7F7; PADDING-LEFT: 15px; PADDING-top: 5px; PADDING-BOTTOM: 5px; }
.m_padding  { PADDING-LEFT: 15px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px; }
.m_padding2 { PADDING-LEFT: 0px; PADDING-top: 5px; PADDING-BOTTOM: 0px; }
.m_padding3 { PADDING-LEFT: 0px; PADDING-top: 5px; PADDING-BOTTOM: 5px; }
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
<h3>정보 입력</h3>
<hr>
<section>
<article>
	<form name="joinfm" action="/semi_project/section/member/join/join_ok.jsp" method="post">
	<table border="1" cellspacing="0" width="980" bordercolordark="#FFFFFF" align="center">
		<tbody>
			<tr>
				<td height="145" valign="top">
				<table width="970" border="0" cellspacing="0" cellpadding="0" align="center">
					<tbody>
						<tr>
							<td height="20" align="right" style="padding-right:20px">* 표시는 필수입력 사항입니다.</td>
						</tr>
					</tbody>
				</table>
				<table width="940" align="center" cellpadding="0" cellspacing="0">
					<tbody>
					<tr>
						<td bgcolor="#CCCCCC">
							<table cellpadding="0" cellspacing="1" width="100%">
								<tbody>
								<tr bgcolor="#FFFFFF">
									<td width="160" class="m_title">*아이디</td>
									<td class="m_padding"><input type="text" name="member_id" readonly required="required" size="20">
									<input type="button" value="아이디 중복 체크" onclick="openIdCheck();"></td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td width="160" class="m_title">*비밀번호</td>
									<td class="m_padding"><input type="password" name="member_pwd" required="required" size="20" maxlength="20">&nbsp;&nbsp;비밀번호는 최대 16자리로 입력해주세요.
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
								 	<td width="160" class="m_title">*비밀번호 확인</td>
									<td class="m_padding"><input type="password" name="member_pwdCheck" required="required" size="20" maxlength="20">&nbsp;&nbsp;입력하신 비밀번호를 한번 더 입력해주세요.
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td width="160" class="m_title">*이름</td>
									<td class="m_padding"><input type="text" name="member_name" required="required" onfocus="openCheck();">
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td width="160" class="m_title">성별</td>
									<td class="m_padding"><input type="radio" name="member_sex" value="남자">남자
									<input type="radio" name="member_sex" value="여자">여자</td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td width="160" class="m_title">*주소</td>
									<td class="m_padding"><input type="text" name="member_addr" required="required">
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td width="160" class="m_title">*휴대폰번호</td>
									<td class="m_padding"><input type="text" name="member_tel" required="required">
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td width="160" class="m_title">이메일</td>
									<td class="m_padding"><input type="text" name="member_email" required="required">
									</td>
								</tr>
								</tbody>
							</table>
						</td>
					</tr>
					</tbody>
				</table>
				<table width="970" border="0" cellspacing="0" cellpadding="0" align="center">
					<tbody>
						<tr>
							<td height="15"></td>
						</tr>
					</tbody>
				</table>
				<p align="center">
					<a><input type="submit" name="memberadd" value="회원 가입"></a>
				</p>
				<table width="970" border="0" cellspacing="0" cellpadding="0" align="center">
					<tbody>
						<tr>
							<td height="15"></td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
	<table width="980" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td height="15"></td>
		</tr>
	</table>
	</form>
</article>
</section>
<%@include file="/footer/footer.jsp" %>
</body>
</html>

















