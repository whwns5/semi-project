<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="java.util.*" %>

<jsp:useBean id="pdao" class="semi.adminproduct.adminproductDAO" scope="page"/>
<jsp:useBean id="pdto" class="semi.adminproduct.adminproductDTO" scope="page"/>
<jsp:setProperty property="*" name="pdto"/>
<%
 String savepath="E:/semi_project/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/semi_project/product/load";
   


try{
MultipartRequest mr=
new MultipartRequest(request,savepath,"utf-8");
	
		 
		 String smallcategory_name = mr.getParameter("smallcategory_name");
		 
		 String product_img = mr.getFilesystemName("subjectproduct_img");
		 String product_name = mr.getParameter("product_name");
		 String product_price_s = mr.getParameter("product_price");
		 if(product_price_s==null||product_price_s==""){
			 product_price_s="0";
		 }
		 int product_price=Integer.parseInt(product_price_s);
		 
		 String product_num_s = mr.getParameter("product_num");
		 
		if(product_num_s==null||product_num_s==""){
			product_num_s="0";
		}
		 int product_num=Integer.parseInt(product_num_s);
		
		
		 int result=pdao.adminproductWrite(smallcategory_id, product_name, product_code, product_color, product_size, product_num, product_price, product_content, product_img, product_imgcount);
		String msg=result>=0?"등록완료":"등록실패";
%>
    <script>
    window.alert('파일 업로드 성공');
	window.alert('<%=msg%>');
	location.href='eventList.jsp';
    </script>
    <%
}catch(Exception e){
	%>
	<script>
	window.alert('업로드 실패');
	</script>
	<%
}
%>
