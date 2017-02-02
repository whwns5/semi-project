<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%  request.setCharacterEncoding("utf-8");  %>
    <%@ page import="java.net.*" %>
    <jsp:useBean id="pdto" class="semi.product.ProductDTO"/>
    <jsp:setProperty property="*" name="pdto"/>
    <% 
    request.setCharacterEncoding("utf-8"); 
    String arr=request.getParameter("arr");
    if(arr==null){
    	%>
    	<script>
    	window.alert('선택한 상품이 없습니다.');
    	location.href="pay.jsp";
    	</script>
    	<%
    	return;
    }
    %>

<script type="text/javascript">
window.onload = function(){
	 if(confirm("결재하시겠습니까?")==true){
	 window.alert('결재완료');
	 location.href="cartArrPay.jsp"
 }else{
	 window.alert('결재취소');
	 location.href="cartArrPay.jsp";
 }
} 
</script>
<%

%>