<%@page import="semi.qna.QnaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdao" class="semi.qna.QnaDAO"/>
<%
	ArrayList<QnaDTO> arr_qdto = null;
	arr_qdto = qdao.qnaList(23,1,10);
%>
	<table border="1">
	
<%
	for(int i = 0; i < arr_qdto.size(); i++){
%>
		<tr>
			<td><%=arr_qdto.get(i).getQna_idx() %></td>
			<td><%=arr_qdto.get(i).getProduct_idx() %></td>
			<td><%=arr_qdto.get(i).getQna_subject() %></td>
		</tr>
<%
	}
%>
	</table>