<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="semi.pay.*" %>
<jsp:useBean id="paydto" class="semi.pay.PayDTO"/>
<jsp:useBean id="paydao" class="semi.pay.PayDAO"/>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

String member_id=request.getParameter("member_id");
String product_idxs=request.getParameter("product_idx");
int product_idx=Integer.parseInt(product_idxs);
String payment_totalprices=request.getParameter("payment_totalprice");
int payment_totalprice=Integer.parseInt(payment_totalprices);
String payment_nums=request.getParameter("payment_num");
int payment_num=Integer.parseInt(payment_nums);
String payment_addr=request.getParameter("payment_addr");
String payment_tel=request.getParameter("payment_tel");

int result = paydao.payInsert(member_id, product_idx, payment_totalprice, payment_num, payment_addr, payment_tel);
String msg=result>0?"결재완료":"결재실패";

%>
<script>
window.alert('<%=msg%>');
location.href="/myweb/pay/pay.jsp";
</script>