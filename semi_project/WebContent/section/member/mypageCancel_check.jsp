<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="rdao" class="semi.refund.RefundDAO" scope="session"/>
    <jsp:useBean id="paydao" class="semi.pay.PayDAO" scope="session"/>
<%
request.setCharacterEncoding("utf-8");

String member_id=request.getParameter("member_id");
String product_idxs=request.getParameter("product_idx");
String payment_idxs=request.getParameter("payment_idx");
String refund_subject=request.getParameter("refund_subject");
String refund_content=request.getParameter("refund_content");

int product_idx=Integer.parseInt(product_idxs);
int payment_idx=Integer.parseInt(payment_idxs);

int result = rdao.refundInsert(member_id, product_idx, payment_idx, refund_subject, refund_content);
String msg="";

if(result>0){
	%>
	<script>
	window.alert('주문 취소요청이 완료되었습니다. '+'\n'+'등록하신 연락처 및 메일로 연락드리겠습니다.'+'\n'+'고객센터:1588-1588');
	</script>
	<%
}else{
	%>
	<script>
	window.alert('주문 취소가 실패하였습니다. '+'\n'+'고객센터:1588-1588');
	</script>
	<%
}

int resultPayChange=paydao.payStatChange(payment_idx);

%>
<script>
window.alert('<%=msg%>');
opener.location.reload();
window.self.close();
</script>