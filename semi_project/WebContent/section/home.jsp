<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/semi_project/css/home.css?ver=2">
<script>
function checkPopup() {
	var result = getCookie('popup0521');
	if (result == 'end') {
	   return false;
	}
	else {
		openPopup();
	}
}

function getCookie(name) { 
	   var cookieName = name + "=";
	   var x = 0;
	   while ( x <= document.cookie.length ) { 
	      var y = (x+cookieName.length); 
	      if ( document.cookie.substring( x, y ) == cookieName) { 
	         if ((lastChrCookie=document.cookie.indexOf(";", y)) == -1) 
	            lastChrCookie = document.cookie.length;
	         return decodeURI(document.cookie.substring(y, lastChrCookie));
	      }
	      x = document.cookie.indexOf(" ", x ) + 1; 
	      if ( x == 0 )
	         break; 
	      } 
	   return "";
	}

function openPopup(){ 
	window.open('/semi_project/section/member/join/popup.jsp','window','width=500,height=300');
}
</script>
</head>
<body onload='javascript:checkPopup();'>
<%@include file="/header/header.jsp" %>
<%@include file="/aside/aside.jsp" %>
<section>
<div class="body_contents">
	<div class="linemap"></div>
	<div class="container_body">
		<div class="eventGrid">
			<ul>
				<li><a><img src="/semi_project/img/home/banner/banner_1.jpg"></a></li>
				<li><a><img src="/semi_project/img/home/banner/banner_2.jpg"></a></li>
				<li><a><img src="/semi_project/img/home/banner/banner_3.jpg"></a></li>
				<li><a><img src="/semi_project/img/home/banner/banner_4.jpg"></a></li>
				<li><a><img src="/semi_project/img/home/banner/banner_5.jpg"></a></li>
				<li><a><img src="/semi_project/img/home/banner/banner_6.jpg"></a></li>
				<li><a><img src="/semi_project/img/home/banner/banner_7.jpg"></a></li>
				<li><a><img src="/semi_project/img/home/banner/banner_8.jpg"></a></li>
				<li><a><img src="/semi_project/img/home/banner/banner_9.jpg"></a></li>
				<li><a><img src="/semi_project/img/home/banner/banner_10.jpg"></a></li>
				<li><a><img src="/semi_project/img/home/banner/banner_11jpg"></a></li>
			</ul>
		</div>
		<div class="evnetGird_controller">
			<div class="evnetGird_controller_dir">
				<a class="bt_prev" href="#"></a>
				<a class="bt_next" href="#"></a>
			</div>
		</div>
		<!-- <ul class="main_middle_banner">
			<li><img src="/semi_project/img/header/nav_depth_menu_totebag.jpg"></li>
		</ul> -->
		<script>
		function overtile_content(id_num) {
			var bg = document.getElementById('tile_content_bg_'+id_num);
			bg.style.opacity = '0.5';
			var title = document.getElementById('tile_content_title_cell_'+id_num);
			title.style.padding = '0px 0px 40px 0px';
			
		}
		function outtile_content(id_num) {
			var bg = document.getElementById('tile_content_bg_'+id_num);
			bg.style.opacity = '0';
			var title = document.getElementById('tile_content_title_cell_'+id_num);
			title.style.padding = '0px 0px 0px 0px';
		}
		</script>
		<div class="tileGrid">
			<div class="tileGrid-wrap">
				<div class="tile1x1">
					<div class="tile_bg">
						<img src="/semi_project/img/home/home_backpack.jpg">
					</div>
					<div class="tile_content" onmouseover="overtile_content(1);" onmouseout="outtile_content(1);" onclick="window.alert('1');">
						<div class="tile_content_bg" id="tile_content_bg_1"></div>
						<div class="tile_content_title">
							<div class="tile_content_title_row">
								<div class="tile_content_title_cell" id="tile_content_title_cell_1">
									<h5>bags</h5>
									<h3>BACK PACK</h3>
								</div>
							</div>
						</div>
					</div>		
				</div>
				<div class="tile2x1">
					<div class="tile2x1_bg">
						<video id = "one_box_video" loop="loop" autoplay="autoplay">
							<source src="/semi_project/video/home1.mp4" type = "video/mp4">
						</video>
					</div>				
				</div>
				<div class="tile1x1">
					<div class="tile_bg">
						<img src="/semi_project/img/home/home_crossbag.jpg">
					</div>
					<div class="tile_content" onmouseover="overtile_content(2);" onmouseout="outtile_content(2);" onclick="window.alert('1');">
						<div class="tile_content_bg" id="tile_content_bg_2"></div>
						<div class="tile_content_title">
							<div class="tile_content_title_row">
								<div class="tile_content_title_cell" id="tile_content_title_cell_2">
									<h5>bags</h5>
									<h3>CROSS BAG</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tile1x1">
					<div class="tile_bg">
						<img src="/semi_project/img/home/home_shoulderbag.jpg">
					</div>
					<div class="tile_content" onmouseover="overtile_content(3);" onmouseout="outtile_content(3);" onclick="window.alert('1');">
						<div class="tile_content_bg" id="tile_content_bg_3"></div>
						<div class="tile_content_title">
							<div class="tile_content_title_row">
								<div class="tile_content_title_cell" id="tile_content_title_cell_3">
									<h5>bags</h5>
									<h3>SHOULDER BAG</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tile1x1">
					<div class="tile_bg">
						<img src="/semi_project/img/home/home_longwallet.jpg">
					</div>
					<div class="tile_content" onmouseover="overtile_content(4);" onmouseout="outtile_content(4);" onclick="window.alert('1');">
						<div class="tile_content_bg" id="tile_content_bg_4"></div>
						<div class="tile_content_title">
							<div class="tile_content_title_row">
								<div class="tile_content_title_cell" id="tile_content_title_cell_4">
									<h5>wallets</h5>
									<h3>LONG WALLET</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tile2x1">
					<div class="tile_bg">
						<img src="/semi_project/img/home/home_event.bmp">
					</div>
				</div>
				<div class="tile1x1">
					<div class="tile_bg">
						<img src="/semi_project/img/home/home_keyring.jpg">
					</div>
					<div class="tile_content" onmouseover="overtile_content(6);" onmouseout="outtile_content(6);" onclick="window.alert('1');">
						<div class="tile_content_bg" id="tile_content_bg_6"></div>
						<div class="tile_content_title">
							<div class="tile_content_title_row">
								<div class="tile_content_title_cell" id="tile_content_title_cell_6">
									<h5>accessory</h5>
									<h3>KEYRING</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</section>
<%@include file="/footer/footer.jsp" %>

</body>
</html>



