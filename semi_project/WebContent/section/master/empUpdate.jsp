<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="semi.member.*"%>
<jsp:useBean id="bdto" class="semi.member.MemberDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="mdao" class="semi.member.MemberDAO"/>

<%
	request.setCharacterEncoding("utf-8");
    String member_idx=request.getParameter("Member_idx");
    

	ArrayList<MemberDTO> arr = mdao.memberFind("member_idx",member_idx);
	
	for(int i=0; i<arr.size(); i++){
		System.out.println("test=-"+arr.get(i).getMember_name());
	}

%>



<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.m_title {
	BACKGROUND-COLOR: #F7F7F7;
	PADDING-LEFT: 15px;
	PADDING-top: 5px;
	PADDING-BOTTOM: 5px;
}

.m_padding {
	PADDING-LEFT: 15px;
	PADDING-BOTTOM: 5px;
	PADDING-TOP: 5px;
}
</style>
</head>


<body>
	<%@include file="/header/header.jsp"%>
	<h1>회원 수정하기</h1>
	<hr>

			<form name="update" action="empUpdate_ok.jsp" method="post">
			<section>
				<article>
				<fieldset style="width: 700px;">
				<table border="0" cellspacing="0" cellpadding="0" align="center">
						<tr>
						<td height="15"></td>
						</tr>
					<table border="1" cellspacing="0" width="980" bordercolordark="#FFFFFF" align="center">
						<tbody>
							<tr bgcolor="#FFFFFF">
								<td width="160" class="m_title">회원번호:</td>
								<td class="m_padding"><input type="text" name="member_idx" value="<%=arr.get(0).getMember_idx()%>" readonly></td>
							</tr>
							<tr bgcolor="#FFFFFF">
								<td width="160" class="m_title">id:</td>
								<td class="m_padding">
								<input type="text" name="member_id" value="<%=arr.get(0).getMember_id()%>" readonly></td>
							</tr>
							<tr bgcolor="#FFFFFF">
								<td width="160" class="m_title">이름:</td>
								<td class="m_padding">
								<input type="text" name="member_name" value="<%=arr.get(0).getMember_name()%>"></td>
							<tr bgcolor="#FFFFFF">
								<td width="160" class="m_title">pwd:</td>
								<td class="m_padding">
								<input type="password" name="member_pwd" value="<%=arr.get(0).getMember_pwd()%>"></td>
							</tr>
							<tr bgcolor="#FFFFFF">
								<td width="160" class="m_title">성별:</td>
								<td class="m_padding">
								<input type="text" name="member_sex" value="<%=arr.get(0).getMember_sex()%>"></td>
							</tr>
							<tr bgcolor="#FFFFFF">
								<td width="160" class="m_title">email: </td>
								<td class="m_padding">
								<input type="text" name="member_email" value="<%=arr.get(0).getMember_email()%>"></td>
							</tr>
							<tr bgcolor="#FFFFFF">
								<td width="160" class="m_title">전화번호:</td> 
								<td class="m_padding"><input type="text" name="member_tel" value="<%=arr.get(0).getMember_tel()%>"></td>
							</tr>
							<tr bgcolor="#FFFFFF">	
								<td width="160" class="m_title">주소:</td> 
								<td class="m_padding">
								<input type="text" name="member_addr" value="<%=arr.get(0).getMember_addr()%>"></td>
							</tr>
							</tbody>
						<table class="empChange" border="0" cellspacing="0" cellpadding="0" align="center">
						<tr>
						<td height="15"></td>
						</tr>
							<p align="center">	
								<a><input type="submit" value="수정하기"></a>
								<a><input type="reset" value="다시작성"></a>
							</p>
						</table>	
						</fieldset>
						
						
					</form>
				</article>
			</section>
		<%@include file="/footer/footer.jsp" %>

</body>
</html>