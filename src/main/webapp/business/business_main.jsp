<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/resources/css/styles.css"
	rel="stylesheet">
<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	function logout() {
		window.location.href = "member/logout";
	}
</script>
<!-- article 부분 테두리 추가 style -->
<style>
.article-wrapper {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.article {
	width: 300px;
	border: 1px solid #ccc;
	border-radius: 4px;
	padding: 20px;
	margin: 10px;
	text-align: center;
	background-color: #ffff;
}

.article .pic img {
	width: 100%;
	max-height: 200px;
	object-fit: cover;
}

.article:hover {
    background-color: #eaf2df;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
</style>

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
			<h1 style="font-family: 'KOTRAHOPE'; font-size:40px">MENU</h1>
			<button type="button" class="btn btn-success" style="font-family: 'KOTRAHOPE'; font-size: 20px"
				onclick="location.href='business_Write.jsp'; ">글쓰기</button>
			<h1></h1>
			<div class="wrap">
				<div class="article-wrapper">
					<article class="article">
						<div class="pic">
							<a href="shareList?page=1"><img
								src="${pageContext.request.contextPath}/resources/img/hands.jpg"
								alt="이미지1"></a>
						</div>
						<h2>
							<a href="shareList?page=1" style="font-family: 'KOTRAHOPE'; font-size: 30px">나눔페이지로</a>
						</h2>
						<p style="font-family: 'KOTRAHOPE'; font-size: 15px">나누고 싶은 마음 함께 나눠요!</p>
					</article>

					<article class="article">
						<div class="pic">
							<a href="dealList?page=1"><img
								src="${pageContext.request.contextPath}/resources/img/money.jpg"
								alt="이미지2"></a>
						</div>
						<h2>
							<a href="dealList?page=1" style="font-family: 'KOTRAHOPE'; font-size: 30px">거래페이지로</a>
						</h2>
						<p style="font-family: 'KOTRAHOPE'; font-size: 15px">사용안하는 용품 팔아봐요!</p>
					</article>
				</div>
			</div>
	</section>
	<hr />
</body>
</html>