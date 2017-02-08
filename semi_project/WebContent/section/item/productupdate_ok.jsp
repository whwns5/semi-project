<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="pdto" class="semi.adminproduct.adminproductDTO"/>
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="semi.adminproduct.adminproductDAO" scope="session"/>

<%
	int count = pdao.updateContent(pdto);
	
	String msg=count>0?"수정 완료":"수정 실패";
	
	%>
	<script>
	window.alert('<%=msg%>');
	location.href='productFind.jsp';
	</script>
	<%
	


%>