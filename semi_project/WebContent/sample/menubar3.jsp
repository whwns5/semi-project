<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial;
	height: 2000px;
}
/* 
.header {
	width: 600px;
	height: 56px;
	position: absolute;
	top: 0px;
	left: 25%;
	background: #fff url(title.png) no-repeat top left;
}
 */
 /*
a.back {
	width: 256px;
	height: 73px;
	position: fixed;
	bottom: 15px;
	right: 15px;
	background: #fff url(codrops_back.png) no-repeat top left;
}
*/
/* 
.scroll {
	width: 133px;
	height: 61px;
	position: fixed;
	bottom: 15px;
	left: 150px;
	background: #fff url(scroll.png) no-repeat top left;
}
 */


ul#navigation {
    position: fixed;
    margin: 0px;
    padding: 0px;
    top: 50px;
    right: 0px;
    list-style: none;
    z-index:9999;
}
ul#navigation li {
    width: 130px;
}
ul#navigation li div{
    display: block;
  	margin-left: 94px;
    width: 130px;
    height: 50px;    
    background-color:#716d6c;
    background-repeat:no-repeat;
    background-position:center center;
    border:1px solid #AFAFAF;
    -moz-border-radius:0px 10px 10px 0px;
    -webkit-border-bottom-left-radius: 10px;
    -webkit-border-top-left-radius: 10px;
    -khtml-border-bottom-left-radius: 10px;
    -khtml-border-top-left-radius: 10px;
    /*-moz-box-shadow: 0px 4px 3px #000;
    -webkit-box-shadow: 0px 4px 3px #000;
    */
    opacity: 0.5;
    filter:progid:DXImageTransform.Microsoft.Alpha(opacity=60);
    transition:all 1s;
}
ul#navigation li div:hover{
	opacity: 1;
	margin-left: 0px;
}
ul#navigation li div a{
	display: block;
	width: 100%;
	height: 100%;
	text-decoration: none;
}
ul#navigation li div a img{
	display: block;
	float: left;
	margin-left : 5px;
	margin-right : 5px;
	margin-top : 15px;
	margin-bottom : 15px;
}
ul#navigation li div a p{
	margin: 0px;
	padding-top: 19px;
	margin-left: 50px;
	font:12px dotum; 
	color:#fff;
}

ul#navigation li:LAST-CHILD div{
	height: 500px;
}
ul#navigation li:LAST-CHILD div img{
	display: blockl;
	float: left;
	margin-left : 5px;
	margin-right : 5px;
	margin-top : 15px;
	margin-bottom : 15px;
}
ul#navigation li:LAST-CHILD div p{
	margin: 0px;
	padding-top: 19px;
	margin-left: 50px;
	font:12px dotum; 
	color:#fff;
}
</style>
</head>
<body>
<ul id="navigation">
            <li class="home"><div><a href="" title="Home"><img src="/semi_project/img/icon/icon_brand_cate.png"/><p>로그아웃</p></a></div></li>
            <li class="about"><div><a href="" title="About"><img src="/semi_project/img/icon/icon_brand_cate.png"><p>내정보보기</p></a></div></li>
            <li class="search"><div><a href="" title="Search"><img src="/semi_project/img/icon/icon_brand_cate.png"><p>포인트</p></a></div></li>
            <li class="photos"><div><a href="" title="Photos"><img src="/semi_project/img/icon/icon_brand_cate.png"><p>쿠폰</p></a></div></li>
            <li class="rssfeed"><div><a href="" title="Rss Feed"><img src="/semi_project/img/icon/icon_brand_cate.png"><p>장바구니</p></a></div></li>
            <li class="podcasts"><div><a href="" title="Podcasts"><img src="/semi_project/img/icon/icon_brand_cate.png"><p>장바구니</p></a></div></li>
            <li class="contact"><div><img src="/semi_project/img/icon/icon_brand_cate.png"><p>투데이상품</p></div></li>
        </ul>
</html>