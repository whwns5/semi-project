/**
 * 
 */
function getXMLHttpRequest() {// XMLHttpRequest 객체 얻기
	
	if (window.XMLHttpRequest) { // IE 이외의 브라우저(Firefox, Chrome, Opera, Safari 등)
		return new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP"); // IE 상위 버젼
		} catch(e) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");// IE 하위 버젼
			} catch(e1) { 
				return null; 
			}
		}
	} else {
		return null;
	}
}
function sendRequest(url, params, callback, method) {
	var httpRequest = getXMLHttpRequest(); // XMLHttpRequest 객체 얻기
	var httpMethod = method ? method : 'GET'; // 넘어온 method 가 없으면 기본값으로 GET
	if (httpMethod != 'GET' && httpMethod != 'POST') { // 이외의 문자열도 GET
		httpMethod = 'GET';
	}
	var httpParams = (params == null || params == '') ? null : params; // parms 셋팅
	var httpUrl = url;
	if (httpMethod == 'GET' && httpParams != null) { // GET 방식일 경우 URL에 추가적으로 파라미터를 삽입해 준다.
		httpUrl = httpUrl + "?" + httpParams;
	}
	httpRequest.open(httpMethod, httpUrl, true); // 연결 (POST 또는 GET)
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // POST 방식일 때 등록
	httpRequest.onreadystatechange = callback(httpRequest); // 콜백 함수 등록
	httpRequest.send(httpMethod == 'POST' ? httpParams : null); // POST 방식일 경우 파라미터값을 인자로, GET방식일 경우 NULL로
}