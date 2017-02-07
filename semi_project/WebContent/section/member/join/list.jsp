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
<div class="list_container">
		<h3>나의 정보수정</h3>
		<div class="member_update_div">
		
		</div>
		<div class="member_delete_div">
		</div>
		<form name="name" action="/semi_project/section/member/join/change.jsp" method="post">
		<input type="hidden" name="member_pwd_bf" value="<%=member_pwd%>">
		
		<table class="t1" align="center">
			<tbody>
				<tr>
					<td class="ta">
					<table class="t2" align="center">
						<tbody>
							<tr>
								<td>
									<p align="right">* 표시는 필수 항목입니다.</p>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="t3" align="center">
						<tbody>
							<tr>
								<td>
									<table class="t4">
										<tbody>
										<tr>
											<td class="m_title">*아이디</td>
											<td class="m_padding"><input type="text" name="member_id" value="<%=member_id%>" readonly></td>
										</tr>
										<tr>
											<td class="m_title">이름</td>
											<td class="m_padding"><input type="text" name="member_name" value="<%=member_name%>"></td>
										</tr>
										<tr>
											<td class="m_title">*이전 비밀번호</td>
											<td class="m_padding"><input type="password" name="member_pwd_bf1" size="20" required="required"></td>
										</tr>
										<tr>
											<td class="m_title">새로운 비밀번호</td>
											<td class="m_padding"><input type="password" name="member_pwd" size="20" required="required">
										</tr>
										<tr>
											<td class="m_title">새로운 비밀번호 확인</td>
											<td class="m_padding"><input type="password" name="member_pwdCheck" size="20" required="required">&nbsp;&nbsp;새로운 비밀번호를 한번 더 입력해주세요.</td>
										</tr>
										<tr>
											<td class="m_title">성별</td>
											<td class="m_padding"><input type="text" name="member_sex" value="<%=member_sex %>" readonly></td>
										</tr>
										<tr>
											<td class="m_title">주소</td>
											<td class="m_padding"><input type="text" name="member_addr" value="<%=member_addr %>" required="required"></td>
										</tr>
										<tr>
											<td class="m_title">휴대폰번호</td>
											<td class="m_padding">
											<input type="text" name="member_tel" value="<%=member_tel %>" size="20" required="required">
											</td>
										</tr>
										<tr>
											<td class="m_title">이메일</td>
											<td class="m_padding"><input type="text" name="member_email" value="<%=member_email %>" required="required">
											</td>
										</tr>
										<table class="t5" align="center">
											<tbody>
												<tr>
													<td height="5"></td>
												</tr>
											</tbody>
										</table>
										<p align="center"><input type="button" value="정보수정" onclick="memberUpdate();"></p>
										<table class="t6" align="center">
											<tbody>
												<tr>
													<td height="5"></td>
												</tr>
											</tbody>
										</table>
									</tbody>
								</table>
							</td>
						</tr>		
					</tbody>
				</table>
				<table class="t11">
					<tbody>
						<tr>
							<td>
							<table class="t9" align="center">
								<tr>
								<td class="m_title">아이디</td>
								<td class="m_padding"><input type="text" name="id" size="20"></td>
								</tr>
								<tr>
								<td class="m_title">비밀번호</td><td class="m_padding"><input type="password" name="pwd" size="20"></td>
								</tr>
							</table>
							<p align="center"><input type="button" value="회원탈퇴" onclick="openDel();"></p>
							<table class="t10">
								<tbody>
									<tr>
										<td height="5"></td>
									</tr>
								</tbody>
							</table>
							</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
</form>
</div>
</section>
<%@include file="/footer/footer.jsp" %>
</body>
</html>

















