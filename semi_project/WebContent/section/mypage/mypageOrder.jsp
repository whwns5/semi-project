<%@page import="semi.product.ProductDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="semi.pay.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="paydao" class="semi.pay.PayDAO" scope="session" />
<jsp:useBean id="pdao" class="semi.product.ProductDAO" scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<%
	DecimalFormat df = new DecimalFormat("#,##0");
	String member_id = (String) session.getAttribute("session_member_id");
	if (member_id == null || member_id.equals("")) {
%>
<script>
	window.alert("로그인이 필요합니다.");
	location.href="../index.jsp"
	</script>
<%
	return;
	}

	ArrayList<PayDTO> payarr = paydao.payInfo(member_id);
	PayDTO pdto = null;
%>
<style>
table, table tr, table td, table th {
	border: 1px solid black;
}
</style>
<body>
	<%@ include file="/header/header.jsp"%>
	<section> <article>
	<table>
		<thead>
			<tr>
				<th class="first">번호</th>
				<th>주문번호</th>
				<th>상품명</th>
				<th>상태</th>
				<th>결제금액</th>
				<th>주문일자</th>
				<th>주문취소</th>
			</tr>
		</thead>
		<tbody>
			<%
				if (payarr == null || payarr.size() == 0) {
			%>
			<tr>
				<td colspan="4">주문상품이 없습니다.</td>
			</tr>
			<%
				} else {
					int count = 0;
					for (int i = 0; i < payarr.size(); i++) {
						count++;
			%>
			<form name="payidx<%=count%>">
				<input type="hidden" name="payment_idx"
					value="<%=payarr.get(i).getPayment_idx()%>"> <input
					type="hidden" name="payment_date"
					value="<%=payarr.get(i).getPayment_date()%>">
			</form>

			<tr align="center">
				<td><%=i + 1%></td>
				<td><%=payarr.get(i).getPayment_idx()%></td>
				<td><%=payarr.get(i).getProduct_name()%><%=payarr.get(i).getProduct_code()%>&nbsp;<%=payarr.get(i).getProduct_color()%></td>
				<td>
				<%
				if(payarr.get(i).getPayment_stat()==1){
					%>
					배송중
					<%
				}else if(payarr.get(i).getPayment_stat()==2){
					%>
					주문취소중
					<%
				}
				%>
				</td>
				<td><%=df.format(payarr.get(i).getPayment_totalprice())%>원</td>
				<td><%=payarr.get(i).getPayment_date()%></td>
				<td><script type="text/javascript">
									function cancelCheck<%=count%>(){
									var payment_idx = document.payidx<%=count%>.payment_idx.value;
									var payment_date = document.payidx<%=count%>.payment_date.value;
									document.payidx<%=count%>.action="../mypage/mypageCancel_check.jsp";
									document.payidx<%=count%>.submit();
									}
								</script> 
								<%
								if(payarr.get(i).getPayment_stat()==1){
									%>
									<input type="button" value="주문취소"
					onclick="javascript:cancelCheck<%=count%>()">
									<%
								}else if(payarr.get(i).getPayment_stat()==2){
									%>
									주문취소중
									<%
								}
								%>
								</td>
			</tr>
			<%
				}
				}
			%>
		</tbody>
	</table>
	</article> </section>
	<%@ include file="/footer/footer.jsp"%>
</body>
</html>