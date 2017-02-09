<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>khSHOPseoul-회원가입</title>
<link rel="stylesheet" type="text/css" href="/semi_project/css/commonButton.css?ver=3">
<style type="text/css">
h1{
	margin-top: 50px;
    margin-left: 20px;
}
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
    line-height: 25px;
}
table.th_left td {
    padding: 8px 0px;
    padding-left: 10px;
    font-size: 15px;
    color: #666;
}
table.th_left th {
    background-color: #f7f7f7;
    font-weight: lighter;
    padding-left: 10px;
    text-align: left;
    min-height: 38px;
    color: #666;
    font-size: 15px;
}
div.join_head{
	text-align: right;
}
div.join_content{
	width: 1100px;
	margin: 0px auto;
}
table.tb_content{
	border-bottom:1px solid gray;
	border-top:1px solid gray;
}
table.tb_content td{
	border-bottom: 1px solid #ddd;
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
<section>
<article>
	<form name="joinfm" action="/semi_project/section/member/join/join_ok.jsp" method="post">
		<div class="join_content">
		<h1>회원가입</h1>
			<div class="join_head">
				<h4>* 표시는 필수입력 사항입니다.</h4>
			</div>
		<table class="th_left" >
			<colgroup>
				<col style="width:121px">
				<col style="width:auto">
			</colgroup>
				<tbody>
					<tr>
						<td>
							<table class="tb_content" width="100%">
								<tbody>
								<tr>
									<th>*아이디</th>
									<td><input type="text" name="member_id" readonly required="required"size="20">
									<input type="button" value="아이디 중복 체크" onclick="openIdCheck();"></td>
								</tr>
								<tr>
									<th>*비밀번호</th>
									<td><input type="password" name="member_pwd" required="required" size="20" maxlength="20">&nbsp;&nbsp;비밀번호는 최대 16자리로 입력해주세요.
									</td>
								</tr>
								<tr>
								 	<th>*비밀번호 확인</th>
									<td><input type="password" name="member_pwdCheck" required="required" size="20" maxlength="20">&nbsp;&nbsp;입력하신 비밀번호를 한번 더 입력해주세요.
									</td>
								</tr>
								<tr>
									<th>*이름</th>
									<td><input type="text" name="member_name" required="required" onfocus="openCheck();">
									</td>
								</tr>
								<tr>
									<th>성별</th>
									<td><input type="radio" name="member_sex" value="남자">남자
									<input type="radio" name="member_sex" value="여자">여자</td>
								</tr>
								<tr>
									<th>*주소</th>
									<td><input type="text" name="member_addr" required="required">
									</td>
								</tr>
								<tr>
									<th>*휴대폰번호</th>
									<td><input type="text" name="member_tel" required="required">
									</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><input type="text" name="member_email" required="required">
									</td>
								</tr>
								</tbody>
							</table>
							</td>
						</tr>
					</tbody>
				</table>
				</div>
			<div class="bt_join">
			<script>
			function memberAdd(){
				joinfm.submit();
				}
			</script>
				<p align="center">
					<a class="common-bt bt_writereply" style=float:left; href="javascript:memberAdd();">회원 가입</a>
					<a class="common-bt bt_writereply" href="/semi_project/section/home.jsp">다음에 하기</a>
				</p>
			</div>
		</form>
	</article>
</section>
<%@include file="/footer/footer.jsp" %>
</body>
</html>

















