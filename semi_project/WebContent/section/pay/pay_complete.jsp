<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="semi.pay.*" %>
<jsp:useBean id="paydto" class="semi.pay.PayDTO" scope="session"/>
<jsp:useBean id="paydao" class="semi.pay.PayDAO" scope="session"/>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

String member_id=request.getParameter("member_id");
if(member_id==null || member_id.equals("")){
	%>
	<script>
	window.alert('잘못된 접근경로 입니다.');
	location.href="../../index.jsp";
	</script>
	<%
	return;
}

String product_idxs=request.getParameter("product_idx");
int product_idx=Integer.parseInt(product_idxs);
String payment_totalprices=request.getParameter("payment_totalprice");
int payment_totalprice=Integer.parseInt(payment_totalprices);
String payment_nums=request.getParameter("payment_num");
int payment_num=Integer.parseInt(payment_nums);
String payment_addr=request.getParameter("payment_addr");
String payment_tel=request.getParameter("payment_tel");
String product_name=request.getParameter("product_name");
String product_color=request.getParameter("product_color");
String product_code=request.getParameter("product_code");

int result = paydao.payInsert(member_id, product_idx, payment_totalprice, payment_num, payment_addr, payment_tel, product_name, product_code, product_color);
String msg=result>0?"결재완료":"결재실패";

%>
<script>
window.alert('<%=msg%>');
location.href="../../index.jsp";
</script>