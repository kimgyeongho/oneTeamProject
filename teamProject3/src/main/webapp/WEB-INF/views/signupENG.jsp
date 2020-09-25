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
//도로명 주소 창
function goPopup(){
    var pop = window.open("/popup/jusoPopupENG.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(zipNo,roadAddr, addrDetail){
	document.form.zipNo.value = zipNo;
	document.form.roadAddr.value = roadAddr;
	document.form.addrDetail.value = addrDetail;
}
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
        <form action="#" id="form" name="form" method="post">          
        <div class="signup"> 
                       
            <table>
                <tr>
                    <td id="index"><p> name</p></td>
                    <td ><input type="text" name="userName" id="userName" placeholder="write your name"></td>
                </tr>
                <tr>
                    <td id="index" rowspan="2"><p>id</p></td>
                    <td ><input type="text" name="userID" id="userID" placeholder="write your id" minlength="3" maxlength="16"></td>                    
                    <td><button type="submit" name="idCheck" id="idCheck" value="중복확인">ID check</button></td>
                </tr>
                <tr>                    
                    <td colspan="3" style="font-size: 12px; padding-left: 25px;">You can use text(english), number, simbol from 6 to 16.</td>
                </tr>                
                <tr>
                    <td id="index" rowspan="2"><p>password</p></td>
                    <td ><input type="password" name="userPW" class="pw" id="userPW" placeholder="write your password" minlength="3" maxlength="16"></td>
                </tr>
                <tr>
                    <td colspan="3" style="font-size: 12px; padding-left: 25px;">You can use text(english), number, simbol from 6 to 16.</td>
                </tr>
                <tr>
                    <td id="index"><p>PW check</p></td>
                    <td ><input type="password" name="pwCheck" class="pw" id="pwCheck"  minlength="6" maxlength="16"></td>
                    <td colspan="2" style="color: red; display: none; font-size: 16px;" id="pw_wrong_msg">Please Check your password</td>
             </tr>
                <tr>
                    <td id="index"><p>ID number</p></td>
                    <td ><input type="text" name="identidication" id="identification" placeholder="first no." maxlength="6"></td>
                    <td ><input type="password" name="identidication" id="identification" placeholder="last no." maxlength="8"></td>
                </tr>
                <tr>
                    <td id="index"><p>email</p></td>
                    <td ><input type="text" name="email" id="email"></td>                    
                    <td ><input type="text" name="emailAddr" id="emailAddr"></td>                  
                    <td><select name="emailOpt" id="emailOpt">
                        <option value="@naver.com">@write your self</option>
                        <option value="@google.com">@google.com</option>
                        <option value="@daum.net">@daum.net</option>
                        <option value="@daum.net">@naver.net</option>
                    </select>    
                </td>      
                </tr>
                <tr>
                    <td id="index" rowspan="2"><p>phone</p></td>
                    <td  id="subindex" style="font-size: 14px; padding-left: 25px;"> mobile                
                    <select name="firstNum" id="firstNum">
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="022">022</option>
                    </select>    
                    </td>                
                    <td ><input type="tel" id="userPhone" name="userPhone"></td>
                    <td ><input type="tel" id="userPhone" name="userPhone"></td>
                </tr>
                <tr>                 
                      
                    <td id="subindex" style="font-size: 14px; padding-left: 25px;"> tel                
                    <select name="firstNum" id="firstNum">
                        <option value="031">031</option>
                        <option value="032">032</option>
                        <option value="033">033</option>
                    </select>    
                </td>                
                    <td ><input type="tel" id="userPhone" name="userPhone"></td>
                    <td ><input type="tel" id="userPhone" name="userPhone"></td>
                </tr>
                <tr>
                    <td id="index" rowspan="3" ><p>address</p></td>
                    <td id="subindex"></td>  
                    <td ><input type="text" id="zipNo" name="zipNo"></td>
                    <td><button class="findaddr" onClick="goPopup();" >find address</button></td>
                </tr>
                <tr>
                    <td style="font-size: 14px; padding-left: 25px;">address</td>
                    <td colspan="2" id="addrInput"><input type="text" id="roadAddr"  name="roadAddr"></td>
                </tr>                
                <tr>
                    <td style="font-size: 14px; padding-left: 25px;">detail</td>
                    <td colspan="2" id="addrInput"><input type="text"  id="addrDetail"  name="addrDetail"></td>
                </tr>         
           
            </table>
        </div> 
            <div id="click">
            <button id="submit" type="submit">submit</button>
            <button id="reset" type="reset">rewrite</button>
            </div>            
        </div> 
        </form>  
</body>
</html>