<%@page import="semi.product.ProductDTO"%>
<%@page import="semi.adminproduct.adminproductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="pdto" class="semi.product.ProductDTO"/>
<jsp:useBean id="pdao" class="semi.product.ProductDAO"/>
<%
	String fkey = request.getParameter("fkey");
	String fvalue = request.getParameter("fvalue");
	
	int totalCnt = 1;// 총 게시글 수
	int listSize = 10;
	int pageSize = 5;
	
	String cp_s = request.getParameter("cp");
	if(cp_s == null || cp_s.equals("")){
		cp_s = "1";	
	}
	int cp = Integer.parseInt(cp_s); // 현재 위치
	
	ArrayList<ProductDTO> arry_pdto = null;
	if(fvalue != null){ // 조건 검색 출력
		totalCnt = pdao.getFindTotalCnt(fkey, fvalue);
		arry_pdto = pdao.productFind(fkey, fvalue);
		
	} else { // 초기 전체 출력 
		totalCnt = pdao.getTotalCnt();
		arry_pdto = pdao.productList(cp, listSize);
	}
	int totalPage = totalCnt/listSize + 1; // 총 페이지 수
	if(totalCnt % listSize == 0)totalPage--;
	
	int userGroup = cp / pageSize; // 해당 페이지의 페이지 그룹
	if(cp % pageSize == 0)userGroup--;  
%>
<script>
function check(value,member_id) {
	 var tmp = value;
	aa.value = 	tmp;
	var bb =document.getElementsByTagName("tbody");

}
 function submitUpdate(fm_id) { // 수정
	 var fm = document.getElementById(fm_id);
	 fm.setAttribute('action', '/semi_project/section/item/productUpdate.jsp');
	 fm.submit(); 
}
function submitDelete(fm_id){
	var fm = document.getElementById(fm_id);
	fm.setAttribute('action', '/semi_project/section/item/productDelete_ok.jsp');
	fm.submit();
}
function goProductFind() {
	var fkey = document.getElementById('fkey').value;
	var fvalue = document.getElementById('fvalue').value;
	location.href = '/semi_project/section/member/adminPage.jsp?menu=product_list&fkey=' + fkey + '&fvalue=' + fvalue;
}
</script>
<div class="content_wrap">
	<h3 class="mypage_tit">상품 관리</h3>

	
	<select id="fkey">
		<option value="product_idx">상품번호</option>
		<option value="product_code">상품코드</option>
		<option value="product_name">상품이름</option>
	</select> 
	<div class="div_search">
		<input type="text" id="fvalue">
		<a href="javascript:goProductFind();" class="a_search" title="검색"></a>
	</div>

				
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
				<th>상품등록일</th>
				<th>상품명&nbsp;상품코드&nbsp;상품색상</th>
				<th>상품가격</th>
				<th>상품수량</th>
				<th>수정&nbsp;삭제</th>
			</tr>
		</thead>
		<tbody>
<%
		if(arry_pdto.size() != 0){ // 데이터가 있을경우 
%>
<%
			for(int i = 0 ; i < arry_pdto.size(); i++){
%>
				<tr>
					<td>
						<form id="fm_<%=i%>" method="post">
						<%=arry_pdto.get(i).getProduct_idx()%>
						<input type="hidden" value="<%=arry_pdto.get(i).getProduct_idx()%>" name="product_idx">
						</form>
					</td>
					<td><%=arry_pdto.get(i).getProduct_regdate()%></td>
					<td><%=arry_pdto.get(i).getProduct_name()%>_<%=arry_pdto.get(i).getProduct_code()%>_<%=arry_pdto.get(i).getProduct_color()%></td>
					<td><%=arry_pdto.get(i).getProduct_price()%></td>
					<td><%=arry_pdto.get(i).getProduct_num()%></td>
					<td><div class="admin_bt_area">
						<a class="common-bt bt_writereply" href="javascript:submitUpdate('fm_<%=i%>');">UPDATE</a>
						<a class="common-bt bt_writereply" href="javascript:submitDelete('fm_<%=i%>');">DELETE</a>
						</div>
					</td>	
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
	<div class="item_page"> <!-- 페이징 -->
<%
		if(userGroup != 0){ // 현재 그룹이 첫 페이지 그룹이 아닌 경우
%>
			<a href="/semi_project/section/member/adminPage.jsp?menu=product_list&cp=<%= (userGroup-1)*pageSize + pageSize %>">이전</a>
<%
		} else {
%>
			<a href="#">이전</a>
<%
		}
			
		for(int i = (userGroup * pageSize) + 1 ; i <= (userGroup * pageSize) + pageSize ; i++){
%>
			<a class="num <%= i==cp ? "on" : "" %>" href="/semi_project/section/member/adminPage.jsp?menu=product_list&cp=<%=i%>"><%=i%></a>
<%
			if(i == totalPage)break;
		}
			
		if(userGroup != (totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0)){ // 현재 그룹이 마지막 페이지가 해당하는 그룹에 해당되지 않는 경우
%>
			<a href="/semi_project/section/member/adminPage.jsp?menu=product_list&cp=<%= ((userGroup+1)*pageSize) + 1 %>">다음</a>
<%
		} else {
%>
			<a href="#">다음</a>
<%
		}
%>
	</div>
</div>