<%@page import="semi.member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="mdto" class="semi.member.MemberDTO"/>
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
	location.href = '/semi_project/section/member/adminPage.jsp?menu=member_list&fkey=' + fkey + '&fvalue=' + fvalue;
}

</script>
<style>
table.th_top {
	width: 100%;
	border-spacing: 0
}
table.th_top th {
	border-top: 1px solid #76787E;
	border-bottom: 1px solid #ddd;
	font-size: 12px;
	color: #666;
	padding: 10px 0px;
	font-weight: lighter;
	text-align: center;
	background-color: #fafafa
}
table.th_top td {
	text-align: center;
	color: #666;
	padding: 0px 0px;
	font-size: 12px;
	border-bottom: 1px solid #ddd
}
.admin_bt_area{	
	margin: 0px auto;
	padding:2px;
	
}
.admin_bt_area a{
	display: inline-block;		
	width: 50px;
}
</style>
<div class="content_wrap">
	<h3 class="mypage_tit">고객 관리</h3>

	<select id="fkey">
			<option value="member_id">아이디</option>
			<option value="member_name">이름</option>
			<option value="member_tel">전화번호</option>
			<option value="member_addr">주소</option>
		</select> 
	<div class="div_search">
		<input type="text" id="fvalue">
		<a href="javascript:goProductFind();" class="a_search" title="검색"></a>
	</div>
				
	<table cellspacing="0" cellpadding="0" summary="" class="th_top">
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
System.out.println("test223="+arry_mdto.size());
			if (arry_mdto.size() != 0) {
%>
			
<%
			for(int i = 0 ; i < arry_mdto.size(); i++){
%>
				<tr>
					<td>
						<form id="fm_<%=i%>" method="post">
						<%=arry_mdto.get(i).getMember_idx()%>
						<input type="hidden" value="<%=arry_mdto.get(i).getMember_idx()%>" name="member_idx">
						
						</form>
					</td>
					<td><%=arry_mdto.get(i).getMember_id()%></td>
					<td><%=arry_mdto.get(i).getMember_name()%>_<%=arry_mdto.get(i).getMember_pwd()%>_<%=arry_mdto.get(i).getMember_email()%>_<%=arry_mdto.get(i).getMember_tel()%></td>
					<td><%=arry_mdto.get(i).getMember_sex()%></td>
					<td><%=arry_mdto.get(i).getMember_addr()%></td>
					<td><div class="admin_bt_area">
						<a class="common-bt bt_writereply" href="javascript:submitDelete('fm_<%=i%>');">DELETE</a>
						</div>
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
			
			
