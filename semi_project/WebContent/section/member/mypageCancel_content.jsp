<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="semi.refund.*"%>
<%@page import="semi.pay.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="paydao" class="semi.pay.PayDAO" scope="session"/>
    <jsp:useBean id="refdao" class="semi.refund.RefundDAO" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/semi_project/css/member/mypage/mypageCancel_Request.css">
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("utf-8");
DecimalFormat df=new DecimalFormat("#,##0");
String refund_idxs=request.getParameter("refund_idx");
System.out.println("???"+refund_idxs);
int refund_idx=0;
RefundDTO rdto=null;
PayDTO paydto=null;
if(refund_idxs==null||refund_idxs.equals("")){
	%>
	<script>
	window.alert('잘못된 접근경로 입니다.');
	location.href="section/mypage/mypage.jsp";
	</script>
	<%
}else{
refund_idx=Integer.parseInt(refund_idxs);
rdto=refdao.refundFindOne(refund_idx);
paydto=paydao.payInfoOne(rdto.getPayment_idx());
}

%>
<body>
<table class="th_top ">
<tr>
<th>상품정보</th>
<th>총가격</th>
<th>총수량</th>
<th>구매일</th>
</tr>
<tr>
<td><%=paydto.getProduct_name() %> / 
<%=paydto.getProduct_code()%> / 
<%=paydto.getProduct_color() %> </td>
<td><%=df.format(paydto.getPayment_totalprice()) %></td>
<td><%=paydto.getPayment_num() %></td>
<td><%=paydto.getPayment_date() %></td>
</tr>
</table>
<p heigth="10px">
</p>
<table class="th_top">
<form name="form" action="">
<tr>
<th>취소사유</th>
<th class="sub">
<%=rdto.getRefund_subject()%>
</th>
</tr>
<tr>
<th colspan="2">상세사유</th>
</tr>
<tr>
<td colspan="2">
<textarea rows="25" cols="70" name="refund_content" placeholder="여기에 입력" maxlength="900" readonly><%=rdto.getRefund_content() %></textarea>
 </td>
</tr>
<tr>
<td colspan="2">
<a href="javascript:cancel()" onmouseover="window.status='닫기';return true;" target="_self" class="btn_A" style="width: 80px">닫기</a>
</td>
</tr>
<input type="hidden" name="payment_idx" value="<%=paydto.getPayment_idx()%>">
<input type="hidden" name="product_idx" value="<%=paydto.getProduct_idx()%>">
<input type="hidden" name="member_id" value="<%=paydto.getMember_id()%>">
</form>
<script>
function cancel(){
	window.self.close();
}
</script>
</table>
</body>
</html>