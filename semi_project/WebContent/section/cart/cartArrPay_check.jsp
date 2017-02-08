<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
    <%@ page import="semi.cart.*" %>
    <%@ page import="semi.product.*" %>
    <jsp:useBean id="cdao" class="semi.cart.CartDAO"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/mainLayout.css">
</head>
<style>
table, table tr, table th, table td{
border:1px solid black;
}
</style>
<body>
<%@ include file="/header/header.jsp"%>
<!-- -------------------------- value 가져오기 -------------------------- -->
<%
String member_name=request.getParameter("member_name");
DecimalFormat df=new DecimalFormat("#,##0");
//payment DB에 집어넣을값들
String member_id=(String)session.getAttribute("session_member_id");
ArrayList<CartDTO> arr=cdao.cartList(member_id);

String product_idxs[]=request.getParameterValues("product_idx");
String cart_nums[]=request.getParameterValues("cart_num");
String product_prices[]=request.getParameterValues("product_price");
int product_idx[]=new int[arr.size()];
int cart_num[]=new int[arr.size()];
int product_price[]=new int[arr.size()];
	//String idxs="";
if(product_idxs == null || product_idxs.length==0){
	%>
	<script>
	alert('product_idxs[]를 불러올 수 없음');
	</script>
	<%
}else{
	for(int i=0; i<arr.size(); i++){
		product_idx[i]=Integer.parseInt(product_idxs[i]);
		cart_num[i]=Integer.parseInt(cart_nums[i]);
		product_price[i]=Integer.parseInt(product_prices[i]);
		//idxs+=product_idx[i]+",";		
	}	
}

//넘어온 값 불러오기

String payment_totalprices=request.getParameter("product_price");
int payment_totalprice=Integer.parseInt(payment_totalprices);

String payment_numstr=request.getParameter("payment_num");
int payment_num=Integer.parseInt(payment_numstr);

String payment_addr=request.getParameter("payment_addr");
String payment_tel=request.getParameter("payment_tel");


String product_name[]=request.getParameterValues("product_name");
String product_code[]=request.getParameterValues("product_code");
String product_color[]=request.getParameterValues("product_color");
%>
<section>
<article>
<h4>결제 확인 창입니다.</h4>
<form name="pay_check" action="cartArrPay_complete.jsp">
<table>
<tr>
<th>회원아이디: </th>
<td><%=member_id %></td>
</tr>
<tr>
<th>이름: </th>
<td><%=member_name %></td>
</tr>

<%
for(int i=0; i<arr.size();i++){
	
%>
<tr>
	<th>제품정보 <%=i+1%>: </th>
	<td>
	<span><%=product_name[i]%> / <%=product_code[i]%> / <%=product_color[i]%></span>
	<span>| 결재액: <%=df.format(product_price[i])%>원 | 개별 수량 <%=cart_num[i]%>개</span>
	</td>
</tr>
<%
}
%>
<tr>
<th>총수량: </th>
<td><%=payment_num%></td>
</tr>
<tr>
<tr>
<th>총결재액: </th>
<td><%=df.format(payment_totalprice)%></td>
</tr>
<tr>
<th>배송지: </th>
<td><%=payment_addr %></td>
</tr>
<tr>
<th>연락처: </th>
<td><%=payment_tel %></td>
</tr>
<tr>
<td colspan="2"><input type="submit" value="결제확인"><input type="button" value="취소" onclick="history.back()"></td>
</tr>
</table>
<input type="hidden" name="member_id" value="<%=member_id%>">
<input type="hidden" name="payment_addr" value="<%=payment_addr%>">
<input type="hidden" name="payment_tel" value="<%=payment_tel%>">
<%
for(int i=0; i<arr.size(); i++){
	%>
<input type="hidden" name="product_idx" value="<%=product_idx[i]%>">
<input type="hidden" name="product_price" value="<%=product_price[i]%>">
<input type="hidden" name="cart_num" value="<%=cart_num[i]%>">
<input type="hidden" name="product_name" value="<%=product_name[i]%>">
<input type="hidden" name="product_code" value="<%=product_code[i]%>">
<input type="hidden" name="product_color" value="<%=product_color[i]%>">
	<%
}
%>
</form>
</article>
</section>
<%@ include file="/footer/footer.jsp"%>
</body>
</html>