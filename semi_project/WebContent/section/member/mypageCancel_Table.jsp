<%@page import="semi.pay.*"%>
<%@page import="semi.product.*"%>
<%@page import="semi.refund.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="refdao" class="semi.refund.RefundDAO" scope="session"/>
    <jsp:useBean id="pdao" class="semi.product.ProductDAO" scope="session"/>
    <jsp:useBean id="paydao" class="semi.pay.PayDAO" scope="session"/>
    <% 
    
    request.setCharacterEncoding("utf-8");
	String member_id=(String)session.getAttribute("session_member_id");
	if(member_id==null || member_id.equals("")){
		%>
		<script>
		window.alert('로그인 후 이용 바랍니다.');
		location.href="../../index.jsp";
		</script>
		<%
	}
	ArrayList<RefundDTO> refarr=refdao.refundInfo(member_id);
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../../css/mainLayout.css">
<style>
table, table tr, table td, table th{
border:1px solid black;
}
</style>
</head>
<body>
<%@ include file="/header/header.jsp"%>
<section>
<article>
<table>
<thead>
<tr>
<th>상품이미지</th>
<th>상품정보</th>
<th>상품주문가격</th>
<th>상품주문개수</th>
<th>취소사유</th>
<th>취소날짜</th>
</tr>
</thead>
<tbody>
<%


if(refarr==null || refarr.size()==0){
	%>
	<tr>
	<td colspan="6" align="center">취소한 내역이 없습니다.</td>
	</tr>
	<%
}else{
	ProductDTO pdto=null;
	PayDTO paydto=null;
	for(int i=0; i<refarr.size(); i++){
		pdto=pdao.productOne(refarr.get(i).getProduct_idx());
		paydto=paydao.payInfoOne(refarr.get(i).getPayment_idx());
		%>
		<tr align="left">
		<td><img alt="" src="../img/<%=pdto.getProduct_img() %>.jsp"></td>
		<td><%=paydto.getProduct_name()%><%=paydto.getProduct_code()%>&nbsp;<%=paydto.getProduct_color()%></td>
		<td><%=paydto.getPayment_totalprice()%></td>
		<td><%=paydto.getPayment_num()%></td>
		<td><%=refarr.get(i).getRefund_subject()%></td>
		<td><%=refarr.get(i).getRefund_date()%></td>
		</tr>
		<%
	}
}
%>
</tbody>
</table>
</article>
</section>
<input type="button" value="my page" onclick="location='mypage.jsp'">
<%@ include file="/footer/footer.jsp"%>

</body>
</html>