<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=800px, height=700px, initial-scale=1.0">
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
        <a href="main.do">
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
                </ul>
                </li>
            </ul>
        </nav>      
        <nav class="ul_nav">
            <ul class="nav_ul">
                <li><p>회원관리</p> 
                <ul class="nav_ul_b">
                    <a href="authentication.do"><li>회원가입</li></a>
                    <a href="login.do"><li>로그인</li></a>
                </ul>
                </li>
            </ul>
        </nav> 
        <nav class="ul_nav">
            <ul class="nav_ul"> 
                <li><p>부동산</p> 
                <ul class="nav_ul_b">
                    <a href="map.do"><li>지도보기</li></a>
                    <a href="board_all.do"><li>게시판</li></a>
                    <a href="boardWrite.do"><li>글쓰기</li></a>
                </ul>
                </li>
            </ul>
        </nav> 
        <nav class="ul_nav">
            <ul class="nav_ul">
                <li><p>서비스</p> 
                <ul class="nav_ul_b">
                    <a href="tips.do"><li>팁</li></a>
                    <a href=""><li>언어 / Language</li></a>
                </ul>
                </li>
            </ul>
        </nav> 
        </div>  
        <div class="div_allow">
            <img id="nav_left_arrow" src="resources/img/arrow_left_w.png" alt="왼쪽화살표">
            <img id="nav_right_arrow"src="resources/img/arrow_right_w.png" alt="오른쪽화살표">
        </div>    
    </header> 
    <section class="all_body_section">  
        <form id="find_id" action="find_id">
            <h3 style="margin-left: 50px;">검색결과</h3>                      		
				<div class="find_id_result" style="padding:8px; margin-top:250px; width: 500px; height: 150px;border-radius:5px; box-shadow: rgba(0, 0, 0, .2) 2px 2px 1px 1px; border:.5px solid rgb(192,192,192);">
				<div><img style="float:left; margin-right: 72px; width:150px;" src="resources/img/logo.png" /></div>
				<div style="width:450px; background-color:red; margin-top: 48px;">
				<p style="float: left;">회원님의 아이디는</p>
					<h3 style="float: left; margin-top:12px;">" ${ id } " </h3>
				<p style="float: left;  margin-top:12px;""> 입니다</p>
				
				</div>				
                </div>
            <div class="find_identification_btn" style="width: 316px;">
            <button type="submit" style="height: 24px;">로그인</button>
            <button type="submit" style="height: 24px;">비밀번호 찾기</button>
            </div>
        </form> 
    </section>
</body>
</html>