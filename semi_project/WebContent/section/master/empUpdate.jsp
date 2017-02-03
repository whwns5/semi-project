<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="semi.member.*"%>
<jsp:useBean id="bdto" class="semi.member.MemberDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="mdao" class="semi.member.MemberDAO"/>

<%
	request.setCharacterEncoding("utf-8");
	ArrayList<MemberDTO> arr = mdao.memberFind("member_id", bdto.getMember_id());
	System.out.println(arr);


%>


