<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 반려식물 MMTI 찾기</title>
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<link rel="stylesheet" href="../resources/css/form.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		var nextBtns = document.querySelectorAll(".next_btn");
		nextBtns.forEach(function(btn) {
			btn.addEventListener("click", function(e) {
				e.preventDefault();

				// 현재 질문의 라디오 버튼 체크 여부 확인
				var currentQuestion = this.closest(".test");
				var radioButtons = currentQuestion
						.querySelectorAll('input[type="radio"]');
				var isChecked = false;

				radioButtons.forEach(function(radio) {
					if (radio.checked) {
						isChecked = true;
					}
				});

				// 라디오 버튼이 체크되어 있지 않으면 모달 창 표시
				if (!isChecked) {
					showModal("알림", "문항이 선택되지 않았습니다.");
					return;
				}

				// 현재 질문 숨기기
				currentQuestion.style.display = "none";

				// 다음 질문 보여주기
				var nextQuestion = currentQuestion.nextElementSibling;
				if (nextQuestion) {
					nextQuestion.style.display = "block";
				}

			});
		});
	});

	// 모달 창 생성 함수
	function showModal(title, message) {
		// 모달 요소 생성
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

		// 모달 표시
		modal.style.display = "block";
	}

	// 모달 닫기 함수
	function closeModal() {
		var modal = document.querySelector(".modal");
		if (modal) {
			modal.style.display = "none";
			document.body.removeChild(modal);
		}
	}

	document.addEventListener("DOMContentLoaded", function() {
		// 이전 버튼 클릭 이벤트 처리
		var prevBtns = document.querySelectorAll(".prev_btn");
		prevBtns.forEach(function(btn) {
			btn.addEventListener("click", function(e) {
				e.preventDefault();

				// 현재 질문 숨기기
				var currentQuestion = this.closest(".test");
				currentQuestion.style.display = "none";

				// 이전 질문 보여주기
				var prevQuestion = currentQuestion.previousElementSibling;
				if (prevQuestion) {
					prevQuestion.style.display = "block";
				}
			});
		});
	});

	document.addEventListener("DOMContentLoaded", function() {
		// 버튼 클릭 이벤트 처리
		var nextBtns = document.querySelectorAll(".mmti_main");
		nextBtns.forEach(function(btn) {
			btn.addEventListener("click", function(e) {
				e.preventDefault();

				// mmti_test.jsp로 이동
				window.location.href = "mmti_test.jsp";
			});
		});
	});

	/* document.addEventListener("DOMContentLoaded", function() {
		// 버튼 클릭 이벤트 처리
		var nextBtns = document.querySelectorAll(".mmti_result");
		nextBtns.forEach(function(btn) {
			btn.addEventListener("click", function(e) {
				e.preventDefault();

				// mmti_result.jsp로 이동
				window.location.href = "result.jsp";
			});
		});
	}); */
