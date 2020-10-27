<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나 홀로 집에</title>
<link rel="stylesheet" href="/resources/css/style.css">
<script src="/resources/jquery/jquery-3.5.1.min.js"></script>
<script src="/resources/jquery/jquery-migrate-1.4.1.min.js"></script>
<script src="/resources/jquery/jquery-ui.min.js"></script>
<script src="/resources/jquery/jstyle.js"></script>
<script type="text/javascript"src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=e8d7644008c73f334f88e4feecdbd1d8&libraries=services,clusterer,drawing"></script>

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
                  </ul></li>
            </ul>
         </nav>
         <nav class="ul_nav">
            <ul class="nav_ul">
               <li><p>회원관리</p>
                  <ul class="nav_ul_b">
                     <a href="authentication.do"><li>회원가입</li></a>
                     <a href="login.do"><li>로그인</li></a>
                  </ul></li>
            </ul>
         </nav>
         <nav class="ul_nav">
            <ul class="nav_ul">
               <li><p>부동산</p>
                  <ul class="nav_ul_b">
                     <a href="map.do"><li>지도보기</li></a>
                     <a href="board_all.do"><li>게시판</li></a>
                     <c:if test="${user != null}">
                        <a href="boardWrite.do"><li>글쓰기</li></a>
                     </c:if>
                  </ul></li>
            </ul>
         </nav>
         <nav class="ul_nav">
            <ul class="nav_ul">
               <li><p>서비스</p>
                  <ul class="nav_ul_b">
                     <a href="tips.do"><li>팁</li></a>
                     <a href=""><li>언어 / Language</li></a>
                  </ul></li>
            </ul>
         </nav>
      </div>
      <div class="div_allow">
         <img id="nav_left_arrow" src="resources/img/arrow_left_w.png"
            alt="왼쪽화살표"> <img id="nav_right_arrow"
            src="resources/img/arrow_right_w.png" alt="오른쪽화살표">
      </div>
   </header>
   
      <!-- 게시판 작성 부분 -->
      <div class="board_table">
         <form action="boardupdate2.do" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
             <table class="boardWrite_table">
               <tr class="boardWrite_table_tr">
                  <td class="boardWrite_index">제목</td>
                  <td><input type="text" name="title" value="${board.title}"></input></td>
               </tr>
          <tr class="boardWrite_table_tr">
                  <td class="boardWrite_index">카테고리</td>
                    <td><select name="content_character" id="content_character">
                        <option>${board.content_character}</option>
                        <option>원룸</option>
                        <option>투룸</option>             
                  </select></td>
                 		<td></td>
               </tr>
               <tr class="boardWrite_table_tr">
                  <td class="boardWrite_index">카테고리</td>
                        <td><select name="content_character2" id="content_character">                        
                        <option>${board.content_character2}</option>                      
                        <option>계약 기간 6개월 이상</option>
                        <option>계약 기간 6개월 미만</option>
                  </select></td>                  		
               </tr>
            <tr class="boardWrite_table_tr">
                  <td class="boardWrite_index">아이디</td>
				  <td>${board.userID}</td>		
               </tr>
             <tr class="boardWrite_table_tr">
                  <td class="boardWrite_index">내용</td>
                  <td><textarea class="boardWrite_textarea" cols="5" rows="11"
                        maxlength="15000" name="content">${board.content}</textarea></td>
                 
               </tr>
               <tr class="boardWrite_table_tr">
                  <td class="boardWrite_index">주소</td>
                  <td><input type="text" name="address" id="address" value="${board.address}"></input><td>              						
               </tr>		
               <tr>
                  <td colspan="2" id="boardmap" style="width: 600px; height: 300px;">
                  <input type="hidden" id="lat" name="lat" /></td>
                  <td><input type="hidden" id="lng" name="lng" />
                  </td>                  
                  <tr class="boardWrite_table_tr">
                  <td class="boardWrite_index">사진올리기</td>
               </tr>
                 <tr class="boardWrite_table_tr">
       			<td><input type="file" name="imgFile" accept="image/*" onchange="loadFile(event)"></td>           
         	    <td><img id="output1" class="output"/></td>
         	    </tr>
         	     <tr class="boardWrite_table_tr">
       			<td><input type="file" name="imgFile2" accept="image/*" onchange="loadFile2(event)"></td>           
         	    <td><img id="output2" class="output"/></td>
         	    </tr>
         	     <tr class="boardWrite_table_tr">
       			<td><input type="file" name="imgFile3" accept="image/*" onchange="loadFile3(event)"></td>           
         	    <td><img id="output3" class="output"/></td>
         	    </tr>
               </tr>             
            </table>      
         <!-- 보드 검색창 버튼 부분 -->
         <div class="boardWrite_btn_container">
            <button type="submit" class="board_search_btn">수정 올리기</button>
         </div>
      </div>
         </form>
   


</body>
</html>
<script>
   var mapContainer = document.getElementById('boardmap'), // 지도를 표시할 div 
   mapOption = {
      center : new kakao.maps.LatLng(37.4860759059799, 126.92448237288), // 지도의 중심좌표
      level : 5
   // 지도의 확대 레벨
   };

   //지도를 생성합니다    
   var map = new kakao.maps.Map(mapContainer, mapOption);

   //주소-좌표 변환 객체를 생성합니다
   var geocoder = new kakao.maps.services.Geocoder();
   var marker = new kakao.maps.Marker();
   var infowindow = new kakao.maps.InfoWindow({content : '<div style="width:150px;text-align:center;padding:6px 0;">우리집</div>'});

$(document).ready(function() {
$("#address").on("propertychange keyup change",function() {
var address_add = document.getElementById('address').value;
geocoder.addressSearch(address_add,function(result,status) {
// 정상적으로 검색이 완료됐으면 
if (status === kakao.maps.services.Status.OK) {
var coords = new kakao.maps.LatLng(result[0].y,result[0].x);
marker.setPosition(coords);
marker.setMap(map);
// 결과값으로 받은 위치를 마커로 표시합니다
document.getElementById('lat').value = result[0].y;
document.getElementById('lng').value = result[0].x;
infowindow.close();
infowindow.open(map,marker);
// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
map.setCenter(coords);
}
});
});
});
var loadFile = function(event) {
	  var reader = new FileReader();
	  reader.onload = function(){
	    var output = document.getElementById('output1');
	    output.src = reader.result;
	  };
	  reader.readAsDataURL(event.target.files[0]);
	};
	var loadFile2 = function(event) {
		    var reader = new FileReader();
		    reader.onload = function(){
		      var output = document.getElementById('output2');
		      output.src = reader.result;
		    };
		    reader.readAsDataURL(event.target.files[0]);
		  };
		  var loadFile3 = function(event) {
			    var reader = new FileReader();
			    reader.onload = function(){
			      var output = document.getElementById('output3');
			      output.src = reader.result;
			    };
			    reader.readAsDataURL(event.target.files[0]);
			  };
</script>