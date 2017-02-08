<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="paydao" class="semi.pay.PayDAO" scope="session"/>
<%
String member_id=(String)session.getAttribute("session_member_id");
String payment_idxs=request.getParameter("payment_idx");
int payment_idx=Integer.parseInt(payment_idxs);
String payment_date=request.getParameter("payment_date");

int result = paydao.checkRefundTime(member_id, payment_idx, payment_date);
System.out.println("--------------------------------------------------result="+result);
if(result>29){
	%>
	<script>
	window.alert('30일이 지난 상품은 환불을 받으실 수 없습니다.'+'\n'+'고객센터로 연락: 1588-1588');
	location.href="../member/mypage.jsp";
	</script>
	<%
	return;
}else{
	%>
	<script>
	window.open('mypageCancel.jsp?payment_idx=<%=payment_idx%>','cancel','width=540, height=600, top=100, left=100');	
	location.href="../member/mypage.jsp";
	</script>
	<%
}

%>