<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>무우럭</title>
<link rel="icon" type="image/x-icon"
	href="resources/assets/favicon.ico" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" type="text/css" rel="stylesheet" />
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
<!-- 			<a class="navbar-brand text-uppercase fw-bold d-lg-none"
				href="index.jsp">Start Bootstrap</a> -->
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
	
         <!-- Services-->	
         <br>
		 <section id="scroll">
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6 order-lg-2">
                        <div class="p-5"><img src="resources/assets/img/main1.png" alt="죄송합니다. 오류로 인해 사진을 띄우지 못했습니다." /></div>
                    </div>
                    <div class="col-lg-6 order-lg-1">
                        <div class="p-5">
                            <h5 class="display-4"> 특별해지는 우리사이!</h5>
                            <p>MMTI 테스트를 통해 반려식물의 성격을 알 수 있어요</p>						
                        </div>
					<div class="intro-button mx-auto"><a class="btn btn-primary btn-xl" href="${pageContext.request.contextPath}/noLogin.jsp" style="color : #fff;">MMTI 테스트 하러가기</a></div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Content section 2-->
        <section>
            <div class="container px-5" style="background-color:#EAF2DF ">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6">
                        <div class="p-5"><img src="resources/assets/img/main2.png" width="700"  height="400" alt="죄송합니다. 오류로 인해 사진을 띄우지 못했습니다." /></div>
                    </div>
                   <div class="col-lg-6">
                        <div class="p-5">
                           <h4 class="display-4">가까워지는 우리사이!</h4>
                            <p>반려식물 등록증을 통해 반려식물을 자랑할 수 있어요</p>					
						</div>
                        <div class="intro-button mx-auto"><a class="btn btn-primary btn-xl" href="${pageContext.request.contextPath}/noLogin.jsp" style="color : #fff;">반려식물 등록증 만들어보기</a></div>
                    </div>
                </div>
            </div>
        </section>
        <br>
        <!-- Content section 3-->
        <section>
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6 order-lg-2">
                        <div class="p-5"><img src="resources/assets/img/main3.png" width="400"  height="200" alt="죄송합니다. 오류로 인해 사진을 띄우지 못했습니다." /></div>
                    </div>
                    <div class="col-lg-6 order-lg-1">
                        <div class="p-5">
                            <h2 class="display-4">편리하고 소중하게!</h2>
							<p>캘린더를 통해 식물을 편리하게 가꾸어보아요<br>
							매일매일 식물일지를 기록해 추억을 쌓아보아요</p>
                        </div>
                        <div class="intro-button mx-auto">
                        <a class="btn btn-primary btn-xl" href="${pageContext.request.contextPath}/noLogin.jsp" style="color : #fff;">캘린더 바로가기</a>
                        <a class="btn btn-primary btn-xl" href="${pageContext.request.contextPath}/noLogin.jsp" style="color : #fff;">식물일지 작성해보기</a></div>
                    </div>
                </div>
            </div>
        </section>
        <br>
        <br>
        <br>
        <!-- Content section 4-->
        <section>
            <div class="container px-5" style="background-color:#EAF2DF ">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6">
                        <div class="p-5"><img src="resources/assets/img/main4.png"  width="600" height="600" alt="죄송합니다. 오류로 인해 사진을 띄우지 못했습니다." /></div>
                    </div>
                   <div class="col-lg-6">
                        <div class="p-5">
                           <h4 class="display-4">식집사들끼리 소통해요!</h4>
                            <p>무우럭 회원들과 다양한 이야기를 나누어보아요</p>
							</div>
                        <div class="intro-button mx-auto"><a class="btn btn-primary btn-xl" href="${pageContext.request.contextPath}/noLogin.jsp" style="color : #fff;">커뮤니티 바로가기</a></div>
                    </div>
                </div>
            </div>
        </section>
        <br>
        <!-- Content section 5-->
        <section>
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6 order-lg-2">
                        <div class="p-5"><img src="resources/assets/img/main5.png" alt="죄송합니다. 오류로 인해 사진을 띄우지 못했습니다." /></div>
                    </div>
                    <div class="col-lg-6 order-lg-1">
                        <div class="p-5">
                            <h2 class="display-4">필요한 것들, 모두 여기서!</h2>
							<p>거래와 나눔을통해 마음을 나누어 보아요</p>
                        </div>
                        <div class="intro-button mx-auto"><a class="btn btn-primary btn-xl" href="${pageContext.request.contextPath}/noLogin.jsp" style="color : #fff;">거래/나눔 바로가기</a></div>
                    </div>
                </div>
            </div>
        </section>
        <br>
        <br>
        <br>
        <br>
        <br>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <!-- <script src="resources/js/scripts.js"></script> -->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script> -->
    </body>
</html>