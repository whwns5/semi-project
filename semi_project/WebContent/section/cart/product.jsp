<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*" %>
 <%@ page import="semi.product.*" %>
<jsp:useBean id="pdto" class="semi.product.ProductDTO"/>
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="semi.product.ProductDAO"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
h2{
text-align:center;
}
table{
margin:0px auto;
border-top:2px double darkblue;
border-bottom:2px double darkblue;
border-spacing:0px;
}
table th{
background: skyblue;
}
</style>
<body>
<%@ include file="/header/header.jsp"%>
<table>
<thead>
<tr>
<th>상품index</th>
<th>소분류아이디</th>
<th>상품이름</th>
<th>상품코드</th>
<th>상품색상</th>
<th>상품사이즈</th>
<th>상품수량</th>
<th>상품가격</th>
<th>상품이미지</th>
</tr>
</thead>
<tbody>
<% 
ArrayList<ProductDTO> arr=pdao.productList();
if(arr==null || arr.size()==0){
	%>
	<tr>
	<td colspan="10" align="center">no list</td>
	</tr>
	<%
}else{
	for(int i=0; i<arr.size(); i++){
		%>
		<tr>
		<td><%=arr.get(i).getProduct_idx() %></td>
		<td><%=arr.get(i).getSmallcategory_id() %></td>
		<td><%=arr.get(i).getProduct_name() %></td>
		<td>
		<a href="productOne.jsp?product_idx=<%=arr.get(i).getProduct_idx()%>"><%=arr.get(i).getProduct_code() %></a>
		</td>
		<td><%=arr.get(i).getProduct_color() %></td>
		<td><%=arr.get(i).getProduct_size() %></td>
		<td><%=arr.get(i).getProduct_num() %></td>
		<td><%=arr.get(i).getProduct_price() %></td>
		<td><%=arr.get(i).getProduct_img() %></td>
		</tr>
		<%
	}
}
%>
</tbody>
</table>
<%@ include file="/footer/footer.jsp"%>
</body>
</html>