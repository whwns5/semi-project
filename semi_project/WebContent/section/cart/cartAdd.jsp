<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="semi.product.*" %>
<jsp:useBean id="pdto" class="semi.product.ProductDTO" scope="session" />
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="semi.product.ProductDAO" scope="session"/>
<jsp:useBean id="cdao" class="semi.cart.CartDAO" scope="session"/>
<%
String member_id=(String)session.getAttribute("user_id");
System.out.println("id first: "+member_id);
String id=null;
if(member_id==null || member_id.equals("")){
	id="zz";
	session.setAttribute("user_id", id);
	member_id=(String)session.getAttribute("user_id");
	%>
	<!--  
	<script>
	window.alert('login is needed');
	location.href="/myweb/cart/product.jsp"
	</script>
	-->
	<%
}
System.out.println("id last: "+member_id);
//넘겨받은 제품 param값 가져오기
String product_nums[]=request.getParameterValues("product_num");
int product_num[]=new int[product_nums.length];
for(int i=0; i<product_nums.length;i++){
	product_num[i]=Integer.parseInt(product_nums[i]);
}
String product_code[]=request.getParameterValues("product_code");
String product_color[]=request.getParameterValues("product_color");

//cart_table에 저장할 나머지 param값 (price, idx)생성
int product_idx[]=new int[product_num.length];
int product_prePrice[]=new int[product_num.length];
int product_price[]=new int[product_num.length];
for(int i=0; i<product_num.length; i++){
	ProductDTO pd=pdao.getIdx(product_code[i], product_color[i]);
	product_idx[i]=pd.getProduct_idx();
	product_prePrice[i]=pd.getProduct_price();
	product_price[i]=product_prePrice[i]*product_num[i];
}
//cart_table에 저장
int result=0;
for(int i=0; i<product_idx.length;i++){
result+=cdao.cartInsert(member_id, product_idx[i], product_num[i], product_price[i]);
}


String msg=result>0?"장바구니 담기 성공":"장바구니 담기 실패";
%>
<script>
window.alert('<%=msg%>');
location.href="cartShow.jsp";
</script>
<!-- 
<html>
<head>
<body>
<hr>
<form name="fm" action="cartShow.jsp">
<input type="text" value="<%=member_id%>">
<%
/*
for(int i=0; i<product_idx.length; i++){
	%>
	<input type="text" name="product_idx" value="<%=product_idx[i]%>">
	<input type="text" name="product_price" value="<%=product_price[i]%>">
	<input type="text" name="product_num" value="<%=product_num[i]%>">
	<input type="text" name="product_code" value="<%=product_code[i]%>">
	<input type="text" name="product_color" value="<%=product_color[i]%>">
	<%
}
*/
%>
<input type="submit" value="submit">
</form>
</body>
</head>
</html>
 -->