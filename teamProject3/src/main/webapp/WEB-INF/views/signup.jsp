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
	   $("#address2").attr("value", "주소체크");
}
      function jusoCallBack(zipNo,roadAddrPart1,addrDetail){
          document.form.zipNo.value = zipNo;
          document.form.roadAddrPart1.value = roadAddrPart1;
          document.form.addrDetail.value = addrDetail;
}    
    $(document).ready(function(){
    	$("#email").blur(function() {
	    	$.ajax({
	    		url : '/emailCheck',
				type : 'post',
				dataType : "json",
				data : {"email" : $("#email").val()},
				success : function(data) {
					console.log("사용주인 이메일이라면 데이터에 값이 나옵니다: "+ data);							
					if (data == 1 ) {
						$("#emailCheck").text("사용중인 이메일입니다 ");
						$("#emailCheck").css("color", "red");
						$("#submit1").attr("disabled", true);
					}else if(data == 0){
						$("#emailCheck").text("");
						$("#submit1").attr("disabled", false);
					}
				}
			}); 
	    });
    	$("#submit1").on("click", function(){
					var name = /^[가-힣]+$/;        
			    	var pw = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,16}$/;

			    	var pwCh = $("#userPW").val();
			        var nameCH =  $("#userName").val();
			        var addr =  $("#emailAddr").val();
			        var Opt = $("#emailOpt").val();
			        // 두가지에 방식으로 만들었음. 
			 		if(false == name.test(nameCH) || nameCH == "") {
					alert('이름을 한글로 입력해주시길 바랍니다.');
					return false;
					}
			        if(!/^[a-zA-Z0-9]{6,16}$/.test($("#userID").val())){
					alert('아이디는 숫자와 영문자 조합으로 6~16자리를 입력해주시길 바랍니다.');
					return false;
					} 
			    	if(false == pw.test(pwCh) || $("#userPW").val()=="") {
			    	alert('비밀번호는 6~16자 이어야 하며, 6~16자 영문(소문자), 숫자, 특수문자로 입력해주시길 바랍니다.');
			    	return false;
			    	}
			    	if($("#pwCheck").val()=="") {
				    alert('비밀번호 확인해주세요');
				    return false;
				    }
			    	if(!/^[0-9]{6}$/.test($("#identification1").val())){
					alert('주민번호 앞자리 숫자 6자로 입력해주시길 바랍니다.');
					return false;
					} 
			    	if(!/^[0-9]{7}$/.test($("#identification2").val())){
					alert('주민번호 뒷자리 숫자 7자로 입력해주시길 바랍니다.');
					return false;
					}			    	
					if( !/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test($("#email").val())){
					alert('이메일 형식에 맞게 입력해주시길 바랍니다.');
					return false;
					}
					if(!/^[0-9]{4}$/.test($("#userPhone1").val())){
					alert('핸드폰 번호 앞자리  입력해주시길 바랍니다.');
					return false;
					}
					if(!/^[0-9]{4}$/.test($("#userPhone2").val())){
					alert('핸드폰 번호 뒷자리  입력해주시길 바랍니다.');
					return false;
					}
			        var address2 = $("#address2").val();
				 	if(address2 == "주소찾기"){
					alert("주소찾기를 통해 주소를 찾아주세요");
					return false;
					}if($("#zipNo").val() == ""){
					alert("주소찾기를 통해 주소를 찾아주세요");
					return false;
					}
					if($("#roadAddrPart1").val() == ""){
					alert("주소찾기를 통해 주소를 찾아주세요");
					return false;
					}
					if($("#addrDetail").val() == ""){
					alert("주소찾기를 통해 주소를 찾아주세요");
					return false;
					}  
				    var idCheckVal = $("#idCheck").val();
				    if(idCheckVal == "중복확인"){
					alert("중복확인 버튼을 눌러주세요.");
				    }else if(idCheckVal == "사용가능" && $("#emailCheck").val() == "" ){
				    $("#form").submit();
			        $('#submit1').attr('disabled', true);
					alert('이메일 인증 메일을 보냈습니다 인증 후 로그인 해주시길 바랍니다.');
					setTimeout(function () {                
				        }, 9000)
				    }
			});
		});
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
					if(!/^[a-zA-Z0-9]{6,16}$/.test($("#userID").val())){
						alert('숫자와 영문자 조합으로 6~16자리를 입력해주세요.');
						return false;
					}$("#idCheck").attr("value", "사용가능");
					alert("사용가능한 아이디입니다.");
					}
				}
			})
			
		}
</script>
<script>
function check() {
	$.ajax({
		url : '/emailCheck',
		type : 'post',
		dataType : "json",
		data : {"email" : $("#email").val()},
		success : function(data) {
			console.log("사용주인 이메일이라면 데이터에 값이 나옵니다2: "+ data);							
			if (data == 1 ){
				alert("중복된 이메일입니다.");
				location.href="signup.do"
				}
			}
		});
/* 	if (true) {
        console.log("클릭됨");
        click = false;
        $('#submit1').attr('disabled', true);		            

        // 타이밍 추가
        setTimeout(function () {
            click = true;
	        $('#submit1').attr('disabled', false);		            
        }, 12000)
     }  */
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