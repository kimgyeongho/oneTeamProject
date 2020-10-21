<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나 홀로 집에</title>
<link rel="stylesheet" href="resources/css/style.css">
<script src="resources/jquery/jquery-3.5.1.min.js"></script>
<script src="resources/jquery/jquery-migrate-1.4.1.min.js"></script>
<script src="resources/jquery/jquery-ui.min.js"></script>
<script src="resources/jquery/jstyle.js"></script>
</head>

<body>
	<header>
		<div class="header_container">
			<a href="/">
				<div class="header_logo">
					<!-- <img src="img/logo.png" alt="로고"> -->
				</div>
			</a>
			<nav class="ul_nav">
				<ul class="nav_ul">
					<li><p>소개</p>
						<ul class="nav_ul_b">
							  <a href="purpose.do"><li>목표</li></a>
                    <a href="service_info.do"><li>서비스 소개</li></a>
                    <a href="#"><li>만든이</li></a>
						</ul></li>
				</ul>
			</nav>
			<nav class="ul_nav">
				<ul class="nav_ul">
					<li><p>회원관리</p>
						<ul class="nav_ul_b">
							<a href="authentication.do"><li>회원가입</li></a>
							<a href="login.do"><li>로그인</li></a>
						</ul></li>
				</ul>
			</nav>
			<nav class="ul_nav">
				<ul class="nav_ul">
					<li><p>부동산</p>
						<ul class="nav_ul_b">
							<a href="map.do"><li>지도보기</li></a>
							<a href="board_all.do"><li>게시판</li></a>
							<a href="boardWrite.do"><li>글쓰기</li></a>
						</ul></li>
				</ul>
			</nav>
			<nav class="ul_nav">
				<ul class="nav_ul">
					<li><p>서비스</p>
						<ul class="nav_ul_b">
							<a href="tips.do"><li>팁</li></a>
							<a href=""><li>언어 / Language</li></a>
						</ul></li>
				</ul>
			</nav>
		</div>
		<div class="div_allow">
			<img id="nav_left_arrow" src="resources/img/arrow_left_w.png"
				alt="왼쪽화살표"> <img id="nav_right_arrow"
				src="resources/img/arrow_right_w.png" alt="오른쪽화살표">
		</div>
	</header>
	
	<div class="slide">
	<img id="back" style="top:550px;" alt="왼쪽 화살표" src="resources/img/arrow_left.png"/>
	<ul>
		<li>
			<img alt="이미지1" src="resources/img/purpose_back.png"/>
		</li>
		<li>
			<img alt="이미지2" src="resources/img/purpose_back_uiux.png"/>
		</li>
		<li>
			<img style="position:relative; width:1200px; top: -400px; left:400px;" alt="이미지 움짤" src="resources/img/purpose_2.gif"/>
			<a href="login.do"><button style="position: relative;top:-300px; left: -320px; width: 248px; height: 36px; background:none;  background-color: black;"><h4>시작하기</h4></button></a>
		</li>
	</ul>
	<img  style="top:550px;" id="next" alt="오른쪽쪽 화살표" src="resources/img/arrow_right.png"/>
	</div>
	

</body>
</html>