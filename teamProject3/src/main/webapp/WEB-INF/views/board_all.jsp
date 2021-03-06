<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나 홀로 집에-게시판</title>
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
							<a href="maker.do"><li>만든이</li></a>
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
		<div class="page_name"
			style="background-image: url(/resources/img/board.png);">
			<h1>게시판</h1>
		</div>

		<section class="board_section">
			<div
				style="margin-left: 16px; float: left; position: relative; width: 500px; height: 24px;">
				<form style="height: 24px;" action="board_all.do">
				<button style="color: white; float: left; width: 84px;"
						type="button">검색창</button> 	<input style="float: left; width: 200px;" type="text" id="serchKeyword" name="serchKeyword" placeholder="검색어를 입력하세요" onkeyup="selectboard()"/>
					
				</form>
			</div>
			<div class="board_go_boardWrite">
				<a href="boardWrite.do"><button class="btn_go_boardWrite">글쓰기</button></a>
			</div>
			<table class="board_contentA">
				<tbody style="height: 400px; overflow: scroll;">
					<tr class="contentA_index">
						<td><h4>제목</h4></td>
						<td><h4>방 구조</h4></td>
						<td><h4>계약기간</h4></td>
						<td><h4>아이디</h4></td>
						<td><h4>내용</h4></td>
						<td><h4>주소</h4></td>
						<td><h4>게시일</h4></td>
						<td><h4>조회수</h4></td>
					</tr>
					<c:forEach items="${boardList}" var="board">
						<tr class="contentA_index" name="contentA" id="contentA">
							<td><a style="font-size: 12px; text-decoration: none;"
								href="getBoard.do?seq=${board.seq}">${board.title}</a></td>
							<td><a style="font-size: 12px; text-decoration: none;"
								href="getBoard.do?seq=${board.seq}">${board.content_character}</a></td>
							<td><a style="font-size: 12px; text-decoration: none;"
								href="getBoard.do?seq=${board.seq}">${board.content_character2}</a></td>
							<td><a style="font-size: 12px; text-decoration: none;"
								href="getBoard.do?seq=${board.seq}">${board.userID}</a></td>
							<td><a style="font-size: 12px; text-decoration: none;"
								href="getBoard.do?seq=${board.seq}">${board.content}</a></td>
							<td><a style="font-size: 12px; text-decoration: none;"
								href="getBoard.do?seq=${board.seq}">${board.address}</a></td>
							<td><a style="font-size: 12px; text-decoration: none;"
								href="getBoard.do?seq=${board.seq}">${board.regDate}</a></td>
							<td><a style="font-size: 12px; text-decoration: none;"
								href="getBoard.do?seq=${board.seq}">${board.cnt}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</section>
	</section>
	<!-- <img class="board_img_up" src="/images/arrowUP.png" alt=" 화살표">
    <img class="board_img_down" src="/images/arrowDown.png" alt="아래 화살표">  -->
	<script type="text/javascript">
		function selectboard() {
		var a = document.getElementsByName("contentA");
		for(var  i=0; i<a.length;i++){
				a[i].innerHTML = "";
			};
			$.ajax({
				url : "/selectboard",
				type : "POST",
				dataType : "json",
				data : $("#serchKeyword"),
				success : function(data) {
				for(var i=0;i<data.length;i++){
					a[i].innerHTML="<td><a style='font-size: 12px; text-decoration: none;'href='getBoard.do?seq="+data[i].seq+"'>"+data[i].title+"</a></td>"
					+"<td><a style='font-size: 12px; text-decoration: none;'href='getBoard.do?seq="+data[i].seq+"'>"+data[i].content_character+"</a></td>"
					+"<td><a style='font-size: 12px; text-decoration: none;'href='getBoard.do?seq="+data[i].seq+"'>"+data[i].content_character2+"</a></td>"
					+"<td><a style='font-size: 12px; text-decoration: none;'href='getBoard.do?seq="+data[i].seq+"'>"+data[i].userID+"</a></td>"
					+"<td><a style='font-size: 12px; text-decoration: none;'href='getBoard.do?seq="+data[i].seq+"'>"+data[i].content+"</a></td>"
					+"<td><a style='font-size: 12px; text-decoration: none;'href='getBoard.do?seq="+data[i].seq+"'>"+data[i].address+"</a></td>"
					+"<td><a style='font-size: 12px; text-decoration: none;'href='getBoard.do?seq="+data[i].seq+"'>"+data[i].regDate+"</a></td>"
					+"<td><a style='font-size: 12px; text-decoration: none;'href='getBoard.do?seq="+data[i].seq+"'>"+data[i].cnt+"</a></td>";
				}
				
				data=null;
				}

			})
		}
	</script>


</body>
</html>