<%@page import="semi.qna.QnaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="qdao" class="semi.qna.QnaDAO"/>
<%
	String product_idx_s = request.getParameter("product_idx");
	int product_idx = 23;
	if(product_idx_s != null){
		product_idx = Integer.parseInt(product_idx_s);
	}
	
	String qnaCp_s = request.getParameter("qnaCp");
	int qnaCp = 1;
	if(qnaCp_s != null){
		qnaCp = Integer.parseInt(qnaCp_s);
	}
	
	String qnaListSize_s = request.getParameter("qnaListSize");
	int qnaListSize = 10;
	if(qnaCp_s != null){
		qnaListSize = Integer.parseInt(qnaListSize_s);
	}
	
	ArrayList<QnaDTO> arr_qdto = null;
	arr_qdto = qdao.qnaList(product_idx, qnaCp, qnaListSize);
	
	//{"employee":[ {"firstName":"김","lastName":"차사"} , {"firstName":"김이","lastName":"차사"} ]}
	String jsonStr = "";
	
	if(arr_qdto != null){
		jsonStr += "{\"QnaDTO\":[";
		for(int i = 0 ; i < arr_qdto.size() ; i++){
			jsonStr += "{";
			jsonStr += "\"qna_idx\":\"" + arr_qdto.get(i).getQna_idx() + "\"" + ",";
			jsonStr += "\"product_idx\":\"" + arr_qdto.get(i).getProduct_idx() + "\"" + ",";
			jsonStr += "\"member_id\":\"" + arr_qdto.get(i).getMember_id() + "\"" + ",";
			jsonStr += "\"qna_subject\":\"" + arr_qdto.get(i).getQna_subject() + "\"" + ",";
			jsonStr += "\"qna_content\":\"" + arr_qdto.get(i).getQna_content() + "\"" + ",";
			jsonStr += "\"qna_regdate\":\"" + arr_qdto.get(i).getQna_regdate() + "\"" + ",";
			jsonStr += "\"qna_ref\":\"" + arr_qdto.get(i).getQna_ref() + "\"" + ",";
			jsonStr += "\"qna_lev\":\"" + arr_qdto.get(i).getQna_lev() + "\"" + ",";
			jsonStr += "\"qna_sunbun\":\"" + arr_qdto.get(i).getQna_sunbun() + "\"";
			jsonStr += "}";
			
			if( i < arr_qdto.size()-1 ){
				jsonStr += ",";
			}
		}
		jsonStr += "]}";
	}
%>
<%=jsonStr%>