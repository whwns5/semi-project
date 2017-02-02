/**
 * 
 */
function getXMLHttpRequest() {// XMLHttpRequest 객체 얻기
    if (window.ActiveXObject) {
        try {
            return new ActiveXObject("Msxml2.XMLHTTP");//IE 상위 버젼
        } catch (e1) {
            try {
                return new ActiveXObject("Microsoft.XMLHTTP");//IE 하위 버젼
            } catch (e2) {
                return null;
            }
        }
    } else if (window.XMLHttpRequest) {
        return new XMLHttpRequest();//IE 이외의 브라우저(Firefox, Chrome, Opera, Safari 등)
    } else {
        return null;
    }
}