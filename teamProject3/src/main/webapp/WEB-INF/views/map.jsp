<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나 홀로 집에</title>
    <link rel="stylesheet" href="style.css">
    <script src="jquery/jquery-3.5.1.min.js"></script>
    <script src="jquery/jquery-1.11.0.js"></script>
    <script src="jquery/jquery-migrate-1.4.1.min.js"></script>
    <script src="jquery/jquery-ui.min.js"></script>
    <script src="jquery/jstyle.js"></script>
    <!-- <script src="jquery/jmap.js"></script> -->
    <script src="jquery/fullsdk.js"></script>
    <script src="jquery/map_service.js"></script>
    

</head>
<body>
    <header>
        <div class="header_container">
        <a href="main.html">
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
            <img id="nav_left_arrow" src="img/arrow_left_w.png" alt="왼쪽화살표">
            <img id="nav_right_arrow"src="img/arrow_right_w.png" alt="오른쪽화살표">
        </div>    
    </header>    
    <section class="all_body_section">    
        <div class="map_wrap">
            <div id="map"></div>
            <ul id="category">
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
            </ul>
        </div>
        <p class="map_p">
            <button class="map_btn" onclick="setOverlayMapTypeId('traffic')">교통정보 보기</button> 
            <button class="map_btn" onclick="setOverlayMapTypeId('roadview')">로드뷰 도로정보 보기</button> 
            <button class="map_btn" onclick="setOverlayMapTypeId('terrain')">지형정보 보기</button>
            <button class="map_btn" onclick="setOverlayMapTypeId('use_district')">지적편집도 보기</button>
            <button onclick="hideMarkers()">마커 감추기</button>
            <button onclick="showMarkers()">마커 보이기</button>
        </p>    
        <p id="result"></p>    
    </section> 
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eebca8bc6ea1c503c7974e25d7381936"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=eebca8bc6ea1c503c7974e25d7381936&libraries=services,clusterer,drawing"></script>  
    
    <!-- 지도를 구성하는 스크립트문(쿼리x) -->
    
<script>
// 1.지도를 생성함############################################################################################
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                level: 7 // 지도의 확대 레벨
            };
        
        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 2.컨트롤러 생성함############################################################################################

        // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        var mapTypeControl = new kakao.maps.MapTypeControl();

        // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
                
// 3.지도 유형을 변경할 수 있는 버튼 생성함############################################################################################

        // 지도에 추가된 지도타입정보를 가지고 있을 변수입니다
        var currentTypeId;
        
        // 버튼이 클릭되면 호출되는 함수입니다
        function setOverlayMapTypeId(maptype) {
            var changeMaptype;
            
            // maptype에 따라 지도에 추가할 지도타입을 결정합니다
            if (maptype === 'traffic') {            
                
                // 교통정보 지도타입
                changeMaptype = kakao.maps.MapTypeId.TRAFFIC;     
                
            } else if (maptype === 'roadview') {        
                
                // 로드뷰 도로정보 지도타입
                changeMaptype = kakao.maps.MapTypeId.ROADVIEW;    
        
            } else if (maptype === 'terrain') {
                
                // 지형정보 지도타입
                changeMaptype = kakao.maps.MapTypeId.TERRAIN;    
        
            } else if (maptype === 'use_district') {
                
                // 지적편집도 지도타입
                changeMaptype = kakao.maps.MapTypeId.USE_DISTRICT;           
            }
            
            // 이미 등록된 지도 타입이 있으면 제거합니다
            if (currentTypeId) {
                map.removeOverlayMapTypeId(currentTypeId);    
            }
            
            // maptype에 해당하는 지도타입을 지도에 추가합니다
            map.addOverlayMapTypeId(changeMaptype);
            
            // 지도에 추가된 타입정보를 갱신합니다
            currentTypeId = changeMaptype;        
            } 

// 4.마커를 생성함############################################################################################
            
           // 지도를 클릭한 위치에 표출할 마커입니다
            var marker = new kakao.maps.Marker({ 
                // 지도 중심좌표에 마커를 생성합니다 
                position: map.getCenter() 
            }); 
            // 지도에 마커를 표시합니다
            marker.setMap(map);

            // 지도에 클릭 이벤트를 등록합니다
            // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
            kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
            // 클릭한 위도, 경도 정보를 가져옵니다 
            var latlng = mouseEvent.latLng; 
            
            // 마커 위치를 클릭한 위치로 옮깁니다
            marker.setPosition(latlng);
                        
            // var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
            // message += '경도는 ' + latlng.getLng() + ' 입니다';
            
            // var resultDiv = document.getElementById('clickLatlng'); 
            // resultDiv.innerHTML = message;
            
            });
            
// 5.마우스를 올리면 이벤트 생성############################################################################################
 
            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                content : iwContent
            });

           
