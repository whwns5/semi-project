<%@page import="semi.session.sessionProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/semi_project/css/aside/aside.css?ver=1">
<%
	String session_member_id_aside = (String)session.getAttribute("session_member_id");
	String session_member_type_aside = (String)session.getAttribute("session_member_name");
	if(session_member_id != null && session_member_type_aside.equals("고객")){ // 로그인 상태
		ArrayList<sessionProductDTO> session_arry_spdto_aside = (ArrayList<sessionProductDTO>) session.getAttribute("session_arry_spdto");
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
<%
						if(session_arry_spdto_aside != null){
							for(int i = session_arry_spdto_aside.size()-1 ; i >= 0 ; i--){
%>
								<a class="today_a" href="/semi_project/section/product/productDetail.jsp?product_idx=<%=session_arry_spdto_aside.get(i).getProduct_idx()%>&product_code=<%=session_arry_spdto_aside.get(i).getProduct_code()%>&lcid=<%=session_arry_spdto_aside.get(i).getLcid()%>&scid=<%=session_arry_spdto_aside.get(i).getScid()%>&today=true">
									<img title="<%=session_arry_spdto_aside.get(i).getProduct_name()%>_<%=session_arry_spdto_aside.get(i).getProduct_code()%>" 
									src="/semi_project/img/product/<%=session_arry_spdto_aside.get(i).getLcid()%>/<%=session_arry_spdto_aside.get(i).getScid()%>/<%=session_arry_spdto_aside.get(i).getProduct_code()%>_<%=session_arry_spdto_aside.get(i).getProduct_color() %>/<%=session_arry_spdto_aside.get(i).getProduct_code()%>_<%=session_arry_spdto_aside.get(i).getProduct_color()%>_2.jpg">
								</a>
<%							
							}
						}
%>
		       		</div>  		
		       	</div>	       	
		       </li>
		    </ul>
		</aside>
<%
	}
%>
