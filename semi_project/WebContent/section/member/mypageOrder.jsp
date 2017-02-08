<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
	<%@page import="semi.product.ProductDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="semi.pay.*"%>
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
<link rel="stylesheet" type="text/css" href="/myweb/css/member/mypage/mypageOrder.css">
<%
	DecimalFormat df = new DecimalFormat("#,##0");
	String member_id = (String) session.getAttribute("session_member_id");
	if (member_id == null || member_id.equals("")) {
%>
<script>
	window.alert("로그인이 필요합니다.");
	location.href="../../index.jsp"
	</script>
<%
	return;
	}

	ArrayList<PayDTO> payarr = paydao.payInfo(member_id);
	PayDTO pdto = null;
%>
<body>
<h3 class="title">주문/배송 조회</h3>
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<input type="hidden" name="ordgbn" value="A">
		<tbody>
			<tr>
				<td align="center">
					<div class="containerBody sub_skin">
						<!-- 내용 -->
						<div class="right_section">
							<!-- 주문/배송 -->
							<div class="table_wrap mt_30">
								<h3>주문/배송</h3>
								<div class="right_info">
									<div class="select_type ta_l" style="width: 100px; z-index: 70">
									</div>
								</div>
								<!-- 주문/배송 -->
								<table class="th_top">
									<colgroup>
										<col width="170">
										<col width="85">
										<col width="*px">
										<col width="145">
										<col width="100">
										<col width="100">
									</colgroup>
									<tbody>
										<tr>
											<th>주문정보</th>
											<th colspan="2">상품정보</th>
											<th>주문금액/수량</th>
											<th>주문일자</th>
											<th>진행상태</th>
											<th>주문취소요청</th>
										</tr>
									</tbody>
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
									<td><%=payarr.get(i).getPayment_idx()%></td>
									<td colspan="2"><%=payarr.get(i).getProduct_name()%><%=payarr.get(i).getProduct_code()%>&nbsp;<%=payarr.get(i).getProduct_color()%></td>
									<td><%=df.format(payarr.get(i).getPayment_totalprice()) %>원 / <%=payarr.get(i).getPayment_num() %>개</td>
									<td><%=payarr.get(i).getPayment_date() %></td>
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
									<td><script type="text/javascript">
									function cancelCheck<%=count%>(){
									var payment_idx = document.payidx<%=count%>.payment_idx.value;
									var payment_date = document.payidx<%=count%>.payment_date.value;
									document.payidx<%=count%>.action="mypageCancel_TimeCheck.jsp";
									document.payidx<%=count%>.submit();
									}
								</script> 
								<%
								if(payarr.get(i).getPayment_stat()==1){
									%>
									<a
									href="javascript:cancelCheck<%=count %>()"
									onmouseover="window.status='취소';return true;" target="_self"
									class="btn_B" style="width: 80px">취소하기</a>
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
								</table>
								<div class="paging mt_30">
									<a class="on">1</a>
								</div>
							</div>
							<!-- //최근주문정보 -->
						</div>
						<!-- 내용 -->
					</div>
					<div id="create_openwin" style="display: none"></div>
		</tbody>
	</table>
</body>
</html>