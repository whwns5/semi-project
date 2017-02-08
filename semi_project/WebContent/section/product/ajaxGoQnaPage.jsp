<%@page import="semi.qna.QnaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdao" class="semi.qna.QnaDAO" scope="session"/>
<%
	String product_idx_s = request.getParameter("product_idx");
	int product_idx = 23;
	if(product_idx_s != null){
		product_idx = Integer.parseInt(product_idx_s);
	}
	
	int qnaTotalCnt = qdao.getQnaTotalCnt(product_idx); // 전페이지 에서 넘어온 product_idx 를 이용하여 qna테이블 검색
	String qnaListSize_s = request.getParameter("qnaListSize");
	int qnaListSize = 10; // 보여줄 리스트 수
	if(qnaListSize_s != null){
		qnaListSize = Integer.parseInt(qnaListSize_s);
	}
	int qnaPageSize = 5; // 보여줄 페이지 수
	
	String qnaCp_s = request.getParameter("qnaCp");
	int qnaCp = 1;
	if(qnaCp_s != null){
		qnaCp = Integer.parseInt(qnaCp_s);
	}
	
	int qnaTotalPage = qnaTotalCnt/qnaListSize + 1; // 총 페이지 수
	if(qnaTotalCnt % qnaListSize == 0)qnaTotalPage--;
	
	int qnaUserGroup = qnaCp / qnaPageSize; // 해당 페이지의 페이지 그룹
	if(qnaCp % qnaPageSize == 0)qnaUserGroup--;  
	
	ArrayList<QnaDTO> arr_qdto = null;
	arr_qdto = qdao.qnaList(product_idx, qnaCp, qnaListSize);
%>
<table>
	<colgroup><col style="width:100px"><col style="width:auto"><col style="width:100px"></colgroup>
	<tbody>
	<%
		if(arr_qdto.size() == 0){
	%>	
			<tr>
				<td colspan="3" class="nothing">등록된 질문이 없습니다.</td>
			</tr>
	<%	
		} else {
			for(int i = 0 ; i < arr_qdto.size() ; i++){			
	%>
			<tr>
				<td class="qna_date"><%=arr_qdto.get(i).getQna_regdate()%></td>
				<td class="qna_subject">
	<%
					for(int z = 0 ; z < arr_qdto.get(i).getQna_lev() ; z++){
						out.println("&nbsp;"); // lev 만큼 간격을 띠워준다. (답글)
					}
					if(arr_qdto.get(i).getQna_lev() != 0){
	%>
						<img src="/semi_project/img/icon/ioc_reply.gif">
	<%
					}
	%>
					<a href="javascript:showContent(<%=i%>,'qna_content');"><%=arr_qdto.get(i).getQna_subject()%></a>
					<span>(<%=arr_qdto.get(i).getMember_id() %>)</span>
					<div class="qna_content">
						<%=arr_qdto.get(i).getQna_content() %>
					</div>
				</td>
	<%
				if(arr_qdto.get(i).getQna_state() == 0){ // 접수중
	%>
					<td class="progress">접수중</td>
	<%	
				} else if (arr_qdto.get(i).getQna_state() == 1) {
	%>
					<td class="point_c">답변완료</td>
	<%
				} else if (arr_qdto.get(i).getQna_state() == 2) {
	%>
					<td class="point_c"></td>
	<%
				}
	%>
			</tr>				
	<%		
			}
		}
	%>
	</tbody>
</table>
<div class="paging bottom">
	<%
		if(qnaUserGroup != 0){ // 현재 그룹이 첫 페이지 그룹이 아닌 경우
	%>
		<a href="javascript:action_ajax('/semi_project/section/product/ajaxGoQnaPage.jsp','product_idx=<%=product_idx %>&qnaCp=<%=(qnaUserGroup-1)*qnaPageSize + qnaPageSize%>&qnaListSize=<%=qnaListSize%>', 'POST', 'QNA_SELECT_ALL');">이전</a>
	<%
		} else {
	%>
		
	<%
		}
						
		for(int i = (qnaUserGroup * qnaPageSize) + 1 ; i <= (qnaUserGroup * qnaPageSize) + qnaPageSize ; i++){
	%>
		<a class="num <%= i==qnaCp ? "on" : "" %>" href="javascript:action_ajax('/semi_project/section/product/ajaxGoQnaPage.jsp','product_idx=<%=product_idx %>&qnaCp=<%=i%>&qnaListSize=<%=qnaListSize%>', 'POST', 'QNA_SELECT_ALL');">
			<font class="<%= i==qnaCp ? "choiceprlist" : "prlist" %>"><%= i==qnaCp? "<b>"+i+"</b>" : i %></font>
		</a>
	<%
			if(i == qnaTotalPage)break;
		}
						
		if(qnaUserGroup != (qnaTotalPage / qnaPageSize) - (qnaTotalPage % qnaPageSize == 0 ? 1 : 0)){ // 현재 그룹이 마지막 페이지가 해당하는 그룹에 해당되지 않는 경우
	%>
		<a href="javascript:action_ajax('/semi_project/section/product/ajaxGoQnaPage.jsp','product_idx=<%=product_idx %>&qnaCp=<%=((qnaUserGroup+1)*qnaPageSize) + 1%>&qnaListSize=<%=qnaListSize%>', 'POST', 'QNA_SELECT_ALL');">다음</a>
	<%
		} else {
	%>
		
	<%
		}
	%>
	<a class="common-bt bt_write" href="javascript:openQnaLayer();">문의 작성</a>
</div>

	
