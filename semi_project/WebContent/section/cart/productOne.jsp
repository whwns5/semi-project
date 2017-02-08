<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="semi.product.*" %>
<jsp:useBean id="pdao" class="semi.product.ProductDAO"/>
<%
request.setCharacterEncoding("utf-8");
String idxs=request.getParameter("product_idx");
if(idxs==null || idxs.equals("")){
	idxs="0";
}
int product_idx=Integer.parseInt(idxs);
System.out.println("String="+idxs);
System.out.println("int="+product_idx);
ProductDTO dto=pdao.productOne(product_idx);
if(dto==null){
	%>
	<script>
	window.alert('it is error');
	location.href="product.jsp";
	</script>
	<%
	return;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/mainLayout.css">
</head>
<script language="javaScript">
function cart(){
	document.f1.method="post";
	document.f1.action="cartAdd.jsp"
}
</script>
<body>
<%@ include file="/header/header.jsp"%>
<section>
<article>
<form name="f1" action="../pay/pay.jsp">
<input type="hidden" name="product_idx" value="<%=dto.getProduct_idx()%>">
<input type="hidden" name="smallcategory_id" value="<%=dto.getSmallcategory_id()%>">
<input type="hidden" name="product_name" value="<%=dto.getProduct_name()%>">
<input type="hidden" name="product_code" value="<%=dto.getProduct_code()%>">
<input type="hidden" name="product_color" value="<%=dto.getProduct_color()%>">
<input type="hidden" name="product_size" value="<%=dto.getProduct_size()%>">
<input type="hidden" name="product_num" value="1">
<input type="hidden" name="product_price" value="<%=dto.getProduct_price()%>">
<input type="hidden" name="product_img" value="<%=dto.getProduct_img()%>">
<table border="1" bordercolor="black" cellspacing="0">
<thead>
<tr>
<th>상품index</th>
<th>소분류아이디</th>
<th>상품이름</th>
<th>상품코드</th>
<th>상품색상</th>
<th>상품사이즈</th>
<th>상품가격</th>
<th>상품이미지</th>
</tr>
</thead>
<tbody>
<tr>
<td><%=dto.getProduct_idx() %></td>
<td><%=dto.getSmallcategory_id() %></td>
<td><%=dto.getProduct_name() %></td>
<td><%=dto.getProduct_code() %></td>
<td><%=dto.getProduct_color() %></td>
<td><%=dto.getProduct_size() %></td>
<td><%=dto.getProduct_price() %></td>
<td><%=dto.getProduct_img() %></td>
</tr>
</tbody>
<tr>
<td colspan="10" align="right">
<script>
function cartArrPay(){
	var product_num = document.f1.product_num.value;
	var product_code = document.f1.product_code.value;
	var product_color = document.f1.product_color .value;
	document.f1.action="../cart/cartAdd.jsp";
	document.f1.submit();
}
</script>
<input type="button" value="장바구니" onclick="javascript:cartArrPay()">
<input type="submit" value="결제">
<!-- 
<input type="image" src="/myweb/img/cart_button.gif" width="122" height="44" onClick="javascript:cart()">
 -->
</td>
</tr>
</table>
</form>
</article>
</section>

<%@ include file="/footer/footer.jsp"%>
</body>
</html>