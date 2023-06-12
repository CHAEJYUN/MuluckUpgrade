<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>무우럭</title>
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

	function handle_change() {
		var fileInput = document.getElementById('formFile');
		var file = fileInput.files[0];
		var fileName = file.name;
		console.log('fileName : ', fileName)
		
		var reader = new FileReader();
		  reader.onload = function(e) {
		    var imgElement = document.getElementById('previewImage');
		    imgElement.src = e.target.result;
		  };
		  reader.readAsDataURL(file);
	}
</script>
</head>
<body>
	<!-- 네비게이션바 header -->
<%@ include file="../../../nav_header.jsp"%>
	<br>
	<section class="page-section about-heading">
		<div class="container">
			<div class="about-heading-content">
				<div class="row">
					<div class="col-xl-9 col-lg-10 mx-auto">
						<div class="bg-faded p-5"
							style="background-color: #eaf2df; border: 3px solid; border-radius: 44px;">
							<h3 class="section-heading mb-4" style="text-align: center;">
								<span class="section-heading-lower">반려식물 등록증 수정 화면입니다</span>
							</h3>
							<form action="update?card_no=${bag.card_no}" method="POST">
								<b style="float: left;">NO : <fmt:formatDate
										value="${bag.card_birth}" pattern="yyyyMMdd" /> -
									${bag.card_no}
								</b><br>
								<hr color="grey">
								<div class="mb-3 row">
									<label class="col-sm-2 col-form-label" id="card_name">반려식물
										이름</label>
									<div class="col-sm-5">
										<label for="card_name"><input type="text"
											class="form-control" name="card_name" id="card_name"
											value="${bag.card_name}" readonly></label>
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-2 col-form-label" id="card_img">이미지</label>
									<div class="col-sm-5">
										<input class="form-control" type="file" name="file"
											id="formFile" value="${bag.card_img}"
											onchange="handle_change()"> 
										<img id="previewImage" src="../resources/upload/${bag.card_img}" alt="Preview Image"/ width=200
											height=200>
										<input type="text"
											class="form-control" name="card_img" id="card_img"
											value="${bag.card_img}">
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-sm-2 col-form-label" id="card_species">반려식물
										종류</label>
									<div class="col-sm-5">
										<label for="card_species"><input type="text"
											class="form-control" name="card_species" id="card_species"
											value="${bag.card_species}" readonly></label>
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-2 col-form-label">반려일</label>
									<div class="col-sm-5">
										<fmt:formatDate value="${bag.card_birth}" pattern="yyyy-MM-dd" />
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-2 col-form-label">MMTI</label>
									<div class="col-sm-5">
										<select class="form-control" name="card_mmti">
											<option value="" hidden>${bag.card_mmti}</option>
											<option value="ISTJ">ISTJ</option>
											<option value="ISTP">ISTP</option>
											<option value="INFJ">INFJ</option>
											<option value="INTJ">INTJ</option>
											<option value="ISFJ">ISFJ</option>
											<option value="ISFP">ISFP</option>
											<option value="INFP">INFP</option>
											<option value="INTP">INTP</option>
											<option value="ESTJ">ESTJ</option>
											<option value="ESFP">ESFP</option>
											<option value="ENFP">ENFP</option>
											<option value="ENTP">ENTP</option>
											<option value="ESFJ">ESFJ</option>
											<option value="ESTP">ESTP</option>
											<option value="ENFJ">ENFJ</option>
											<option value="ENTJ">ENTJ</option>
										</select>
									</div>
								</div>
								<br>
								<button type="submit" class="btn"
									style="background-color: #145f37; border-color: none; color: #eaf2df;">
									<b>수정</b>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>