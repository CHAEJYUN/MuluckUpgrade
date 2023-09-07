<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy.MM.dd.");
	String strdate = simpleDate.format(date);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!-- 팝업창 -->
<title>반려식물 등록증</title>
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" type="text/css"
	rel="stylesheet" />
<!-- Bootstrap core JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

<style>
div {
	text-align: center;
}

.btn {
	background-color: #145f37;
	border-color: none;
	color: #eaf2df;
	font-weight: bold;
}

.parent-container {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 600px;
	height: 260px;
}

.grid-container {
	display: grid;
	grid-template-areas: 'a a a a a' 'b b c c c' 'b b c c c' '. . c c c'
		'd e e e .';
	grid-template-rows: repeat(5, 1fr);
	grid-template-columns: repeat(5, 1fr);
	width: 650px;
	height: 370px;
	background-color: #eaf2df;
	border: 4px solid;
	border-radius: 44px;
	align-items: flex-start;
}

.a {
	grid-area: a;
}

.b {
	grid-area: b;
}

.c {
	grid-area: c;
}

.d {
	grid-area: d;
}

.e {
	grid-area: e;
}

body{
	font-family: 'KOTRAHOPE';
	font-size: 1rem;
}
</style>
<script type="text/javascript">
	function clip() {
		var url = ''; // <a>태그에서 호출한 함수인 clip 생성 
		var textarea = document.createElement("textarea");
		// url 변수 생성 후, textarea라는 변수에 textarea 요소 생성

		document.body.appendChild(textarea); // <body> 바로 위에 textarea 추가(임시 공간이므로 위치는 상관 없음)
		url = window.document.location.href; // url에 현재 주소값을 넣어줌
		textarea.value = url; // textarea 값에 url을 넣어줌
		textarea.select(); // textarea 설정
		document.execCommand("copy"); // 복사
		document.body.removeChild(textarea); //textarea 요소를 없애줌
		alert("주소가 복사되었습니다.") // 알림창
	}

</script>
</head>
<body>
<!-- 네비게이션바 header -->
<%@ include file="../../../nav_header.jsp"%>
	<br>
	<form action="../card/card_detail.jsp" method="get">
		<h3 class="section-heading" style="text-align: center;">
			<br> <b>반려식물 등록증을 만들어 보세요</b>
		</h3>
		<div style="float: right;">
			<button type="submit" class="btn" style="margin-right: 50px;">등록</button>
		</div>
		<br>
	</form>
	<br>
	<c:forEach items="${list}" var="bag">
		<section class="page-section about-heading">
			<div class="container">
				<div class="about-heading-content">
					<div class="row">
						<div class="parent-container mx-auto">
							<div class="bg-faded p-4"
								style="border: 3px solid; border-radius: 44px;">
								<%-- <form action="one" method="get">
								<b style="float: left;"><a
									href="one?no=${bag.card_no}">NO :
										${bag.card_no}</a></b>
								</form> --%>
								<b style="float: left;"><a href="one?card_no=${bag.card_no}"
									style="color: black;">NO : <fmt:formatDate
											value="${bag.card_birth}" pattern="yyyyMMdd" /> - ${bag.card_no}
								</a></b>
								<div class="grid-container">
									<div class="grid-item a">
										<h4>
											<b>반려식물 등록증</b>
										</h4>
									</div>
									<div class="grid-item b">
										<h5>
											이름 : ${bag.card_name}<br> <br> 종류 :
											${bag.card_species} <br> <br> 반려일 :
											${bag.card_birth}<br> <br> MMTI : ${bag.card_mmti}<br>
											<br> <br>
										</h5>
									</div>
									<div class="grid-item c">
										<img src="../resources/upload/${bag.card_img}" width=200
											height=200>
									</div>
									<!-- <div class="grid-item d">
									<br> <img src="../resources/assets/img/무럭무럭.png" width=70
										height=70>
								</div> -->
								<div class="grid-item d">
									<br> <img src="../resources/assets/img/무럭무럭.png" width=70
										height=70>
								</div>
									<div class="grid-item e">
										<br>
										<h4 style="text-align: center;">
											<fmt:formatDate value="${bag.card_date}" pattern="yyyy-MM-dd" />
											<br>무우럭마을 무럭무럭
										</h4>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</c:forEach>
</body>
</html>