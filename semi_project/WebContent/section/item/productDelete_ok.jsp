<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdto" class="semi.adminproduct.adminproductDTO"/>
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="semi.adminproduct.adminproductDAO"/>
<%
	int result=pdao.productDel(pdto);
	String msg = result> 0 ? "등록제거 성공" : "등록제거 실패";
%>
<script>
	window.alert('<%=msg%>');
	location.href = '/semi_project/section/member/adminPage.jsp?menu=product_list';
</script>