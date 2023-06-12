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
<!-- Bootstrap core JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script src="http://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script type="text/javascript">
	$(function() {
		$("#save").click(function() {
			html2canvas($("#screenshot").get(0)).then(function(canvas) {
				var screenshotUrl = canvas.toDataURL(); // 스크린샷 이미지의 데이터 URL

				// 이미지 다운로드 링크 생성
				var link = document.createElement("a");
				link.href = screenshotUrl;
				link.download = "muluck.png";
				link.click();
			});
		});
	});
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

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 400px;
}

.modal-content h2 {
	margin-top: 0;
}

.modal-content p {
	margin-bottom: 20px;
}

.modal-content button {
	background-color: #145f37;
	border: none;
	color: #eaf2df;
	padding: 10px 20px;
	font-weight: bold;
	cursor: pointer;
}

.modal-content button:hover {
	background-color: #0c4025;
}
</style>
<script type="text/javascript">
	function showModal(title, message) {
		var modal = document.createElement("div");
		modal.classList.add("modal");

		var modalContent = document.createElement("div");
		modalContent.classList.add("modal-content");

		var modalTitle = document.createElement("h2");
		modalTitle.textContent = title;

		var modalMessage = document.createElement("p");
		modalMessage.textContent = message;

		var closeButton = document.createElement("button");
		closeButton.textContent = "닫기";
		closeButton.addEventListener("click", function() {
			closeModal();
		});

		// 요소들을 모달에 추가
		modalContent.appendChild(modalTitle);
		modalContent.appendChild(modalMessage);
		modalContent.appendChild(closeButton);
		modal.appendChild(modalContent);

		// 모달을 페이지에 추가
		document.body.appendChild(modal);

		// 모달을 표시
		modal.style.display = "block";
	}

	var copyButton = document.querySelector(".copy_btn");
	copyButton.addEventListener("click", function() {
		copyUrl();
	});

	function showCustomScreen() {
	    // 커스텀 화면을 표시하는 코드 작성
	    document.querySelector(".update_btn").style.display = "none";
	  }

	  function copyUrl() {
	    let tmp = document.createElement('input');
	    let url = window.location.href;

	    document.body.appendChild(tmp);
	    tmp.value = url;
	    tmp.select();
	    document.execCommand("copy");
	    document.body.removeChild(tmp);

	    showModal("알림", "URL이 복사되었습니다.");

	    // 복사한 URL로 이동했을 때 커스텀 화면을 표시하고 수정 버튼을 숨깁니다.
	    if (window.location.hash === "#custom") {
	      // 현재 URL에 파라미터를 추가하여 수정 버튼이 사라지도록 변경합니다.
	      window.location.href = window.location.href + "&noEdit=true";
	    }
	  }

	  // 페이지가 로드되었을 때 URL에 "noEdit" 파라미터가 있으면 수정 버튼을 숨깁니다.
	  window.addEventListener("load", function() {
	    const urlParams = new URLSearchParams(window.location.search);
	    if (urlParams.get("noEdit") === "true") {
	      showCustomScreen();
	    }
	  });

	function closeModal() {
		var modal = document.querySelector(".modal");
		modal.style.display = "none";
	}

	// 닫기 버튼에 대한 처리
	function closeModal() {
		var modal = document.querySelector(".modal");
		if (modal) {
			modal.style.display = "none";
			document.body.removeChild(modal);
		}
	}

	// 삭제 모달 창
	function showDeleteModal(cardNo) {
		var modal = document.createElement("div");
		modal.classList.add("modal");

		var modalContent = document.createElement("div");
		modalContent.classList.add("modal-content");

		var modalTitle = document.createElement("h2");
		modalTitle.textContent = "알림";

		var modalMessage = document.createElement("p");
		modalMessage.textContent = "정말 등록증을 삭제하시겠습니까?";

		var confirmButton = document.createElement("button");
		confirmButton.textContent = "확인";
		confirmButton.addEventListener("click", function() {
			deleteCard(cardNo); // cardNo 값을 전달하여 deleteCard 함수 호출
		});

		var closeButton = document.createElement("button");
		closeButton.textContent = "닫기";
		closeButton.addEventListener("click", function() {
			closeModal();
		});

		// 요소들을 모달에 추가
		modalContent.appendChild(modalTitle);
		modalContent.appendChild(modalMessage);
		modalContent.appendChild(confirmButton);
		modalContent.appendChild(closeButton);
		modal.appendChild(modalContent);

		// 모달을 페이지에 추가
		document.body.appendChild(modal);

		// 모달을 표시
		modal.style.display = "block";
	}

	function deleteCard(cardNo) {
		// cardNo 값을 사용하여 등록증 삭제 작업을 수행하는 코드를 추가하세요.
		console.log("등록증이 삭제되었습니다.", cardNo);

		// 페이지 이동
		window.location.href = "delete?card_no=" + cardNo;

		closeModal();
	}

	function closeModal() {
		var modal = document.querySelector(".modal");
		if (modal) {
			modal.style.display = "none";
			document.body.removeChild(modal);
		}
	}
</script>
</head>
<body>
<!-- 네비게이션바 header -->
<%@ include file="../../../nav_header.jsp"%>
	<br>
	<div style="float: center;">
		<button type="button" class="btn" id="save">스크린샷</button>
		<button type="submit" class="btn" id="copy_btn"
			onclick="javascript:copyUrl()">주소 복사하기</button>
		<button type="submit" class="btn" onclick="location='list'">전체
			목록</button>
	</div>
	<br>
	<div style="float: right;">

		<a role="button" class="btn update_btn" href="card_update?card_no=${bag.card_no}">수정</a>
		<%-- <a onclick="return confirm('정말 등록증을 삭제하실건가요? :(')"
			href="delete?card_no=${bag.card_no}" role="button" class="btn">삭제</a> --%>
		<%-- <a onclick="showDeleteModal('${bag.card_no}')" href="#" role="button" class="btn">삭제</a> --%>
		<a onclick="showDeleteModal('${bag.card_no}')" href="#" role="button"
			class="btn">삭제</a>
	</div>
	<br>
	<section class="page-section about-heading">
		<div class="container">
			<div class="about-heading-content">
				<div class="row">
					<div class="parent-container mx-auto">
						<div class="bg-faded p-4" id='screenshot'
							style="border: 3px solid; border-radius: 44px;">
							<b style="float: left;">NO : <fmt:formatDate
									value="${bag.card_birth}" pattern="yyyyMMdd" /> -
								${bag.card_no}
							</b>
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
									<h4>
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
	<div class="modal">
		<div class="modal-content">
			<h2>모달 제목</h2>
			<p>모달 내용</p>
			<button id="modal-close-btn">닫기</button>
		</div>
	</div>
	<div id="deleteModal" class="modal">
		<div class="modal-content">
			<h2 id="deleteModalTitle">모달 제목</h2>
			<p id="deleteModalMessage">모달 내용</p>
			<button id="deleteModalCloseBtn">닫기</button>
		</div>
	</div>
</body>
</html>