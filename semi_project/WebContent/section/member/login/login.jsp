<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi_project/css/default.css?ver=3">
<link rel="stylesheet" type="text/css" href="/semi_project/css/commonButton.css?ver=3">
<link rel="stylesheet" type="text/css" href="/semi_project/css/member/login/login.css?ver=4">

</head>
<%
String ckid = null;
Cookie cks[]=request.getCookies();
if(cks!=null){
	for(int i=0;i<cks.length;i++){
		if(cks[i].getName().equals("ckid")){
			ckid=cks[i].getValue();
		}
	}
}
%>
<body>
<%@include file="/header/header.jsp" %>
<section class="login_section">
<div class="login_container">
	<div class="login_container_title"><h1>Login</h1></div>
	<div class="login_container_content">
		<div class="div_login_box">
			<div class="login_input_wrap">
				<div class="member_login_div">
					<script>
					function goLogin() {
						var login_fm = document.getElementById('login_fm');
						login_fm.submit();
					}
					</script>
					<form name="form" id="login_fm" action="/semi_project/section/member/login/login_ok.jsp" method="post">
						<div class="member_login_div_input_area">
							<table>
								<tbody>
									<tr>
										<td colspan="2"><h4 class="member_login_div_input_area_title">MEMBER_LOGIN</h4></td>
									</tr>
									<tr>
										<td><span>ID</span></td>
										<td><input class="login_input" type="text" name="member_id" value="<%=ckid == null ? "" : ckid %>"></td>
									</tr>
									<tr>
										<td><span>PWD</span></td>
										<td><input class="login_input" type="password" name="member_pwd"></td>
									</tr>
									<tr>
										<td colspan="2"><input type="checkbox" name="ckid" value="on" <%=ckid == null ? "" : "checked"  %>>아이디 기억</td>
									</tr>
								</tbody>
							</table>	
						</div>
						<div class="member_login_div_bt_area">
							<a class="common-bt" href="javascript:goLogin();">LOGIN</a>
						</div>
					</form>
				</div>
			</div>
			<div class="login_button_wrap">
				<div class="member_regist_div">
					<span id="dot">●</span> 아직 회원이 아니십니까?
					<a href="#">&nbsp;&nbsp;회원가입</a>
				</div>
				<div class="member_pwdsearch_div">
					<span>●</span> 아이디 / 비밀번호를 잊으셨나요?
					<a href="#">&nbsp;&nbsp;아이디/비밀번호 찾기</a>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
<%@include file="/footer/footer.jsp" %>
</body>
</html>







