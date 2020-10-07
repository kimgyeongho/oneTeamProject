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
	   $("#address2").atul("value", "주소체크");
}
      function jusoCallBack(zipNo,roadAddrPart1,addrDetail){
          document.form.zipNo.value = zipNo;
          document.form.roadAddrPart1.value = roadAddrPart1;
          document.form.addrDetail.value = addrDetail;
}    
    $(document).ready(function(){
			$("#submit1").on("click", function(){
					var name = /^[가-힣]+$/;        
			    	var pw = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,16}$/;

			    	var pwCh = $("#userPW").val();
			        var nameCH =  $("#userName").val();
			        var addr =  $("#emailAddr").val();
			        var Opt = $("#emailOpt").val();
			        // 두가지에 방식으로 만들었음. 
			 		if(false == name.test(nameCH) || nameCH == "") {
					alert('Please write your name in Korean');
					return false;
					}
			        if(!/^[a-zA-Z0-9]{6,16}$/.test($("#userID").val())){
					alert('You can use text(english), number, simbol from 6 to 16.');
					return false;
					} 
			    	if(false == pw.test(pwCh) || $("#userPW").val()=="") {
			    	alert('Your PW should be 6~16 long also You can use text(english), number, simbol.');
			    	return false;
			    	}
			    	if($("#pwCheck").val()=="") {
				    alert('Please check your PW');
				    return false;
				    }
			    	if(!/^[0-9]{6}$/.test($("#identification1").val())){
					alert('Please write your first identity number');
					return false;
					} 
			    	if(!/^[0-9]{7}$/.test($("#identification2").val())){
					alert('Please write your last identity number');
					return false;
					}
			    	
	if( !/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test($("#email").val())){
					alert('Please write as E-mail form(must write @)');
					return false;
					}
/* 			    	if( !/^@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test($("#emailAddr").val()) &&
					$("#emailOpt").val()==""){
					alert('이메일 형식에 맞게 입력해주시길 바랍니다.');
					return false;
					}
					if(addr != "" && Opt != ""){
					alert('이메일 형식에 맞게 입력해주시길 바랍니다.');
					return false;
					} */
					if(!/^[0-9]{4}$/.test($("#userPhone1").val())){
					alert('Please write your first mobile phone number');
					return false;
					}
					if(!/^[0-9]{4}$/.test($("#userPhone2").val())){
					alert('Please write your lasr mobile phone number');
					return false;
					}userPhone3
					if(!/^[0-9]{4}$/.test($("#userPhone3").val())){
					alert('Please write your first tel number');
					return false;
					}
					if(!/^[0-9]{4}$/.test($("#userPhone4").val())){
					alert('Please write your last tel number');
					return false;
					} 
			        var address2 = $("#address2").val();
				 	if(address2 == "주소찾기"){
					alert("Please click find button");
					return false;
					}if($("#zipNo").val() == ""){
					alert("Please click find button");
					return false;
					}
					if($("#roadAddrPart1").val() == ""){
					alert("Please click find button");
					return false;
					}
					if($("#addrDetail").val() == ""){
					alert("Please click find button");
					return false;
					}  
				    var idCheckVal = $("#idCheck").val();
				    if(idCheckVal == "중복확인"){
					alert("Please click id check button");
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
						alert("This id already exists");
					}else if(data == 0){
					if(!/^[a-zA-Z0-9]{6,16}$/.test($("#userID").val())){
						alert('You can use text(english), number, simbol from 6 to 16.');
						return false;
					}$("#idCheck").atul("value", "사용가능");
					alert("This id is available.");
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
                <li><p>About us</p> 
                <ul class="nav_ul_b">
                    <a href="#"><li>our goal</li></a>
                    <a href="#"><li>services</li></a>
                    <a href="#"><li>designed by</li></a>
                </ul>
                </li>
            </ul>
        </nav>      
        <nav class="ul_nav">
            <ul class="nav_ul">
                <li><p>Member</p> 
                <ul class="nav_ul_b">
                    <a href="authentication.html"><li>Sign up</li></a>
                    <a href="login.html"><li>login</li></a>
                </ul>
                </li>
            </ul>
        </nav> 
        <nav class="ul_nav">
            <ul class="nav_ul"> 
                <li><p>Property</p> 
                <ul class="nav_ul_b">
                    <a href="map.html"><li>map</li></a>
                    <a href="board_all.html"><li>board</li></a>
                    <a href="boardWrite.html"><li>write</li></a>
                </ul>
                </li>
            </ul>
        </nav> 
        <nav class="ul_nav">
            <ul class="nav_ul">
                <li><p>Services</p> 
                <ul class="nav_ul_b">
                    <a href="tips.html"><li>tip</li></a>
                    <a href=""><li>Language</li></a>
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
                    <li id="index"><p> Name</p></li>
                    <li ><input type="text" name="userName" id="userName" placeholder="write your Name"></li>
                </ul>
                <ul class="sign_upA" style="margin-top: 8px;" >
                    <li id="index"><p>ID</p></li>
                    <li ><input type="text" name="userID" id="userID" placeholder="write your ID" minlength="6" maxlength="16">                   
                    <button type="button" name="idCheck" id="idCheck" onclick="idCheck1();" value="중복확인">ID check</button></li>
                </ul>
                <ul class="sign_upA" style="margin-top: 8px;">                    
                    <li style="font-size: 14px; margin-left: 124px; color: rgb(192,192,192);">You can use text(english), number, simbol from 6 to 16.</li>
                </ul>                
                <ul class="sign_upA"style="margin-top: 8px;">
                    <li id="index"><p>PW</p></li>
                    <li ><input type="password" name="userPW" class="pw" id="userPW" placeholder="write your PW" minlength="6" maxlength="16"></li>
                </ul>
                <ul class="sign_upA"style="margin-top: 8px;">
                    <li style="font-size: 14px; margin-left: 124px; color: rgb(192,192,192);">Your PW should be 6~16 long also You can use text(english), number, simbol.</li>
                </ul>
                <ul class="sign_upA" style="margin-top: 8px;">
                    <li id="index"><p>PW check</p></li>
                    <li ><input type="password" name="pwCheck" class="pw" id="pwCheck"  minlength="6" maxlength="16"></li>
                    <li id="pw_wrong_msg"  style="display:inline;margin-left: 124px;font-size: 14px; color: red; display: none">Your PW has wrong.</li>
                    <li id="pw_right_msg"  style="display:inline; font-size: 14px; color: green; display: none">Your PW is accorded</li>
                </ul>
                <ul class="sign_upA" style="margin-top: 8px;">
                    <li id="index"><p>Identified Number</p></li>
                    <li ><input style="width: 127.5px;" type="text" name="identidication1" id="identification1" placeholder="first" minlength="6" maxlength="6">
                    <input style="width: 127.5px; type="password" name="identidication2" id="identification2" placeholder="last" minlength="7" maxlength="7"></li>
                </ul>
                <ul class="sign_upA" style="margin-top: 8px;">
                    <li id="index"><p>Email</p></li>
                    <li ><input type="text" name="email" id="email"  style="width: 268px;style="margin-left: 124px;""></li>                    
             <!--        <li ><input type="text" name="emailAddr" id="emailAddr"></li>                  
                    <li><select name="emailOpt" id="emailOpt">
                        <option value="">@직접입력</option>
                        <option value="@google.com">@google.com</option>
                        <option value="@daum.net">@daum.net</option>
                        <option value="@naver.com">@naver.com</option>
                    </select>    
                </li>     -->  
                </ul>
                <ul class="sign_upA" style="margin-top: 8px;">
                    <li id="index" ><p>Phone</p></li>
                    <li id="subindex" style="margin-left: 124px;">mobile</li>
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
                    <li id="subindex" style="margin-left: 124px;">telephone</li>
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
                    <li id="index"   id="address"><p>Address</p></li>
                    <li id="subindex" style="margin-left: 124px;">post number</li>  
                    <li ><input type="text" id="zipNo" name="zipNo" style="margin-left: 124px;">
                    <button type="button" id="addrfind" class="findaddr" onClick="goPopup();" style="width: 108px;">find address</button></li>
                 <input type="hidden" id="address2" value="주소찾기" />
                </ul>
                <ul class="sign_upA" style="margin-top: 8px;">
                    <li style="margin-left: 124px;">address</li>
                    <li id="addrInput"><input style="margin-left: 124px; width: 268px;" type="text" id="roadAddrPart1"  name="roadAddrPart1" ></li>
                </ul>                
                <ul class="sign_upA" style="margin-top: 8px;">
                    <li style="margin-left: 124px;">detail</li>
                    <li  id="addrInput"><input style="margin-left: 124px; width: 268px;" type="text" id="addrDetail"  name="addrDetail"></li>
                </ul>
       		</div>
            <div id="click">
            <button id="submit1" type="button" onclick="check()">Submit</button>
            <button id="reset" type="reset">Rewrite</button>            
            </div>   
        </form> 
        <!-- 회원가입부분 끝!-->   
    </section>
   
</body>
</html>