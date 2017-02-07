<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="semi.pay.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <% request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="paydao" class="semi.pay.PayDAO" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<%
DecimalFormat df= new DecimalFormat("#,##0");
String member_id=(String)session.getAttribute("session_member_id");
if(member_id==null || member_id.equals("")){
	%>
	<script>
	window.alert("로그인이 필요합니다.");
	location.href="../index.jsp"
	</script>
	<%
	return;
}

ArrayList<PayDTO> arr=paydao.payInfo(member_id);

%>
<style>
table, table tr, table td, table th{
border:1px solid black;
}
</style>
<body>
<%@ include file="/header/header.jsp"%>
<section>
<article>
<table>
<thead>
<tr>
<th>상품정보</th>
<th>주문금액</th>
<th>주문수량</th>
<th>주문일자</th>
<th>환불취소</th>
</tr>
</thead>
<tbody>
<%
if(arr==null || arr.size()==0){
	%>
	<tr>
	<td colspan="4">주문상품이 없습니다.</td>
	</tr>
	<%
}else{
int count=0;
for(int i=0; i<arr.size(); i++){
	count++;
%>
<tr>
<td>
<form name="payidx<%=count%>">
<input type="hidden" name="payment_idx" value="<%=arr.get(i).getPayment_idx()%>">
<input type="hidden" name="payment_date" value="<%=arr.get(i).getPayment_date()%>">
</form>
<%=arr.get(i).getProduct_name()%> /<br> <%=arr.get(i).getProduct_code() %> /<br> <%=arr.get(i).getProduct_color() %>
</td>
<td><%=df.format(arr.get(i).getPayment_totalprice())%></td>	
<td><%=arr.get(i).getPayment_num() %></td>
<td><span id="paydate"><%=arr.get(i).getPayment_date() %></span></td>
<td>
<%
/*
Date d = arr.get(i).getPayment_date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String to = sdf.format(d);
System.out.println("d="+d);
System.out.println("to="+to);
*/
%>
<script type="text/javascript">
function cancelCheck<%=count%>(){
	var payment_idx = document.payidx<%=count%>.payment_idx.value;
	var payment_date = document.payidx<%=count%>.payment_date.value;
	document.payidx<%=count%>.action="../mypage/mypageCancel_check.jsp";
	document.payidx<%=count%>.submit();
	
}
</script>
<input type="button" value="주문취소" onclick="javascript:cancelCheck<%=count%>()">
</td>	
</tr>
<%
}
}
%>
</tbody>
</table>
</article>
</section>
<%@ include file="/footer/footer.jsp"%>
</body>
</html>