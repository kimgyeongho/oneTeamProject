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
<body>
    <header>
        <div class="header_container">
        <a href="/">
            <div class="header_logo">
            <!-- <img src="img/logo.png" alt="로고"> -->
            </div>
        </a>   
        <div class="user_information">
            <h3>홍길동님 환영합니다.</h3>
            <input type="text" name="#" id="#">
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
         <!-- 게시판 작성 부분 -->
        <div class="board_table">
        <form action="#">                      
        <table class="boardWrite_table">
            <tr class="boardWrite_table_tr">
                <td class="boardWrite_index">제목</td>
                <td><input type="text" placeholder="제목을 입력하세요"></input></td>
            </tr>
            <tr class="boardWrite_table_tr">
                <td class="boardWrite_index">카테고리</td>
                <td>
                    <select name="catagorized" id="content_character">
                        <option value="카테고리를 선택해 주세요">선택</option>
                        <option value="카테고리">원룸</option>
                        <option value="기타1">투룸</option>
                        <option value="기타2">계약 기간 6개월 이상</option>
                        <option value="기타2">계약 기간 6개월 미만</option>
                    </select>
                </td>
            </tr>
            <tr class="boardWrite_table_tr">
                <td class="boardWrite_index">아이디</td>
                <td>${user.userID}</td>
            </tr>                     
            <tr class="boardWrite_table_tr">
                <td class="boardWrite_index">내용</td>
                <td><textarea class="boardWrite_textarea" cols="5" rows="11" maxlength="15000">내용을 입력하세요</textarea></td>
            </tr>                 
        </table> 
    </form> 
    </div>   
    <!-- 첨부파일창 부분 -->
    <div class="img_file_container">
    <input type="file" name="add_image" id="add_fileA"></input>
    <input type="file" name="add_image" id="add_fileB"></input>
    </div>
    <!-- 보드 검색창 버튼 부분 -->
    <div class="boardWrite_btn_container">                
        <button type="submit" class="board_search_btn" name="insert">올리기</button>                      
        <a href="board.html"><button class="board_fix_btn" name="update">수정하기</button></a>    
        <button class="board_delete_btn" name="delete">삭제하기</button></a>    
    </div>          
        </section>      
       
    </section>
   
</body>
</html>