</script>
</head>
<body>
	<section id="survey">
		<div class="wrapper">
			<form id="form" action="mmti_result.jsp" method="post">
				<!-- 질문 1 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">1/12</h3>
						<h3 class="question">오늘은 반려식물이 나들이를 가는 날입니다. 어디로 가볼까요?</h3>
						<input id="type" type="hidden" value="HD">
					</div>
					<div class="answer">
						<div>
							<input id="one_1" type="radio" name="answer_1" value="D"> <label
								for="one_1">바람이 솔랑솔랑 부는 야외로 갈래!</label>
						</div>
						<div>
							<input id="two_1" type="radio" name="answer_1" value="H"> <label
								for="two_1">습한 무게가 느껴지는 온실로 갈래!</label>
						</div>
						<input type="hidden" id="PA" value="0"> <input
							type="hidden" id="HD" value="0"> <input type="hidden"
							id="LU" value="0"> <input type="hidden" id="IS" value="0">
					</div>
					<div class="btn_wrap btn_sort">
						<button class="mmti_main">돌아가기</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 2 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">2/12</h3>
						<h3 class="question">식물에게 좋다는 영양제나 비료는 꼭 챙겨주는 편인가요?</h3>
						<input id="type" type="hidden" value="PA">
					</div>
					<div class="answer">
						<div>
							<input id="one_2" type="radio" name="answer_2" value="P"> <label
								for="one_2">네! 내 식물에게 좋다는 영양소는 종종 챙겨주는 편이에요.</label>
						</div>
						<div>
							<input id="two_2" type="radio" name="answer_2" value="A"> <label
								for="two_2">제 식물은 물만 먹어도 쑥쑥 잘 자라요.</label>
						</div>

					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 3 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">3/12</h3>
						<h3 class="question">식물을 키우면서 자라는 모습에 행복을 느끼거나 마음이 치유되는 것 같다고
							느낀 적이 있나요?</h3>
						<input id="type" type="hidden" value="PA">
					</div>
					<div class="answer">
						<div>
							<input id="one_3" type="radio" name="answer_3" value="P"> <label
								for="one_3">물론이죠 :) 식물을 기르는 건 저만의 소소한 힐링이에요.</label>
						</div>
						<div>
							<input id="two_3" type="radio" name="answer_3" value="A"> <label
								for="two_3">식물에 신경을 많이 못 써줘서 그런 느낌을 받은 적은 드문 것 같아요.</label>
						</div>

					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 4 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">4/12</h3>
						<h3 class="question">평소 식물을 위해 창문을 얼마나 자주 열고 계시나요?</h3>
						<input id="type" type="hidden" value="HD">
					</div>
					<div class="answer">
						<div>
							<input id="one_4" type="radio" name="answer_4" value="D"> <label
								for="one_4">주기적으로 환기해요.</label>
						</div>
						<div>
							<input id="two_4" type="radio" name="answer_4" value="H"> <label
								for="two_4">생각날 때마다 한 번씩 환기해요.</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 5 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">5/12</h3>
						<h3 class="question">식물에 얼마나 자주 관심을 주나요?</h3>
						<input id="type" type="hidden" value="PA">
					</div>
					<div class="answer">
						<div>
							<input id="one_5" type="radio" name="answer_5" value="P"> <label
								for="one_5">자주 들여다보는 편이에요.</label>
						</div>
						<div>
							<input id="two_5" type="radio" name="answer_5" value="A"> <label
								for="two_5">생각날 때마다 한번씩 들여다 보는 편이에요.</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 6 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">6/12</h3>
						<h3 class="question">내 반려식물의 흙 상태는 어떤가요?</h3>
						<input id="type" type="hidden" value="HD">
					</div>
					<div class="answer">
						<div>
							<input id="one_6" type="radio" name="answer_6" value="H"> <label
								for="one_6">흙이 촉촉하게 젖어 있는 편이에요.</label>
						</div>
						<div>
							<input id="two_6" type="radio" name="answer_6" value="D"> <label
								for="two_6">흙이 말라 있는 편이에요.</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 7 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">7/12</h3>
						<h3 class="question">반려식물은 어디에 있나요?</h3>
						<input id="type" type="hidden" value="LU">
					</div>
					<div class="answer">
						<div>
							<input id="one_7" type="radio" name="answer_7" value="L"> <label
								for="one_7">거실, 테라스, 베란다, 실외 또는 창과 가까운 실내에 있어요.</label>
						</div>
						<div>
							<input id="two_7" type="radio" name="answer_7" value="U"> <label
								for="two_7">창과 거리가 있는 실내에 있어요.</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 8 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">8/12</h3>
						<h3 class="question">반려식물이 위치한 장소는 빛이 얼마나 드나요?</h3>
						<input id="type" type="hidden" value="LU">
					</div>
					<div class="answer">
						<div>
							<input id="one_8" type="radio" name="answer_8" value="L"> <label
								for="one_8">빛이 잘 들어오는 편이에요.</label>
						</div>
						<div>
							<input id="two_8" type="radio" name="answer_8" value="U"> <label
								for="two_8">빛이 잘 들지 않아요.</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 9 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">9/12</h3>
						<h3 class="question">반려식물이 위치한 장소의 창문은 어떤 모양인가요?</h3>
						<input id="type" type="hidden" value="LU">
					</div>
					<div class="answer">
						<div>
							<input id="one_9" type="radio" name="answer_9" value="L"> <label
								for="one_9">통유리나 키와 비슷한 정도의 창문이 있어요.</label>
						</div>
						<div>
							<input id="two_9" type="radio" name="answer_9" value="U"> <label
								for="two_9">환기가 겨우 가능한 조그마난 창문이 있어요.</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>
				<!-- 질문 10 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">10/12</h3>
						<h3 class="question">내 반려식물에게 물을 주는 패턴이 있나요?</h3>
						<input id="type" type="hidden" value="IS">
					</div>
					<div class="answer">
						<div>
							<input id="one_10" type="radio" name="answer_10" value="S"> <label
								for="one_10">네 ! 내 반려식물만의 루틴으로 물을 제공해줘요. 이 식물은 루틴에 따라
								움직여야 건강해요.</label>
						</div>
						<div>
							<input id="two_10" type="radio" name="answer_10" value="I"> <label
								for="two_10">아니요 ! 딱히 정해져있지 않아요. 그래도 무럭무럭 잘 자라요.</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 11 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">11/12</h3>
						<h3 class="question">나의 반려식물은 병해충에 얼마나 강한가요?</h3>
						<input id="type" type="hidden" value="IS">
					</div>
					<div class="answer">
						<div>
							<input id="one_11" type="radio" name="answer_11" value="I"> <label
								for="one_11">병해충에 강한 편이에요.</label>
						</div>
						<div>
							<input id="two_11" type="radio" name="answer_11" value="S"> <label
								for="two_11">병해충에 취약한 편이에요.</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button class="next_btn">다 음</button>
					</div>
				</div>

				<!-- 질문 12 -->
				<div class="test">
					<div class="question_container">
						<h3 class="number">12/12</h3>
						<h3 class="question">반려식물은 병원에 얼마나 자주 방문하나요?</h3>
						<input id="type" type="hidden" value="IS">
					</div>
					<div class="answer">
						<div>
							<input id="one_12" type="radio" name="answer_12" value="I"> <label
								for="one_12">내 반려식물은 건강한 편이라 간단한 자가 치료로 충분해요!</label>
						</div>
						<div>
							<input id="two_12" type="radio" name="answer_12" value="S"> <label
								for="two_12">자주 아파서 병원 선생님이 내 식물을 알아봐요 :(</label>
						</div>
					</div>
					<div class="btn_wrap btn_sort">
						<button class="prev_btn">이 전</button>
						<div class="space"></div>
						<button type="submit" class="mmti_result">제 출</button>
					</div>
				</div>
			</form>
		</div>
	</section>
	<div class="modal">
		<div class="modal-content">
			<h2>모달 제목</h2>
			<p>모달 내용</p>
			<button id="modal-close-btn">닫기</button>
		</div>
	</div>

	<!-- <script type="text/javascript" src="../resources/js/form.js"></script> -->
</body>
</html>