$(function() { 
    // 헤더 노출부분================================================
    $("#nav_right_arrow").click(function(){
        $(".header_container").show(500);
        $("#nav_right_arrow").hide();
    });
    $("#nav_left_arrow").click(function(){
        $(".header_container").hide(500);
        $("#nav_right_arrow").show();
    });
});

//메인 판넬 에니메이션
$(function(){
    $(".img_slide").eq(0).siblings().hide();
    var main_img=0;
    var marginLeft=0;
    setInterval(function(){
        if(main_img<2){
            main_img++;
            marginLeft =(marginLeft+54);
            $("#dot_div").animate({"margin-left": marginLeft});
        }else{
            main_img=0;
            marginLeft=0;
        }
        $(".img_slide").eq(main_img).siblings().fadeOut(500);
        $(".img_slide").eq(main_img).fadeIn(500);
        $("#dot_div").eq(marginLeft).css({"margin-left": "0px"});
    },5000)
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

function goPopup() {
    var pop = window.open("popup/jusoPopup.jsp", "pop",
          "width=570,height=420, scrollbars=yes, resizable=yes");
 };
 function jusoCallBack(roadFullAddr) {
    document.form.roadFullAddr.value = roadFullAddr;
 };
//서비스 이용 안내페이지==================================================================
$(function(){
    $(".service_section_btnB").click(function(){
        $(".service_sectionB").show(500);
        $(".service_sectionA").hide();
    })
    $(".service_section_btnA").click(function(){
        $(".service_sectionA").show(500);
        $(".service_sectionB").hide();
    })
});

//지도 검색기능이 보이는 버튼
$(function(){
    $("#btn_search_cata").click(function(){
        $("#category").toggle('50');
        });     
    $("#btn_search_loc").click(function(){
        $("#menu_wrap").toggle('50');
        });         
});
//지도 검색기능 안내 메세지
$(function(){
    $("#btn_search_cata").mouseover(function(){
        $("#map_cata_show").show();
        }); 
        $("#btn_search_cata").mouseout(function(){
            $("#map_cata_show").hide();
            });
    $("#btn_search_loc").mouseover(function(){
        $("#map_loc_show").show();
        }); 
        $("#btn_search_loc").mouseout(function(){
            $("#map_loc_show").hide();
            });        
    $("#btn_search_distance").mouseover(function(){
        $("#map_distance_show").show();
        }); 
        $("#btn_search_distance").mouseout(function(){
            $("#map_distance_show").hide();
            });    
});
//아이디 비밀번호 찾기 팝업 알고리즘
$(function(){
    $("#find_id_pop").click(function(){
        window.open('find_id.html','info','width = 1000px height= 1200px top=300 left=455');
    })
    $("#find_pw_pop").click(function(){
        window.open('find_pw.html','info','width = 1000px height= 1200px top=300 left=455');
    })
});


  

