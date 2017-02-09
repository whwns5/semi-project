<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="semi.pay.*"%>
<%@page import="semi.product.*"%>
<%@page import="semi.refund.*"%>
    <jsp:useBean id="refdao" class="semi.refund.RefundDAO" scope="session"/>
        <jsp:useBean id="pdao1" class="semi.product.ProductDAO" scope="session"/>
    <jsp:useBean id="paydao1" class="semi.pay.PayDAO" scope="session"/>
    <% 
    
    request.setCharacterEncoding("utf-8");
	String member_id2=(String)session.getAttribute("session_member_id");
	if(member_id2==null || member_id2.equals("")){
		%>
		<script>
		window.alert('로그인 후 이용 바랍니다.');
		location.href="../../index.jsp";
		</script>
		<%
	}
	ArrayList<RefundDTO> refarr=refdao.refundInfo(member_id2);
	DecimalFormat df = new DecimalFormat("#,##0");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/semi_project/css/member/mypage/mypageOrder.css">
<body>
<h3 class="title">주문취소 조회</h3>
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
								<h3>취소 내역</h3>
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
											<th>주문금액 / 수량</th>
											<th colspan="2">취소사유</th>
											<th>취소날짜</th>
										</tr>
									</tbody>
									<%


if(refarr==null || refarr.size()==0){
	%>
	<tr>
	<td colspan="7" align="center">취소한 내역이 없습니다.</td>
	</tr>
	<%
}else{
	ProductDTO pdto=null;
	PayDTO paydto=null;
	for(int i=0; i<refarr.size(); i++){
		pdto=pdao1.productOne(refarr.get(i).getProduct_idx());
		paydto=paydao1.payInfoOne(refarr.get(i).getPayment_idx());
		%>
		<tr align="left">
		<td><%=paydto.getPayment_idx() %></td>
		<td colspan="2"><%=paydto.getProduct_name()%><%=paydto.getProduct_code()%>&nbsp;<%=paydto.getProduct_color()%></td>
		<td><%=df.format(paydto.getPayment_totalprice())%> 원/ <%=paydto.getPayment_num()%>개</td>
		<td colspan="2"><%=refarr.get(i).getRefund_subject()%></td>
		<td><%=refarr.get(i).getRefund_date()%></td>
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