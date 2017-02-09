<%@page import="java.text.DecimalFormat"%>
<%@page import="semi.pay.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi_project/css/default.css?ver=3">
<link rel="stylesheet" type="text/css" href="/semi_project/css/member/mypage/mypage.css?ver=11">

</head>
<%
	request.setCharacterEncoding("utf-8");

	//주문정보 불러오기
	String member_id_mypage = (String) session.getAttribute("session_member_id");
	if (member_id_mypage == null || member_id_mypage.equals("")) {
%>
		<script>
		    	window.alert('로그인 후 이용 바랍니다.');
		    	location.href="../index.jsp";
		</script>
<%
	}
	
	String menu = request.getParameter("menu");
	if(menu==null){
		menu="myorder";
	}
	
%>
<body>
	<%@include file="/header/header.jsp"%>
	<%@include file="/aside/aside.jsp"%>
	<section>
		<div class="body_contents">
			<div class="mypage_container">
				<h2 class="mypage_title">My Page</h2>
				<div class="mypage_info">
					<table cellspacing="0" cellpadding="0" class="myinfo1" summary="">
						<colgroup>
							<col width="*">
							<col width="16%">
							<col width="16%">
							<col width="16%">
						</colgroup>
						<tbody>
							<tr>
								<td class="name" rowspan="2"><img
									src="/semi_project/img/icon/icon_mypage.gif" alt="" title="">
									<br>안녕하세요. <span><%=session_member_name%></span>님,<br>KH-SHOP
									을 찾아 주셔서 감사합니다.</td>
								<th>등급</th>
								<th>적립금</th>
								<th>쿠폰</th>
							</tr>
							<tr>
								<td><span class="lavel">silver</span></td>
								<td><span class="milage">0</span> 원</td>
								<td><span class="coupon">0</span> 개</td>
							</tr>
						</tbody>
					</table>
					<table cellspacing="0" cellpadding="0" class="myinfo2" summary="">
						<colgroup>
							<col width="35%">
							<col width="65%">
						</colgroup>
						<tbody>
							<tr>
								<th>연락처</th>
								<td>031-791-0915</td>
							</tr>
							<tr>
								<th>휴대폰</th>
								<td>010-4140-6421</td>
							</tr>
							<tr>
								<th class="last">주소</th>
								<td class="last">경기도 하남시 대청로 62-2 511- 11</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="mypage_content_wrap">
					<div class="mypage_menu">
						<dl>
							<dt>
								<a href="#">MY PAGE</a>
							</dt>
							<dd>
								<a href="/semi_project/section/member/mypage.jsp?menu=myupdate">회원 정보 수정</a>
							</dd>
							<dd>
								<a href="/semi_project/section/member/mypage.jsp?menu=myorder">주문 내역</a>
							</dd>
							<dd>
								<a href="../member/mypage.jsp?menu=cancel">취소 내역</a>
							</dd>
							<dd>
								<a href="/board/?db=counsel">문의 내역</a>
							</dd>
							<dd>
								<a href="/semi_project/section/member/mypage.jsp?menu=memberdel">회원 탈퇴</a>
							</dd>
						</dl>
					</div>
					<div class="mypage_content">
						<!-- 내용이 교체되는 부분 -->
						<div class="content_wrap">
							<%
								if(menu.equals("myorder")){
							%>
								<%@ include file="mypageOrder.jsp"%>
							<%
								}else if(menu.equals("cancel")){
							%>
								<%@ include file="mypageCancel_Table.jsp"%>
							<%
								}else if(menu.equals("memberdel")){
							%>
								<%@ include file="/section/member/join/del.jsp"%>
							<%
								}else if(menu.equals("myupdate")){
							%>
								<%@ include file="/section/member/join/list.jsp"%>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>