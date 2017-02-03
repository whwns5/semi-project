<%@page import="semi.review.ReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="rdao" class="semi.review.ReviewDAO" scope="session"/>
<%
	String product_idx_s = request.getParameter("product_idx");
	int product_idx = 23;
	if(product_idx_s != null){
		product_idx = Integer.parseInt(product_idx_s);
	}
	
	int reviewTotalCnt = rdao.getReviewTotalCnt(product_idx); // 전페이지 에서 넘어온 product_idx 를 이용하여 qna테이블 검색
	String reviewListSize_s = request.getParameter("reviewListSize");
	int reviewListSize = 10; // 보여줄 리스트 수
	if(reviewListSize_s != null){
		reviewListSize = Integer.parseInt(reviewListSize_s);
	}
	int reviewPageSize = 5; // 보여줄 페이지 수
	
	String reviewCp_s = request.getParameter("reviewCp");
	int reviewCp = 1;
	if(reviewCp_s != null){
		reviewCp = Integer.parseInt(reviewCp_s);
	}
	
	int reviewTotalPage = reviewTotalCnt/reviewListSize + 1; // 총 페이지 수
	if(reviewTotalCnt % reviewListSize == 0)reviewTotalPage--;
	
	int reviewUserGroup = reviewCp / reviewPageSize; // 해당 페이지의 페이지 그룹
	if(reviewCp % reviewPageSize == 0)reviewUserGroup--;  
	
	ArrayList<ReviewDTO> arr_rdto = null;
	arr_rdto = rdao.reviewList(product_idx, reviewCp, reviewListSize);
%>
<table>
	<colgroup><col style="width:100px"><col style="width:auto"><col style="width:100px"></colgroup>
	<tbody>
	<%
		if(arr_rdto.size() == 0){
	%>	
			<tr>
				<td colspan="3" class="nothing">등록된 후기가 없습니다.</td>
			</tr>
	<%	
		} else {
			for(int i = 0 ; i < arr_rdto.size() ; i++){			
	%>
			<tr>
				<td class="review_date"><%=arr_rdto.get(i).getReview_regdate()%></td>
				<td class="review_subject">
	<%
					for(int z = 0 ; z < arr_rdto.get(i).getReview_lev() ; z++){
						out.println("&nbsp;"); // lev 만큼 간격을 띠워준다. (답글)
					}
					if(arr_rdto.get(i).getReview_lev() != 0){
	%>
						<img src="/semi_project/img/icon/ioc_reply.gif">
	<%
					}
	%>
					<a href="javascript:showContent(<%=i%>,'review_content');"><%=arr_rdto.get(i).getReview_subject()%></a>
					<span>(<%=arr_rdto.get(i).getMember_id()%>)</span>
	<%
					if( arr_rdto.get(i).getReview_img() == null || arr_rdto.get(i).getReview_img().equals("") ){
						
					} else {
	%>
						<img src="/semi_project/img/review/<%=arr_rdto.get(i).getReview_img()%>">		
	<%
					}
	%>		
					<div class="review_content">
						<%=arr_rdto.get(i).getReview_content()%>
					</div>
				</td>
				<td class="review_grade">
	<%
					for(int j = 0 ; j < arr_rdto.get(i).getReview_grade(); j++){
	%>
						★
	<% 					
					}
	%>
				</td> 
			</tr>				
	<%		
			}
		}
	%>
	</tbody>
</table>
<div class="paging bottom">
	<a class="on" href="#"><font class="choiceprlist"><b>1</b></font></a>
	<a href="#"><font class="prlist">2</font></a>
	<input class="submit-button" type="button" value="리뷰작성" onclick="openReviewLayer();">
</div>