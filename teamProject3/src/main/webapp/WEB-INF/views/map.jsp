<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
   
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>카테고리별 장소 검색하기</title>
    <link rel="stylesheet" href="resources/css/style.css">
</head>
<body>
<script type="text/javascript"
   src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=e8d7644008c73f334f88e4feecdbd1d8&libraries=services,clusterer,drawing"></script>
<script src="resources/jquery/jquery-3.5.1.min.js"></script>
<script src="resources/jquery/jquery-migrate-1.4.1.min.js"></script>
<script src="resources/jquery/jquery-ui.min.js"></script>
<script src="resources/jquery/jstyle.js"></script>

<header>
        <div class="header_container">
        <a href="/">
            <div class="header_logo">
            <!-- <img src="img/logo.png" alt="로고"> -->
            </div>
        </a>   
        <div class="user_information">
           <c:if test="${user != null}">        
           <a href="mypage.do">           
           <h3>${user.userID}님 마이페이지</h3>
           </a>            
           </c:if>
           <c:if test="${result != null}">        
           <a href="mypage.do">           
           <h3 id=name></h3>
           </a>            
           </c:if>
        </div>
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
                     <c:if test="${user == null}">
                    <a href="login.do"><li>로그인</li></a>
                     </c:if> 
                      <c:if test="${user != null}">
                    <a onclick="logout();"><li>로그아웃</li></a>
                     </c:if>           
                     
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
             <c:if test="${user != null}">        
                    <a href="boardWrite.do"><li>글쓰기</li></a>
                               </c:if>
                    
                </ul>
                </li>
            </ul>
        </nav> 
        <nav class="ul_nav">
            <ul class="nav_ul">
                <li><p>서비스</p> 
                <ul class="nav_ul_b">
                    <a href="tips.do"><li>팁</li></a>
                  
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
      <div class="page_name"
         style="background-image: url(/resources/img/map.png);">
         <h1>지도</h1>
      </div>
      
<div class="map_wrap" >
   <div id="map" >         
</div>
    <ul id="category" style="left: 61px; top: 50px; ">
        <li id="BK9" data-order="0"> 
            <span class="category_bg bank"></span>
            은행
        </li>       
        <li id="MT1" data-order="1"> 
            <span class="category_bg mart"></span>
            마트
        </li>  
        <li id="PM9" data-order="2"> 
            <span class="category_bg pharmacy"></span>
            약국
        </li>  
        <li id="OL7" data-order="3"> 
            <span class="category_bg oil"></span>
            주유소
        </li>  
        <li id="CE7" data-order="4"> 
            <span class="category_bg cafe"></span>
            카페
        </li>  
        <li id="CS2" data-order="5"> 
            <span class="category_bg store"></span>
            편의점
        </li> 
        <li>
        교통 정보 보기
        <input  type="checkbox" id="chkTraffic" onclick="setOverlayMapTypeId()" />
        </li>     
    </ul>
    </div>
    <div class="m_communication" >
<button style="float: left; width: 84px; height:30px;"
                  type="button" value="검색창">검색창</button> 
                 
           <form>
      <input style=" float: left; width: 442px; height:25px;" type="text"
                  id="serchKeyword" name="serchKeyword" placeholder="검색어를 입력하세요"
                  onkeyup="selectmapboard()" />
                  </form>
            <table class="map_com" id="map_com_board">
            <c:forEach items="${resultList}" var="board">
               <tr id="map_tr">
               <td  style="width: 204px;">
                  <a href="getBoard.do?seq=${board.seq}" onmouseover="abc(this)"><img  style="width:204px;"src="data:image/png;base64,${board.strImg}"></a></td>
              <td class="lat" style='display: none;'>${board.lat}</td>
               <td class="lng" style='display: none;'>${board.lng}</td>
             
               <td colspan="2">
               <ul style="list-style: none; margin-left: 8px;">
               <li style="text-decoration: none;"><h2 style= "font-size: 18px;">${board.content_character}</h2></li>
               <li style="text-decoration: none;"><h2 style= "font-size
               : 18px;">${board.content_character2}</h2></li>
               <li style="text-decoration: none;"><h2 style= "font-size: 28px;">${board.title}</h2></li>
               <li style="text-decoration: none;"><h2 style= "font-size: 18px;">${board.address}</h2></li>
            
               </ul>
               </td>
               <td style="width: 64px;"><h2 style= "font-size: 11px;">${board.regDate}</h2></td>
               </tr>               
               </c:forEach>                                                
            </table>
         </div>
