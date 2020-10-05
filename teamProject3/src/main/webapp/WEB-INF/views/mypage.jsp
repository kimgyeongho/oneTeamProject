<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    	  
    	  $("#submit1").on("click", function(){
        			if($("#userPW").val()==""){
        				alert("비밀번호를 입력하세요.");
        				$("#userPW").focus();
        				return false;
        			}
    			$.ajax({
					url : "/PassswordChange",
					type : "POST",
					dateType : "json",
					data : $("#delete").serializeArray(),
					success: function(data){
						
						if(data==false){
							alert("패스워드가 틀렸습니다.");
							return;
						}else{
							if(confirm("회원탈퇴하시겠습니까?")){
								$("#delete").submit();
							}
							
						}
					}
				})
				
			});
    	  $("#submit2").on("click", function(){
				if(!/^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,16}$/.test($("#userPW1").val())){
					alert("비밀번호는 6~16자 이어야 하며, 6~16자 영문(소문자), 숫자, 특수문자로 입력해주시길 바랍니다.");
					$("#userPW1").focus();
					return false;
				}
					if(confirm("비밀번호가 변경이 되고 로그아웃 됩니다.")){
					$("#pswwordCH").submit();
					return false;
				}
		});
    	  $("#submit3").on("click", function(){
			if(!/^[0-9]{4}$/.test($("#userPhone1").val())){
					alert("번호 앞자리 입력해주세요.");
					$("#userPhone1").focus();
					return false;
				}
				if(!/^[0-9]{4}$/.test($("#userPhone2").val())){
					alert("번호 뒷자리 입력해주세요.");
					$("#userPhone2").focus();
					return false;
				}
				if(confirm("번호 변경이 되고 로그아웃 됩니다.")){
					$("#firstNumCH").submit();
					return false;
				}
		});
    	  $("#submit4").on("click", function(){
		/* 		if($("#zipNo").val()==""){
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
 */			    var address2 = $("#address2").val();
			 	if(address2 == "주소찾기"){
				alert("주소찾기를 통해 주소를 찾아주세요");
				return false;
				}if($("#zipNo").val() ==""){
				alert("주소찾기를 통해 주소를 찾아주세요");
				return false;
				}
				if($("#roadAddrPart1").val() ==""){
				alert("주소찾기를 통해 주소를 찾아주세요");
				return false;
				}
				if($("#addrDetail").val() == ""){
				alert("주소찾기를 통해 주소를 찾아주세요");
				return false;
				}  
				if(confirm("주소가 변경이 되고 로그아웃 됩니다.")){
				$("#form").submit();
				return false;
				}
		});
	}) 
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
       <section class="mypage_section">
        <div class="mypage_1">
            <h3>회원 정보 보기</h3>
            <div class="static_info">
            <ul>
                <li>
                    <p>이름</p>
                    <input type="text" value="${user.userName}"/>
                </li>
                <li>
                    <p>아이디</p>
                    <input type="text" value="${user.userID}"/>
                </li>
                <li>
                    <p>이메일</p>
                    <input type="text" value="${user.email}<%-- ${user.emailAddr}${user.emailOpt} --%>"/>
                </li>
                <li>
                    <p>주소</p>
                    <input type="text" value="우편번호:${user.zipNo}주소:${user.roadAddrPart1}${user.addrDetail}"/>
                </li>
                 <li>
                    <p>연락처</p>
                    <input type="text" value="${user.firstNum1}-${user.userPhone1}-${user.userPhone2}"/>
                </li>
            </ul>
            </div>
                <!-- 회원 정보 변경사항을 보낼 form 태그 -->
