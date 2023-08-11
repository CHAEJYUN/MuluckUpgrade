<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-light" id="mainNav2">
	<div class="container px-4 px-lg-5">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/manager/managerInquiry.jsp">Muluck</a>
		<button class="navbar-toggler" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ms-auto py-4 py-lg-0">
				<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" 
				id="#userNickname">${member_nickname} 관리자님</a></li>
				<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
					href="${pageContext.request.contextPath}/manager/managerPage">관리자페이지</a></li>
				<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
					href="${pageContext.request.contextPath}/manager/logout">로그아웃</a></li>
			</ul>
		</div>
	</div>
</nav>
<header>
	<h1 class="site-heading text-center text-faded d-none d-lg-block">
		<div style="display: flex; justify-content: center;">
			<a href="${pageContext.request.contextPath}/manager/managerInquiry.jsp">
				<img src="${pageContext.request.contextPath}/resources/assets/img/무우럭.png" style="display: block; width: 100%; height: auto;"/>
			</a>
		</div>
	</h1>
</header>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
	<div class="container">
<!-- 	<a class="navbar-brand text-uppercase fw-bold d-lg-none" href="index.jsp">Start Bootstrap</a> -->
		<button class="navbar-toggler" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mx-auto">
				<li class="nav-item px-lg-4">
				<a class="nav-link text-uppercase" href="${pageContext.request.contextPath}/manager/managerInquiry.jsp">문의</a></li>
				<li class="nav-item px-lg-4">
				<a class="nav-link text-uppercase" href="${pageContext.request.contextPath}/manager/managerRegister.jsp">관리자</a></li>
			</ul>
		</div>
	</div>
</nav>
