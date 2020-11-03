//페이지마다 로그인 되어 있을때 로그아웃 처리
function logout(){
if(confirm("로그아웃하시겠습니까?")){
   location.href = "logout.do";
}
}
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
     
   
   
});

//$(function(){
//     $(".pw").focusout(function(){
//           var pwd3 = $("#userPW").val();
//           var pwd4 = $("#pwCheck").val();
//           if(pwd1 !='' && pwd2 == ''){
//               null;
//           }else if(pwd3 !='' && pwd4 != ''){
//               if(pwd3 == pwd4){
//                   $("#pw_right_msg").show();
//               }else{
//                   $("#pw_right__msg").hide();
//               }        
//           }
//     });
//});



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
    $("#btn_search_marker").mouseover(function(){
        $("#map_marker_show").show();
        }); 
        $("#btn_search_marker").mouseout(function(){
            $("#map_marker_show").hide();
            });
});
//아이디 비밀번호 찾기 팝업 알고리즘
$(function(){
    $("#find_id_pop").click(function(){
        window.open('find_id.html','info','width = 700px height= 800px top=100 left=455');
    })
    $("#find_pw_pop").click(function(){
        window.open('find_pw.html','info','width = 700px height= 800px top=100 left=455');
    })
});
//목표 페이지 이미지 슬라이드
$(document).ready(function() {
   var imgs;
   var img_count;
   var img_position=1;
   
   imgs=$(".slide ul");
   img_count=imgs.children().length;
   
   $("#back").click(function() {
      back();
   });
   $("#next").click(function() {
      next();
   });
   function next() {
      if(img_count>img_position){
         imgs.animate({
            left:'-=1920px'
         });
         img_position++;
      
      }
   }
   function back() {
      if(1<img_position){
         imgs.animate({
            left:'+=1920px'
         });
         img_position--;
      }
      
   }
   

});
$(function() {
   var timeout = setTimeout(function(){
      $('.main_logo').fadeOut(800)
      },6000);
   var show1 = setTimeout(function() {
      $('.main_logo1').fadeIn(1000)
      },7050)
   setTimeout(timeout, 6000);
   setTimeout(show1, 7050);


   });
         //map 부분 검색 구현
 function selectmapboard() {
  var a = document.getElementById("map_com_board");
         a.innerHTML = "";
        
          $.ajax({
         url: "/seltmapboard",
         type: "POST",
         dataType: "json",
         data: $("#serchKeyword"),
      success: function(data) {
      for(var i=0;i<data.length;i++){
       $("#map_com_board").append("<tr id='map_tr'>"
               +"<td style='width: 204px;'><a href='getBoard.do?seq="+data[i].seq+"'onmouseover='abc(this)'><img  style='width:204px;'src='data:image/png;base64,"+data[i].strImg+"'></a></td>"
               +"<td class='lat' style='display: none;'>"+data[i].lat+"</td>"
               +"<td class='lng'  style='display: none;'>"+data[i].lng+"</td>"
               +"<td colspan='2'>"
               +"<ul style='list-style:none; margin-left: 8px;'>"
               +"<li style='text-decoration: none;'><h2 class='boardtitle' style= 'font-size: 18px;'>"+data[i].content_character+"</h2></li>"
               +"<li style='text-decoration: none;'><h2 class='boardtitle' style= 'font-size: 18px;'>"+data[i].content_character2+"</h2></li>"
               +"<li style='text-decoration: none;'><h2 class='boardtitle' style= 'font-size: 28px;'>"+data[i].title+"</h2></li>"
               +"<li style='text-decoration: none;'><h2 style= 'font-size: 18px;'>"+data[i].address+"</h2></li>"
               +"</ul>"
               +"</td>"
               +"<td style='width: 64px;'><h2 style= 'font-size: 11px;'>"+data[i].regDate+"</h2></td>"
               +"</tr>");
      }
      
      
      
}
})
      }
     


  