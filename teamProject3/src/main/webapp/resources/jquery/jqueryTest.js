$(function() { 

    $(".navi>img").click(function(){
        $("#icon-bar").slideDown();
    });
    $("#up").click(function(){
        $("#icon-bar").slideUp();
    });

    //평점 노출 알고리즘//
    $(".icon>a>#home").mouseover(function () { 
        $(".homeinfo").stop().slideDown()
    });
    $(".icon>a>#home").mouseout(function () { 
        $(".homeinfo").stop().slideUp()
    });
    $(".icon>a>#men").mouseover(function () { 
        $(".meninfo").stop().slideDown()
    });
    $(".icon>a>#men").mouseout(function () { 
        $(".meninfo").stop().slideUp()
    });
    $(".icon>a>#star").mouseover(function () { 
        $(".starinfo").stop().slideDown()
    });
    $(".icon>a>#star").mouseout(function () { 
        $(".starinfo").stop().slideUp()
    });

    });


   
//비밀번호 확인하는 알고리즘
$(function(){    
    $(".pw").focusout(function(){
        var pwd1 = $("#userPW").val();
        var pwd2 = $("#pwCheck").val();
        if(pwd1 !='' && pwd2 == ''){
            null;
        }else if(pwd1 !='' && pwd2 != ''){
            if(pwd1 != pwd2){
                $("#pw_wrong_msg").show();
            }else{
                $("#pw_wrong_msg").hide();
            }
        }
    
    //=========================================================
    //  $('.pw').focusout(function () {
    //      var pwd1 = $("#userPW").val();
    //      var pwd2 = $("#pwCheck").val();
 
    //      if ( pwd1 != '' && pwd2 == '' ) {
    //          null;
    //      } else if (pwd1 != "" || pwd2 != "") {
    //          if (pwd1 == pwd2) {
    //              // $("#alert-success").css('display', 'inline-block');
    //              // $("#alert-danger").css('display', 'none');
    //              null;
    //          } else {
    //              alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                
    //              // $("#alert-success").css('display', 'none');
    //              // $("#alert-danger").css('display', 'inline-block');
    //          }            
    //      }
    //=========================================================
    });
    $('.board_div>.board_btn_cata').click(function(){        
        $(".board_contentB").slideDown();
        $(".board_section").css({"background":"linear-gradient(rgb(110, 115, 110),rgb(90, 95, 90),rgb(50, 55, 50),rgb(30, 35, 30)"})
        $(".board_contentA").css({"display":"none"});
    })
    $('.board_div>.board_btn_all').click(function(){
        $(".board_contentA").slideDown();
        $(".board_section").css({"background":"linear-gradient(rgb(255, 255, 255),white,rgb(250, 255, 249),rgb(239, 243, 234))"})
        $(".board_contentB").css({"display":"none"});
    })      
   
   
});
//거래꿀팁 좌우 슬라이드 알고리즘
$(function(){
    var ta=$(".tip_all_container")
    var t1=$(".tip_area_ready")
    var t2=$(".tip_area_doing")
    var t3=$(".tip_area_clear")
    
    var num=0;

$("#tip_btn_left").click(function(){
    $(".tip_all_container").hide();
})
    
var a1= $(".ready").click(function(){
    ta.fadeIn(500);
    t1.fadeIn(500);    
        
})
var a2=$(".doing").click(function(){    
    ta.fadeIn(500);
    t1.hide();
    t2.fadeIn(500);       
    t3.hide();
})
var a3=$(".clear").click(function(){
    ta.fadeIn(500);
    t1.hide();
    t2.hide();
    t3.fadeIn(500);      
})
   
});
function initialize() {
    var myLatlng = new google.maps.LatLng(37.485841, 126.897238);
    var myOptions = {
     zoom: 15,
     center: myLatlng,
     mapTypeId: google.maps.MapTypeId.TERRAIN
    }
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    // var marker = new google.maps.Marker( {
    //  position: myLatlng, 
    //  map: map, 
    //  title:"(주)서울"
    // });   
    // var infowindow = new google.maps.InfoWindow( {
    //  content: "(주)서울시 마포구"
    // });
    infowindow.open(map,marker);
   }
   window.onload=function() {
    initialize();
   }

//마이페이지 탭 메뉴 알고리즘=============================================
$(function(){
    $(".service_section_btnB").click(function(){
        $(".sectionB_container").slideDown(1000);
        $(".sectionA_container").hide();
    })
    $(".service_section_btnA").click(function(){
        $(".sectionA_container").slideDown(1000);
        $(".sectionB_container").hide();
    })
});

//주소입력시 팝업이 뜨는 메서드
function goPopup() {
    var pop = window.open("popup/jusoPopup.jsp", "pop",
          "width=570,height=420, scrollbars=yes, resizable=yes");
 }
 function jusoCallBack(roadFullAddr) {
    document.form.roadFullAddr.value = roadFullAddr;
 }

 //팁 숨김 메뉴 드러내기
 $(function(){
    $(".hidden_gray_cross").click(function(){
        $(".ready_hidden").hide(500);
    });
    $(".real_esteam_management").click(function(){
        $(".ready_hidden").show(500);      
    });
    $(".hidden_gray_cross2").click(function(){
        $(".ready_hidden2").hide(500);
    });
    $(".town_trip").click(function(){
        $(".ready_hidden2").show(500);      
    });
    $(".hidden_gray_cross3").click(function(){
        $(".ready_hidden3").hide(500);
    });
    $(".move_service_management").click(function(){
        $(".ready_hidden3").show(500);      
    });   
 });
 //점수 계산하기
 $(function(){
    var score;
    var score2;
    var score3;
    var score4;
    var score5;
    var score6;
    var score7;
    var score8;
    var totalScore=score+score2+score3+score4+score5+score6+score7+score8;

    score=$(".ready_move_tr2>input").name(wasted_point).checked().value();
    score2=$(".ready_move_tr2>input").name(wasted_point1).checked().value();
    score3=$(".ready_move_tr2>input").name(wasted_point2).checked().value();
    score4=$(".ready_move_tr2>input").name(wasted_point3).checked().value();
    score5=$(".ready_move_tr2>input").name(wasted_point4).checked().value();
    score6=$(".ready_move_tr2>input").name(wasted_point5).checked().value();
    score7=$(".ready_move_tr2>input").name(wasted_point6).checked().value();
    score8=$(".ready_move_tr2>input").name(wasted_point7).checked().value();
    
    $("#totalScore").getElementBy("#totalScore");
 });