<div class="flexible_info">
        <form class="change_pw" action="PassswordChange" method="post" id="pswwordCH">
                <input type="hidden" name="userID" value="${user.userID}"/>   
                <ul>
                <li>
                    <p>비밀번호</p>
                    <input type="password" name="userPW" id="userPW1"/>
                    <button id="submit2"type="button" style="width: 80px;height: 24px; margin-bottom: 0px; background: none; border-radius: 5px; background-color: rgb(102, 102, 102); line-height: 0px; color:white;">변경</button>
                </li>
                </ul>
        </form>
        <form class="change_num" action="NumberChange" method="post" id="firstNumCH" >
				 <input type="hidden" name="userID" value="${user.userID}"/>
            <ul>
                 <li>
                    <p>연락처</p>                    
                    <select name="firstNum1" id="firstNum">
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="022">022</option>
                    </select>       
                    <input   type="tel" id="userPhone1" name="userPhone1" style="width:90px" minlength="4" maxlength="4">
                    <input  type="tel" id="userPhone2" name="userPhone2" style="width:90px" minlength="4" maxlength="4">
                    <button id="submit3" type="button" style="width: 80px;height: 24px; margin-bottom: 0px; background: none; border-radius: 5px; background-color: rgb(102, 102, 102); line-height: 0px; color:white;">변경</button>
                </li>
            </ul>
        </form>                
        <form  class="change_addr" action="mypageUpdate" name="form" id="form" method="post">
                <input type="hidden" name="userID" value="${user.userID}"/>
            <ul>
                <li>
                    <p>우편번호</p>
                    <input type="text"  id="zipNo"  name="zipNo"/>
                    <button type="button" class="findaddr" onClick="goPopup();" style="width: 80px;height: 24px; margin-bottom: 0px; background: none; border-radius: 5px; background-color: rgb(102, 102, 102); line-height: 0px; color:white;">주소 찾기</button>
                </li>  
                <li>
                    <p>주소</p>
                   <input type="text" id="roadAddrPart1" name="roadAddrPart1" />
                </li>     
                <li>
                    <p>상세주소</p>
                   <input type="text"  id="addrDetail"  name="addrDetail"/>
                   <button  id="submit4" type="button" style="width: 80px;height: 24px; margin-bottom: 0px; background: none; border-radius: 5px; background-color: rgb(102, 102, 102); line-height: 0px; color:white;">변경</button>
                </li> 
            </ul> 
                             <input type="hidden" id="address2" value="주소찾기">
        </form>
        <form class="inform_delete" action="userDelete"method="post" id="delete">
            <ul>
                <li>
                    <p>회원탈퇴</p>
                   <input type="text" name="userID" value="${user.userID}" />
                   <input type="password" id="userPW" name="userPW" style="margin-top:12px" />
                   <button id="submit1" type="button" style="width: 80px;height: 24px; margin-bottom: 0px; background: none; border-radius: 5px; background-color: rgb(102, 102, 102); line-height: 0px; color:white;">탈퇴</button>
                </li>  
            </ul>
        </form> 
          	
            
</div>
            <!-- <div class="mypage_btn">
                <a href="#"><button >회원정보 변경</button></a> 
            </div>          -->
        </div>
        <!-- <div class="mypage_2">
            <h3>찜목록</h3>
            <div class="mypage_2scroll">
           <table class="mypage_2_table">
            <tr class="mypage_2_tr">
                <td>-</td>
                <td colspan="2">내용</td>
                <td>날짜</td>
            </tr>
            <tr class="mypage_2_tr">
                <td><img src="images/home.png" alt="매물 이미지"></td>
                <td colspan="2">내용</td>
                <td>날짜</td>
            </tr>
            <tr class="mypage_2_tr">
                <td><img src="#" alt="매물 이미지"></td>
                <td colspan="2">내용</td>
                <td>날짜</td>
            </tr>
            <tr class="mypage_2_tr">
                <td><img src="#" alt="매물 이미지"></td>
                <td colspan="2">내용</td>
                <td>날짜</td>
            </tr>
            <tr class="mypage_2_tr">
                <td><img src="#" alt="매물 이미지"></td>
                <td colspan="2">내용</td>
                <td>날짜</td>
            </tr>
            
           </table> 
         </div>
        </div>        
        <div class="mypage_3">
            <h3>서비스 이용안내</h3>
            <section class="service_section_btnAll">
                <button class="service_section_btnA">진행 중인 서비스</button>
                <button class="service_section_btnB">종료 된 서비스</button>
            </section>
            <section class="service_sectionA">
                <div class="sectionA_container">
                <table class="sectionA_table">
                    <tr class="sectionA_tr"> 
                        <td style="text-align: center;">이름</td>
                        <td style="text-align: center;">내용</td>
                        <td style="text-align: center;">날짜</td>
                    </tr>
                    <tr class="sectionA_tr">
                        <td>##</td>
                        <td>####</td>
                        <td>##</td>
                    </tr>
                    <tr class="sectionA_tr">
                        <td>##</td>
                        <td>####</td>
                        <td>##</td>
                    </tr>
                                 
                </table>
            </div>
            </section> 
            <section class="service_sectionB">
                <div class="sectionB_container">
                <table class="sectionB_table">
                    <tr class="sectionB_tr"> 
                        <td style="text-align: center;">이름</td>
                        <td style="text-align: center;">내용</td>
                        <td style="text-align: center;">날짜</td>
                    </tr>
                    <tr class="sectionB_tr">
                        <td>$$</td>
                        <td>$$$$</td>
                        <td>$$</td>
                    </tr>
                              
                </table>
            </div>
            </section>          
        </div> -->
    </section>        
                 
    </section>
    
    <!-- <footer>-->
        <!-- <footer>       
            <div class="footerright">
                <table>
                <tr>
                    <td>프로젝트</td>
                    <td>####</td>
                </tr>
                <tr>
                    <td>팀명</td>
                    <td>####</td>
                </tr>
                <tr>
                    <td>팀장</td>
                    <td>####</td>
                </tr>
                <tr>
                    <td>팀원</td>
                    <td>####</td>
                </tr>
            </table>  
        </div>
    </footer> -->
</body>
</html>