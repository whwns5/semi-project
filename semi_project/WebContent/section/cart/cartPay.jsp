<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="semi.member.*" %>
    <%@ page import="semi.product.*" %>
    <%@ page import="semi.cart.*" %>
    <jsp:useBean id="pdto" class="semi.product.ProductDTO" scope="session"/>
    <jsp:setProperty property="*" name="pdto"/>
    <jsp:useBean id="pdao" class="semi.product.ProductDAO" scope="session"/>
    <jsp:useBean id="mdao" class="semi.member.MemberDAO" scope="session"/>
    <jsp:useBean id="cdao" class="semi.cart.CartDAO" scope="session"/>
<%
request.setCharacterEncoding("utf-8");
String member_id=(String)session.getAttribute("user_id");

String count=request.getParameter("count");

String str_onePrice="onePrice"+count;
String str_oneNum="oneNum"+count;
String str_oneCart="oneCart"+count;


String cart_idxs=(String)request.getParameter(str_oneCart);
String payment_nums=(String)request.getParameter(str_oneNum);
String product_prices=(String)request.getParameter(str_onePrice);

int cart_idx=Integer.parseInt(cart_idxs);
int payment_num=Integer.parseInt(payment_nums);
int product_price=Integer.parseInt(product_prices);

CartDTO cd=cdao.showOneForPay(member_id, cart_idx);
int product_idx=cdao.productLoad(cart_idx);
MemberDTO mdto=mdao.memberGet(member_id);
DecimalFormat df=new DecimalFormat("#,##0");


if(member_id==null||member_id.equals("")){
	%>
	<script>
	window.alert('login is needed');
	location.href="cartShow.jsp";
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
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<style>
.table-proinfo{
border:1px solid black;
width:500px;
}

.table{
border:1px solid black;
width:500px;
}

.table-pay{
border:1px solid black;
width:500px;
}

table th{
width:100px;
border:1px solid black;
}

table tr, table td{
border:1px solid black;
}

caption{
text-align:left;
}
</style>
<%

%>
<body>
<%@ include file="/header/header.jsp"%>
<%

%>
<h3>주문/결제</h3>
<section>
<form name="pay" action="cartPay_check.jsp" method="post">
<article>
<table class="table-proinfo">
<caption>01. 주문상품</caption>
<thead>
<tr>
<th>상품사진</th>
<th>상품정보</th>
<th>수량</th>
<th>결재예정가</th>
</tr>
</thead>
<tbody>
<%
ProductDTO dto=pdao.productOne(product_idx);
if(dto==null || dto.equals("")){
	%>
	<tr>
	<td colspan="4" align="center">선택한 상품이 없습니다.</td>
	</tr>
	<%
}else{
%>
<tr>
<td><%=dto.getProduct_img() %></td>
<td><%=dto.getProduct_name() %> / <%=dto.getProduct_color() %> /<%=dto.getProduct_code() %></td>
<td>
<%=payment_num %>
</td>
<td><%=df.format(product_price) %></td>
</tr>
<%
}
%>
</tbody>
</table>
</article>
<hr>
<article>
<table class="table-pay">
<caption>02. 배송 및 결재정보</caption>
<tr>
<th>주문자 명</th>
<td><input type="text" name="member_name" value="<%=mdto.getMember_name() %>" size="50" required="required"></td>
</tr>
<tr>
<th>휴대폰 번호</th>
<td><input type="text" name="member_tel" value="<%=mdto.getMember_tel()%>" size="50"></td>
</tr>
<tr>
<th>전화 번호</th>
<td><input type="text" name="payment_tel" required="required" size="50"></td>
</tr>
<tr>
<th>이메일</th>
<td><input type="text" name="member_email" value="" size="50"></td>
</tr>
<tr>
<th>배송주소</th>
<td><input type="text" name="payment_addr" value="<%=mdto.getMember_addr()%>" required="required" size="50"></td>
</tr>
</table>
</article>
<hr>
<article>
<table class="table">
<caption>03. 쿠폰적용</caption>
<tr>
<td align="center">(준비중)</td>
</tr>
</table>
</article>
<hr>
<article>
<table class="table">
<caption>04. 결재하기</caption>
<tr>
<th>총 상품가격</th>
<td></td>
</tr>
<tr>
<th>쿠폰</th>
<td></td>
</tr>
<tr>
<th>총금액</th>
<td><%=df.format(product_price) %></td>
</tr>
<tr align="right">
<td colspan="3"> <input type="submit" value="결제하기" ></td>
</tr>
</table>
<input type="hidden" name="member_id" value="<%=mdto.getMember_id()%>">
<input type="hidden" name="product_idx" value="<%=product_idx%>">
<input type="hidden" name="product_price" value="<%=product_price%>">
<input type="hidden" name="payment_num" value="<%=payment_num%>">
<input type="hidden" name="product_name" value="<%=dto.getProduct_name()%>">
<input type="hidden" name="product_color" value="<%=dto.getProduct_color()%>">
<input type="hidden" name="product_code" value="<%=dto.getProduct_code()%>">
<input type="hidden" name="cart_idx" value="<%=cart_idx%>">
</article>
</form>
</section>
<%@ include file="/footer/footer.jsp"%>
</body>
</html>