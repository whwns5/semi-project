<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="ppdto" class="semi.adminproduct.adminproductDTO"/>
<jsp:setProperty property="*" name="ppdto"/>
<jsp:useBean id="ppdao" class="semi.adminproduct.adminproductDAO" scope="session"/>

<%
	int count = ppdao.updateContent(ppdto);
	
	String msg = count > 0? "수정 완료" : "수정 실패";
	
%>
<script>
	window.alert('<%=msg%>');
	location.href='/semi_project/section/member/adminPage.jsp?menu=product_list';
</script>
