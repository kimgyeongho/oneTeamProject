<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="map"style="width: 300px; height: 300px;"></div>
<script type="text/javascript"
	src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=e8d7644008c73f334f88e4feecdbd1d8&libraries=services,clusterer,drawing"></script>
<script src="/resources/jquery/jquery-3.5.1.min.js"></script>
<script src="/resources/jquery/jquery-migrate-1.4.1.min.js"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(37.4860759059799, 126.92448237288), // 지도의 중심좌표
    level: 5 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
var marker = new kakao.maps.Marker();
var infowindow = new kakao.maps.InfoWindow({
    content: '<div style="width:150px;text-align:center;padding:6px 0;">1팀화이팅짱짱짱</div>'
});

//주소로 좌표를 검색합니다
function add(){
		document.getElementById('address').value="구로동로20길"
			var address_add =document.getElementById('address').value;
 		alert(address_add);
	  
	}
$(document).ready(function(){
$("#address").on("propertychange change", function(){
	var address_add =document.getElementById('address').value;
    geocoder.addressSearch(address_add,function(result,status){
    	// 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {

          var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		  marker.setPosition(coords);
		  marker.setMap(map);
           // 결과값으로 받은 위치를 마커로 표시합니다
           document.getElementById('lat').value=result[0].y;
           document.getElementById('lng').value=result[0].x;

        
    infowindow.close();
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
}
});
});    
}); 

</script>
<input type="text" id="address"/>
<input type="button" onclick="add()" value="위도,경도 찾기" />
<form action="sand" method="post">
	<p>위도</p>
	<input type="test" id="lat" name="lat" />
	<p>경도</p>
	<input type="test" id="lng" name="lng" />
	<button type="submit">제출하기</button>

</form>
