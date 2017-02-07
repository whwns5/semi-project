<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/semi_project/css/aside/aside.css?ver=1">
<%
	if(session_member_id != null){ // 로그인 상태
%>
		<aside>
			<ul id="navigation">
		       <li class="home"><div><a href="/semi_project/section/member/logout/logout_ok.jsp" title="로그아웃"><img src="/semi_project/img/icon/icon_brand_cate.png"/><p>로그아웃</p></a></div></li>
		       <li class="about"><div><a href="/semi_project/section/member/mypage.jsp" title="내정보보기"><img src="/semi_project/img/icon/icon_mypage.png"><p>내정보보기</p></a></div></li>
		       <li class="search"><div><a href="" title="Search"><img src="/semi_project/img/icon/icon_hhg_cate.png"><p>이벤트</p></a></div></li>
		       <li class="photos"><div><a href="" title="Photos"><img src="/semi_project/img/icon/icon_coupon.png"><p>쿠폰</p></a></div></li>
		       <li class="rssfeed"><div><a href="" title="Rss Feed"><img src="/semi_project/img/icon/icon_cart.png"><p>장바구니</p></a></div></li>
		       <li class="contact"><div><img src="/semi_project/img/icon/icon_today.png"><p>투데이상품</p></div></li>
		    </ul>
		</aside>
<%
	}
%>
