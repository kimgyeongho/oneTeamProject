<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <script src="resources/jquery/jquery-3.5.1.min.js"></script>
    <script src="resources/jquery/jquery-migrate-1.4.1.min.js"></script>
    <script src="resources/jquery/jquery-ui.min.js"></script>
    <script src="resources/jquery/jstyle.js"></script>
    <script src="resources/jquery/main_sugnup.js"></script>
</head>
<script type="text/javascript">
  $(document).ready(function() {
    var name = ${result}.response.name;
    var email = ${result}.response.email;
    var birthday = ${result}.response.birthday;
    $("#name").html("환영합니다. "+name+"님");

  }
    });
  //location.href = "${pageContext.request.contextPath}/";
</script>
<body>   
    <header>
        <div class="header_container">
        <a href="/">
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
           <c:if test="${result != null}">        
           <a href="mypage.do">           
           <h3 id=name></h3>
           </a>            
           </c:if>
        </div>
        <nav class="ul_nav">
            <ul class="nav_ul">
                <li><p>소개</p> 
                <ul class="nav_ul_b">
                    <a href="perpose.do"><li>목표</li></a>
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
                     <c:if test="${user == null}">
                    <a href="login.do"><li>로그인</li></a>
                     </c:if> 
                      <c:if test="${user != null}">
                    <a onclick="logout();"><li>로그아웃</li></a>
                     </c:if>           
                     
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
 <c:if test="${user != null}">        
                    <a href="boardWrite.do"><li>글쓰기</li></a>
                               </c:if>
                    
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
  
   <div class="main_logo">
    <!-- <img id="main_logo" src="img/main_logo.png" alt="메인로고'나홀로집에'"> -->
    </div>
    <div class="div_search">
        <div class="search_container">
        <input type="search" placeholder="검색어를 입력하세요">
        <button type="submit"><img src="resources/img/search_w.png" alt="검색"></button>
        </div>
        <div id="page_dot">            
            <div id="dot_div"></div>           
            <!-- <div id="dot_div"></div>           
            <div id="dot_div"></div>            -->
    </div> 
    </div>    
    <section class="main_part2">        
        <div id="imgs_main">            
            <div class="img_slide">
                <a href="map.do" style="position: absolute; left: 1580px; top: 250px;">
                    <button style="background: rgb(90, 92, 91); height: 60px; font-size: 24px; width: 180px; ">지도 보러가기</button>
                </a>
                <img src="resources/img/main_2_img.png" alt="지도 홍보">
            </div>
            <div class="img_slide">
                <a href="map.do" style="position: absolute; left: 1580px; top: 270px;">
                    <button style="background: rgb(136, 155, 151); height: 60px; font-size: 24px; width: 180px;">안내 보러가기</button>
                </a>
                <img src="resources/img/main_3_img.png" alt="지도 홍보">
            </div>
            <div class="img_slide">
                <!-- <a href="map.html" style="position: absolute; left: 1580px; top: 250px;">
                    <button style="background: rgb(90, 92, 91); height: 60px; font-size: 24px; width: 180px;">지도 보러가기</button>
                </a> -->
                <img src="resources/img/main2.png" alt="지도 홍보">
            </div>
         
        </div>        
    </section>
    <section class="main_part3"> 
        <div class="main_part3_div">

        </div>
    </section>
    
    </body>
</html>