//-------------------------ㅊ--sigupENG.js------------------------
// 한글 버전과 같은 스크립트  한글 버전 참고
function goPopup(){
   var pop = window.open("popup/jusoPopupENG.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	   $("#address2").attr("value", "주소체크");
}
      function jusoCallBack(zipNo,roadAddrPart1,addrDetail){
          document.form.zipNo.value = zipNo;
          document.form.roadAddrPart1.value = roadAddrPart1;
          document.form.addrDetail.value = addrDetail;
}    
    $(document).ready(function(){
    	$("#email").blur(function() {
	    	$.ajax({
	    		url : '/emailCheck',
				type : 'post',
				dataType : "json",
				data : {"email" : $("#email").val()},
				success : function(data) {
					console.log("사용주인 이메일이라면 데이터에 값이 나옵니다: "+ data);							
					if (data == 1 ) {
						$("#emailCheck").text("Email in use");
						$("#emailCheck").css("color", "red");
						$("#submit1").attr("disabled", true);
					}else if(data == 0){
						$("#emailCheck").text("");
						$("#submit1").attr("disabled", false);
					}
				}
			}); 
	    });
    	$("#submit1").on("click", function(){
    				var name = /^[a-zA-Z]{3,10}$/;        
			    	var pw = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,16}$/;

			    	var pwCh = $("#userPW").val();
			        var nameCH =  $("#userName").val();
			        var addr =  $("#emailAddr").val();
			        var Opt = $("#emailOpt").val();
			        // 두가지에 방식으로 만들었음. 
			 		if(false == name.test(nameCH) || nameCH == "") {
					alert('Please write your name in Korean');
					return false;
					}
			        if(!/^[a-zA-Z0-9]{6,16}$/.test($("#userID").val())){
					alert('You can use text(english), number, simbol from 6 to 16.');
					return false;
					} 
			    	if(false == pw.test(pwCh) || $("#userPW").val()=="") {
			    	alert('Your PW should be 6~16 long also You can use text(english), number, simbol.');
			    	return false;
			    	}
			    	if($("#pwCheck").val()=="") {
				    alert('Please check your PW');
				    return false;
				    }
			    	if(!/^[0-9]{6}$/.test($("#identification1").val())){
					alert('Please write your first identity number');
					return false;
					} 
			    	if(!/^[0-9]{7}$/.test($("#identification2").val())){
					alert('Please write your last identity number');
					return false;
					}			    	
					if( !/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test($("#email").val())){
					alert('Please write as E-mail form(must write @)');
					return false;
					}
					if(!/^[0-9]{4}$/.test($("#userPhone1").val())){
					alert('Please write your first mobile phone number');
					return false;
					}
					if(!/^[0-9]{4}$/.test($("#userPhone2").val())){
					alert('Please write your lasr mobile phone number');
					return false;
					}
			        var address2 = $("#address2").val();
				 	if(address2 == "주소찾기"){
					alert("Please click find button");
					return false;
					}if($("#zipNo").val() == ""){
					alert("Please click find button");
					return false;
					}
					if($("#roadAddrPart1").val() == ""){
					alert("Please click find button");
					return false;
					}
					if($("#addrDetail").val() == ""){
					alert("Please click find button");
					return false;
					}  
					var idCheckVal = $("#idCheck").val();
					if(idCheckVal == "중복확인"){
					alert("Please press the two OK buttons");
					}else if(idCheckVal == "사용가능" && $("#emailCheck").val() == "" ){
					$("#form").submit();
					$('#submit1').attr('disabled', true);
					alert('Email verification email has been sent Please log in after verification');
					setTimeout(function () {                
					  }, 9000)
					}
					});
				});
		
		function idCheck1(){
    	$.ajax({
				url : "/IdCheck",
				type : "post",
				dataType : "json",
				data : {"userID" : $("#userID").val()},
				success : function(data){
					if(data == 1){
						alert("This id already exists");
					}else if(data == 0){
					if(!/^[a-zA-Z0-9]{6,16}$/.test($("#userID").val())){
						alert('You can use text(english), number, simbol from 6 to 16.');
						return false;
					}$("#idCheck").attr("value", "사용가능");
					alert("This id is available.");
					}
				}
			})
		}
		function check() {
			$.ajax({
				url : '/emailCheck',
				type : 'post',
				dataType : "json",
				data : {"email" : $("#email").val()},
				success : function(data) {
					console.log("사용주인 이메일이라면 데이터에 값이 나옵니다2: "+ data);							
					if (data == 1 ){
						alert("This email is a duplicate.");
						location.href="signup.do"
						}
					}
				});
		}
//---------------------------------------------------------------------
    