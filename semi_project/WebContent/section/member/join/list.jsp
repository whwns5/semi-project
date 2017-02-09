 
<%@page import="semi.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="jdto" class="semi.member.MemberDTO"/>
<jsp:setProperty property="*" name="jdto"/>
<jsp:useBean id="jdao" class="semi.member.MemberDAO"/>
<link rel="stylesheet" type="text/css" href="/semi_project/css/member/list/list.css?ver=3">
<link rel="stylesheet" type="text/css" href="/semi_project/css/commonButton.css?ver=3">

<style>
div.containerBody {
    width: 1100px;
    margin: 0 auto;
    text-align: left;
    position: relative;
	border: 2px;
	border: 1px solid silver;
}
h3{
    color: #333;
    margin-bottom: 50px;
    margin-top: 50px;
    background: url(../img/icon/h3_ico.gif) no-repeat;
    text-indent: 42px;
    
}
table.th_left th {
    background-color: #f7f7f7;
    border-bottom: 2px solid #ddd;
    font-weight: lighter;
    padding-left: 10px;
    text-align: left;
    min-height: 38px;
    color: #666;
    height: 30px;
    cellpacing: 0px;
}
table.th_left{
 margin-left: 50px;
}
table.th_left td input[type="text"], table.th_left td select, table.th_left td textarea {
    border: 1px solid #c5c5c5;
    border-right-color: #e2e6e5;
    border-bottom-color: #e2e6e5;
    color: #686868;
    font: 12px "Dotum","돋움";
    width: 300px;
}
table.th_left td input[type="text"] {
    padding: 0 0 0 5px;
    line-height: 23px;
    background-color: #fbfbfb;
}
table.th_left td input[type="password"] {
    border: 1px solid #c5c5c5;
    border-right-color: #e2e6e5;
    border-bottom-color: #e2e6e5;
    color: #686868;
    font: 12px "Dotum","돋움";
    height: 22px;
    padding: 0 0 0 5px;
    line-height: 23px;
    background-color: #fbfbfb;
    width: 300px;
}
.ta_c {
    text-align: center !important;
}
.mt_40 {
    margin-top: 40px !important;
}
div.table_wrap_button a {
    margin: 0px auto;
    color: #e8380d;
    margin-top: 50px;
    margin-bottom: 60px;
}
a.common-bt {
    display: block;
    color: #e8380d;
    width: 150px;
    height: 20px;
    border: 2px solid #e8380d;
    padding: 14px 15px;
    text-align: center;
    transition: all 0.3s;
    font-family: 'Lato', sans-serif;
}
</style>


<div class="containerBody">
<script>
function memberUpdate(){
 var member_pwd_bf = document.name.member_pwd_bf.value;
 var member_pwdInput = document.name.member_pwd_bf1.value;
 var member_pwdInput1 = document.name.member_pwd.value;
 var member_pwdInput2= document.name.member_pwdCheck.value;
 
 
 if(member_pwdInput == member_pwd_bf){
  if(member_pwdInput1 != '' || member_pwdInput2 != ''){
   if(member_pwdInput1 == member_pwdInput2){
    
   }else{
    window.alert('새로운 비밀번호가 일치하지 않습니다.');
    return;
   }
  }
 }else{
  window.alert('이전 비밀번호가 올바르지 않습니다.');
  return;
 }
 
 if(document.name.member_pwd.value == "") {
  document.name.member_pwd.value = document.name.member_pwd_bf.value;
 }
 document.name.submit();
}
</script>
 <h3>회원 정보수정</h3>
 <%
 String member_name_update = "";
 String member_pwd_update = "";
 String member_sex_update = "";
 String member_addr_update = "";
 String member_tel_update = "";
 String member_email_update = "";
 
 String member_id_update = (String)session.getAttribute("session_member_id");

 jdao.userInfo(member_id_update);
 MemberDTO[] dto = jdao.userInfo(member_id_update);
 if(dto.length == 1) {
  for(int i=0;i<dto.length;i++){
	  member_name_update = dto[i].getMember_name();
	  member_pwd_update = dto[i].getMember_pwd();
	  member_sex_update = dto[i].getMember_sex();
	  member_addr_update = dto[i].getMember_addr();
	  member_tel_update = dto[i].getMember_tel();
	  member_email_update = dto[i].getMember_email();
  }
 }
%>
  <div class="table_wrap mt_30">
  <form name="name" action="/semi_project/section/member/join/change.jsp" method="post">
  <input type="hidden" name="member_pwd_bf" value="<%=member_pwd_update%>">
  <table class="th_left">
   <tbody>
    <tr>
     <th>*아이디</th>
     <td><input type="text" name="member_id" value="<%=member_id_update%>" readonly></td>
    </tr>
    <tr>
     <th>이름</th>
     <td><input type="text" name="member_name" value="<%=member_name_update%>"></td>
    </tr>
    <tr>
     <th>*이전비밀번호</th>
     <td><input type="password" name="member_pwd_bf1" size="20" required="required"></td>
    </tr>
    <tr>
     <th>새로운 비밀번호</th>
     <td><input type="password" name="member_pwd" size="20" required="required"></td>
    </tr>
    <tr>
     <th>새로운 비밀번호 확인</th>
     <td><input type="password" name="member_pwdCheck" size="20" required="required">&nbsp;&nbsp;새로운 비밀번호를 한번 더 입력해주세요.</td>
    </tr>
    <tr>
     <th>성별</th>
     <td><input type="text" name="member_sex" value="<%=member_sex_update %>" readonly></td>
    </tr>
    <tr>
     <th>주소</th>
     <td><input type="text" name="member_addr" value="<%=member_addr_update %>" required="required"></td>
    </tr>
    <tr>
     <th>핸드폰 번호</th>
     <td><input type="text" name="member_tel" value="<%=member_tel_update %>" size="20" required="required"></td>
    </tr>
    <tr>
     <th>E-MAIL</th>
     <td><input type="text" name="member_email" value="<%=member_email_update %>" required="required"></td>
    </tr>
   </tbody>
  </table>
 </form>
  <div class="table_wrap_button">
    <p align="center"><a class="common-bt" href="javascript:memberUpdate();">정보수정</a></p>
  </div>
</div>
</div>