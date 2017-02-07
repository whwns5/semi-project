<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/semi_project/css/aside/aside.css?ver=1">
<%
	if(session_member_id != null){ // 로그인 상태
%>
		<aside>
			<script>
			function showTodayLinkImg() {
				var today_link_img = document.getElementById('today_link_img');
				today_link_img.style.opacity = 1;
			}
			function closeTodayLinkImg() {
				var today_link_img = document.getElementById('today_link_img');
				today_link_img.style.opacity = 0;
			}
			</script>
			<ul id="navigation">
		       <li class="navigation_li"><div class="li_div"><a class="nav_menu_a" href="/semi_project/section/member/logout/logout_ok.jsp" title="로그아웃"><img class="nav_menu_icon" src="/semi_project/img/icon/icon_brand_cate.png"/><p>로그아웃</p></a></div></li>
		       <li class="navigation_li"><div class="li_div"><a class="nav_menu_a" href="/semi_project/section/member/mypage.jsp" title="내정보보기"><img class="nav_menu_icon" src="/semi_project/img/icon/icon_mypage.png"><p>내정보보기</p></a></div></li>
		       <li class="navigation_li"><div class="li_div"><a class="nav_menu_a" href="" title="이벤트"><img class="nav_menu_icon" src="/semi_project/img/icon/icon_event.png"><p>이벤트</p></a></div></li>
		       <li class="navigation_li"><div class="li_div"><a class="nav_menu_a" href="" title="쿠폰"><img class="nav_menu_icon" src="/semi_project/img/icon/icon_coupon.png"><p>쿠폰</p></a></div></li>
		       <li class="navigation_li"><div class="li_div"><a class="nav_menu_a" href="" title="장바구니"><img class="nav_menu_icon" src="/semi_project/img/icon/icon_cart.png"><p>장바구니</p></a></div></li>
		       <li class="navigation_li" >
		       	<div class="li_div" onmouseover="showTodayLinkImg();" onmouseout="closeTodayLinkImg();">
		       		<img class="nav_menu_icon" src="/semi_project/img/icon/icon_today.png">
		       		<p>투데이상품</p>
		       		<div class="today_div" id="today_link_img">
		       			<a class="today_a" href="#"><img title="테일러 미니 O5NBCB08" src="/semi_project/img/product/bags/backpack/O5FBBP04_BEIGE/O5FBBP04_BEIGE_2.jpg"></a>	
		       			<a class="today_a" href="#"><img title="테일러 미니 O5NBCB08" src="/semi_project/img/product/bags/backpack/O5FBBP04_BEIGE/O5FBBP04_BEIGE_2.jpg"></a>	
		       			<a class="today_a" href="#"><img title="테일러 미니 O5NBCB08" src="/semi_project/img/product/bags/backpack/O5FBBP04_BEIGE/O5FBBP04_BEIGE_2.jpg"></a>	
		       		</div>  		
		       	</div>	       	
		       </li>
		    </ul>
		</aside>
<%
	}
%>
