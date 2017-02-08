<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");  %>
<%@ page import = "java.net.*" %>
    <jsp:useBean id="pdto" class="semi.product.ProductDTO"/>
    <jsp:setProperty property="*" name="pdto"/>
    <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
table{
border:1px black solid;
width:400px;
}
table th, table tr, table td{
border:1px black solid;
}
</style>
</head>

    <% 
    String product_idxs=request.getParameter("product_idx");
    if(product_idxs==null||product_idxs.equals("")){
    	%>
    	<script>
    	window.alert('선택한 상품이 없습니다.');
    	location.href="pay.jsp";
    	</script>
    	<%
    	return;
    }
    int product_idx=Integer.parseInt(product_idxs);
    

	String member_name=request.getParameter("member_name");
	String member_tel=request.getParameter("member_tel");
	String payment_tel=request.getParameter("payment_tel");
	String member_email=request.getParameter("member_email");
	String payment_addr=request.getParameter("payment_addr");
	String member_id=request.getParameter("member_id");
	String payment_totalprices=request.getParameter("payment_totalprice");
	int payment_totalprice=Integer.parseInt(payment_totalprices);
	String payment_nums=request.getParameter("payment_num");
	int payment_num=Integer.parseInt(payment_nums);
	String product_name=request.getParameter("product_name");
	String product_color=request.getParameter("product_color");
	String product_code=request.getParameter("product_code");
	
	%>
<body>
<%@ include file="/header/header.jsp"%>
<section>
<article>
<h4>결제 확인 창입니다.</h4>
<form name="pay_check" action="pay_complete.jsp">
<table>
<tr>
<th>회원아이디: </th>
<td><%=member_id %></td>
</tr>
<tr>
<th>이름: </th>
<td><%=member_name %></td>
</tr>
<tr>
<th>상품이름: </th>
<td><%=product_name %> / <%=product_color %> / <%=product_code %></td>
</tr>
<tr>
<th>상품번호: </th>
<td><%=product_idx %></td>
</tr>
<tr>
<th>총결재액: </th>
<td><%=payment_totalprice %></td>
</tr>
<tr>
<th>총 수량: </th>
<td><%=payment_num %></td>
</tr>
<tr>
<th>배송지: </th>
<td><%=payment_addr %></td>
</tr>
<tr>
<th>연락처: </th>
<td><%=payment_tel %></td>
</tr>
<tr>
<td colspan="2"><input type="submit" value="결제확인"><input type="button" value="취소" onclick="history.back()"></td>
</tr>
</table>
<input type="hidden" name="member_id" value="<%=member_id%>">
<input type="hidden" name="product_idx" value="<%=product_idx%>">
<input type="hidden" name="payment_totalprice" value="<%=payment_totalprice%>">
<input type="hidden" name="payment_num" value="<%=payment_num%>">
<input type="hidden" name="payment_addr" value="<%=payment_addr%>">
<input type="hidden" name="payment_tel" value="<%=payment_tel%>">
<input type="hidden" name="product_name" value="<%=product_name%>">
<input type="hidden" name="product_code" value="<%=product_code%>">
<input type="hidden" name="product_color" value="<%=product_color%>">
</form>
</article>
</section>
<%
/**
	request.setAttribute("member_id", member_id);
	request.setAttribute("product_idx", product_idx);
	request.setAttribute("payment_totalprice", payment_totalprice);
	request.setAttribute("payment_num", payment_num);
	request.setAttribute("payment_addr", payment_addr);
	request.setAttribute("payment_tel", payment_tel);
	request.getRequestDispatcher("pay_complete.jsp").forward(request, response);
*/
%>
<%@ include file="/footer/footer.jsp"%>
</body>
</html>

