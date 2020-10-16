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
<script src="/resources/jquery/jstyle.js"></script>
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
							<a href="#"><li>목표</li></a>
							<a href="#"><li>서비스 소개</li></a>
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
							<c:if test="${user != null}">
								<a href="boardWrite.do"><li>글쓰기</li></a>
							</c:if>
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
	<section class="all_body_section">
		<!-- 게시판 작성 부분 -->
		<div class="board_table">
			<form action="#" name="pp2" id="pp2">
				<table class="boardWrite_table">
					<tr class="boardWrite_table_tr">
						<td class="boardWrite_index">제목</td>
						<td>${board.title}</td>
					</tr>
					<tr class="boardWrite_table_tr">
						<td class="boardWrite_index">카테고리</td>
						<td>카테고리 나올곳</td>
					</tr>
					<tr class="boardWrite_table_tr">
						<td class="boardWrite_index">아이디</td>
						<td>${board.writer}</td>
					</tr>
					<tr class="boardWrite_table_tr">
						<td class="boardWrite_index">내용</td>
						<td>${board.content}</td>
					</tr>
					<tr class="boardWrite_table_tr">
						<td class="boardWrite_index">주소</td>
						<td>주소나올곳</td>
						</li>
					</tr>
				</table>
			</form>

			<!-- 첨부파일창 부분 -->
			<!-- 보드 검색창 버튼 부분 -->
			<div class="boardWrite_btn_container">
				<a href="board.do"><button class="board_fix_btn" name="update">수정하기</button></a>
				<button class="board_delete_btn" name="delete">삭제하기</button>
				</a>
			</div>
		</div>
	</section>


</body>
</html>