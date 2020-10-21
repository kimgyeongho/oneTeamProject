<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나 홀로 집에-회원가입</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <script src="resources/jquery/jquery-3.5.1.min.js"></script>
    <script src="resources/jquery/jquery-migrate-1.4.1.min.js"></script>
    <script src="resources/jquery/jquery-ui.min.js"></script>
    <script src="resources/jquery/jstyle.js"></script>
    <script src="resources/jquery/main_sugnup.js"></script>
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
    <div class="page_name" style=" background-image: url(/resources/img/signup.png);"><h1>회원가입</h1></div>
        <!-- 회원가입부분 -->
        <form action="join" method="post"name="form" id="form" >          
       		<div id="signup" style=" width: 720px; height: 540px;">
       			  <ul class="sign_upA">
                    <li id="index"><p> 이름</p></li>
                    <li ><input type="text" name="userName" id="userName" placeholder="이름을 입력하세요"></li>
                </ul>
                <ul class="sign_upA" style="margin-top: 8px;" >
                    <li id="index"><p>아이디</p></li>
                    <li ><input type="text" name="userID" id="userID" placeholder="아이디를 입력하세요" minlength="6" maxlength="16">                   
                    <button type="button" name="idCheck" id="idCheck" onclick="idCheck1()" value="중복확인">중복확인</button></li>
                </ul>
                <ul class="sign_upA" style="margin-top: 8px;">                    
                    <li style="font-size: 14px; margin-left: 124px; color: rgb(192,192,192);">6~16자 영문(소문자), 숫자 입력가능합니다.</li>
                </ul>                
                <ul class="sign_upA"style="margin-top: 8px;">
                    <li id="index"><p>비밀번호</p></li>
                    <li ><input type="password" name="userPW" class="pw" id="userPW" placeholder="비밀번호를 입력하세요" minlength="6" maxlength="16"></li>
                </ul>
                <ul class="sign_upA"style="margin-top: 8px;">
                    <li style="font-size: 14px; margin-left: 124px; color: rgb(192,192,192);">6~16자 영문(소문자), 숫자, 특수문자 입력가능합니다.</li>
                </ul>
                <ul class="sign_upA" style="margin-top: 8px;">
                    <li id="index"><p>비밀번호 확인</p></li>
                    <li ><input type="password" name="pwCheck" class="pw" id="pwCheck"  minlength="6" maxlength="16"></li>
                    <li id="pw_wrong_msg"  style="display:inline;margin-left: 124px;font-size: 14px; color: red; display: none">비밀번호가 일치하지 않습니다.</li>
                    <li id="pw_right_msg"  style="display:inline; font-size: 14px; color: green; display: none">비밀번호가 일치합니다.</li>
                </ul>
                <ul class="sign_upA" style="margin-top: 8px;">
                    <li id="index"><p>주민번호</p></li>
                    <li ><input style="width: 127.5px;" type="text" name="identidication1" id="identification1" placeholder="주민번호 앞 자리 입력" minlength="6" maxlength="6">
                    <input style="width: 127.5px;" type="password" name="identidication2" id="identification2" placeholder="주민번호 뒷 자리 입력" minlength="7" maxlength="7"></li>
                </ul>
                <ul class="sign_upA" style="margin-top: 8px;">
                    <li id="index"><p>이메일</p></li>
                    <li ><input type="text" name="email" id="email"></li>                    
       			    <li>
                   <div class="check_font" id="emailCheck"></div>
                </li>
                </ul>
                <ul class="sign_upA" style="margin-top: 8px;">
                    <li id="index" ><p>연락처</p></li>
                    <li id="subindex" style="margin-left: 124px;">휴대전화</li>
                    <li  id="subindex" style="margin-left: 124px;">                
                    <select name="firstNum1" id="firstNum" >
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="022">022</option>
                    </select>    
                    </li>                
                    <li ><input type="tel" id="userPhone1" name="userPhone1" minlength="4" maxlength="4"  style="width: 92px;">
                    <input type="tel" id="userPhone2" name="userPhone2" minlength="4" maxlength="4" style="width: 92px;"></li>
                </ul>
                <ul class="sign_upA" style="margin-top: 8px;">                
                    <li id="subindex" style="margin-left: 124px;">일반전화</li>
                    <li id="subindex" style="margin-left: 124px;">                
                    <select name="firstNum2" id="firstNum" >
                        <option value="031">031</option>
                        <option value="032">032</option>
                        <option value="033">033</option>
                    </select>    
                	</li>                
                    <li ><input style="width: 92px;" type="tel" id="userPhone3" name="userPhone3"  minlength="4" maxlength="4">
                   <input style="width: 92px;" type="tel" id="userPhone4" name="userPhone4"  minlength="4" maxlength="4"></li>
                </ul>
                <ul class="sign_upA" style="margin-top: 8px;">
                    <li id="index"   id="address"><p>주소</p></li>
                    <li id="subindex" style="margin-left: 124px;">우편번호</li>  
                    <li ><input type="text" id="zipNo" name="zipNo" style="margin-left: 124px;">
                    <button type="button" id="addrfind" class="findaddr" onClick="goPopup();" style="width: 108px;">주소 찾기</button></li>
                 <input type="hidden" id="address2" value="주소찾기" />
                </ul>
                <ul class="sign_upA" style="margin-top: 8px;">
                    <li style="margin-left: 124px;">주소</li>
                    <li id="addrInput"><input style="margin-left: 124px; width: 268px;" type="text" id="roadAddrPart1"  name="roadAddrPart1" ></li>
                </ul>                
                <ul class="sign_upA" style="margin-top: 8px;">
                    <li style="margin-left: 124px;">상세주소</li>
                    <li  id="addrInput"><input style="margin-left: 124px; width: 268px;" type="text" id="addrDetail"  name="addrDetail"></li>
                </ul>
       		</div>
            <div id="click">
            <button id="submit1" type="button" onclick="check();" >제출하기</button>
            <button id="reset" type="reset">다시쓰기</button>            
            </div>   
        </form> 
        <!-- 회원가입부분 끝!-->   
    </section>
   
</body>
</html>