<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="seung.cart.*" %>
    <jsp:useBean id="cdao" class="seung.cart.CartDAO" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
String member_id=(String)session.getAttribute("user_id");
ArrayList<CartDTO> arr=cdao.cartList(member_id);

String product_idxs[]=new String[arr.size()];
int product_idx[]=new int[arr.size()];

String product_prices[]=new String[arr.size()];
int product_price[]=new int[arr.size()];

String cart_nums[]=new String[arr.size()];
int cart_num[]=new int[arr.size()];

String cart_idxs[]=new String[arr.size()];
int cart_idx[]=new int[arr.size()];

for(int i=0; i<arr.size(); i++){
	
	product_idxs[i]=request.getParameter("product_idx"+(i+1));
	product_idx[i]=Integer.parseInt(product_idxs[i]);

	product_prices[i]=request.getParameter("product_price"+(i+1));
	product_price[i]=Integer.parseInt(product_prices[i]);
	
	cart_nums[i]=request.getParameter("payment_num"+(i+1));
	cart_num[i]=Integer.parseInt(cart_nums[i]);
	
	cart_idxs[i]=request.getParameter("cart_idx"+(i+1));
	cart_idx[i]=Integer.parseInt(cart_idxs[i]);
	
	cdao.UpdateCart(member_id, cart_idx[i], product_price[i], cart_num[i]);

	System.out.println("cartArrToDB"+product_idx[i]+"/"+product_price[i]+"/"+cart_idx[i]+"/"+cart_num[i]);
}
%>
<body>
<h2>넘어온 값 db 수정 후 ok누르면 결제창으로 연결</h2>
<form name="move" action="cartArrPay.jsp">
<%
int count=0;
for(int i=0; i<arr.size(); i++){
	count++;
	%>
	<input type="text" name="product_idx" value="<%=product_idx[i]%>">
	<input type="text" name="product_price" value="<%=product_price[i]%>">
	<input type="text" name="cart_num" value="<%=cart_num[i]%>">
	<input type="text" name="cart_idx" value="<%=cart_idx[i]%>"><br>
	<%
}
%>
<input type="hidden" name="member_id" value="<%=member_id%>">

<input type="submit" value="ok">
<input type="button" value="back" onclick="location.href='/myweb/cart/cartShow.jsp'">
</form>
</body>
</html>