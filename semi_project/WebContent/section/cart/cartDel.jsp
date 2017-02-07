<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cdao" class="semi.cart.CartDAO"/>
    
    <%
    String idxs=request.getParameter("cart_idx");
    int cart_idx=Integer.parseInt(idxs);
    String member_id=(String)session.getAttribute("session_member_id");
    
    int result=cdao.cartDel(cart_idx, member_id);
	String msg=result==1?"Success":"fail";
    %>
<script>
window.alert('<%=msg%>');
location.href="cartShow.jsp";
</script>