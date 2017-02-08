<%@page import="java.text.DecimalFormat"%>
<%@page import="semi.pay.PayDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="paydao" class="semi.pay.PayDAO" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("utf-8");
String member_id = (String) session.getAttribute("session_member_id");
	ArrayList<PayDTO> payarr = paydao.payInfo(member_id);
	DecimalFormat df = new DecimalFormat("#,##0");
	String menu = request.getParameter("menu");
%>
<body>
<h3 class="mypage_tit">주문/배송조회</h3>
							<table cellspacing="0" cellpadding="0" summary=""
								class="table_style">
								<colgroup>
									<col width="8%">
									<col width="20%">
									<col width="*">
									<col width="14%">
									<col width="10%">
									<col width="10%">
								</colgroup>
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
										<td colspan="6">주문하신 내역이 없습니다.</td>
									</tr>
									<%
										} else {
											int count = 0;
											for (int i = 0; i < payarr.size(); i++) {
												count++;
									%>
									<script type="text/javascript">
									function cancelCheck<%=count%>(){
									var payment_idx = document.payidx<%=count%>.payment_idx.value;
									var payment_date = document.payidx<%=count%>.payment_date.value;
									document.payidx<%=count%>.action="../mypage/mypageCancel_check.jsp";
									document.payidx<%=count%>.submit();
									}
								</script>
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
												if (payarr.get(i).getPayment_stat() == 1) {
											%> 배송중 <%
												} else if (payarr.get(i).getPayment_stat() == 2) {
											%> 주문취소중 <%
												}
											%>
										</td>
										<td><%=df.format(payarr.get(i).getPayment_totalprice())%>원</td>
										<td><%=payarr.get(i).getPayment_date()%></td>
										<td>
											<%
												if (payarr.get(i).getPayment_stat() == 1) {
											%> 
											<input type="button" value="주문취소" onclick="javascript:cancelCheck<%=count%>()">
											 <%
 												} else if (payarr.get(i).getPayment_stat() == 2) {
 												%> 주문취소중<%
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
</body>
</html>