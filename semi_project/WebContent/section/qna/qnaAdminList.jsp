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
	String session_member_id_adminpage = (String)session.getAttribute("session_member_id"); // 로그인 정보를 받아온다.

	int totalCnt = 1;// 총 게시글 수
	int listSize = 10;
	int pageSize = 5;
	
	String cp_s = request.getParameter("cp");
	if(cp_s == null || cp_s.equals("")){
		cp_s = "1";	
	}
	int cp = Integer.parseInt(cp_s); // 현재 위치
	
	ArrayList<QnaDTO> arry_qdto = null;
	totalCnt = qdao.getQnaAdminTotalCnt();
	arry_qdto = qdao.qnaAdminList(cp, listSize);
	
	int totalPage = totalCnt/listSize + 1; // 총 페이지 수
	if(totalCnt % listSize == 0)totalPage--;
	
	int userGroup = cp / pageSize; // 해당 페이지의 페이지 그룹
	if(cp % pageSize == 0)userGroup--;  
%>
<div class="content_wrap">
	<h3 class="mypage_tit">문의 관리</h3>
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
		function submitDelete(fm_id){
			var fm = document.getElementById(fm_id);
			fm.setAttribute('action', '/semi_project/section/qna/qnaDelete_ok.jsp');
			fm.submit();
		}
		
	</script>
	<table cellspacing="0" cellpadding="0" summary="" class="table_style">
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
				<th>답변&nbsp;삭제</th>
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
				<td class="td_subject"><a class="subject_a"
					href="javascript:showContent(<%=i%>,'qna_content');"><%=arry_qdto.get(i).getQna_subject()%></a>
					<div class="qna_content">
						<%=arry_qdto.get(i).getQna_content()%>
						<div class="rqna_reply_div">
							<a class="common-bt bt_writereply_small" href="javascript:openQnaLayer(<%=arry_qdto.get(i).getQna_idx()%>,<%=arry_qdto.get(i).getProduct_idx()%>,<%=arry_qdto.get(i).getQna_ref()%>,<%=arry_qdto.get(i).getQna_lev()%>,<%=arry_qdto.get(i).getQna_sunbun()%>);">REPLY</a>
						</div>
					</div></td>
				<td class="td_top"><%=arry_qdto.get(i).getMember_id()%></td>
				<td class="td_top"><%=arry_qdto.get(i).getProduct_idx()%></td>
				<td class="td_top"><div class="admin_bt_area">
						<%-- <a class="common-bt bt_writereply" href="javascript:submitUpdate('fm_<%=i%>');">ANSWER</a> --%>
						<a class="common-bt bt_writereply"
							href="javascript:submitDelete('fm_<%=i%>');">DELETE</a>
					</div></td>
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
	<script>
		function openQnaLayer(qna_idx, product_idx, qna_ref, qna_lev, qna_sunbun) {
			document.getElementById('qna_idx').value = qna_idx;
			document.getElementById('product_idx').value = product_idx;
			document.getElementById('qna_ref').value = qna_ref;
			document.getElementById('qna_lev').value = qna_lev;
			document.getElementById('qna_sunbun').value = qna_sunbun;
			document.getElementById('qna_subject').value = '';
			document.getElementById('qna_content').value = '';
			
			var qna_layer = document.getElementById('id_qna_layer');
			qna_layer.style.display = 'block';
		}
		function closeQnaLayer() {
			document.getElementById('qna_idx').value = '';
			document.getElementById('product_idx').value = '';
			document.getElementById('qna_ref').value = '';
			document.getElementById('qna_lev').value = '';
			document.getElementById('qna_sunbun').value = '';
			document.getElementById('qna_subject').value = '';
			document.getElementById('qna_content').value = '';
			
			var qna_layer = document.getElementById('id_qna_layer');
		
			qna_layer.style.display = '';
		}
		function submitQnaLayer() {
			var id_qnaReWrite_ok = document.getElementById('id_qnaReWrite_ok');
			id_qnaReWrite_ok.submit();
		}
	</script>
	<div class="qna_layer" id="id_qna_layer">
		<div class="qna_layer_bg" onclick="closeQnaLayer();"></div>
		<div class="qna_layer_pop">
			<div class="qna_layer_content">
				<form class="layer-form-container" name="qnaReWrite_ok"
					id="id_qnaReWrite_ok"
					action="/semi_project/section/qna/qnaReWrite_ok.jsp">
					<input type="hidden" name="qna_idx" id="qna_idx">
					<input type="hidden" name="product_idx" id="product_idx">
					<input type="hidden" name="qna_ref" id="qna_ref">
					<input type="hidden" name="qna_lev" id="qna_lev">
					<input type="hidden" name="qna_sunbun" id="qna_sunbun">
					<div class="layer-form-title">
						<h2>문의 답변</h2>
					</div>
					<br />
					<!--  차후 session 값으로 교체 -->
					<div class="layer-form-title">
						아이디<input class="layer-form-field layer-form-field-id" type="text"
							name="member_id" id="member_id" value="<%=session_member_id_adminpage%>"
							readonly="readonly" />
					</div>
					<br />
					<div class="layer-form-title">
						제목<input class="layer-form-field layer-form-field-subject"
							type="text" name="qna_subject" id="qna_subject"
							required="required" />
					</div>
					<br />
					<div class="layer-form-title">
						답변 내용
						<textarea class="layer-form-field-content" rows="20" cols="68"
							name="qna_content" id="qna_content" required="required"></textarea>
					</div>
					<div class="layer-submit-container">
						<a class="common-bt bt_write" style="margin-left: 15px;"
							href="javascript:closeQnaLayer();">CLOSE</a> <a
							class="common-bt bt_write" href="javascript:submitQnaLayer();">WRITE</a>
						<input class="layer-submit-button" style="visibility: hidden;"
							type="button" value="나가기" onclick="closeQnaLayer();">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>