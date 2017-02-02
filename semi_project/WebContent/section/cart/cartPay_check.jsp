<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  request.setCharacterEncoding("utf-8");  %>
    <%@ page import="java.net.*" %>
    <jsp:useBean id="pdto" class="semi.product.ProductDTO"/>
    <jsp:setProperty property="*" name="pdto"/>
    <% 
  
    String product_idxs=request.getParameter("product_idx");
    if(product_idxs==null|| product_idxs.equals("")){
    	%>
    	<script>
    	window.alert('선택한 상품이 없습니다.');
    	location.href="pay.jsp";
    	</script>
    	<%
    	return;
    }
    int product_idx=Integer.parseInt(product_idxs);
    System.out.println("product_idx="+product_idx);
    

    %>

<script type="text/javascript">
window.onload = function(){
	 if(confirm("결재하시겠습니까?")==true){
	 window.alert('결재완료');
	 location.href="cartPay.jsp"
 }else{
	 window.alert('결재취소');
	 location.href="cartPay.jsp";
 }
} 
</script>
<%

%>