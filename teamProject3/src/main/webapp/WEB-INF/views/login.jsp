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

$(document).ready(function(){
	  $("#idCheck").on("click", function(){
		  if($("#userID").val()==""){
				alert('아이디를 입력해주세요');
				return false;
			}
			if($("#userPW").val()==""){
				alert('비밀번호를 입력해주세요');
				return false;
			}
			if($("#userPW").val()=="" && $("#userID").val()==""){
				alert('아이디와 비밀번호를 입력해주세요');
				return false;
			}
			 if($("#userID2").val()=="아이디체크완료" && $("#userPW2").val()=="비밀번호체크완료"){
				$("#loginForm").submit();
				return false;
			}
			$.ajax({
				url : "/IdCheck",
				type : "post",
				dataType : "json",
				data : {"userID" : $("#userID").val()},
				success : function(data){
					if(data == 0){
						alert("아이디가 틀렸습니다.");			
					}else if(data == 1){
						$("#userID2").attr("value", "아이디체크완료");
					}
				}
			}) 
			$.ajax({
						url : "/passwordCheck",
						type : "POST",
						dateType : "json",
						data : $("#loginForm").serializeArray(),
						success: function(data){
							
							if(data==false){
								alert("패스워드가 틀렸습니다.");	
							}else if(data == true){
								$("#userPW2").attr("value", "비밀번호체크완료");
							}
						}		
					})
});
})  
/* function idCheck1(){

	} */
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
        <form action="login" class="formlogin"  method="post" id="loginForm">
        <table class="logintable">           
            <tr id="ID">
                <td><h2 class="h2">아이디</h2></td>
                <td><input type="text" id="userID" name="userID" placeholder="id"></td>
                <input type="hidden" id="userID2" value="아이디">
            </tr>
            <tr id="PW">
                <td><h2 class="h2">비밀번호</h2></td>
                <td><input type="password" id="userPW" name="userPW" placeholder="password"></td>
                <input type="hidden" id="userPW2" value="비밀번호">
            </tr>        
        </table>
        <div class="loginbutton">
        <a><button type="button" class="log" id="idCheck" onclick="idCheck1();">로그인</button></a>
        <a href="authentication.do"><button type="submit" class="sign">회원가입</button></a>
        </div>
        </form>
        <div class="login_find">
        <a href="find_id.do"><p>아이디 찾기</p></a>
        <a href="find_pw.do"><p>비밀번호 찾기</p></a>
        </div>
    </section>
    <section class="panel">
    </section>
   
</body>
</html>