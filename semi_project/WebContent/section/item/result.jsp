<%@page import="semi.adminproduct.adminproductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="semi.product.*"%>
<jsp:useBean id="pdto" class="semi.adminproduct.adminproductDTO"/>
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="semi.adminproduct.adminproductDAO"/>


<%
	request.setCharacterEncoding("utf-8");
	String fkey = request.getParameter("fkey");
	String fvalue = request.getParameter("fvalue");
	ArrayList<adminproductDTO> arr=pdao.productFind(fkey,fvalue);
	
	System.out.println("--------------"+arr);
	

	String tmp = request.getParameter("product_idx");
	//ArrayList<MemberDTO> arr = mdao.memberFind(fkey, fvalue);
	System.out.println("*****************"+tmp);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">


 function check(value,member_id) {
	
	 var tmp = value;
	aa.value = 	tmp;
	var bb =document.getElementsByTagName("tbody");
	

}
 function submitUpdate() {
	 var fm = document.getElementById('fm');
	 fm.setAttribute('action', 'productUpdate.jsp');
	 fm.submit();
	 
}
 function submitDelete(){
	var fm = document.getElementById('fm');
	fm.setAttribute('action', 'productDelete_ok.jsp');
	fm.submit();
 }
</script>
<body>
	<form id="fm" method="post">
	<table border="1" cellspacing="0" width="450px" id = "table1">
	
		<thead>
			<tr>
					
				<th>상품순번</th>
				<th>카테고리아이디</th>
				<th>상품명</th>
				<th>상품코드</th>
				<th>상품색상</th>
				<th>상품사이즈</th>
				<th>상품수량</th>
				<th>상품가격</th>
				<th>상품설명내용</th>
				<th>상품이미지명</th>
				<th>상품등록일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody name ="tbody2">
			<%
				if (arr == null || arr.size() == 0) {
			%>
			<tr>
				<td colspan="11" align="center">검색된 상품이 아닙니다</td>
			</tr>
			<%
				} else {
					for (int i = 0; i < arr.size(); i++) {
			%>
			<tr>
				
				<td><%=arr.get(i).getProduct_idx()%>	
					<input type="hidden" value="<%=arr.get(i).getProduct_idx()%>" name="product_idx">
					<input type="hidden" value="<%=arr.get(i).getSmallcategory_id()%>" name="smallcategory_id">
				</td>
				<td><%=arr.get(i).getSmallcategory_id()%></td>
				<td><%=arr.get(i).getProduct_name()%></td>
				<td><%=arr.get(i).getProduct_code()%></td>
				<td><%=arr.get(i).getProduct_color()%></td>
				<td><%=arr.get(i).getProduct_size()%></td>
				<td><%=arr.get(i).getProduct_num()%></td>
				<td><%=arr.get(i).getProduct_price()%></td>
				<td><%=arr.get(i).getProduct_content()%></td>
				<td><%=arr.get(i).getProduct_img()%></td>
				<td><%=arr.get(i).getProduct_regdate()%></td>
				
				<td><input type="button" value="수정" onclick="submitUpdate();"></td>
				<td><input type="button" value="삭제" onclick="submitDelete();"></td>
			</tr>
			<%
				}
				}
			%>
			
		</tbody>
		
			
	</table>
			<!--<tr>
				<th>회원번호:<input type="text" id="idx" name="idx"></th><br>
				<th>ID:<input type="text" id="id" name="id"></th><br>
				<th>이름:<input type="text" id="name" name="name"></th><br>
				<th>전화번호:<input type="text" id="tel" name="tel"></th><br>
				<th>주소:<input type="text" id="addr" name="addr"></th>	<br>
			</tr>-->
			
			
			
			</form>
</body>
</html>
