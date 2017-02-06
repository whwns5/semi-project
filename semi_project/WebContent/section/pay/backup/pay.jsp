<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="seung.member.*" %>
    <%@ page import="seung.product.*" %>
    <jsp:useBean id="pdto" class="seung.product.ProductDTO" scope="session"/>
    <jsp:setProperty property="*" name="pdto"/>
    <jsp:useBean id="pdao" class="seung.product.ProductDAO" scope="session"/>
    <jsp:useBean id="mdao" class="seung.member.MemberDAO" scope="session"/>
    <jsp:useBean id="mt" class="seung.member.MemberDTO" scope="session"/>
    <jsp:useBean id="cdao" class="seung.cart.CartDAO" scope="session"/>
<%
request.setCharacterEncoding("utf-8");
String member_id=(String)session.getAttribute("user_id");
System.out.println("pay.jsp BEFORE id="+member_id);
if(member_id==null|| member_id.equals("")){
%>
<script>
window.alert('로그인 후 이용바랍니다.');
location.href="/myweb/index.jsp";
</script>
<%
	/*
	mdto=mdao.memberGet("default");
	member_id=mdto.getMember_id();
	String none="";
	//String name="none";
	//mt.setMember_id(name);
	//mt.setMember_type(none);
	mdto.setMember_name(none);
	//mt.setMember_pwd(none);
	//mt.setMember_sex(none);
	//mt.setMember_email(none);
	mdto.setMember_tel(none);
	mdto.setMember_addr(none);
	//mt.setMember_coupon(none);
	
	//mdto=mdao.noneMemberSet();
	//mdto=mdao.memberGet("none");
	//String name="";
	//mdto.setMember_name(name);
	//String tel="";
	//mdto.setMember_tel(tel);
	//String addr="";
	//mdto.setMember_addr(addr);
	*/
	
}
MemberDTO mdto=mdao.memberGet(member_id);
DecimalFormat df=new DecimalFormat("#,##0");
System.out.println("pay.jsp AFTER id="+member_id);
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
.div-pay{
float:right;
width:500px;
}
</style>
<body>
<%@ include file="/header.jsp"%>
<h3>주문/결제</h3>
<section>
<form name="pay" action="pay_check.jsp" method="post">
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
pdto.setProduct_num(1);
if(pdto.getProduct_name()==null || pdto.getProduct_name().equals("")){
	%>
	<tr>
	<td colspan="4" align="center">선택한 상품이 없습니다.</td>
	</tr>
	<%
}else{
%>
<tr>
<td><%=pdto.getProduct_img() %></td>
<td><%=pdto.getProduct_name() %> / <%=pdto.getProduct_color() %> /<%=pdto.getProduct_code() %></td>
<td>
<%=pdto.getProduct_num() %>
</td>
<td><%=df.format(pdto.getProduct_price()) %></td>
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
<td><input type="text" name="member_name" value="<%=mdto.getMember_name() %>" size="50" required="required" minlength=2></td>
</tr>
<tr>
<th>휴대폰 번호</th>
<td><input type="text" name="member_tel" value="<%=mdto.getMember_tel()%>" size="50" minlength=8></td>
</tr>
<tr>
<th>전화 번호</th>
<td><input type="text" name="payment_tel" required="required" size="50" minlength=8></td>
</tr>
<tr>
<th>이메일</th>
<td><input type="text" name="member_email" value="" size="50" minlength=6></td>
</tr>
<tr>
<th>배송주소</th>
<td><input type="text" name="payment_addr" value="<%=mdto.getMember_addr() %>" required="required" size="50" minlength=10></td>
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
<% int payment_totalPrice=pdto.getProduct_price(); %>
<td><%=df.format(payment_totalPrice)%></td>
</tr>
<tr align="right">
 
<td colspan="3"> 
<input type="submit" value="submit결제하기"> 
</td>

</tr>
</table>
<input type="hidden" name="member_id" value="<%=member_id%>">
<input type="hidden" name="product_idx" value="<%=pdto.getProduct_idx()%>">
<input type="hidden" name="payment_totalprice" value="<%=pdto.getProduct_price()%>">
<input type="hidden" name="payment_num" value="<%=pdto.getProduct_num()%>">
<input type="hidden" name="product_name" value="<%=pdto.getProduct_name()%>">
<input type="hidden" name="product_color" value="<%=pdto.getProduct_color()%>">
<input type="hidden" name="product_code" value="<%=pdto.getProduct_code()%>">
</article>
</form>
<!-- 
<div class="div-pay">
<input type="button" value="button결제하기" onclick='paycheck()'>
</div>
 -->
</section>
<%@ include file="/footer.jsp"%>
</body>
</html>