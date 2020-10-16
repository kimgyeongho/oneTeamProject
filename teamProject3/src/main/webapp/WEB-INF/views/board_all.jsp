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
            <!-- <img src="img/logo.png" alt="로고"> -->
            </div>
        </a>   
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
        <div class="board_div">
            <button class="board_btn_all">전체 게시판</button>
            <button class="board_btn_cata">카테고리</button>
        </div>
        <div class="board_go_boardWrite">
            <a href="boardWrite.do"><button class="btn_go_boardWrite">글쓰기</button></a>        
        </div>
    <section class="board_section">        
          <table class="board_contentA" >             
          <tbody style="height: 400px; overflow: scroll;">             
            <tr class="contentA_index">
              <td><h4>번호</h4></td>
              <td><h4>제목</h4></td>
              <td><h4>아이디</h4></td>
              <td><h4>내용</h4></td>
              <td><h4>게시일</h4></td>
              <td><h4>조회수</h4></td>
            </tr>
            <tr class="contentA_index">
            	<td>8</td>
                <td>안녕하세요</td>
                <td>네 안녕하세요</td>
                <td>혼자 오셨나요?</td>
                <td>2020-10-16</td>
                <td>245</td>
              </tr>                       
            <tr class="contentA_index">
            <td>7</td>
                <td>네 혼자 왔습니다</td>
                <td>찾는</td>
                <td>매물 있으시면 말씀해주세요</td>
                <td>2020-10-6</td>
                <td>9</td>
              </tr>                       
            <tr class="contentA_index">
            <td>6</td>
                <td>혼자 살기 좋은 집</td>
                <td>구하고</td>
                <td>싶은데 혹시 어떻게 하면 좋을까요?</td>
                <td>2020-09-22</td>
                <td>2</td>
              </tr>                       
            <tr class="contentA_index">
            <td>5</td>
                <td>잘 모를땐</td>
                <td>써보세요</td>
                <td>혼자살기 좋은 집 찾을 때에는</td>
                <td>2020-09-16</td>
                <td>2</td>
              </tr>                       
            <tr class="contentA_index">
            <td>4</td>
                <td>나홀로</td>
                <td>집에</td>
                <td>감사합니다</td>
                <td>2020-09-16</td>
                <td>5</td>
              </tr>                       
            <tr class="contentA_index">
            <td>3</td>
                <td>혼자 살기 좋은 집</td>
                <td>두집살림</td>
                <td>구로디지털단지 인근 혼자 살기 좋은 집입니다.</td>
                <td>2020-09-16</td>
                <td>38</td>
              </tr>                       
            <tr class="contentA_index">
            <td>2</td>
                <td>둘이 살기 좋은 집</td>
                <td>세집살림</td>
                <td>구로디지털단지 인근 둘이 살기 좋은 집입니다.</td>
                <td>2020-09-16</td>
                <td>75</td>
              </tr>                       
            <tr class="contentA_index">
            <td>1</td>
                <td>야경 좋은 집</td>
                <td>야근각</td>
                <td>인근 야근하는 사람이 많아 야경이 훌륭합니다</td>
                <td>2020-09-16</td>
                <td>33</td>
              </tr>          
                   </tbody>               
          </table>
            <table class="board_contentB">            
            <tr class="contentB_index">
              <a href="#"><td><img src="resources/img/study.jpg" alt="면학의"></td></a>
              <a href="#"><td><img src="resources/img/calm.jpg" alt="조용한"></td></a>                           
            </tr>    
            <tr class="contentB_index">
                <a href="#"><td><img src="resources/img/wolabel.jpg" alt="면학의"></td></a>
                <a href="#"><td><img src="resources/img/young.jpg" alt="조용한"></td></a>                           
              </tr> 
              <tr class="contentB_index">
                <a href="#"><td><img src="resources/img/wolabel.jpg" alt="면학의"></td></a>
                <a href="#"><td><img src="resources/img/wolabel.jpg" alt="조용한"></td></a>                           
              </tr>       
          </table>  
    </section>
    <!-- <img class="board_img_up" src="/images/arrowUP.png" alt=" 화살표">
    <img class="board_img_down" src="/images/arrowDown.png" alt="아래 화살표">  -->
    
   
</body>
</html>