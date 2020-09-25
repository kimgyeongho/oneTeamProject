<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>나 홀로 집에</title>
    <link rel="stylesheet" href="resources/style.css">
    <script src="resources/jquery/jquery-3.5.1.min.js"></script>
    <script src="resources/jquery/jquery-migrate-1.4.1.min.js"></script>
    <script src="resources/jquery/jquery-ui.min.js"></script>
    <script src="resources/jquery/jstyle.js"></script>    
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
        <!-- 팁 부분 -->
        <div class="tipContainer">
            <a href="#"><img class="ready" src="img/tip1ready.png" alt="#"></a>
            <a href="#"><img class="doing" src="img/tip2.png" alt="#"></a>
            <a href="#"><img class="clear" src="img/tip3.png" alt="#"></a>
        </div>
        <section class="tip_all_container">
        <section class="tip_area_ready">
            <div class="tip_ready_container">
                <h1><한 달 전></h1>
                <ul class="tip_ready_check">
                    <h4>확인해 보세요</h4>
                    <li class="real_esteam_management"><input type="checkbox" value="부동산"><a href="#">부동산 관리하기</a></li>
                    <li class="town_trip"><input type="checkbox" value="주소 이전 신청하셨나요?"><a href="#">이사 갈 동네 알아보기</a></li>
                    <li class="move_service_management"><input type="checkbox" value="이사날짜 확정 받으셨나요?"><a href="#">이삿짐 업체 알아보기</a></li>
                </ul>
                <ul class="tip_ready_info">
                    <h4>거래 전 유의사항</h4>
                    <li>1. 계약기간이 남았더라도 계약서상 특별히 명시된 내용이 없다면 임대인이 수수료를 내는 것이 맞다는 판례가 있습니다.</li>
                    <li>2. 부동산 중개비는 매매가의 상한 0.5% 이므로 중개인과 협의하여 얼마든지 합리적으로 조절이 가능합니다. </li>
                    <li>3. 계약서 상의 특약이나 강제사항이 있는지 확인해 주세요. (유사시 불리한 처분을 받을 수 있습니다.)</li>
                    <li>4. 월세 및 관리비에 포함되어 있는 내용에는 어떤것이 있는지 확인해 주세요.</li>
                    <li>5. 계약서는 꼼꼼히 확인하시고 잘 보관해 주세요.</li>
                </ul>
                <section class="ready_hidden">  
                    <img class="hidden_gray_cross" src="img/cross_gray.png" alt="회색 화살표">                  
                    <div class="ready_move_choice">
                        <table class="ready_move_table">
                            <tr class="ready_move_tr">
                                <td colspan="2">남은 계약 기간이<br> 얼마나 되나요?</td>                                
                                <td colspan="4">
                                <input name="wasted_time" type="radio"/> 3 개월 이상
                                <input name="wasted_time" type="radio"/>1 개월~3 개월
                                <input name="wasted_time" type="radio"/>보름에서 1 개월
                                <input name="wasted_time" type="radio"/>보름 미만
                                </td>
                            </tr>
                            <tr class="ready_move_tr">
                                <td colspan="2">중도해지에 대한 특약사항이 있나요?</td>
                                <td colspan="2"><input name="wasted_contract" type="radio" style="margin-right: 10px; font-size: 10px;"/>아니오, 
                                특약사항이 없는 경우<br> 중도계약해지에 관한 비용은 집주인이 부담한다는 판례가 있습니다.</td>
                                <td colspan="2"><input name="wasted_contract" type="radio" style="margin-right: 10px; font-size: 10px;"/>예, 
                               계약서 상 명시된 내용 위반시 불리한 처우를 받을 수 있습니다.</td>
                            </tr>
                            <tr class="ready_move_tr">
                                <td colspan="2">부동산은 정하셨나요?</td>
                                <td colspan="4">가능한 여러 부동산을 둘러보세요. 원하는 방을 구체적으로 제시할수록 만족할 결과를 얻을 수 있을 거에요.</td>
                                
                            </tr>                            
                        </table>
                    </div>
                </section>
                <section class="ready_hidden2">  
                    <img class="hidden_gray_cross2" src="img/cross_gray.png" alt="회색 화살표">                  
                    <div class="ready_move_choice2">
                        <table class="ready_move_table2">
                            <tr class="ready_move_tr2">
                                <td colspan="2">금액대는 적절한가요?</td>                                
                                <td colspan="4">
                                <input name="wasted_point" type="radio" value="4"/>완전 만족
                                <input name="wasted_point" type="radio"value="3"/>그럭저럭 만족
                                <input name="wasted_point" type="radio"value="2"/>보통
                                <input name="wasted_point" type="radio"value="0"/>다른 곳 볼래요
                                </td>
                            </tr>
                            <tr class="ready_move_tr2">
                                <td colspan="2">교통은 어떤가요?</td>
                                <td colspan="4">
                                    <input name="wasted_point1" type="radio"value="4"/>완전 만족
                                    <input name="wasted_point1" type="radio"value="3"/>그럭저럭 만족
                                    <input name="wasted_point1" type="radio"value="2"/>보통
                                    <input name="wasted_point1" type="radio"value="0"/>다른 곳 볼래요
                                    </td>                                
                            </tr>
                            <tr class="ready_move_tr2">
                                <td colspan="2">치안은 어떤가요?</td>
                                <td colspan="4">
                                    <input name="wasted_point2" type="radio"value="4"/>완전 만족
                                    <input name="wasted_point2" type="radio"value="3"/>그럭저럭 만족
                                    <input name="wasted_point2" type="radio"value="2"/>보통
                                    <input name="wasted_point2" type="radio"value="0"/>다른 곳 볼래요
                                </td>
                            </tr>  
                            <tr class="ready_move_tr2">
                                <td colspan="2">편의시설은 어떤가요?</td>
                                <td colspan="4">
                                    <input name="wasted_point3" type="radio"value="4"/>완전 만족
                                    <input name="wasted_point3" type="radio"value="3"/>그럭저럭 만족
                                    <input name="wasted_point3" type="radio"value="2"/>보통
                                    <input name="wasted_point3" type="radio"value="0"/>다른 곳 볼래요
                                </td>
                            </tr> 
                            <tr class="ready_move_tr2">
                                <td colspan="2">공원 및 생활체육 시설은 어떤가요?</td>
                                <td colspan="4">
                                    <input name="wasted_point4" type="radio"value="4"/>완전 만족
                                    <input name="wasted_point4" type="radio"value="3"/>그럭저럭 만족
                                    <input name="wasted_point4" type="radio"value="2"/>보통
                                    <input name="wasted_point4" type="radio"value="0"/>다른 곳 볼래요
                                </td>
                            </tr> 
                            <tr class="ready_move_tr2">
                                <td colspan="2">방음은 어떤가요?</td>
                                <td colspan="4">
                                    <input name="wasted_point5" type="radio"value="4"/>완전 만족
                                    <input name="wasted_point5" type="radio"value="3"/>그럭저럭 만족
                                    <input name="wasted_point5" type="radio"value="2"/>보통
                                    <input name="wasted_point5" type="radio"value="0"/>다른 곳 볼래요
                                </td>
                            </tr>   
                            <tr class="ready_move_tr2">
                                <td colspan="2">건물관리는 어떤가요?</td>
                                <td colspan="4">
                                    <input name="wasted_point6" type="radio"value="4"/>완전 만족
                                    <input name="wasted_point6" type="radio"value="3"/>그럭저럭 만족
                                    <input name="wasted_point6" type="radio"value="2"/>보통
                                    <input name="wasted_point6" type="radio"value="0"/>다른 곳 볼래요
                                </td>
                            </tr>                          
                            <tr class="ready_move_tr2">
                                <td colspan="2">채광은 어떤가요?</td>
                                <td colspan="4">
                                    <input name="wasted_point7" type="radio"value="4"/>완전 만족
                                    <input name="wasted_point7" type="radio"value="3"/>그럭저럭 만족
                                    <input name="wasted_point7" type="radio"value="2"/>보통
                                    <input name="wasted_point7" type="radio"value="0"/>다른 곳 볼래요
                                </td>
                            </tr>  
                            <tr class="ready_move_tr2">
                                <td colspan="6" style="text-align: center;">
                                완전 만족 : 4점 | 그럭저럭 만족 : 3점 | 보통 : 2점 | 다른곳 볼래요 : 0점
                                </td>
                            </tr> 
                            <tr class="ready_move_tr2">
                                <td colspan="2">고객님의 만족도는</td>
                                <td colspan="4" class="total_point">
                                  <input id="totalScore" name="totalScore" value="totalScore">  
                                </td>
                            </tr>                        
                        </table>
                    </div>
                </section>
                <section class="ready_hidden3">  
                    <img class="hidden_gray_cross3" src="img/cross_gray.png" alt="회색 화살표">                  
                    <div class="ready_move_choice3">
                        <table class="ready_move_table3">
                            <tr class="ready_move_tr3">
                                <td colspan="2">버릴 짐과 가져갈 짐을 먼저 구분하세요.</td>                                
                                <td colspan="4">
                                    불필요한 이삿짐이 많을 수록 더 많은 비용과 노동을 투자해야만 해요.
                                </td>
                            </tr>
                            <tr class="ready_move_tr3">
                                <td colspan="2">대형 폐기물은 신고해서 버려야해요</td>
                                <td colspan="4">
                                   지역 주민센터를 방문하거나 인터넷으로 폐기물처리 날짜를 정할 수 있었요.
                                </td>
                            </tr>
                            <tr class="ready_move_tr3">
                                <td colspan="2">음식물 쓰레기도 미리미리</td>
                                <td colspan="4">두고두고 먹으려고 사놓았던 음식들도 떠날땐 결국 쓰레기가 된다는 점 잊지마세요.</td>
                            </tr>                            
                        </table>
                    </div>
                </section>
            </div>
            </section>
            <section class="tip_area_doing">
            <div class="tip_doing_container">
                <h1><1 주일 전></h1>                
                <ul class="tip_doing_check">
                    <h4>확인해 보세요</h4>
                    <li>집 주인과 이사 날짜와 시간을 확인하세요.</li>
                    <li>짐 정리를 시작하세요.</li>
                    <li>이전 설치를 신청하세요.</li>
                    <li>공과금을 정산하세요.</li>
                    <li>냉장고 정리는 미리 할수록 좋아요.</li>
                    <li>이사 업체와 시간을 확인하세요.</li>
                </ul>  
            </div>
            </section>
            <section class="tip_area_clear">
                <div class="tip_clear_container">
                <h1><정리하기></h1>
                <ul class="tip_clear_check">
                    <h4>확인해보세요</h4>
                    <li><input type="checkbox" value="a">잔금을 어떻게 처리할지 정했나요?</li>
                    <li><input type="checkbox" value="a">대형 쓰레기 봉투가 있으면 좋아요.</li>
                    <li><input type="checkbox" value="a">공과금은 정리하셨나요?</li>
                    <li><input type="checkbox" value="a">우편물 주소 변경을 신청 할 수 있어요.</li>
                    <li><input type="checkbox" value="a">만일에 대비해 현금을 약간 준비해주세요.</li>
                    <li><input type="checkbox" value="a">전입신고는 하셨나요?</li>
                </ul>
                <!-- <ul class="tip_clear_check">
                    <h4>마무리 유의사항</h4>
                    <li>#</li>
                    <li>#</li>
                    <li>#</li>
                    <li>#</li>
                    <li>#</li>
                </ul> -->
            </div>
            
        </section>
        <div class="tip_btn_area">
            <img src="img/close_w.png" alt="x버튼" id="tip_btn_left">
            <!-- <img src="img/arrowtipR.png" alt="좌측버튼" id="tip_btn_right"> -->
        </div>
        </section>
</body>
</html>