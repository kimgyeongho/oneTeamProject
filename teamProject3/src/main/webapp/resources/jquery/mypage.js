//---------------------------mypage.jsp-------------------------
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
    	 //정규식
    	  $("#submit1").on("click", function(){
        			if($("#userPW").val()==""){
        				alert("비밀번호를 입력하세요.");
        				$("#userPW").focus();
        				return false;
        			}
    	 //비밀번호 확인 회원탈퇴
        			$.ajax({
					url : "/passwordCheck",
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
    	//정규식
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
    	//정규식  
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
    	//정규식  
    	  $("#submit4").on("click", function(){
		    var address2 = $("#address2").val();
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
//---------------------------------------------------------------------	