
//------------------Main.jsp----------------------
//로그인 후 main 페이지에서 로그아웃할때에 쓰이는 알고리즘
function logout(){
if(confirm("로그아웃하시겠습니까?")){
	location.href = "logout.do";
}
}
//------------------------------------------------

//------------------signup.jsp---------------------
//도로명 주소 창 띄우기 회원가입 할때에 사용
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
    // 회원가입할 때에 입력 창을 벗어나면 증복 된 이메일인지 구분을 할때 사용    	
    	$("#email").blur(function() {
	    	$.ajax({
	    		url : '/emailCheck',
				type : 'post',
				dataType : "json",
				data : {"email" : $("#email").val()},
				success : function(data) {
					console.log("사용주인 이메일이라면 데이터에 값이 나옵니다: "+ data);							
					if (data == 1 ) {
						$("#emailCheck").text("사용중인 이메일입니다 ");
						$("#emailCheck").css("color", "red");
						$("#submit1").attr("disabled", true);
					}else if(data == 0){
						$("#emailCheck").text("");
						$("#submit1").attr("disabled", false);
					}
				}
			}); 
	    });
     //회원가입을 할때에 입력창들을 입력할때에 정규식
    	$("#submit1").on("click", function(){
			
     // 두가지에 방식으로 만들었음 하나는 변수에 담아서 하나는 집적 값을 비교해서		
    		var name = /^[가-힣]+$/;        
			var pw = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,16}$/;

			var pwCh = $("#userPW").val();
			var nameCH =  $("#userName").val();
			var addr =  $("#emailAddr").val();
	        var Opt = $("#emailOpt").val();
			 
	   // 이름이 한글인지 확인하는 정규식
			if(false == name.test(nameCH) || nameCH == "") {
			alert('이름을 한글로 입력해주시길 바랍니다.');
			return false;
			}
		// 아이디가 영문 숫자로 입력이 됐는지 확인하는 정규식
			if(!/^[a-zA-Z0-9]{6,16}$/.test($("#userID").val())){
			alert('아이디는 숫자와 영문자 조합으로 6~16자리를 입력해주시길 바랍니다.');
			return false;
			} 
		// 비밀번호가 6자~16 조건에 맞게 들어갔는지에 정규식	
			if(false == pw.test(pwCh) || $("#userPW").val()=="") {
			alert('비밀번호는 6~16자 이어야 하며, 6~16자 영문(소문자), 숫자, 특수문자로 입력해주시길 바랍니다.');
			return false;
			}
		// 비밀번호 확인 입력창에 value 값이 널 값인지에 정규식	
			if($("#pwCheck").val()=="") {
		    alert('비밀번호 확인해주세요');
			return false;
		    }
		// 주민번호가 숫자이며 6자로 입력 정규식	    	
			if(!/^[0-9]{6}$/.test($("#identification1").val())){
			alert('주민번호 앞자리 숫자 6자로 입력해주시길 바랍니다.');
			return false;
			} 
		// 주민번호 뒷자리가 숫자이며 7자로 입력 정규식	  
			if(!/^[0-9]{7}$/.test($("#identification2").val())){
			alert('주민번호 뒷자리 숫자 7자로 입력해주시길 바랍니다.');
			return false;
			}			
		 // 이메일에 입력 창에  알맞게 이메일 형식으로 입력이 됐는지에 정규식	
			if( !/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test($("#email").val())){
			alert('이메일 형식에 맞게 입력해주시길 바랍니다.');
			return false;
			}
		 // 핸드폰 번호 앞자리 4자로 숫자로 입력 정규식			
			if(!/^[0-9]{4}$/.test($("#userPhone1").val())){
			alert('핸드폰 번호 앞자리  입력해주시길 바랍니다.');
			return false;
			}
		// 뒷자리가 4자로 숫자로 입력 정규식			
			if(!/^[0-9]{4}$/.test($("#userPhone2").val())){
			alert('핸드폰 번호 뒷자리  입력해주시길 바랍니다.');
			return false;
			}
		 // 주소 찾기를 통해 주소를 찾았는지에 정규식
			var address2 = $("#address2").val();
			if(address2 == "주소찾기"){
		    alert("주소찾기를 통해 주소를 찾아주세요");
			return false;
		 // 우편번호가 널 값인가에 대한 정규식	
			}if($("#zipNo").val() == ""){
			alert("주소찾기를 통해 주소를 찾아주세요");
			return false;
			}
		// 주소가 널 값인가에 대한 정규식		
			if($("#roadAddrPart1").val() == ""){
			alert("주소찾기를 통해 주소를 찾아주세요");
			return false;
			}
		 // 상세주소가 널 값인가에 정규식	
			if($("#addrDetail").val() == ""){
			alert("주소찾기를 통해 주소를 찾아주세요");
			return false;
			}  
		 // 중복확인 버튼을 클릭했는지에 대한 정규식 		   
			var idCheckVal = $("#idCheck").val();
			if(idCheckVal == "중복확인"){
			alert("중복확인 버튼을 눌러주세요.");
		 // 모든게 통과 된다면 이메일에 인증 메일을 보내준다 메일 전송 로딩 시간 때문에 버튼을 클릭을 비활성화 해준다	
			}else if(idCheckVal == "사용가능" && $("#emailCheck").val() == "" ){
			$("#form").submit();
			$('#submit1').attr('disabled', true);
			alert('이메일 인증 메일을 보냈습니다 인증 후 로그인 해주시길 바랍니다.');
			setTimeout(function () {                
			  }, 9000)
			}
			});
		});
        // 위에 서비밋을 해주기 위해 사용 되는 알고리즘 
		function idCheck1(){
    	$.ajax({
				url : "/IdCheck",
				type : "post",
				dataType : "json",
				data : {"userID" : $("#userID").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
					if(!/^[a-zA-Z0-9]{6,16}$/.test($("#userID").val())){
						alert('숫자와 영문자 조합으로 6~16자리를 입력해주세요.');
						return false;
					}$("#idCheck").attr("value", "사용가능");
					alert("사용가능한 아이디입니다.");
					}
				}
			})
			
		}
		// 만약 서브밋이 되고 버튼이 비활성화가 풀린다면 이메일이 중복된 이메일 값이라는 것을 알려준다 
		function check() {
			$.ajax({
				url : '/emailCheck',
				type : 'post',
				dataType : "json",
				data : {"email" : $("#email").val()},
				success : function(data) {
					console.log("사용주인 이메일이라면 데이터에 값이 나옵니다2: "+ data);							
					if (data == 1 ){
						alert("중복된 이메일입니다.");
						location.href="signup.do"
						}
					}
				});
		}
//--------------------------------------------------------------		