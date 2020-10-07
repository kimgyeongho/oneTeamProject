<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다 나 홀로 집에입니다!!</title>
</head>
<body>
<div style="margin: 100px;">
		<a><img src="<%-- ${pageContext.request.contextPath} --%>resources/img/logo.png"	style="height: 80px; margin-left: 10px;" /></a> <br>
		<br>
		<h1>안녕하세요, ${param.user_id} 님</h1>
		<br>
		<p>환영합니다! 나 홀로집에입니다.</p>
		<br>
		<p>회원가입이 정상적으로 이루어졌습니다.</p>
		<br>
		<p>로그인 하시면 홈페이지 내의 모든 서비스를 이용하실 수 있습니다.</p>
		<br> <a href="login.do">로그인 페이지로 이동하기</a>
	</div>
</body>
</html>