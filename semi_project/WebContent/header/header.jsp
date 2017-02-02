<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/semi_project/css/header/header.css?ver=8">
<link rel="stylesheet" type="text/css" href="/semi_project/css/header/dropdownmenu.css?ver=4">
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
	<div id="gnb">
		<div class="gnb_container">
			<div class="div_util">
				<div class="container_util">
					<a href="#" class="btn_favorite">즐겨찾기추가</a>
					<ul class="nav_util">
						<li>	<%
						String user_name = (String)session.getAttribute("user_name");
						if ( user_name == null )
						{
						%>
						<a href="/semi_project/section/member/login/login.jsp">LOGIN</a> 
						<%
						}else{
						%>
						<%=user_name %>님 환영합니다. | <a href="/semi_project/section/member/logout/logout_ok.jsp">LOGOUT</a>
						<%
						}
						%>
						| <a href="/semi_project/section/member/join/join.jsp">JOIN US</a> | <a href="#">CART</a> | <a href="/semi_project/section/member/join/list.jsp">MYPAGE</a></li>
						<li><a href="/semi_project/section/member/join/join.jsp">JOIN US</a></li>
						<li><a href="#">CART</a></li>
						<li><a href="#">MYPAGE</a></li>
						<li><a href="#">ORDER</a></li>
						<li><a href="#">EVENT</a></li>
					</ul>
				</div>
			</div>
			<div class="div_logo">
				<h1>khSHOPseoul</h1>
				<div class="div_search">
					<input type="text" name="search" id="search">
					<a href="#" class="a_search" title="검색"></a>
				</div>
			</div>
			<script>
				var timeout	= 250;
				var closetimer	= 0;
				var ddmenuitem	= 0;
				
				// open hidden layer
				function mopen(id)
				{	
					// cancel close timer
					mcancelclosetime();
				
					// close old layer
					if(ddmenuitem){
						//ddmenuitem.style.display = 'none';
						ddmenuitem.style.visibility = 'hidden';
						ddmenuitem.style.opacity = '0';
						//ddmenuitem.style.visibility = 'hidden';
					}
				
					// get new layer and show it
					ddmenuitem = document.getElementById(id);
					//ddmenuitem.style.display = 'block';
					ddmenuitem.style.visibility = 'visible';
					ddmenuitem.style.opacity = '1';
					//ddmenuitem.style.visibility = 'visible';
				}
				// close showed layer
				function mclose()
				{
					if(ddmenuitem){
						//ddmenuitem.style.display = 'none';
						ddmenuitem.style.visibility = 'hidden';
						ddmenuitem.style.opacity = '0';
						//ddmenuitem.style.visibility = 'hidden';
					}
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
			<div class="div_nav">
				<div class="container_nav"> 
					<nav>
						<ul class="nav_menu" id="sddm">
							<li><a class="a_largecategory" href="/semi_project/section/home.jsp">HOME</a></li>
							<li><a class="a_largecategory" href="/semi_project/section/product/productByItemList.jsp?lcid=bags"
								   onmouseover="mopen('container_nav_depth_bags');"
								   onmouseout="mclosetime();">BAGS</a></li>
							
							<li><a class="a_largecategory" href="/semi_project/section/product/productByItemList.jsp?lcid=wallets"
								   onmouseover="mopen('container_nav_depth_wallets');"
								   onmouseout="mclosetime();">WALLETS</a></li>
							<li><a class="a_largecategory" href="/semi_project/section/product/productByItemList.jsp?lcid=accessory"
								   onmouseover="mopen('container_nav_depth_accessory');"
								   onmouseout="mclosetime();">ACCESSORY</a></li>
							<li><a class="a_largecategory" href="#">MYPAGE</a></li>
							<li><a class="a_largecategory" href="#">CART</a></li>
						</ul>
					</nav>
				</div>
				<script>
				function changeDiv(div_id, img){	
					container_nav_depth_ddmenuitem = document.getElementById(div_id);
					container_nav_depth_ddmenuitem.style.backgroundImage = 'url("/semi_project/img/header/' + img + '.jpg")';
					container_nav_depth_ddmenuitem.style.opacity = '1';
				}
				function resetDiv(div_id){
					container_nav_depth_ddmenuitem = document.getElementById(div_id);
					container_nav_depth_ddmenuitem.style.opacity = '0';
				}
				</script>
				<div class="container_nav_depth" id="container_nav_depth_bags" onmouseover="mcancelclosetime();" onmouseout="mclosetime();">
					<div class="nav_depth_menu">	
						<div class="back_nav_depth_menu" id="back_nav_depth_menu_bags_img">
						</div>
						<div class="content_nav_depth_menu">
							<ul class="nav_depth_menu_ul">
								<li><a href="/semi_project/section/product/productByItemList.jsp?lcid=bags&scid=backpack" 
									   onmouseover="changeDiv('back_nav_depth_menu_bags_img','nav_depth_menu_backpack')" 
									   onmouseout="resetDiv('back_nav_depth_menu_bags_img')">BACK PACK</a></li>
								<li><a href="/semi_project/section/product/productByItemList.jsp?lcid=bags&scid=minibag" 
									   onmouseover="changeDiv('back_nav_depth_menu_bags_img','nav_depth_menu_minibag')" 
									   onmouseout="resetDiv('back_nav_depth_menu_bags_img')">MINI BAG</a></li>
								<li><a href="/semi_project/section/product/productByItemList.jsp?lcid=bags&scid=crossbag" 
									   onmouseover="changeDiv('back_nav_depth_menu_bags_img','nav_depth_menu_crossbag')" 
									   onmouseout="resetDiv('back_nav_depth_menu_bags_img')">CROSS BAG</a></li>
								<li><a href="/semi_project/section/product/productByItemList.jsp?lcid=bags&scid=shoulderbag" 
									   onmouseover="changeDiv('back_nav_depth_menu_bags_img','nav_depth_menu_shoulderbag')" 
									   onmouseout="resetDiv('back_nav_depth_menu_bags_img')">SHOULDER BAG</a></li>
								<li><a href="/semi_project/section/product/productByItemList.jsp?lcid=bags&scid=totebag" 
									   onmouseover="changeDiv('back_nav_depth_menu_bags_img','nav_depth_menu_totebag')" 
									   onmouseout="resetDiv('back_nav_depth_menu_bags_img')">TOTE BAG</a></li>
								<li><a href="/semi_project/section/product/productByItemList.jsp?lcid=bags&scid=clutchbag" 
									   onmouseover="changeDiv('back_nav_depth_menu_bags_img','nav_depth_menu_clutchbag')" 
									   onmouseout="resetDiv('back_nav_depth_menu_bags_img')">CLUTCH BAG</a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="container_nav_depth" id="container_nav_depth_wallets" onmouseover="mcancelclosetime();" onmouseout="mclosetime();">
					<div class="nav_depth_menu">	
						<div class="back_nav_depth_menu" id="back_nav_depth_menu_wallets_img">
						</div>
						<div class="content_nav_depth_menu">
							<ul class="nav_depth_menu_ul">
								<li><a href="/semi_project/section/product/productByItemList.jsp?lcid=wallets&scid=longwallet" 
									   onmouseover="changeDiv('back_nav_depth_menu_wallets_img','nav_depth_menu_backpack')" 
									   onmouseout="resetDiv('back_nav_depth_menu_wallets_img')">LONG WALLET</a></li>
								<li><a href="/semi_project/section/product/productByItemList.jsp?lcid=wallets&scid=midiumwallet" 
									   onmouseover="changeDiv('back_nav_depth_menu_wallets_img','nav_depth_menu_minibag')" 
									   onmouseout="resetDiv('back_nav_depth_menu_wallets_img')">MIDIUM WALLET</a></li>
								<li><a href="/semi_project/section/product/productByItemList.jsp?lcid=wallets&scid=harfwallet" 
									   onmouseover="changeDiv('back_nav_depth_menu_wallets_img','nav_depth_menu_crossbag')" 
									   onmouseout="resetDiv('back_nav_depth_menu_wallets_img')">HARF WALLET</a></li>
								<li><a href="/semi_project/section/product/productByItemList.jsp?lcid=wallets&scid=cardcase" 
									   onmouseover="changeDiv('back_nav_depth_menu_wallets_img','nav_depth_menu_shoulderbag')" 
									   onmouseout="resetDiv('back_nav_depth_menu_wallets_img')">CARD CASE</a></li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="container_nav_depth" id="container_nav_depth_accessory" onmouseover="mcancelclosetime();" onmouseout="mclosetime();">
					<div class="nav_depth_menu">	
						<div class="back_nav_depth_menu" id="back_nav_depth_menu_accessory_img">
						</div>
						<div class="content_nav_depth_menu">
							<ul class="nav_depth_menu_ul">
								<li><a href="/semi_project/section/product/productByItemList.jsp?lcid=accessory&scid=keyring" onmouseover="changeDiv('back_nav_depth_menu_accessory_img','nav_depth_menu_backpack')" onmouseout="resetDiv('back_nav_depth_menu_accessory_img')">KEY RING</a></li>
							</ul>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<hr>
</header>











