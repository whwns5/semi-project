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
String idxs=(String)request.getParameter("cart_idx");
int cart_idx=Integer.parseInt(idxs);
if(member_id==null||member_id.equals("")){
	%>
	<script>
	window.alert('login is needed');
	location.href="/myweb/index.jsp";
	</script>
	<%
	return;
}else if(idxs==null || idxs.equals("")){
	%>
	<script>
	window.alert('잘못된 접근경로 입니다.');
	location.href="/myweb/index.jsp";
	</script>
	<%
}

int product_idx=cdao.productLoad(cart_idx);
MemberDTO mdto=mdao.memberGet(member_id);
CartDTO cd=cdao.show(member_id);
DecimalFormat df=new DecimalFormat("#,##0");
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
<%=cd.getCart_num() %>
<!-- 
<select name="payment_num">
<option value=1>1</option>
<option value=2>2</option>
<option value=3>3</option>
<option value=4>4</option>
<option value=5>5</option>
<option value=6>6</option>
<option value=7>7</option>
<option value=8>8</option>
<option value=9>9</option>
<option value=10>10</option>
</select>
 -->
</td>
<td><%=df.format(cd.getProduct_price()) %></td>
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
<td><%=df.format(cd.getProduct_price()) %></td>
</tr>
<tr align="right">
<td colspan="3"> <input type="submit" value="결제하기" ></td>
</tr>
</table>
<input type="hidden" name="member_id" value="<%=mdto.getMember_id()%>">
<input type="hidden" name="product_idx" value="<%=dto.getProduct_idx()%>">
</article>
</form>
</section>
<%@ include file="/footer/footer.jsp"%>
</body>
</html>