<%@page import="semi.cart.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/semi_project/css/header/header.css?ver=9">
<link href='http://fonts.googleapis.com/css?family=Vidaloka' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="/semi_project/css/header/logo.css?ver=8">
<script type="text/javascript" src="/semi_project/js/bookmark.js?ver=4"></script>
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
<%
	String session_member_id = (String)session.getAttribute("session_member_id"); // 로그인 정보를 받아온다.
	String session_member_name = (String)session.getAttribute("session_member_name");
	String session_member_type = (String)session.getAttribute("session_member_type");
	/* String cartNums=(String)session.getAttribute("cart");
	int cartN=0;
	if(cartNums==null || cartNums.equals("")){
		cartN=0;
	}else{
	cartN=Integer.parseInt(cartNums);
	} */
%>
<header>
	<div id="gnb">
		<div class="gnb_container">
			<div class="div_util">
				<div class="container_util">
					<a href="javascript:bookmarksite('KH쇼핑몰','http://localhost:9090/semi_project');" class="btn_favorite">즐겨찾기추가</a>
					<ul class="nav_util">
					<%	
						if(session_member_id == null){ // 비로그인 상태
					%>
							<li><a href="/semi_project/section/member/login/login.jsp">LOGIN</a></li>
							<li><a href="/semi_project/section/member/join/join.jsp">JOIN US</a></li>	
							
					<%									
						} else { // 로그인 상태
					%>
							<li><a href="#"><%=session_member_name %>님 환영합니다.</a></li>
					<%
							if(session_member_type.equals("관리자")){
					%>
								<li><a href="/semi_project/section/member/adminPage.jsp">관리자모드</a></li>
					<%	
							}
					%>
							<li><a href="/semi_project/section/member/logout/logout_ok.jsp">LOGOUT</a></li>
							<!-- <li><a href="#">CART</a></li>				
							<li><a href="#">ORDER</a></li>
							<li><a href="#">EVENT</a></li>
							<li><a href="#">MYPAGE</a></li> -->
					<%
						}
					%>
					</ul>
				</div>
			</div>
			<div class="div_logo">
				<h1 class="logo_h1"><span class="maintitle">KH-SHOP</span><span class="description">Fun shopping for tomorrow</span></h1>
				<script>
				function goSearch() {
					var searchStr = document.getElementById('id_search_input').value;
					if(searchStr == ''){
						window.alert('검색 값을 입력하세요.');
						return;
					}
					location.href = '/semi_project/section/product/productByItemList.jsp?searchStr='+searchStr;
					
				}
				</script>
				<div class="div_search">
					<input type="text" name="search" id="id_search_input">
					<a href="javascript:goSearch();" class="a_search" title="검색"></a>
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
					<script>
					function goMyPage() {
						var session_member_id = <%=session_member_id == null ? null : "'" + session_member_id + "'"%>;
						if(session_member_id == null){
							window.alert('로그인 후 사용 가능합니다.');
							return;
						}
						location.href = '/semi_project/section/member/mypage.jsp';
					}
					
					function goMyCart() {
						var session_member_id = <%=session_member_id == null ? null : "'" + session_member_id + "'"%>;
						if(session_member_id == null){
							window.alert('로그인 후 사용 가능합니다.');
							return;
						}
						location.href = '/semi_project/section/cart/cartShow.jsp';
					}
					</script>
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
							
							<li><a class="a_largecategory" href="javascript:goMyPage();">MYPAGE</a></li>
							<li><a class="a_largecategory" href="javascript:goMyCart();">CART</a></li>
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
								<li><a href="/semi_project/section/product/productByItemList.jsp?lcid=accessory&scid=keyring" 
								onmouseover="changeDiv('back_nav_depth_menu_accessory_img','nav_depth_menu_backpack')" 
								onmouseout="resetDiv('back_nav_depth_menu_accessory_img')">KEY RING</a></li>
							</ul>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</header>











