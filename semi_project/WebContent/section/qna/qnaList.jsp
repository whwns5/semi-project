<%@page import="semi.qna.QnaDTO"%>
<%@page import="semi.product.ProductDTO"%>
<%@page import="semi.adminproduct.adminproductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="qdto" class="semi.qna.QnaDTO" scope="session"/>
<jsp:useBean id="qdao" class="semi.qna.QnaDAO" scope="session"/>
<%
	String session_member_id_mypage = (String)session.getAttribute("session_member_id"); // 로그인 정보를 받아온다.

	int totalCnt = 1;// 총 게시글 수
	int listSize = 10;
	int pageSize = 5;
	
	String cp_s = request.getParameter("cp");
	if(cp_s == null || cp_s.equals("")){
		cp_s = "1";	
	}
	int cp = Integer.parseInt(cp_s); // 현재 위치
	
	ArrayList<QnaDTO> arry_qdto = null;
	totalCnt = qdao.getQnaUserTotalCnt(session_member_id_mypage);
	System.out.println(totalCnt);
	arry_qdto = qdao.qnaUserList(session_member_id_mypage, cp, listSize);
	System.out.println(arry_qdto.toString());
	
	int totalPage = totalCnt/listSize + 1; // 총 페이지 수
	if(totalCnt % listSize == 0)totalPage--;
	
	int userGroup = cp / pageSize; // 해당 페이지의 페이지 그룹
	if(cp % pageSize == 0)userGroup--;  
%>
<link rel="stylesheet" type="text/css" href="/semi_project/css/member/mypage/mypageOrder.css">

<div class="table_wrap">
	<h3 class="mypage_tit">문의 내역</h3>
	<script>
		function showContent(cnt, content) {
			var contents = document.getElementsByClassName(content);
			for (var i = 0; i < contents.length; i++) {
				if (i == cnt) {
					if (contents[cnt].style.display == '') {
						contents[cnt].style.display = 'block';
					} else if (contents[cnt].style.display == 'block') {
						contents[cnt].style.display = '';
					}
				} else {
					contents[i].style.display = '';
				}
			}
		}	
	</script>
	<table cellspacing="0" cellpadding="0" summary="" class="th_top">
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
				<th>작성일</th>
				<th>제목&nbsp;내용</th>
				<th>아이디</th>
				<th>상품번호</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
<%
		if(arry_qdto.size() != 0){ // 데이터가 있을경우 
%>
<%
			for(int i = 0 ; i < arry_qdto.size(); i++){
%>
			<tr>
				<td class="td_top">
					<form id="fm_<%=i%>" method="post">
						<%=arry_qdto.get(i).getQna_idx()%>
						<input type="hidden" value="<%=arry_qdto.get(i).getQna_idx()%>"
							name="qna_idx">
					</form>
				</td>
				<td class="td_top"><%=arry_qdto.get(i).getQna_regdate()%></td>
				<td class="td_subject">
<%
					for(int z = 0 ; z < arry_qdto.get(i).getQna_lev() ; z++){
						out.println("&nbsp;"); // lev 만큼 간격을 띠워준다. (답글)
					}
					if(arry_qdto.get(i).getQna_lev() != 0){
%>
						<img src="/semi_project/img/icon/ioc_reply.gif">
<%
					}
%>
					<a class="subject_a" href="javascript:showContent(<%=i%>,'qna_content');"><%=arry_qdto.get(i).getQna_subject()%></a>
					<div class="qna_content">
						<%=arry_qdto.get(i).getQna_content()%>
					
					</div>
				</td>
				<td class="td_top"><%=arry_qdto.get(i).getMember_id()%></td>
				<td class="td_top"><%=arry_qdto.get(i).getProduct_idx()%></td>
				<td class="td_top"></td>
			</tr>
			<%			
			}		
		} else {
%>
			<tr>
				<td colspan="6" align="center">데이터가 없습니다.</td>
			</tr>
			<%			
		}
%>
		</tbody>
	</table>
	<div class="item_page">
		<!-- 페이징 -->
		<%
		if(userGroup != 0){ // 현재 그룹이 첫 페이지 그룹이 아닌 경우
%>
		<a
			href="/semi_project/section/member/adminPage.jsp?menu=qna_list&cp=<%= (userGroup-1)*pageSize + pageSize %>">이전</a>
		<%
		} else {
%>
		<a href="#">이전</a>
		<%
		}
			
		for(int i = (userGroup * pageSize) + 1 ; i <= (userGroup * pageSize) + pageSize ; i++){
%>
		<a class="num <%= i==cp ? "on" : "" %>"
			href="/semi_project/section/member/adminPage.jsp?menu=qna_list&cp=<%=i%>"><%=i%></a>
		<%
			if(i == totalPage)break;
		}
			
		if(userGroup != (totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0)){ // 현재 그룹이 마지막 페이지가 해당하는 그룹에 해당되지 않는 경우
%>
		<a
			href="/semi_project/section/member/adminPage.jsp?menu=qna_list&cp=<%= ((userGroup+1)*pageSize) + 1 %>">다음</a>
		<%
		} else {
%>
		<a href="#">다음</a>
		<%
		}
%>
	</div>
</div>