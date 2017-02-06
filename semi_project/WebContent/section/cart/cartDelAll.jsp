<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cdao" class="semi.cart.CartDAO" scope="session"/>
<%
String member_id=(String)session.getAttribute("user_id");
int result=cdao.cartDelAll(member_id);

String msg=result>0?"success":"fail";
%>
<script>
window.alert('<%=msg%>');
location.href="cartShow.jsp";
</script>