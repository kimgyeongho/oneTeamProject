<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <script src="resources/jquery/jquery-3.5.1.min.js"></script>
    <script src="resources/jquery/jquery-migrate-1.4.1.min.js"></script>
    <script src="resources/jquery/jquery-ui.min.js"></script>
    <script src="resources/jquery/jstyle.js"></script>
</head>
<body>   
    <header>
        <div class="header_container">
        <a href="main.html">
            <div class="header_logo">
            <!-- <img src="img/logo.png" alt="로고"> -->
            </div>
        </a>   
        <div class="user_information">
           <c:if test="${user != null}">        
           <a href="mypage.do">           
           <h3>${user.userID}님 마이페이지</h3>
           
           </a> 
           </c:if>
           <c:if test="${user == null}">
           <h3></h3>
           </c:if>
        </div>
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
                    <a href="authentication.do"><li>회원가입</li></a>
                     <c:if test="${user == null}">
                    <a href="login.do"><li>로그인</li></a>
                     </c:if> 
                      <c:if test="${user != null}">
                    <a href="logout.do"><li>로그아웃</li></a>
                     </c:if>           
                     
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
                    <a href="tips.html"><li>팁ㅇ</li></a>
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
  
   <div class="main_logo">
    <!-- <img id="main_logo" src="img/main_logo.png" alt="메인로고'나홀로집에'"> -->
    </div>
    <div class="div_search">
        <div class="search_container">
        <input type="search" placeholder="검색어를 입력하세요">
        <button type="submit"><img src="resources/img/search_w.png" alt="검색"></button>
        </div>
    </div>
    <section class="main_part2"> 
        <div class="main_part2_div">
            <img src="resources/img/move1.png" alt="이사 1">
            <img src="resources/img/move2.png" alt="이사 1">
            <img src="resources/img/move3.png" alt="이사 1">
        </div>
    </section>
    <section class="main_part3"> 
        <div class="main_part3_div">

        </div>
    </section>
    
    </body>
</html>