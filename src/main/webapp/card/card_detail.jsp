<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../resources/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script type="text/javascript">
function validateDateInput(input) {
	  var selectedDate = new Date(input.value);
	  var currentDate = new Date();
	  currentDate.setHours(0, 0, 0, 0); // 현재 날짜의 시간을 00:00:00으로 설정

	  if (selectedDate > currentDate) {
	    // 선택된 날짜가 현재 날짜보다 큰 경우
	    input.value = ""; // 입력된 날짜를 지웁니다.
	    alert("현재 날짜 이전의 날짜만 선택할 수 있습니다.");
	  }
	}
	
function getCurrentDate() {
	  var now = new Date();
	  var year = now.getFullYear();
	  var month = String(now.getMonth() + 1).padStart(2, "0");
	  var day = String(now.getDate()).padStart(2, "0");
	  return `${year}-${month}-${day}`;
	}

</script>
<style>

body{
	font-family: 'KOTRAHOPE';
	font-size: 1.5rem;
}
div {
	text-align: center;
}

input[type='date']::before, input[type='date']:focus::before {
	content: attr(data-placeholder);
	width: 100%;
}

input[type='date']:valid::before {
	display: none;
}
</style>
</head>
<body>
<!-- 네비게이션바 header -->
<%@ include file="../nav_header.jsp"%>

	<section class="page-section about-heading">
		<div class="container">
			<div class="about-heading-content">
				<div class="row">
					<div class="col-xl-9 col-lg-10 mx-auto">
						<div class="bg-faded p-5"
							style="background-color: #eaf2df; border: 3px solid; border-radius: 44px;">
							<h3 class="section-heading mb-4" style="text-align: center;">
								<span class="section-heading-lower">내 식물에 대해 알려주세요!</span>
							</h3>
							<form action="insert" id="form" method="post"
								enctype="multipart/form-data">
								<hr color="grey">
								<div class="mb-3 row">
									<label class="col-sm-2 col-form-label">반려식물 이름</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="card_name"
											placeholder="반려식물 이름을 입력해주세요">
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-2 col-form-label">사진</label>
									<div class="col-sm-5">
										<input class="form-control" type="file" name="file"
											id="formFile">
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-2 col-form-label">반려식물 종류</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="card_species"
											placeholder="어떤 종인가요?">
									</div>
								</div>
								<div class="mb-3 row">
									<label class="col-sm-2 col-form-label">반려일</label>
									<div class="col-sm-5">
										<input type="date" class="form-control" name="card_birth"
											data-placeholder="날짜 선택" required aria-required="true"
											value={startDateValue} className={styles.selectDay}
											min={getCurrentDate()} oninput="validateDateInput(this)">
									</div>
								</div>

								<div class="mb-3 row">
									<label class="col-sm-2 col-form-label">MMTI</label>
									<div class="col-sm-5">
										<select class="form-control" name="card_mmti">
											<option value="" hidden>MMTI를 선택해주세요</option>
											<option value="PHDA">PHUI</option>
											<option value="PHDU">PHUS</option>
											<option value="PHLA">PHLI</option>
											<option value="PHLU">PHLS</option>
											<option value="PDDA">PDUI</option>
											<option value="PDDU">PDUS</option>
											<option value="PDLA">PDLI</option>
											<option value="PDLU">PDLS</option>
											<option value="AHDA">AHUI</option>
											<option value="AHDU">AHUS</option>
											<option value="AHLA">AHLI</option>
											<option value="AHLU">AHLS</option>
											<option value="ADDA">ADUI</option>
											<option value="ADDU">ADUS</option>
											<option value="ADLA">ADLI</option>
											<option value="ADLU">ADLS</option>
										</select>
									</div>
								</div>
								<label class="col-form-label">*MMTI : 무우럭에서 제공하는 반려식물 성향
									유형이에요! 지금 바로 테스트해보세요</label>
								<button type="button" class="btn"
									onclick="window.open('../mmti/mmti_test.jsp', )"
									style="background-color: #145f37; border-color: none; color: #eaf2df;">
									<b>MMTI 테스트</b>
								</button>
								<br> <br>
								<button type="submit" class="btn"
									style="float: right; background-color: #145f37; border-color: none; color: #eaf2df;">
									<b>만들기</b>
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