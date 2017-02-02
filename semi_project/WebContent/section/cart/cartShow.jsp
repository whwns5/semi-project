<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="seung.cart.*" %>
<%@ page import="seung.product.*" %>
<jsp:useBean id="cdao" class="seung.cart.CartDAO" scope="session"/>
<jsp:useBean id="pdao" class="seung.product.ProductDAO" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<style>
table{
width:680px;
margin:0 auto;
border:1px solid black;
}
table tr, th, td{
text-align:center;
border:1px solid black;
}
</style>
<%
String member_id=(String)session.getAttribute("user_id");
if(member_id==null || member_id.equals("")){
	%>
	<script>
	window.alert('login is needed');
	location.href="/myweb/cart/product.jsp";
	</script>
	<%
	return;
}

ArrayList<CartDTO> arr=cdao.cartList(member_id);
int sum=cdao.cartSum(member_id);
DecimalFormat df = new DecimalFormat("#,##0");
int cartNumi=arr.size();
String cartNum=String.valueOf(cartNumi);
session.setAttribute("cart",cartNum);
%>
<body>
<%@ include file="/header.jsp"%>
<%
int productidx[]=new int[arr.size()];
ProductDTO pd=null;
for(int i=0; i<arr.size(); i++){
	productidx[i]=arr.get(i).getProduct_idx();
}
%>
<table>
<catption>
<%=member_id %>님의 장바구니
</catption>
<thead>
<tr>
<th>상품번호</th>
<th>상품사진</th>
<th>상품정보</th>
<th>판매가</th>
<th>수량</th>
<th>결제예정가</th>
<th>선택</th>
</tr>
</thead>
<tbody>
<%
if(arr==null || arr.size()==0){
	%>
	<tr>
	<td colspan="7" align="center">장바구니가 없습니다.</td>
	</tr>
	<%
}else{
%>
<tr>
<%
for(int i=0; i<productidx.length; i++){
	pd=pdao.productOne(productidx[i]);
	%>
	<td><%=pd.getProduct_idx() %></td>
	<td>
	<img src="/myweb/img/product/<%=pd.getProduct_img() %>.jpg">
	</td>
	<td><%=pd.getProduct_name() %> / <%=pd.getProduct_color() %> /<%=pd.getProduct_code() %></td>
	<td><%=df.format(arr.get(i).getProduct_price()) %></td>
	<td><%=arr.get(i).getCart_num() %></td>
	<td><%=df.format(arr.get(i).getProduct_price()) %></td>
	<td>
	<input type="button" value="삭제" onclick="location='cartDel.jsp?cart_idx=<%=arr.get(i).getCart_idx()%>'">
	<input type="button" value="주문" onclick="location='cartPay.jsp?cart_idx=<%=arr.get(i).getCart_idx()%>'">
	</td>
	</tr>
	<%
	}
}
%>
</tbody>
<tr>
<td colspan="7">총합계금액:<%=df.format(sum)%>원&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="Cal" onclick="location='cartArrPay.jsp?member_id=<%=member_id%>'"></td>
</tr>
</table>

<%@ include file="/footer.jsp"%>
</body>
</html>