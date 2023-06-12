<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나눔</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
	
<script type="text/javascript">
	function showPage(page) {
		window.location.href = "dealList?page=" + page;
	}
</script>

<script type="text/javascript">
	function logout() {
		window.location.href = "member/logout";
	}
</script>
<style>
td {
	background: white;
	height: 30px;
}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/resources/css/styles.css"
	rel="stylesheet">
<!-- jquery  -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light" id="mainNav2">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="../main/home.jsp">Muluck</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto py-4 py-lg-0">
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
						id="#userNickname">${member_nickname} 님</a></li>
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
						href="../member/mypage">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
						href="../member/login.jsp" onclick="logout()">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<header>
		<h1 class="site-heading text-center text-faded d-none d-lg-block">
			<!-- <span class="site-heading-lower">무우럭</span>
                <span class="site-heading-upper text-primary mb-3">muluck</span> -->
			<div>
				<img src="${pageContext.request.contextPath}/resources/img/LOGO.png"
					alt="MULUCK">
			</div>
		</h1>
	</header>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
		<div class="container">
			<a class="navbar-brand text-uppercase fw-bold d-lg-none"
				href="index.jsp">Start Bootstrap</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="../main/home.jsp">홈</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="../community/community.jsp">커뮤니티</a></li>
					<ul class="navbar-nav px-lg-4">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="myplant.jsp" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 나의 식물 </a>
							<ul class="dropdown-menu dropdown-menu-dark">
								<li><a class="dropdown-item" href="../diary/cardview.jsp">식물
										일지</a></li>
								<li><a class="dropdown-item" href="../card/card_main.jsp">반려식물
										등록증</a></li>
								<li><a class="dropdown-item" href="#">MMTI 테스트</a></li>
							</ul></li>
					</ul>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase"
						href="../business/business_main.jsp">나눔 / 거래</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<figure>
		<video src="${pageContext.request.contextPath}/resources/img/pot.mp4"
			autoplay muted loop></video>
		<div class="inner">
			<h2>MULUCK</h2>
			<p>거래 나눔 페이지</p>
		</div>
	</figure>

	<section>
			<div class="inner">
			<h3 style="font-family: 'KOTRAHOPE'; font-size:50px">거래 게시글 : ${count1}</h3>
			<hr color="green">
			<%
				int pages = (int) request.getAttribute("pages");
			for (int p = 1; p <= pages; p++) {
			%>
			<button style="background: #eaf2df; color: #145f37; width: 50px;"
				class="pages" onclick="showPage(<%=p%>)"><%=p%></button>
			<%
				}
			%>
			<hr color="green">
			<div id="d1">
				<table class="table table-striped">
					<thead>
						<tr>
							<td class="left">게시판 번호</td>
							<td class="left">게시자</td>
							<td class="left">제목</td>
							<td class="left">게시시간</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="one" varStatus="loop">
							<c:if test="${one.business_share == false}">
								<tr>
									<td class="right"><c:out value="${loop.index+1}" /></td>
									<td class="right">${one.member_nickname}</td>
									<td class="right"><a href="businessList?business_no=${one.business_no}">${one.business_title}</a></td>
									<td class="right">${one.business_date}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>

</body>
</html>