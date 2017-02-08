<%@page import="java.util.ArrayList"%>
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
//db 업데이트
String member_id=(String)session.getAttribute("session_member_id");
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

	System.out.println("cartArrToDB="+product_idx[i]+"/"+product_price[i]+"/"+cart_idx[i]+"/"+cart_num[i]);
}
%>
<%
request.setCharacterEncoding("utf-8");
MemberDTO mdto=mdao.memberGet(member_id);
DecimalFormat df=new DecimalFormat("#,##0");
CartDTO cd=cdao.show(member_id);
String product_num[]=request.getParameterValues("product_num");
String product_name[]=new String[arr.size()];
product_name=request.getParameterValues("product_name");
String product_code[]=new String[arr.size()];
product_code=request.getParameterValues("product_code");
String product_color[]=new String[arr.size()];
product_color=request.getParameterValues("product_color");
/*
String product_idxs[]=request.getParameterValues("product_idx");
String product_prices[]=request.getParameterValues("product_price");
String cart_nums[]=request.getParameterValues("cart_num");
String cart_idxs[]=request.getParameterValues("cart_idx");
*/

/*
int product_idx[]=new int[arr.size()];
int product_price[]=new int[arr.size()];
int cart_num[]=new int[arr.size()];
int cart_idx[]=new int[arr.size()];
*/


	/*
for(int i=0; i<arr.size(); i++){
	product_idx[i]=Integer.parseInt(product_idxs[i]);
	product_price[i]=Integer.parseInt(product_prices[i]);
	cart_num[i]=Integer.parseInt(cart_nums[i]);
	cart_idx[i]=Integer.parseInt(cart_idxs[i]);
	System.out.println("cartArrPay"+product_idx[i]+"/"+product_price[i]+"/"+cart_idx[i]+"/"+cart_num[i]);
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
	*/

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/mainLayout.css">
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
<h3>주문/결제</h3>
<section>
<form name="pay" action="cartArrPay_check.jsp" method="post">
<article>
<table class="table-proinfo">
<caption>01. 주문상품</caption>
<thead>
<tr>
<th>상품번호</th>
<th>상품사진</th>
<th>상품정보</th>
<th>수량</th>
<th>결재예정가</th>
</tr>
</thead>
<tbody>
<%
ProductDTO pd=null;
CartDTO cdto=null;
if(arr==null || arr.size()==0){
	%>
	<tr>
	<td colspan="4" align="center">선택한 상품이 없습니다.</td>
	</tr>
	<%
}else{
	for(int i=0; i<arr.size(); i++){
	//각 table 행에 맞는 cart와 product 불러오기
	cdto=cdao.showOneForPay(member_id, cart_idx[i]);
	pd=pdao.productOne(product_idx[i]);
%>
<tr>
<td>
<%=pd.getProduct_idx() %>
<% System.out.println("cartArrPay.jsp="+pd.getProduct_idx()); %>
<input type="hidden" name="product_idx" value="<%=pd.getProduct_idx()%>">
</td>
<td><%=pd.getProduct_img()%></td>
<td><%=pd.getProduct_name() %> / <%=pd.getProduct_color() %> /<%=pd.getProduct_code() %></td>
<td>
<%=cdto.getCart_num()%>
</td>
<td>
<%=df.format(cdto.getProduct_price()) %>

</td>
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
int cartNumSum=cdao.cartNumSum(member_id);
/*
String cartPname="";
String cartPcode="";
String cartPcolor="";
if(product_name.length>1){
for(int i=0; i<arr.size(); i++){
	cartPname+=product_name[i]+",";
	cartPcode+=product_code[i]+",";
	cartPcolor+=product_color[i]+",";
}
}else{
	cartPname=product_name[0];
	cartPcode=product_code[0];
	cartPcolor=product_color[0];
}
*/
%>
<td><%=df.format(cartSum) %></td>
</tr>
<tr align="right">
<td colspan="3"> <input type="submit" value="결제하기" ></td>
</tr>
</table>
</article>
<!-- -------------------------------------------------- 넘길값 ---------------------------------------------------->
<input type="hidden" name="product_price" value="<%=cartSum%>">
<input type="hidden" name="payment_num" value="<%=cartNumSum%>"><br>
<hr>
<%
int cartidx=0;
for(int i=0; i<arr.size();i++){
	cdto=cdao.showOneForPay(member_id, cart_idx[i]);
	cartidx=cdto.getProduct_idx();
	pd=pdao.productOne(cartidx);
	%>
<input type="hidden" name="product_idx" value="<%=cdto.getProduct_idx()%>">
<input type="hidden" name="cart_num" value="<%=cdto.getCart_num()%>">
<input type="hidden" name="product_name" value="<%=pd.getProduct_name()%>">
<input type="hidden" name="product_code" value="<%=pd.getProduct_code()%>">
<input type="hidden" name="product_price" value="<%=cdto.getProduct_price()%>">
<input type="hidden" name="product_color" value="<%=pd.getProduct_color()%>"><br>
	<%
}
%>
</form>
</section>
<%@ include file="/footer/footer.jsp"%>
</body>
</html>