// 6.마우스를 올리면 이벤트 생성############################################################################################
            var iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/,37.566826, 126.9786567" style="color:blue" target="_blank">다음 지도로 보기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                iwPosition = new kakao.maps.LatLng(); //인포윈도우 표시 위치입니다

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                position : iwPosition, 
                content : iwContent 
            });
            
            // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
            infowindow.open(map, marker);  

// 7.여러개 마커 생성/삭제############################################################################################      
            // 지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
            kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
                // 클릭한 위치에 마커를 표시합니다 
                addMarker(mouseEvent.latLng);             
            });
                        
            // 지도에 표시된 마커 객체를 가지고 있을 배열입니다
            var markers = [];

            // 마커 하나를 지도위에 표시합니다 
            addMarker(new kakao.maps.LatLng(33.450701, 126.570667));

            // 마커를 생성하고 지도위에 표시하는 함수입니다
            function addMarker(position) {
                
                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                    position: position
                });

                // 마커가 지도 위에 표시되도록 설정합니다
                marker.setMap(map);
                
                // 생성된 마커를 배열에 추가합니다
                markers.push(marker);
            }

            // 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
            function setMarkers(map) {
                for (var i = 0; i < markers.length; i++) {
                    markers[i].setMap(map);
                }            
            }

            // "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
            function showMarkers() {
                setMarkers(map)    
            }

            // "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
            function hideMarkers() {
                setMarkers(null);    
            }       
// // 7.여러개 마커 이벤트 조절 ######################################################################################

            // var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
            //     MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
            //     OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
            //     OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
            //     OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
            //     OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
            //     OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
            //     OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
            //     SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
            //     SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
            //     SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
            //     SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

            // var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
            //     markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
            //     overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
            //     overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
            //     spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기

            // var positions = [  // 마커의 위치
            //         new kakao.maps.LatLng(33.44975, 126.56967),
            //         new kakao.maps.LatLng(33.450579, 126.56956),
            //         new kakao.maps.LatLng(33.4506468, 126.5707)
            //     ],
            //     selectedMarker = null; // 클릭한 마커를 담을 변수

            // var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            //     mapOption = { 
            //         center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            //         level: 3 // 지도의 확대 레벨
            //     };

            // var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            // // 지도 위에 마커를 표시합니다
            // for (var i = 0, len = positions.length; i < len; i++) {
            //     var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
            //         originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
            //         overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
            //         normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
            //         clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
            //         overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
                    
            //     // 마커를 생성하고 지도위에 표시합니다
            //     addMarker(positions[i], normalOrigin, overOrigin, clickOrigin);
            // }

            // // 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
            // function addMarker(position, normalOrigin, overOrigin, clickOrigin) {

            //     // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
            //     var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
            //         overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
            //         clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);
                
            //     // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
            //     var marker = new kakao.maps.Marker({
            //         map: map,
            //         position: position,
            //         image: normalImage
            //     });

            //     // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
            //     marker.normalImage = normalImage;

            //     // 마커에 mouseover 이벤트를 등록합니다
            //     kakao.maps.event.addListener(marker, 'mouseover', function() {

            //         // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
            //         // 마커의 이미지를 오버 이미지로 변경합니다
            //         if (!selectedMarker || selectedMarker !== marker) {
            //             marker.setImage(overImage);
            //         }
            //     });

            //     // 마커에 mouseout 이벤트를 등록합니다
            //     kakao.maps.event.addListener(marker, 'mouseout', function() {

            //         // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
            //         // 마커의 이미지를 기본 이미지로 변경합니다
            //         if (!selectedMarker || selectedMarker !== marker) {
            //             marker.setImage(normalImage);
            //         }
            //     });

            //     // 마커에 click 이벤트를 등록합니다
            //     kakao.maps.event.addListener(marker, 'click', function() {

            //         // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
            //         // 마커의 이미지를 클릭 이미지로 변경합니다
            //         if (!selectedMarker || selectedMarker !== marker) {

            //             // 클릭된 마커 객체가 null이 아니면
            //             // 클릭된 마커의 이미지를 기본 이미지로 변경하고
            //             !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

            //             // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
            //             marker.setImage(clickImage);
            //         }

            //         // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
            //         selectedMarker = marker;
            //     });
            // }

            // // MakrerImage 객체를 생성하여 반환하는 함수입니다
            // function createMarkerImage(markerSize, offset, spriteOrigin) {
            //     var markerImage = new kakao.maps.MarkerImage(
            //         SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
            //         markerSize, // 마커의 크기
            //         {
            //             offset: offset, // 마커 이미지에서의 기준 좌표
            //             spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
            //             spriteSize: spriteImageSize // 스프라이트 이미지의 크기
            //         }
            //     );
                
            //     return markerImage;
            // }                      
//9. 지도에 정보 나열하기##################################################################################################################
// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
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
</script> 
    
</body>
</html>