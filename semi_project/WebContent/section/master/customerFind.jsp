<%@page import="semi.member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mdto" class="semi.member.MemberDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="mdao" class="semi.member.MemberDAO"/>
<%
	String fkey = request.getParameter("fkey");
	System.out.println("fkey:"+fkey);
	String fvalue = request.getParameter("fvalue");
	System.out.println("fvalue:"+fvalue);
	ArrayList<MemberDTO> arry_mdto = null;
	if(fvalue != null){ 
		arry_mdto = mdao.memberFind(fkey,fvalue);
	} else { 
		arry_mdto = mdao.MemberList();
	}
	System.out.println("arry_mdto1:"+arry_mdto);
%>
<script>

 function submitUpdate(fm_id) { 
	 var fm = document.getElementById(fm_id);
	 fm.setAttribute('action', '/semi_project/section/master/empUpdate.jsp');
	 fm.submit(); 
}
function submitDelete(fm_id){
	var fm = document.getElementById(fm_id);
	fm.setAttribute('action', '/semi_project/section/master/empDelete_ok.jsp');
	fm.submit();
}
function goProductFind() {
	var fkey = document.getElementById('fkey').value;
	var fvalue = document.getElementById('fvalue').value;
	location.href = '/semi_project/section/member/adminPage.jsp?menu=member&fkey=' + fkey + '&fvalue=' + fvalue;
}

</script>
<div class="content_wrap">
	<h3 class="mypage_tit">고객 관리</h3>
	
	<fieldset>
		<select id="fkey">
			<option value="member_id">아이디</option>
			<option value="member_name">이름</option>
			<option value="member_tel">전화번호</option>
			<option value="member_addr">주소</option>
		</select> 
		<input type="text" id="fvalue">
		<input type="button" value="검색" onclick="goProductFind();">
	</fieldset>
				
	<table cellspacing="0" cellpadding="0" summary="" class="table_style">
		<colgroup>
			<col width="8%">
			<col width="20%">
			<col width="*">
			<col width="14%">
			<col width="10%">
			<col width="10%">
		</colgroup>
		<thead>
			<tr>
				<th class="first">회원번호</th>
				<th>아이디</th>
				<th>이름&nbsp;pwd&nbsp;email&nbsp;전화번호</th>
				<th>성별</th>
				<th>주소</th>
				<th>수정&nbsp;삭제</th>
			</tr>
		</thead>
		<tbody>
<%
			if (arry_mdto.size() != 0) {
%>
			
<%
			for(int i = 0 ; i < arry_mdto.size(); i++){
%>
				<tr>
					<td>
						<form id="fm_<%=i%>" method="post">
						<%=arry_mdto.get(i).getMember_idx()%>
						<input type="hidden" value="<%=arry_mdto.get(i).getMember_idx()%>" name="Member_idx">
						
						</form>
					</td>
					<td><%=arry_mdto.get(i).getMember_id()%></td>
					<td><%=arry_mdto.get(i).getMember_name()%>_<%=arry_mdto.get(i).getMember_pwd()%>_<%=arry_mdto.get(i).getMember_email()%>_<%=arry_mdto.get(i).getMember_tel()%></td>
					<td><%=arry_mdto.get(i).getMember_sex()%></td>
					<td><%=arry_mdto.get(i).getMember_addr()%></td>
					<td>
						<input type="button" value="수정" onclick="submitUpdate('fm_<%=i%>');">
						<input type="button" value="삭제" onclick="submitDelete('fm_<%=i%>');">
					</td>	
				</tr>
<%			
			}
%>
			
<%			
		} else {
%>
			<tr>
				<td colspan="6" align="center">데이터가 없습니다.</td>
			</tr>
<%			
		}
%>	
		</tbody>
	</table>
</div>
			
			
