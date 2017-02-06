<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="semi.product.*" %>
<jsp:useBean id="pdto" class="semi.product.ProductDTO" scope="session" />
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="semi.product.ProductDAO" scope="session"/>
<jsp:useBean id="cdao" class="semi.cart.CartDAO" scope="session"/>
<%
String member_id=(String)session.getAttribute("user_id");
/*
if(member_id==null || member_id.equals("")){
	%>
	<script>
	window.alert('login is needed');
	location.href="/myweb/cart/product.jsp"
	</script>
	<%
	return;
}
*/

String idxs=request.getParameter("product_idx");
int product_idx=Integer.parseInt(idxs);

ProductDTO pd=pdao.productOne(product_idx);
int product_price=pd.getProduct_price();

cdao.insert(member_id, product_idx, product_price);

%>
<script>
window.alert('cart add complete');
location.href="cartShow.jsp";
</script>