<%@page import="semi.adminproduct.adminproductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="pdto" class="semi.adminproduct.adminproductDTO"/>
<jsp:useBean id="pdao" class="semi.adminproduct.adminproductDAO"/>
<%
	String fkey = request.getParameter("fkey");
	String fvalue = request.getParameter("fvalue");

	ArrayList<adminproductDTO> arry_pdto = null;
	if(fvalue != null){ // 조건 검색 출력
		arry_pdto = pdao.productFind(fkey,fvalue);
	} else { // 초기 전체 출력 
		arry_pdto = pdao.productList();
	}
%>
<script>
function check(value,member_id) {
	 var tmp = value;
	aa.value = 	tmp;
	var bb =document.getElementsByTagName("tbody");

}
 function submitUpdate(fm_id) { // 수정
	 var fm = document.getElementById(fm_id);
	 fm.setAttribute('action', 'productUpdate.jsp');
	 fm.submit(); 
}
function submitDelete(fm_id){
	var fm = document.getElementById(fm_id);
	fm.setAttribute('action', 'productDelete_ok.jsp');
	fm.submit();
}
function goProductFind() {
	var fkey = document.getElementById('fkey').value;
	var fvalue = document.getElementById('fvalue').value;
	location.href = '/semi_project/section/member/adminPage.jsp?menu=product&fkey=' + fkey + '&fvalue=' + fvalue;
}

</script>
<div class="content_wrap">
	<h3 class="mypage_tit">상품 관리</h3>
	
	<fieldset>
		<select id="fkey">
			<option value="product_idx">상품번호</option>
			<option value="product_code">상품코드</option>
			<option value="product_name">상품이름</option>
		</select> 
		<input type="text" id="fvalue">
		<input type="button" value="검색" onclick="goProductFind();">
	</fieldset>
				
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
					<td>
						<input type="button" value="수정" onclick="submitUpdate('fm_<%=i%>');">
						<input type="button" value="삭제" onclick="submitDelete('fm_<%=i%>');">
					</td>	
				</tr>
<%			
			}
%>
			
<%			
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
</div>
			
			<%-- 			
			<h2>상 품 검 색</h2>
			<hr>
			<form name="productFind" method="post">
				<fieldset>
					<select name="fkey">
						<option value="product_idx">상품순서</option>
						<option value="smallcategory_id">카테고리ID</option>
						<option value="product_name">상품이름</option>
					</select> 
					<input type="text" name="fvalue">
					<input type="submit" value="검색">
				</fieldset>
			</form>
			<hr>
			<div>
			<%
				if(request.getMethod().equals("GET")){
			%>
					위 검색란에 검색어를 입력해주세요
			<% 
				}else{
			%>
					<jsp:include page="result.jsp" />
			<%
				}
			%>
			</div> --%>
