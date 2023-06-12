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
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- Bootstrap core JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">

	// 주소 복사
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

	// 사진 수정
	/* function handle_change() {
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
	} */
	
	// 선택된 사진로 show_img가 바뀌게 하기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				// 파일 내용을 이용하여 원하는 동작 수행
				$('#show_img').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	//사진 삭제
  	/* function deleteImage() {
 		$('#show_img').attr('src', '../resources/upload/무럭무럭.png');
		$('#file').val('');
		$('#card_img').val("무럭무럭.png");
    } */
    
    

</script>
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
							<form action="update?card_no=${bag.card_no}" method="POST" enctype="multipart/form-data">
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
									<label class="col-sm-2 col-form-label" id="card_img">사진</label>
									<div class="col-sm-5">
										<%-- <input class="form-control" type="file" name="file"
											id="formFile" value="${bag.card_img}"
											onchange="handle_change()">  --%>
										<%-- <img id="previewImage" src="../resources/upload/${bag.card_img}" alt="Preview Image"/ width=200
											height=200> --%>									
						<input type="hidden" name="card_img" id="card_img" />
						<!-- 사진 넣기 -->
						<div style="margin-bottom: 10px; margin-top: 20px;">
							<img id="show_img" width=200 height=200 alt="프로필 사진" style="border-radius: 50px;" src="../resources/upload/${bag.card_img}">
						</div>
						<div style="margin-bottom: 10px;">
							<label for="file">
								<div class="btn" style="width: 90px; height: 30px;">변경하기</div>
							</label>
					        <!-- <button id="del_img" type="button" class="btn" style="width: 90px; height: 30px;" onclick="deleteImage()">삭제하기</button> -->
							<input type="file" id="file" name="file" style="display: none;" onchange="readURL(this)"><br>
						</div>
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
											<option value="PHDA">PHDA</option>
											<option value="PHDU">PHDU</option>
											<option value="PHLA">PHLA</option>
											<option value="PHLU">PHLU</option>
											<option value="PDDA">PDDA</option>
											<option value="PDDU">PDDU</option>
											<option value="PDLA">PDLA</option>
											<option value="PDLU">PDLU</option>
											<option value="AHDA">AHDA</option>
											<option value="AHDU">AHDU</option>
											<option value="AHLA">AHLA</option>
											<option value="AHLU">AHLU</option>
											<option value="ADDA">ADDA</option>
											<option value="ADDU">ADDU</option>
											<option value="ADLA">ADLA</option>
											<option value="ADLU">ADLU</option>
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