<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <!-- <img src="img/logo.png" alt="로고"> f-->
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
        <div class="board_div">
            <button class="board_btn_all">전체 게시판</button>
            <button class="board_btn_cata">카테고리</button>
        </div>
        <div class="board_go_boardWrite">
            <a href="boardWrite.html"><button class="btn_go_boardWrite">글쓰기</button></a>        
        </div>
    <section class="board_section">
        
          <table class="board_contentA">                          
            <tr class="contentA_index">
              <td><h3>제목</h3></td>
              <td><h3>아이디</h3></td>
              <td><h3>내용</h3></td>
              <td><h3>게시일</h3></td>
            </tr>
            <tr class="contentA_index">
                <td>##</td>
                <td>###</td>
                <td>#######################</td>
                <td>####-##-##</td>
              </tr>
              <tr class="contentA_index">
                <td>##</td>
                <td>###</td>
                <td>#######################</td>
                <td>####-##-##</td>
              </tr>
              <tr class="contentA_index">
                <td>##</td>
                <td>###</td>
                <td>#######################</td>
                <td>####-##-##</td>
              </tr>
          </table>
          <table class="board_contentB">            
            <tr class="contentB_index">
              <a href="#"><td><img src="img/study.jpg" alt="면학의"></td></a>
              <a href="#"><td><img src="img/calm.jpg" alt="조용한"></td></a>                           
            </tr>    
            <tr class="contentB_index">
                <a href="#"><td><img src="img/wolabel.jpg" alt="면학의"></td></a>
                <a href="#"><td><img src="img/young.jpg" alt="조용한"></td></a>                           
              </tr> 
              <tr class="contentB_index">
                <a href="#"><td><img src="img/wolabel.jpg" alt="면학의"></td></a>
                <a href="#"><td><img src="img/wolabel.jpg" alt="조용한"></td></a>                           
              </tr>       
          </table>  
    </section>
    <!-- <img class="board_img_up" src="/images/arrowUP.png" alt=" 화살표">
    <img class="board_img_down" src="/images/arrowDown.png" alt="아래 화살표">  -->
    
   
</body>
</html>