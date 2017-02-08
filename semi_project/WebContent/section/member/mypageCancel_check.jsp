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
String msg=result>0?"주문이 취소되었습니다.":"주문취소가 실패하였습니다.";


int resultPayChange=paydao.payStatChange(payment_idx);
String msgPay = resultPayChange>0?"pay change complete":"change fail";

%>
<script>
window.alert('<%=msg%>');
opener.location.reload();
window.self.close();
</script>