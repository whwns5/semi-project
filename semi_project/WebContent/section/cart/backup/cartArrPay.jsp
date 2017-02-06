<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="seung.member.*" %>
    <%@ page import="seung.product.*" %>
    <jsp:useBean id="pdto" class="seung.product.ProductDTO" scope="session"/>
    <jsp:setProperty property="*" name="pdto"/>
    <jsp:useBean id="pdao" class="seung.product.ProductDAO" scope="session"/>
    <jsp:useBean id="mdao" class="seung.member.MemberDAO" scope="session"/>
    <jsp:useBean id="cdao" class="seung.cart.CartDAO" scope="session"/>
<%
request.setCharacterEncoding("utf-8");
String member_id=(String)session.getAttribute("user_id");
MemberDTO mdto=mdao.memberGet(member_id);
DecimalFormat df=new DecimalFormat("#,##0");
ArrayList<CartDTO> arr=cdao.cartList(member_id);
CartDTO cd=cdao.show(member_id);

String product_idx[]=request.getParameterValues("product_idx");
String product_price[]=request.getParameterValues("product_price");
String cart_num[]=request.getParameterValues("cart_num");
String cart_idx[]=request.getParameterValues("cart_idx");
String product_num[]=request.getParameterValues("product_num");
String product_code[]=request.getParameterValues("product_code");
String product_color[]=request.getParameterValues("product_color");

for(int i=0; i<arr.size(); i++){
	System.out.println(product_idx[i]+"/"+product_price[i]+"/"+cart_idx[i]+"/"+cart_num[i]);
	if(product_num!=null){
		System.out.println("product_num="+product_num[i]);
	}
	if(product_code!=null){
		System.out.println("product_code="+product_code[i]);
	}
	if(product_color!=null){
		System.out.println("product_color="+product_color[i]);
	}
}

int productidx[]=new int[arr.size()];
ProductDTO dto=null;
/***********************************배열값 불러오기********************************************8*/
int productprice[]=new int[arr.size()];
String pstr[]=new String[arr.size()];
int paymentnum[]=new int[arr.size()];
String nstr[]=new String[arr.size()];
for(int i=0; i<arr.size(); i++){
	pstr[i]="product_price"+(i+1);
	productprice[i]=Integer.parseInt(request.getParameter(pstr[i]));
	nstr[i]="payment_num"+(i+1);
	paymentnum[i]=Integer.parseInt(request.getParameter(nstr[i]));
}

if(productprice==null && paymentnum==null){
%>
<script>
window.alert('price와 num값 null 값임');
</script>
<%
}
	
/**********************************************************************************************8*/

if(member_id==null||member_id.equals("")){
	%>
	<script>
	window.alert('login is needed');
	location.href="/myweb/index.jsp";
	</script>
	<%
	return;
}

for(int i=0; i<arr.size(); i++){
	productidx[i]=arr.get(i).getProduct_idx();
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
<%@ include file="/header.jsp"%>
<h3>주문/결제</h3>
<section>
<form name="pay" action="cartArrPay_check.jsp" method="post">
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
if(arr==null || arr.size()==0){
	%>
	<tr>
	<td colspan="4" align="center">선택한 상품이 없습니다.</td>
	</tr>
	<%
}else{
	for(int i=0; i<arr.size(); i++){
		dto=pdao.productOne(productidx[i]);

%>
<tr>
<td><%=dto.getProduct_img()%></td>
<td><%=dto.getProduct_name() %> / <%=dto.getProduct_color() %> /<%=dto.getProduct_code() %></td>
<td>
<%=paymentnum[i]%>
</td>
<td><%=df.format(productprice[i]) %></td>
</tr>
<%
	}
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
<td><input type="text" name="member_name" value="<%=mdto.getMember_name()%>" size="50" required="required"></td>
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
<%
int cartSum=cdao.cartSum(member_id);
%>
<td><%=df.format(cartSum) %></td>
</tr>
<tr align="right">
<td colspan="3"> <input type="submit" value="결제하기" ></td>
</tr>
</table>
</article>
<input type="hidden" name="arr" value="<%=arr%>">
</form>
</section>
<%@ include file="/footer.jsp"%>
</body>
</html>