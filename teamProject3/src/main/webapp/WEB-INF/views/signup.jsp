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
</head>
<script>
// 도로명 주소 창
function goPopup(){
   var pop = window.open("popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
      function jusoCallBack(zipNo,roadAddrPart1,addrDetail){
          document.form.zipNo.value = zipNo;
          document.form.roadAddrPart1.value = roadAddrPart1;
          document.form.addrDetail.value = addrDetail;
}
    $(document).ready(function(){
			$("#submit").on("click", function(){
				if($("#userName").val()==""){
					alert("이름을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				if($("#userID").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userID").focus();
					return false;
				}
				if($("#userPW").val()==""){
					alert("비밀번호을 입력해주세요.");
					$("#userPW").focus();
					return false;
				}
				if($("#pwCheck").val()==""){
					alert("비밀번호 확인을 해주세요.");
					$("#pwCheck").focus();
					return false;
				}
				if($("#identification1").val()==""){
					alert("주민번호 입력해주세요.");
					$("#identification1").focus();
					return false;
				}
				if($("#identification2").val()==""){
					alert("주민번호 입력해주세요.");
					$("#identification2").focus();
					return false;
				}
				if($("#email").val()==""){
					alert("이메일를입력해주세요.");
					$("#email").focus();
					return false;
				}
				if($("#userPhone1").val()==""){
					alert("핸드폰 번호를 입력해주세요.");
					$("#userPhone1").focus();
					return false;
				}
				if($("#userPhone2").val()==""){
					alert("핸드폰 번호를 입력해주세요.");
					$("#userPhone2").focus();
					return false;
				}
				if($("#userPhone3").val()==""){
					alert("집 번호를입력해주세요.");
					$("#userPhone3").focus();
					return false;
				}
				if($("#userPhone4").val()==""){
					alert("집 번호를입력해주세요.");
					$("#userPhone4").focus();
					return false;
				}
				if($("#zipNo").val()==""){
					alert("우편번호를 입력해주세요.");
					$("#zipNo").focus();
					return false;
				}
				if($("#roadAddrPart1").val()==""){
					alert("주소를 입력해주세요.");
					$("#roadAddrPart1").focus();
					return false;
				}
				if($("#addrDetail").val()==""){
					alert("상세주소를 입력해주세요.");
					$("#addrDetail").focus();
					return false;
				}
				var idCheckVal = $("#idCheck").val();
				if(idCheckVal == "중복확인"){
					alert("중복확인 버튼을 눌러주세요.");
				}else if(idCheckVal == "사용가능"){
					$("#form").submit();
				}
			});
		})
		
		function idCheck1(){
			$.ajax({
				url : "/IdCheck",
				type : "post",
				dataType : "json",
				data : {"userID" : $("#userID").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idCheck").attr("value", "사용가능");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
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
        <!-- 회원가입부분 -->
        <form action="join" method="post"name="form" id="form" >          
        <div class="signup">                        
            <table>
                <tr>
                    <td id="index"><p> 이름</p></td>
                    <td ><input type="text" name="userName" id="userName" placeholder="이름을 입력하세요"></td>
                </tr>
                <tr>
                    <td id="index" rowspan="2"><p>아이디</p></td>
                    <td ><input type="text" name="userID" id="userID" placeholder="아이디를 입력하세요" minlength="6" maxlength="16"></td>                    
                    <td><button type="button" name="idCheck" id="idCheck" onclick="idCheck1();" value="중복확인">중복확인</button></td>
                </tr>
                <tr>                    
                    <td colspan="3" style="font-size: 12px; padding-left: 25px;">6~16자 영문(소문자), 숫자 입력가능합니다.</td>
                </tr>                
                <tr>
                    <td id="index" rowspan="2"><p>비밀번호</p></td>
                    <td ><input type="password" name="userPW" class="pw" id="userPW" placeholder="비밀번호를 입력하세요" minlength="6" maxlength="16"></td>
                </tr>
                <tr>
                    <td colspan="3" style="font-size: 12px; padding-left: 25px;">6~16자 영문(소문자), 숫자, 특수문자 입력가능합니다.</td>
                </tr>
                <tr>
                    <td id="index"><p>비밀번호 확인</p></td>
                    <td ><input type="password" name="pwCheck" class="pw" id="pwCheck"  minlength="6" maxlength="16"></td>
                    <td colspan="2" style="color: red; display: none; font-size: 16px;" id="pw_wrong_msg">비밀번호가 일치하지 않습니다.</td>
                </tr>
                <tr>
                    <td id="index"><p>주민번호</p></td>
                    <td ><input type="text" name="identidication1" id="identification1" placeholder="주민번호 앞 자리 입력" minlength="6" maxlength="6"></td>
                    <td ><input type="password" name="identidication2" id="identification2" placeholder="주민번호 뒷 자리 입력" minlength="7" maxlength="7"></td>
                </tr>
                <tr>
                    <td id="index"><p>이메일</p></td>
                    <td ><input type="text" name="email" id="email"></td>                    
                    <td ><input type="text" name="emailAddr" id="emailAddr"></td>                  
                    <td><select name="emailOpt" id="emailOpt">
                        <option value="">@직접입력</option>
                        <option value="@google.com">@google.com</option>
                        <option value="@daum.net">@daum.net</option>
                        <option value="@daum.net">@naver.net</option>
                    </select>    
                </td>      
                </tr>
                <tr>
                    <td id="index" rowspan="2"><p>연락처</p></td>
                    <td  id="subindex" style="font-size: 14px; padding-left: 25px;"> 휴대폰                
                    <select name="firstNum1" id="firstNum">
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="022">022</option>
                    </select>    
                    </td>                
                    <td ><input type="tel" id="userPhone1" name="userPhone1" minlength="4" maxlength="4"></td>
                    <td ><input type="tel" id="userPhone2" name="userPhone2" minlength="4" maxlength="4"></td>
                </tr>
                <tr>                 
                      
                    <td id="subindex" style="font-size: 14px; padding-left: 25px;"> 일반전화                
                    <select name="firstNum2" id="firstNum">
                        <option value="031">031</option>
                        <option value="032">032</option>
                        <option value="033">033</option>
                    </select>    
                </td>                
                    <td ><input type="tel" id="userPhone3" name="userPhone3"  minlength="4" maxlength="4"></td>
                    <td ><input type="tel" id="userPhone4" name="userPhone4"  minlength="4" maxlength="4"></td>
                </tr>
                <tr>
                    <td id="index" rowspan="3"><p>주소</p></td>
                    <td id="subindex" style="font-size: 14px; padding-left: 25px;">우편번호</td>  
                    <td ><input type="text" id="zipNo" name="zipNo"></td>
                    <td><button type="button" class="findaddr" onClick="goPopup();" >주소 찾기</button></td>
                </tr>
                <tr>
                    <td style="font-size: 14px; padding-left: 25px;">주소</td>
                    <td id="addrInput"><input type="text" id="roadAddrPart1"  name="roadAddrPart1" ></td>
                </tr>                
                <tr>
                    <td style="font-size: 14px; padding-left: 25px;">상세주소</td>
                    <td colspan="2" id="addrInput"><input type="text" id="addrDetail"  name="addrDetail"></td>
                </tr>                
        
            </table>
        </div> 
            <div id="click">
            <button id="submit" type="submit">제출하기</button>
            <button id="reset" type="reset">다시쓰기</button>            
            </div>            
        </div> 
        </form> 
        <!-- 회원가입부분 끝!-->   
    </section>
   
</body>
</html>