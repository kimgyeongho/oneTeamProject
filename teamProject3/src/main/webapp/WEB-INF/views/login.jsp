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
    <script src="resources/jquery/login_findPw.js"></script>    
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
    <div class="page_name" style=" background-image: url(/resources/img/login.png);"><h1>로그인</h1></div>
        <form action="login" class="formlogin"  method="post" id="loginForm">
        <table class="logintable">           
            <tr id="ID">
                <td><h2 class="h2">아이디</h2></td>
                <td><input type="text" id="userID" name="userID" placeholder="id"></td>
                <input type="hidden" id="userID2" value="아이디">
                <input type="hidden" id="email" value="이메일인증">
                
            </tr>
            <tr id="PW">
                <td><h2 class="h2">비밀번호</h2></td>
                <td><input type="password" id="userPW" name="userPW" placeholder="password"></td>
                <input type="hidden" id="userPW2" value="비밀번호">
            </tr>        
        </table>
        <div class="loginbutton">
        <a><button type="button" class="log" id="idCheck" onclick="idCheck1()">로그인</button></a>
        <a href="authentication.do"><button type="button" class="sign">회원가입</button></a>
        </div>
        </form>
        <div id="naver_id_login" style="text-align:center"><a href="${url}">
		<img style="width:300px; margin-top: 12px;box-shadow: rgba(0, 0, 0, .2) 3px 3px 2px 2px;" src="resources/img/naverLogin.png"/>
		</a></div>
        <div class="login_find">
        <a href="find_id.do"><p>아이디 찾기</p></a>
        <a href="find_pw.do"><p> 비밀번호 찾기</p></a>
        </div>
    </section>
    <section class="panel">
    </section>
   
</body>
</html>