<%@page import="semi.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="jdto" class="semi.member.MemberDTO"/>
<jsp:setProperty property="*" name="jdto"/>
<jsp:useBean id="jdao" class="semi.member.MemberDAO"/>
<%request.setCharacterEncoding("utf-8"); %>
<%
	String member_name = "";
	String member_pwd = "";
	//Date member_birthday = "";
	String member_sex = "";
	String member_addr = "";
	String member_tel = "";
	String member_email = "";
	
	String member_id = (String)session.getAttribute("user_id");

	MemberDTO[] dto = jdao.userInfo(member_id);
	if(dto.length == 1) {
		for(int i=0;i<dto.length;i++){
			member_name = dto[i].getMember_name();
			member_pwd = dto[i].getMember_pwd();
			//member_birthday = dto[i].getMember_birthday();
			member_sex = dto[i].getMember_sex();
			member_addr = dto[i].getMember_addr();
			member_tel = dto[i].getMember_tel();
			member_email = dto[i].getMember_email();
			
		}
	}

%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script>
function openCheck(){
	var member_pwd_bf = document.name.member_pwd_bf.value;
	var member_pwdInput = document.name.member_pwd_bf1.value;
	var member_pwdInput1 = document.name.member_pwd.value;
	var member_pwdInput2= document.name.member_pwdCheck.value;
	
	
	if(member_pwdInput == member_pwd_bf){
		if(member_pwdInput1 == member_pwdInput2){
			alert("입력하신 정보가 수정되었습니다.");
		}else{
			window.alert('새로운 비밀번호가 일치하지 않습니다.');
			return;
		}
	}else{
		window.alert('이전 비밀번호가 올바르지 않습니다.');
		return;
	}

}
function openDel(){
	var id = document.name.id.value;
	var pwd = document.name.pwd.value;
	var url = '/semi_project/section/member/join/del_ok.jsp?';
	url = url + 'member_id='+id;
	url = url + '&member_pwd='+pwd;
	location.href=url;
	
}
</script>
</head>
<body>
<section>
<article>
	<h3>회원정보 변경</h3>
	<form name="name" action="/semi_project/section/member/join/change_ok.jsp">
	<input type="hidden" name="member_pwd_bf" value="<%=member_pwd%>">
		<table>
			<tr>
				<td>*아이디</td>
				<td><input type="text" name="member_id" value="<%=member_id%>" readonly></td>
			</tr>
			<tr>
				<td>*이름</td>
				<td><input type="text" name="member_name" value="<%=member_name%>"></td>
			</tr>
			<tr>
				<td>이전 비밀번호</td>
				<td><input type="password" name="member_pwd_bf1" required="required"></td>
			</tr>
			<tr>
				<td>새로운 비밀번호</td>
				<td><input type="password" name="member_pwd" required="required">
			</tr>
			<tr>
				<td>새로운 비밀번호 확인</td>
				<td><input type="password" name="member_pwdCheck" required="required">입력하신 비밀번호를 한번 더 입력해주세요.</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="member_birthday"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="text" name="member_sex" value="<%=member_sex %>" readonly></td>
			</tr>
			<tr>
				<td>*주소</td>
				<td><input type="text" name="member_addr" value="<%=member_addr %>" required="required"></td>
			</tr>
			<tr>
				<td>*휴대폰번호</td>
				<td>
				<input type="text" name="member_tel" value="<%=member_tel %>" required="required">
				</td>
			</tr>
			<tr>
				<td>*이메일</td>
				<td><input type="text" name="member_email" value="<%=member_email %>" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="정보수정" onclick="openCheck();"></td>
			</tr>
			<tr>
			<td>
				ID<input type="text" name="id">PWD<input type="password" name="pwd">
				</td>
				<td><input type="button" value="회원탈퇴" onclick="openDel()"></td>
			</tr>
		</table>
	</form>
</article>
</section>
</body>
</html>
















