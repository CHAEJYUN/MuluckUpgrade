<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입성공</title>
<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
<link rel="stylesheet" type="text/css" href="../resources/css/login_join.css">
</head>
<body>
	<div class="muluck_logo"><a href="login.jsp"><img src="../resources/assets/img/무우럭.png" alt="로고"></a></div>
	<div class="myform">
	<div  class="go_login"><a href="${pageContext.request.contextPath}/member/login.jsp"><button>X</button></a></div>
		<div class="title">가입 대기 상태 입니다.</div>
		<div class="center">
			<div style="margin-top: 100px;">무우럭의 관리자 가입 대기 상태입니다.</div>
			<div style="margin-bottom: 100px;"> 해당 계정으로 일반로그인은 가능합니다.</div>
			<a href="${pageContext.request.contextPath}/member/login.jsp"><button class="btn black_btn" type="submit"> 일반 로그인하러 가기</button></a>
			<a href="${pageContext.request.contextPath}/manager/managerLogin.jsp"><button class="btn white_btn" type="submit"> 관리자 로그인하러 가기</button></a>
		</div>
	</div>
</body>
</html>