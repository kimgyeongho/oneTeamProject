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
    <script src="resources/jquery/login_findPw.js"></script>
    
</head>
<body>
    <header>
        <div class="header_container">
        <a href="main.html">
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
                </ul>
                </li>
            </ul>
        </nav>      
        <nav class="ul_nav">
            <ul class="nav_ul">
                <li><p>회원관리</p> 
                <ul class="nav_ul_b">
                    <a href="authentication.html"><li>회원가입</li></a>
                    <a href="login.html"><li>로그인</li></a>
                </ul>
                </li>
            </ul>
        </nav> 
        <nav class="ul_nav">
            <ul class="nav_ul"> 
                <li><p>부동산</p> 
                <ul class="nav_ul_b">
                    <a href="map.html"><li>지도보기</li></a>
                    <a href="board_all.html"><li>게시판</li></a>
                    <a href="boardWrite.html"><li>글쓰기</li></a>
                </ul>
                </li>
            </ul>
        </nav> 
        <nav class="ul_nav">
            <ul class="nav_ul">
                <li><p>서비스</p> 
                <ul class="nav_ul_b">
                    <a href="tips.html"><li>팁</li></a>
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
        <section class="all_body_section">  
            <form id="find_identification_pw" action="find_identification_pw" method="POST">
                <h3>비밀번호 찾기</h3>
                <table class="find_id_table">
                    <tr>
                        <td>이름</td>
                        <td><input  id="userName" name="userName" style="margin-left: 24px; width: 240px;"></td>
                    </tr>
                    <tr>
                        <td>아이디</td>
                        <td><input  id="userID" name="userID" style="margin-top: 24px;margin-left: 24px; width: 240px;"></td>
                    </tr>
                    <tr>
                        <td>이메일</td>
                        <td><input type="email" id="email" name="email" style="margin-top: 24px; margin-left: 24px; width: 240px;"></td>
                    </tr>      
                </table>
                <div class="find_identification_btn">
                <button type="button" id="findBtn" style="height: 24px;" onclick="check()">확인</button>
                </div>
            </form> 
        </section>
        </section>
</body>
</html>