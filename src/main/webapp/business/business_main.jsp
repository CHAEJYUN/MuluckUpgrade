<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/resources/css/business.css"
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
<!-- 토글 - 드롭다운 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../resources/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</head>
<body>
<!-- 네비게이션바 header -->
<%@ include file="../nav_header.jsp"%>
	
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