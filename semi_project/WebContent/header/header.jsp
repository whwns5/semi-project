<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/semi_project/css/header/header.css?ver=4">
<link rel="stylesheet" type="text/css" href="/semi_project/css/header/dropdownmenu.css?ver=3">
<script>
var timeout	= 500;
var closetimer	= 0;
var ddmenuitem	= 0;

// open hidden layer
function mopen(id)
{	
	// cancel close timer
	mcancelclosetime();

	// close old layer
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';

	// get new layer and show it
	ddmenuitem = document.getElementById(id);
	ddmenuitem.style.visibility = 'visible';

}
// close showed layer
function mclose()
{
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
}

// go close timer
function mclosetime()
{
	closetimer = window.setTimeout(mclose, timeout);
}

// cancel close timer
function mcancelclosetime()
{
	if(closetimer)
	{
		window.clearTimeout(closetimer);
		closetimer = null;
	}
}

// close layer when click-out
document.onclick = mclose; 

</script>
<header>
	<p><a href="/semi_project/section/member/login/login.jsp">LOGIN</a> | <a href="/semi_project/section/member/join/join.jsp">JOIN US</a> | <a href="#">CART</a> | <a href="#">MYPAGE</a></p>
	<h1>KH SHOPPING MALL</h1>
	<div class="nav_container">
		<nav>
			<ul class="nav_menu" id="sddm">
				<li><a class="a_largecategory" href="/semi_project/section/home.jsp"><p>HOME</p></a></li>
				<li><a class="a_largecategory" href="#"
					onmouseover="mopen('m1')" 
					onmouseout="mclosetime()" ><p>BAGS</p></a>
					<div id="m1" 
            			onmouseover="mcancelclosetime()" 
            			onmouseout="mclosetime()">
        				<a href="#"><p>BACK PACK</p></a>
        				<a href="#"><p>MINI BAG</p></a>
        				<a href="#"><p>CROSS BAG</p></a>
        				<a href="#"><p>SHOULDER BAG</p></a>
        				<a href="#"><p>TOTE BAG</p></a>
        				<a href="#"><p>CLUTCH BAG</p></a>
        			</div>
				</li>
				<li><a class="a_largecategory" href="#"
					onmouseover="mopen('m2')" 
					onmouseout="mclosetime()" ><p>WALLETS</p></a>
					<div id="m2" 
            			onmouseover="mcancelclosetime()" 
            			onmouseout="mclosetime()">
        				<a href="#"><p>LONG WALLET</p></a>
        				<a href="#"><p>MIDIUM WALLET</p></a>
        				<a href="#"><p>HARF WALLET</p></a>
        				<a href="#"><p>CARD CASE</p></a>
        				<a href="#"><p>TOTE BAG</p></a>
        			</div>
				</li>
				<li><a class="a_largecategory" href="#"
					onmouseover="mopen('m3')" 
					onmouseout="mclosetime()" ><p>ACCESSORY</p></a>
					<div id="m3" 
            			onmouseover="mcancelclosetime()" 
            			onmouseout="mclosetime()">
        				<a href="#"><p>KEYRING</p></a>
        			</div>
				</li>
				<li><a class="a_largecategory" href="#"><p>MYPAGE</p></a></li>
				<li><a class="a_largecategory" href="#"><p>CART</p></a></li>
			</ul>
		</nav>
	</div>
	<hr>
</header>











