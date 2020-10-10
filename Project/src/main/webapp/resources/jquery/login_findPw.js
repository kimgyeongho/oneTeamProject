//-----------------------------login.js-------------------------
$(document).ready(function(){
	 // 입력창 정규식
	$("#idCheck").on("click", function(){
		  if($("#userID").val()==""){
				alert('아이디를 입력해주세요');
				return false;
			}
			if($("#userPW").val()==""){
				alert('비밀번호를 입력해주세요');
				return false;
			}
			if($("#userPW").val()=="" && $("#userID").val()==""){
				alert('아이디와 비밀번호를 입력해주세요');
				return false;
			}
			 if($("#userID2").val()=="아이디체크완료" && $("#userPW2").val()=="비밀번호체크완료"
					 && $("#email").val()=="이메일인증완료"){
				$("#loginForm").submit();
				return false;
			}
		//아이디 체크 알고리즘		
			$.ajax({
				url : "/IdCheck",
				type : "post",
				dataType : "json",
				data : {"userID" : $("#userID").val()},
				success : function(data){
					if(data == 0){
						alert("아이디가 틀렸습니다.");			
					}else if(data == 1){
						$("#userID2").attr("value", "아이디체크완료");
					}
				}
			}); 
		//이메일 인증이 됐는지에 알고리즘
			$.ajax({
				url : "/Email_Success_Check",
				type : "post",
				dataType : "json",
				data : {"userID" : $("#userID").val()},
				success : function(data){
					if(data == 0 && $("#userID2").val()=="아이디체크완료" && $("#userPW2").val()=="비밀번호체크완료"){
						alert("이메일 인증 후 로그인 할 수 있습니다.");			
					}else if(data == 1){
						$("#email").attr("value", "이메일인증완료");
					}
				}
			}); 
		// 비밀번호 알고리즘 
			$.ajax({
						url : "/passwordCheck",
						type : "post",
						dateType : "json",
						data : $("#loginForm").serializeArray(),
						success: function(data){
							
							if(data==false){
								alert("패스워드가 틀렸습니다.");	
							}else if(data == true){
								$("#userPW2").attr("value", "비밀번호체크완료");
							}
						}		
					});
		});	
});  
//------------------------------------------------------

//---------------------find_pw.jsp--------------------------
//유저 정보가 있는지 체크하는 알고리즘
function check() {
	$.ajax({
		url : "/userCheck",
		type : "post",
		dataType : "json",
		data : {"email" : $("#email").val()
			,"userID" : $("#userID").val(),"userName" : $("#userName").val()},
		success : function(data){
			if(data == 0){
				alert("가입 하신 정보가 안맞습니다.");
				return false;
			}else{		       
			console.log("클릭됨");
			$("#find_identification_pw").submit();
	        $('#findBtn').attr('disabled', true);
	        alert("잠시 후 이메일로 임시 비밀번호가 전송 됩니다.로딩중이오니 잠시만 기달려주세요");
				setTimeout(function () {
		        }, 9000)				
			}
		}
	})
}
//---------------------------------------------------------
