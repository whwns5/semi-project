<%@page import="semi.qna.QnaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdao" class="semi.qna.QnaDAO"/>
<%
	ArrayList<QnaDTO> arr_qdto = null;
	arr_qdto = qdao.qnaList();
	
	//{"employee":[ {"firstName":"김","lastName":"차사"} , {"firstName":"김이","lastName":"차사"} ]}
	String jsonStr = "";
	
	if(arr_qdto != null){
		jsonStr += "{\"QnaDTO\":[";
		for(int i = 0 ; i < arr_qdto.size() ; i++){
			jsonStr += "{";
			jsonStr += "\"qna_idx\":\"" + arr_qdto.get(i).getQna_idx() + "\"" + ",";
			jsonStr += "\"product_idx\":\"" + arr_qdto.get(i).getProduct_idx() + "\"";
			jsonStr += "}";
		}
		
	}

%>