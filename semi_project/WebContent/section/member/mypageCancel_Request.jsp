<%@page import="java.text.DecimalFormat"%>
<%@page import="semi.refund.*"%>
<%@page import="semi.pay.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="paydao" class="semi.pay.PayDAO" scope="session"/>
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
String payment_idxs=request.getParameter("payment_idx");
int payment_idx=0;
if(payment_idxs==null || payment_idxs.equals("")){
	%>
	<script>
	window.alert('잘못된 접근경로 입니다.');
	location.href="section/mypage/mypage.jsp";
	</script>
	<%
}else{
payment_idx=Integer.parseInt(payment_idxs);
}
PayDTO paydto=paydao.payInfoOne(payment_idx);
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
<form name="form" action="mypageCancel_check.jsp">
<tr>
<th>취소사유</th>
<th class="sub">
<select name="refund_subject">
<option value="실수로 구입함">
실수로 구입함
</option>
<option value="더 이상 구매를 원하지 않음">
더 이상 구매를 원하지 않음
</option>
<option value="지인이 내 동의 없이 구매">
지인이 내 동의 없이 구매
</option>
<option value="구매에 대해 아는바 없음">
구매에 대해 아는바 없음
</option>
<option value="제품 불량">
제품 불량
</option>
<option value="구매했지만 미배송">
구매했지만 미배송
</option>
<option value="기타">
기타
</option>
</select>
</th>
</tr>
<tr>
<th colspan="2">상세사유</th>
</tr>
<tr>
<td colspan="2">
<textarea rows="25" cols="70" name="refund_content" placeholder="여기에 입력" maxlength="900" required="required"></textarea>
 </td>
</tr>
<tr>
<td colspan="2">
<a href="javascript:submit()" onmouseover="window.status='제출';return true;" target="_self" class="btn_A" style="width: 80px">제출하기</a>
<a href="javascript:cancel()" onmouseover="window.status='취소';return true;" target="_self" class="btn_B" style="width: 80px">취소하기</a>
</td>
</tr>
<input type="hidden" name="payment_idx" value="<%=paydto.getPayment_idx()%>">
<input type="hidden" name="product_idx" value="<%=paydto.getProduct_idx()%>">
<input type="hidden" name="member_id" value="<%=paydto.getMember_id()%>">
</form>
<script>
function submit(){
	document.form.action="mypageCancel_check.jsp";
	document.form.submit();
}
function cancel(){
	window.self.close();
}
</script>
</table>
</body>
</html>