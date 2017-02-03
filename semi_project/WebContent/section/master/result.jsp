<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="semi.member.*"%>
<jsp:useBean id="bdto" class="semi.member.MemberDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="mdao" class="semi.member.MemberDAO"/>


<%
	request.setCharacterEncoding("utf-8");
	String fkey = request.getParameter("fkey");
	String fvalue = request.getParameter("fvalue");

	ArrayList<MemberDTO> arr =mdao.memberFind(fkey, fvalue);
	System.out.println("--------------"+arr);
	

	String tmp = request.getParameter("member_idx");
	//ArrayList<MemberDTO> arr = mdao.memberFind(fkey, fvalue);
	System.out.println("*****************"+tmp);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">


 function check(value,member_id) {
	
	 var tmp = value;
	aa.value = 	tmp;
	var bb =document.getElementsByTagName("tbody");
	

}
 function submitUpdate() {
	 var fm = document.getElementById('fm');
	 fm.setAttribute('action', 'empUpdate.jsp');
	 fm.submit();
	 
}
 function submitDelete(){
	var fm = document.getElementById('fm');
	fm.setAttribute('action', 'empDelete_ok.jsp');
	fm.submit();
 }
</script>
<body>
	<form id="fm" method="post">
	<table border="1" cellspacing="0" width="450px" id = "table1">
	
		<thead>
			<tr>
					
				<th>회원번호</th>
				<th>ID</th>
				<th>이름</th>
				<th>pwd</th>
				<th>성별</th>
				<th>email</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody name ="tbody2">
			<%
				if (arr == null || arr.size() == 0) {
			%>
			<tr>
				<td colspan="10" align="center">검색된 회원이 아닙니다</td>
			</tr>
			<%
				} else {
					for (int i = 0; i < arr.size(); i++) {
			%>
			<tr>
				
				<td><%=arr.get(i).getMember_idx()%>	
					<input type="hidden" value="<%=arr.get(i).getMember_idx()%>" name="member_idx">
					<input type="hidden" value="<%=arr.get(i).getMember_id()%>" name="member_id">
				</td>
				<td><%=arr.get(i).getMember_id()%></td>
				<td><%=arr.get(i).getMember_name()%></td>
				<td><%=arr.get(i).getMember_pwd()%></td>
				<td><%=arr.get(i).getMember_sex()%></td>
				<td><%=arr.get(i).getMember_email()%></td>
				<td><%=arr.get(i).getMember_tel()%></td>
				<td><%=arr.get(i).getMember_addr()%></td>
				<td><input type="button" value="수정" onclick="submitUpdate();"></td>
				<td><input type="button" value="삭제" onclick="submitDelete();"></td>
			</tr>
			<%
				}
				}
			%>
			
		</tbody>
		
			
	</table>
		
	</form>
</body>
</html>
