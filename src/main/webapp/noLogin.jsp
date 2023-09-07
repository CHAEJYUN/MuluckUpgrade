<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>무우럭</title>
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet"/>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="resources/css/login_join.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" id="mainNav2">
	<div class="container px-4 px-lg-5">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/home.jsp">Muluck</a>
		<button class="navbar-toggler" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ms-auto py-4 py-lg-0">
				<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
					href="${pageContext.request.contextPath}/noLogin.jsp">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
					href="${pageContext.request.contextPath}/member/login.jsp">로그인</a></li>
			</ul>
		</div>
	</div>
</nav>
<header>
	<h1 class="site-heading text-center text-faded d-none d-lg-block">
		<div style="display: flex; justify-content: center;">
			<a href="${pageContext.request.contextPath}/home.jsp">
			<img src="${pageContext.request.contextPath}/resources/assets/img/무우럭.png" style="display: block; width: 100%; height: auto;"/></a>
		</div>
	</h1>
</header>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
	<div class="container">
	<!-- <a class="navbar-brand text-uppercase fw-bold d-lg-none" href="index.jsp">Start Bootstrap</a> -->
		<button class="navbar-toggler" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mx-auto">
				<li class="nav-item px-lg-4">
				<a class="nav-link text-uppercase" href="${pageContext.request.contextPath}/home.jsp">홈</a></li>
				<li class="nav-item px-lg-4">
				<a class="nav-link text-uppercase" href="${pageContext.request.contextPath}/noLogin.jsp">커뮤니티</a></li>
				<li class="nav-item px-lg-4">
				<a class="nav-link text-uppercase" href="${pageContext.request.contextPath}/noLogin.jsp">나의 식물</a></li>
				<li class="nav-item px-lg-4">
				<a class="nav-link text-uppercase" href="${pageContext.request.contextPath}/noLogin.jsp">거래/나눔</a></li>
			</ul>
		</div>
	</div>
</nav>

<!-- 본문 -->
<div align="center">
	<div style="margin-top: 100px; font-size: 70px;"> 로그인 후 사용가능 합니다.</div>
	<div style="margin-top: 70px; font-size: 30px;">
		<a href="${pageContext.request.contextPath}/member/login.jsp">
			<button class="black_btn">로그인 하러가기</button>
		</a>
	</div>
</div>

</body>
</html>