</div>
</section>
<script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eebca8bc6ea1c503c7974e25d7381936&libraries=services,clusterer,drawing"></script>

<script>
var changeMaptype;



// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };  

    
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 




var imageSrc = '/resources/img/KakaoTalk.png', // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(27, 28); // 마커이미지의 크기입니다
  
//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

//마커를 생성합니다















//마커 클러스터러를 생성합니다
// 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
// 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
// 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
// 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
    minLevel: 5, // 클러스터 할 최소 지도 레벨
    disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
});

// 데이터를 가져오기 위해 jQuery를 사용합니다
// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
         $.get("/resources/json/json.json", function(data) {
    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
    var markers2 = $(data.positions).map(function(i, position) {
        return new kakao.maps.Marker({
            position : new kakao.maps.LatLng(position.lat, position.lng),
            image: markerImage 
        });
    });
  
    // 클러스터러에 마커들을 추가합니다
    clusterer.addMarkers(markers2);
});

// 마커 클러스터러에 클릭이벤트를 등록합니다
// 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
// 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

    // 현재 지도 레벨에서 1레벨 확대한 레벨
    var level = map.getLevel()-1;

    // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
    map.setLevel(level, {anchor: cluster.getCenter()});
});





























// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

// 지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');

    

    for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
                kakao.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 








//지도 타입 정보를 가지고 있을 객체입니다
//map.addOverlayMapTypeId 함수로 추가된 지도 타입은
//가장 나중에 추가된 지도 타입이 가장 앞에 표시됩니다
//이 예제에서는 지도 타입을 추가할 때 지적편집도, 지형정보, 교통정보, 자전거도로 정보 순으로 추가하므로
//자전거 도로 정보가 가장 앞에 표시됩니다
var mapTypes = {
terrain : kakao.maps.MapTypeId.TERRAIN,    
traffic :  kakao.maps.MapTypeId.TRAFFIC,
bicycle : kakao.maps.MapTypeId.BICYCLE,
useDistrict : kakao.maps.MapTypeId.USE_DISTRICT
};

//체크 박스를 선택하면 호출되는 함수입니다
function setOverlayMapTypeId() {
var    chkTraffic = document.getElementById('chkTraffic');


// 지도 타입을 제거합니다
for (var type in mapTypes) {
    map.removeOverlayMapTypeId(mapTypes[type]);    
}

// 교통정보 체크박스가 체크되어있으면 지도에 교통정보 지도타입을 추가합니다
if (chkTraffic.checked) {
    map.addOverlayMapTypeId(mapTypes.traffic);    
}

}  
 function abc(e){
    var lng = $(e).parent().siblings('.lng').text();
    var lat = $(e).parent().siblings('.lat').text();

	var imageSrc3 = '/resources/img/KakaoTalk_2.png', // 마커이미지의 주소입니다    
	imageSize3 = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
	imageOption3 = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	  
	//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage3 = new kakao.maps.MarkerImage(imageSrc3, imageSize3, imageOption3),
	markerPosition3 = new kakao.maps.LatLng(lng, lat); // 마커가 표시될 위치입니다

	//마커를 생성합니다
	var marker3 = new kakao.maps.Marker({
	position: markerPosition3, 
	image: markerImage3, // 마커이미지 설정 
	zIndex: 1
	});
	
	$("button").on({				// 모든 <button>요소에
		mouseenter: function() {	// mouseenter 이벤트를 설정함.
			
			//마커가 지도 위에 표시되도록 설정합니다
			marker3.setMap(map);  		
		},
		mouseleave: function() {	// mouseleave 이벤트를 설정함.
			marker3.setMap(null);
		}
	});
	}
	
	



</script>
</body>
</html>