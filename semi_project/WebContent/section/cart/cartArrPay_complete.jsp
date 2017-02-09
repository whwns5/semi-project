<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="semi.pay.*" %>
<jsp:useBean id="paydto" class="semi.pay.PayDTO" scope="session"/>
<jsp:useBean id="paydao" class="semi.pay.PayDAO" scope="session"/>
<jsp:useBean id="cdao" class="semi.cart.CartDAO" scope="session"/>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("utf-8");
String member_id=request.getParameter("member_id");

String payment_addr=request.getParameter("payment_addr");
String payment_tel=request.getParameter("payment_tel");

String product_idxs[]=request.getParameterValues("product_idx");
String payment_prices[]=request.getParameterValues("product_price");
String payment_nums[]=request.getParameterValues("cart_num");
String product_name[]=request.getParameterValues("product_name");
String product_code[]=request.getParameterValues("product_code");
String product_color[]=request.getParameterValues("product_color");
int payment_totalprice[]=new int[payment_prices.length];
int payment_num[]=new int[payment_prices.length];
int product_idx[]=new int[payment_prices.length];

for(int i=0; i<payment_nums.length; i++){
	payment_totalprice[i]=Integer.parseInt(payment_prices[i]);
	payment_num[i]=Integer.parseInt(payment_nums[i]);
	product_idx[i]=Integer.parseInt(product_idxs[i]);
}

int result =0; 
for(int i=0; i<payment_num.length; i++){
result += paydao.payInsert(member_id, product_idx[i], payment_totalprice[i], payment_num[i], payment_addr, payment_tel, product_name[i], product_code[i], product_color[i]);
}

String msg=result>0?"결재완료":"결재실패";

int result_CartDel = cdao.cartDelAll(member_id);
String msgCart=result_CartDel>0?"cartdel success":"cartdel fail";
%>
<script>
window.alert('<%=msg%>');
location.href="cartShow.jsp";
</script>