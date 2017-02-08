<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="pdto" class="semi.adminproduct.adminproductDTO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Insert title here</title>

</head>
<%
	request.setCharacterEncoding("utf-8");
%>
<body>
	<section>
		<article>
			<h2>상 품 검 색</h2>
			<hr>
			<form name="productFind" method="post">
				<fieldset>
					<select name="fkey">
						<option value="product_idx">상품순서</option>
						<option value="smallcategory_id">카테고리ID</option>
						<option value="product_name">상품이름</option>
					</select> 
					<input type="text" name="fvalue">
					<input type="submit" value="검색">
				</fieldset>
			</form>
			<hr>
			<div>
			<%
				if(request.getMethod().equals("GET")){
			%>
					위 검색란에 검색어를 입력해주세요
			<% 
				}else{
			%>
					<jsp:include page="result.jsp" />
			<%
				}
			%>
			</div>
		</article>
	</section>
</body>
</html>