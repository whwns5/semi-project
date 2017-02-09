    <%@page import="semi.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="jdto" class="semi.member.MemberDTO"/>
<jsp:setProperty property="*" name="jdto"/>
<jsp:useBean id="jdao" class="semi.member.MemberDAO"/>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi_project/css/member/list/list.css?ver=3">
<script>
function memberUpdate(){
	var member_pwd_bf = document.name.member_pwd_bf.value;
	var member_pwdInput = document.name.member_pwd_bf1.value;
	var member_pwdInput1 = document.name.member_pwd.value;
	var member_pwdInput2= document.name.member_pwdCheck.value;
	
	
	if(member_pwdInput == member_pwd_bf){
		if(member_pwdInput1 != '' || member_pwdInput2 != ''){
			if(member_pwdInput1 == member_pwdInput2){
				
			}else{
				window.alert('새로운 비밀번호가 일치하지 않습니다.');
				return;
			}
		}
	}else{
		window.alert('이전 비밀번호가 올바르지 않습니다.');
		return;
	}
	
	if(document.name.member_pwd.value == "") {
		document.name.member_pwd.value = document.name.member_pwd_bf.value;
	}
	document.name.submit();
}
</script>
</head>
<style>
div.containerBody {
    width: 1100px;
    margin: 0 auto;
    text-align: left;
    position: relative;
	border: 2px;
}
h3{
    color: #333;
    margin-bottom: 50px;
    margin-top: 50px;
    background: url(../img/icon/h3_ico.gif) no-repeat;
    text-indent: 42px;
    
}
table.th_left th {
    background-color: #f7f7f7;
    border-bottom: 2px solid #ddd;
    font-weight: lighter;
    padding-left: 10px;
    text-align: left;
    min-height: 38px;
    color: #666;
    height: 30px;
    cellpacing: 0px;
}
table.th_left td input[type="text"], table.th_left td select, table.th_left td textarea {
    border: 1px solid #c5c5c5;
    border-right-color: #e2e6e5;
    border-bottom-color: #e2e6e5;
    color: #686868;
    font: 12px "Dotum","돋움";
    width: 300px;
}
table.th_left td input[type="text"] {
    padding: 0 0 0 5px;
    line-height: 23px;
    background-color: #fbfbfb;
}
table.th_left td input[type="password"] {
    border: 1px solid #c5c5c5;
    border-right-color: #e2e6e5;
    border-bottom-color: #e2e6e5;
    color: #686868;
    font: 12px "Dotum","돋움";
    height: 22px;
    padding: 0 0 0 5px;
    line-height: 23px;
    background-color: #fbfbfb;
    width: 300px;
}
.ta_c {
    text-align: center !important;
}
.mt_40 {
    margin-top: 40px !important;
}
table_wrap_button{

}
</style>
<%request.setCharacterEncoding("utf-8"); %>
<%
	String member_name = "";
	String member_pwd = "";
	String member_sex = "";
	String member_addr = "";
	String member_tel = "";
	String member_email = "";
	
	String member_id = (String)session.getAttribute("user_id");
	System.out.println(member_id);
	jdao.userInfo(member_id);
	MemberDTO[] dto = jdao.userInfo(member_id);
	if(dto.length == 1) {
		for(int i=0;i<dto.length;i++){
			member_name = dto[i].getMember_name();
			member_pwd = dto[i].getMember_pwd();
			member_sex = dto[i].getMember_sex();
			member_addr = dto[i].getMember_addr();
			member_tel = dto[i].getMember_tel();
			member_email = dto[i].getMember_email();
		}
	}
%>
<body>
<%@include file="/header/header.jsp" %>
<section>
<div class="containerBody">
	<h3>나의 정보수정</h3>
		<div class="table_wrap mt_30">
		<form name="name" action="/semi_project/section/member/join/change.jsp" method="post">
		<input type="hidden" name="member_pwd_bf" value="<%=member_pwd%>">
		<table class="th_left">
			<tbody>
				<tr>
					<th>*아이디</th>
					<td><input type="text" name="member_id" value="<%=member_id%>" readonly></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="member_name" value="<%=member_name%>"></td>
				</tr>
				<tr>
					<th>*이전비밀번호</th>
					<td><input type="password" name="member_pwd_bf1" size="20" required="required"></td>
				</tr>
				<tr>
					<th>새로운 비밀번호</th>
					<td><input type="password" name="member_pwd" size="20" required="required"></td>
				</tr>
				<tr>
					<th>새로운 비밀번호 확인</th>
					<td><input type="password" name="member_pwdCheck" size="20" required="required">&nbsp;&nbsp;새로운 비밀번호를 한번 더 입력해주세요.</td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="text" name="member_sex" value="<%=member_sex %>" readonly></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="member_addr" value="<%=member_addr %>" required="required"></td>
				</tr>
				<tr>
					<th>핸드폰 번호</th>
					<td><input type="text" name="member_tel" value="<%=member_tel %>" size="20" required="required"></td>
				</tr>
				<tr>
					<th>E-MAIL</th>
					<td><input type="text" name="member_email" value="<%=member_email %>" required="required"></td>
				</tr>
			<div class="table_wrap_button">
				<p align="center"><input type="button" value="정보수정" onclick="memberUpdate();"></p>
			</div>
		</tbody>
	</table>
							
</form>
</div>
</div>
</section>
<%@include file="/footer/footer.jsp" %>
</body>
</html>

















