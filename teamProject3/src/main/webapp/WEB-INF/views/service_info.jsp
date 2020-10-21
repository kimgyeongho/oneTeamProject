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
<script>
    $(function(){
            $("#singleE").animate({"left":"10px"},1500);
});
</script>
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
  
        <section class="service_left" style=" float: left; z-index: 1; position: absolute;">
             <img src="resources/img/singleE.png" alt="싱글이" id="singleE" style="width:500px;  left: 50px; top:250px; position: absolute;" >
        </section>
        <section class="service_right">
          <img src="resources/img/service_page.png" alt="서비스 페이지" id="service_page"style="width: 95%;">
            <a href="board_all.do" style="position: absolute; top:910px; left: 650px;"> <button>바로가기</button></a>
            <a href="map.do" style="position: absolute; top:910px; left: 1035px;"> <button>바로가기</button></a>
            <a href="authentication.do" style="position: absolute; top:910px; left: 1410px;"> <button>바로가기</button></a>
            
        </section>
   


<!-- footer 부분-->    

</body>
</html>