<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi_project/css/default.css?ver=3">
<link rel="stylesheet" type="text/css" href="/semi_project/css/commonButton.css?ver=9">
<link rel="stylesheet" type="text/css" href="/semi_project/css/member/mypage/mypage.css?ver=10">
</head>
<%
	String menu = request.getParameter("menu");
	if(menu == null){
		menu = "product_list";
	}
%>
<body>
	<%@include file="/header/header.jsp" %>
	<%@include file="/aside/aside.jsp" %>
	<section>
		<div class="body_contents">
			<div class="mypage_container">
				<h2 class="mypage_title">Admin Page</h2>
				<div class="mypage_content_wrap">
					<div class="mypage_menu">
						<dl>
							<dt><a href="#">ADMIN PAGE</a></dt>
							<dd><a href="/semi_project/section/member/adminPage.jsp?menu=member">회원 관리</a></dd>
							<dd><a href="/semi_project/section/member/adminPage.jsp?menu=product_list">상품 관리</a></dd>
							<dd><a href="/semi_project/section/member/adminPage.jsp?menu=qna_list">문의 답변</a></dd>
						</dl>
					</div>
					<div class="mypage_content"> <!-- 내용이 교체되는 부분 -->
						<%
							if(menu.equals("product_list")){
						%>
								<%@include file="/section/item/productFind.jsp" %>
						<%		
							} else if (menu.equals("qna_list")){
						%>
								<%@include file="/section/qna/qnaList.jsp" %>
						<% 		
							}
						%>
						
						
						<!-- <div class="content_wrap">
							<h3 class="mypage_tit">주문/배송조회</h3>
							<table cellspacing="0" cellpadding="0" summary=""
								class="table_style">
								<colgroup>
									<col width="8%">
									<col width="20%">
									<col width="*">
									<col width="14%">
									<col width="10%">
									<col width="10%">
								</colgroup>
								<thead>
									<tr>
										<th class="first">번호</th>
										<th>주문번호</th>
										<th>상품명</th>
										<th>상태</th>
										<th>결제금액</th>
										<th>주문일자</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>