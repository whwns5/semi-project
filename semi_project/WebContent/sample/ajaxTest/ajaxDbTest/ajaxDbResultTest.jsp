<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="ajax.js"></script>
<script>
function makeJson() {
	var jsonObj = {}; // 최상위 오브젝트
	var qna = []; // QnaDTO 속성의 배열
	
	var info = {};
	info.qna_idx = '1'; // qna_idx
	info.product_idx = '23'; // product_idx
	info.member_id = '44'; // member_id
	info.qna_subject = '테스트제목'; // qna_subject
	info.qna_content = '테스트해봅니다.'; // qna_content
	info.qna_regdate = '2017-01-01'; // qna_regdate
	info.qna_ref = '0'; // qna_ref
	info.qna_lev = '0'; // qna_lev
	info.qna_sunbun = '0'; // qna_sunbun
	
	qna.push(info);
	
	jsonObj.QnaDTO = qna;
	
	var resultJsonMsg = JSON.stringify(jsonObj);
	document.body.innerHTML = resultJsonMsg;
}
</script>

</head>
<body onload="makeJson();">

</body>
</html>