<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>khSHOPseoul-회원가입</title>
<link rel="stylesheet" type="text/css" href="/semi_project/css/commonButton.css?ver=3">
<style type="text/css">
.m_title    { BACKGROUND-COLOR: #F7F7F7; PADDING-LEFT: 15px; PADDING-top: 5px; PADDING-BOTTOM: 5px; }
.m_padding  { PADDING-LEFT: 15px; PADDING-BOTTOM: 5px; PADDING-TOP: 5px; }
.m_padding2 { PADDING-LEFT: 0px; PADDING-top: 5px; PADDING-BOTTOM: 0px; }
.m_padding3 { PADDING-LEFT: 0px; PADDING-top: 5px; PADDING-BOTTOM: 5px; }
a.common-bt {
    display: block;
    color: #e8380d;
    width: 150px;
    height: 20px;
    border: 2px solid #e8380d;
    padding: 14px 15px;
    text-align: center;
    transition: all 0.3s;
    font-family: 'Lato', sans-serif;
}
a.bt_writereply{
	width: 80px;
	padding: 8px 11px;
	font-size: 15px;
	color: #e8380d;
}
bt_join{
	margin:0px auto;
}
div.bt_join{
	margin:0px auto;
	width:330px;
}
div.table_wrap h3 {
    font-family: ngb;
    font-size: 16px;
    margin-bottom: 5px;
    font-weight: lighter;
    color: #666;
}
div.table_wrap h3 {
    font-family: ngb;
    font-size: 16px;
    margin-bottom: 5px;
    font-weight: lighter;
    color: #666;
}
table.th_left {
    width: 100%;
    border-spacing: 0;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
tr {
    font-family: "돋움,굴림";
    color: #4B4B4B;
    font-size: 12px;
    line-height: 17px;
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
function memberAdd(){
	joinfm.submit();
	}
}
</script>
</head>
<body>
<%@include file="/header/header.jsp" %>
<h1>회원가입</h1>
<div class="table_wrap mt_30">
	<h3>정보 입력</h3>
</div>
<hr>
<section>
<article>
	<form name="joinfm" action="/semi_project/section/member/join/join_ok.jsp" method="post">
	<table class="th_left" >
	<colgroup>
		<col style="width:121px">
		<col style="width:auto">
	</colgroup>
		<tbody>
			<tr>
				<td>
				<table>
					<tbody>
						<tr>
							<td height="20" align="right" style="padding-right:20px; margin-bottom:20px;" >* 표시는 필수입력 사항입니다.</td>
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
	<div class="bt_join">
		<p align="center">
			<a class="common-bt bt_writereply" style=float:left; href="javascript:memberAdd();">회원 가입</a>
			<a class="common-bt bt_writereply" href="/semi_project/section/home.jsp">다음에 하기</a>
		</p>
	</div>
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

















