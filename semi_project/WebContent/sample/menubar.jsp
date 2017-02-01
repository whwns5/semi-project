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
    top: 100px;
    right: 0px;
    list-style: none;
    z-index:9999;
}
ul#navigation li {
    width: 100px;
}
ul#navigation li a {
    display: block;
  	margin-left: 80px;
    width: 100px;
    height: 70px;    
    background-color:#CFCFCF;
    background-repeat:no-repeat;
    background-position:center center;
    border:1px solid #AFAFAF;
    -moz-border-radius:0px 10px 10px 0px;
    -webkit-border-bottom-right-radius: 10px;
    -webkit-border-top-right-radius: 10px;
    -khtml-border-bottom-right-radius: 10px;
    -khtml-border-top-right-radius: 10px;
    /*-moz-box-shadow: 0px 4px 3px #000;
    -webkit-box-shadow: 0px 4px 3px #000;
    */
    opacity: 0.6;
    filter:progid:DXImageTransform.Microsoft.Alpha(opacity=60);
    transition:all 1s;
}
ul#navigation li a:hover{
	margin-left: 5px;
}

</style>
<script type="text/javascript">
	document.getElementById('1').set
</script>
</head>
<body>
		<div class="header"></div>
        <div class="scroll"></div>
        <ul id="navigation">
            <li class="home"><a href="" title="Home"></a></li>
            <li class="about"><a href="" title="About"></a></li>
            <li class="search"><a href="" title="Search"></a></li>
            <li class="photos"><a href="" title="Photos"></a></li>
            <li class="rssfeed"><a href="" title="Rss Feed"></a></li>
            <li class="podcasts"><a href="" title="Podcasts"></a></li>
            <li class="contact"><a href="" title="Contact"></a></li>
        </ul>
</body>
</html>