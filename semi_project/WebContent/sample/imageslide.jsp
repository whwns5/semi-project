<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<TITLE>초간단 이미지 슬라이더 회전 </TITLE>
<style>
#photo_layer{
	height:78px; 
	position:absolute; 
	left:1px; 
	top:0px; 
	z-index:1;
}
</style>
<script>
var step = -1, stime = 10, wtime = 1000, ep;
var sleep = stime, cell = 94, total = 3, width = cell * total;
function do_stop(){
clearTimeout(ep);
}
function do_move(){
var obj = photo_layer.style;
obj.pixelLeft = (obj.pixelLeft + step) % width;
if (obj.pixelLeft % cell == 1) sleep = wtime;
ep = setTimeout("do_move()",sleep);
sleep = stime;
}
</script>
</head>
<body onload="do_move();">
<div onmouseout="do_move()" onmouseover="do_stop()">
<div id="photo_layer">
<table height="78" cellspacing="0" cellpadding="0" id="table7">
<tr valign="top" height=78 bgcolor="#cccccc">
<td width=98 height="78"><a href="#"><IMG src="/semi_project/img/icon/cart_icon.png" border="0"></a></td>
<td width=98 height="78"><a href="#"><IMG src="/semi_project/img/icon/cart_icon.png" border="0"></a></td>
<td width=98 height="78"><a href="#"><IMG src="/semi_project/img/icon/cart_icon.png" border="0"></a></td>
<td width=98 height="78"><a href="#"><IMG src="/semi_project/img/icon/cart_icon.png" border="0"></a></td>
<td width=98 height="78"><a href="#"><IMG src="/semi_project/img/icon/cart_icon.png" border="0"></a></td>
<td width=98 height="78"><a href="#"><IMG src="/semi_project/img/icon/cart_icon.png" border="0"></a></td>
</tr>
</table>
</div>
</div>
</body>
</html>