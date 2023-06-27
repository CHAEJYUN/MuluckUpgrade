<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta property="og:title" content="나의 반려식물 유형은?">
<meta property="og:image" content="">
<meta property="og:url" content="">
<meta property="og:description" content="나의 반려식물에게 맞는 성격 유형은 무엇일까?">
<title>나의 반려식물 MMTI 찾기</title>
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<link rel="stylesheet" href="../resources/css/result.css"
	type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
	integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx"
	crossorigin="anonymous"></script>
<script>
	Kakao.init('fae1cb71aee8a9b6922099421578a59f'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="../resources/js/result.js"></script>
<script>
	function shareMessage() {
		Kakao.Share.sendDefault({
			objectType : 'feed',
			content : {
				title : 'MMTI 테스트',
				description : '테스트를 통해 당신에게 딱 맞는 식물을 추천해 드릴게요!',
				imageUrl : 'https://ifh.cc/g/3gVfQ4.png',
				link : {
					// [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
					mobileWebUrl : 'https://developers.kakao.com',
					webUrl : 'https://developers.kakao.com',
				},
			},
			social : {
				likeCount : 286,
				commentCount : 45,
				sharedCount : 845,
			},
			buttons : [ {
				title : '웹으로 보기',
				link : {
					mobileWebUrl : 'https://developers.kakao.com',
					webUrl : 'https://developers.kakao.com',
				},
			}],
		});
	}
	
	// 모달 창 생성 함수
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

	    modalContent.appendChild(modalTitle);
	    modalContent.appendChild(modalMessage);
	    modalContent.appendChild(closeButton);
	    modal.appendChild(modalContent);

	    document.body.appendChild(modal);

	    modal.style.display = "block";
	}

	function closeModal() {
	    var modal = document.querySelector(".modal");
	    if (modal) {
	        modal.style.display = "none";
	        document.body.removeChild(modal);
	    }
	}

	var copyButton = document.querySelector(".copy_btn");
	copyButton.addEventListener("click", function() {
	    copyUrl();
	});
	
</script>
</head>
<body>

<%-- 사용자가 선택한 각 유형별 답변 값을 받습니다. --%>
    <% String answer_1 = request.getParameter("answer_1"); %>
    <% String answer_2 = request.getParameter("answer_2"); %>
    <% String answer_3 = request.getParameter("answer_3"); %>
    <% String answer_4 = request.getParameter("answer_4"); %>
    <% String answer_5 = request.getParameter("answer_5"); %>
    <% String answer_6 = request.getParameter("answer_6"); %>
    <% String answer_7 = request.getParameter("answer_7"); %>
    <% String answer_8 = request.getParameter("answer_8"); %>
    <% String answer_9 = request.getParameter("answer_9"); %>
    <% String answer_10 = request.getParameter("answer_10"); %>
    <% String answer_11 = request.getParameter("answer_11"); %>
    <% String answer_12 = request.getParameter("answer_12"); %>
    
    <%-- 각 유형별 질문의 가중치를 정의합니다. --%>
    <% int PWeight = 2; %>
    <% int AWeight = 1; %>
    <% int HWeight = 2; %>
    <% int DWeight = 1; %>
    <% int LWeight = 2; %>
    <% int UWeight = 1; %>
    <% int IWeight = 2; %>
    <% int SWeight = 1; %>
    
    <%-- 사용자가 선택한 유형을 기반으로 MMTI 유형을 계산합니다. --%>
    <% int PCount = 0; %>
    <% int ACount = 0; %>
    <% int HCount = 0; %>
    <% int DCount = 0; %>
    <% int LCount = 0; %>
    <% int UCount = 0; %>
    <% int ICount = 0; %>
    <% int SCount = 0; %>
    
    <% if (answer_1.equals("H")) { HCount += HWeight; } else { DCount += DWeight; } %>
    <% if (answer_2.equals("P")) { PCount += PWeight; } else { ACount += AWeight; } %>
    <% if (answer_3.equals("P")) { PCount += PWeight; } else { ACount += AWeight; } %>
    <% if (answer_4.equals("H")) { HCount += HWeight; } else { DCount += DWeight; } %>
    <% if (answer_5.equals("P")) { PCount += PWeight; } else { ACount += AWeight; } %>
    <% if (answer_6.equals("H")) { HCount += HWeight; } else { DCount += DWeight; } %>
    <% if (answer_7.equals("L")) { LCount += LWeight; } else { UCount += UWeight; } %>
    <% if (answer_8.equals("L")) { LCount += LWeight; } else { UCount += UWeight; } %>
    <% if (answer_9.equals("L")) { LCount += LWeight; } else { UCount += UWeight; } %>
    <% if (answer_10.equals("I")) { ICount += IWeight; } else { SCount += SWeight; } %>
    <% if (answer_11.equals("I")) { ICount += IWeight; } else { SCount += SWeight; } %>
    <% if (answer_12.equals("I")) { ICount += IWeight; } else { SCount += SWeight; } %>
    
    <%-- 사용자의 MMTI 유형을 계산합니다. --%>
    <% String mmtiType = ""; %>
    <% if (PCount > ACount) { mmtiType += "P"; } else { mmtiType += "A"; } %>
    <% if (HCount > DCount) { mmtiType += "H"; } else { mmtiType += "D"; } %>
    <% if (LCount > UCount) { mmtiType += "L"; } else { mmtiType += "U"; } %>
    <% if (ICount > SCount) { mmtiType += "I"; } else { mmtiType += "S"; } %>
    
	<section id="main_contents">
		<div class="wrapper">
			<div class="result">
				<div class="title">
					<h2>내 식물의 MMTI는</h2>
					<h1>[<%= mmtiType %>]</h1>
					<%-- 상단 설명을 위한 조건문 --%>
					<% if (mmtiType.equals("PHLS")) { %>
    				<h2>소극적인 마음가짐 - 습하고, 밝은 곳을 좋아하며 키우기 까다로워요</h2>
					<% } else if (mmtiType.equals("PHUI")){ %>
    				<h2>소극적인 마음가짐 - 습하고, 어두운 곳을 좋아하며 키우기 까다롭지 않아요</h2>
					<% } else if (mmtiType.equals("PHUS")){ %>
    				<h2>소극적인 마음가짐 - 습하고, 어두운 곳을 좋아하며 키우기 까다로워요</h2>
    				<% } else if (mmtiType.equals("PHLI")){ %>
    				<h2>소극적인 마음가짐 - 습하고, 밝은 곳을 좋아하며 키우기 까다롭지 않아요</h2>
    				<% } else if (mmtiType.equals("PDUI")){ %>
    				<h2>소극적인 마음가짐 - 건조하고, 어두운 곳을 좋아하며 키우기 까다롭지 않아요</h2>
    				<% } else if (mmtiType.equals("PDUS")){ %>
    				<h2>소극적인 마음가짐 - 건조하고, 어두운 곳을 좋아하며 키우기 까다로워요</h2>
    				<% } else if (mmtiType.equals("AHUI")){ %>
    				<h2>적극적인 마음가짐 - 습하고, 어두운 곳을 좋아하며 키우기 까다로워요</h2>
    				<% } else if (mmtiType.equals("PDLI")){ %>
    				<h2>소극적인 마음가짐 - 건조하고, 밝운 곳을 좋아하며 키우기 까다롭지 않아요</h2>
    				<% } else if (mmtiType.equals("PDLS")){ %>
    				<h2>소극적인 마음가짐 - 건조하고, 밝은 곳을 좋아하며 키우기 까다로워요</h2>
    				<% } else if (mmtiType.equals("AHUS")){ %>
    				<h2>적극적인 마음가짐 - 습하고, 어두운 곳을 좋아하며 키우기 까다로워요</h2>
    				<% } else if (mmtiType.equals("AHLI")){ %>
    				<h2>적극적인 마음가짐 - 습하고, 밝은 곳을 좋아하며 키우기 까다롭지 않아요</h2>
    				<% } else if (mmtiType.equals("AHLS")){ %>
    				<h2>적극적인 마음가짐 - 습하고, 밝은 곳을 좋아하며 키우기 까다로워요</h2>
    				<% } else if (mmtiType.equals("ADUI")){ %>
    				<h2>적극적인 마음가짐 - 건조하고, 어두운 곳을 좋아하며 키우기 까다롭지 않아요</h2>
    				<% } else if (mmtiType.equals("ADUS")){ %>
    				<h2>적극적인 마음가짐 - 건조하고, 어두운 곳을 좋아하며 키우기 까다로워요</h2>
    				<% } else if (mmtiType.equals("ADLI")){ %>
    				<h2>적극적인 마음가짐 - 건조하고, 밝은 곳을 좋아하며 키우기 까다롭지 않아요</h2>
    				<% } else if (mmtiType.equals("ADLS")){ %>
    				<h2>적극적인 마음가짐 - 건조하고, 밝은 곳을 좋아하며 키우기 까다로워요</h2>
					<% } %>
				</div>
				<div class="result_img">
					<!-- <img src="../resources/assets/img/mmti.png" alt="frontend"> -->
					<%-- 이미지 표시를 위한 조건문 --%>
					<% if (mmtiType.equals("PHLS")) { %>
    				<img src="../resources/assets/img/result/PHLS.png" alt="Image PHLS">
					<% } else if (mmtiType.equals("PHUI")){ %>
    				<img src="../resources/assets/img/result/PHUI.png" alt="Image PHUI">
					<% } else if (mmtiType.equals("PHUS")){ %>
    				<img src="../resources/assets/img/result/PHUS.png" alt="Image PHUS">
    				<% } else if (mmtiType.equals("PHLI")){ %>
    				<img src="../resources/assets/img/result/PHLI.png" alt="Image PHLI">
    				<% } else if (mmtiType.equals("PDUI")){ %>
    				<img src="../resources/assets/img/result/PDUI.png" alt="Image PDUI">
    				<% } else if (mmtiType.equals("PDUS")){ %>
    				<img src="../resources/assets/img/result/PDUS.png" alt="Image PDUS">
    				<% } else if (mmtiType.equals("AHUI")){ %>
    				<img src="../resources/assets/img/result/AHUI.png" alt="Image AHUI">
    				<% } else if (mmtiType.equals("PDLI")){ %>
    				<img src="../resources/assets/img/result/PDLI.png" alt="Image PDLI">
    				<% } else if (mmtiType.equals("PDLS")){ %>
    				<img src="../resources/assets/img/result/PDLS.png" alt="Image PDLS">
    				<% } else if (mmtiType.equals("AHUS")){ %>
    				<img src="../resources/assets/img/result/AHUS.png" alt="Image AHUS">
    				<% } else if (mmtiType.equals("AHLI")){ %>
    				<img src="../resources/assets/img/result/AHLI.png" alt="Image AHLI">
    				<% } else if (mmtiType.equals("AHLS")){ %>
    				<img src="../resources/assets/img/result/AHLS.png" alt="Image AHLS">
    				<% } else if (mmtiType.equals("ADUI")){ %>
    				<img src="../resources/assets/img/result/ADUI.png" alt="Image ADUI">
    				<% } else if (mmtiType.equals("ADUS")){ %>
    				<img src="../resources/assets/img/result/ADUS.png" alt="Image ADUS">
    				<% } else if (mmtiType.equals("ADLI")){ %>
    				<img src="../resources/assets/img/result/ADLI.png" alt="Image ADLI">
    				<% } else if (mmtiType.equals("ADLS")){ %>
    				<img src="../resources/assets/img/result/ADLS.png" alt="Image ADLS">
					<% } %>
				</div>
			</div>
			<div class="result_explains">
				<div class="explain">
					<h3 class="title"><%= mmtiType %></h3>
					<div class="result_img2">
					<img src="../resources/assets/img/type.png">
					</div>
					<ul>
					
					<!-- 내용 표시를 위한 조건문 -->
					<% if (mmtiType.equals("PHLS")) { %>
    				<li>P/A : <b>Passive(소극적인 마음가짐)</b> / Active(적극적인 마음가짐)</li>
    				<li>H/D : <b>Humid(공기가 살짝 촉촉하거나 습한 곳)</b> / Dry(습도가 낮아 건조한 곳)</li>
    				<li>L/U : <b>Light(빛이 잘 드는 밝은 곳)</b> / Umbrous(빛이 잘 들지 않는 곳)</li>
    				<li>I/S : Insensitive(적응을 잘하는) / <b>Sensitive(적응을 어려워하는)</b></li>
					<% } else if (mmtiType.equals("PHUI")){ %>
    				<li>P/A : <b>Passive(소극적인 마음가짐)</b> / Active(적극적인 마음가짐)</li>
    				<li>H/D : <b>Humid(공기가 살짝 촉촉하거나 습한 곳)</b> / Dry(습도가 낮아 건조한 곳)</li>
    				<li>L/U : Light(빛이 잘 드는 밝은 곳) / <b>Umbrous(빛이 잘 들지 않는 곳)</b></li>
    				<li>I/S : <b>Insensitive(적응을 잘하는)</b> / Sensitive(적응을 어려워하는)</li>
					<% } else if (mmtiType.equals("PHUS")){ %>
    				<li>P/A : <b>Passive(소극적인 마음가짐)</b> / Active(적극적인 마음가짐)</li>
    				<li>H/D : <b>Humid(공기가 살짝 촉촉하거나 습한 곳)</b> / Dry(습도가 낮아 건조한 곳)</li>
    				<li>L/U : Light(빛이 잘 드는 밝은 곳) / <b>Umbrous(빛이 잘 들지 않는 곳)</b></li>
    				<li>I/S : Insensitive(적응을 잘하는) / <b>Sensitive(적응을 어려워하는)</b></li>
    				<% } else if (mmtiType.equals("PHLI")){ %>
    				<li>P/A : <b>Passive(소극적인 마음가짐)</b> / Active(적극적인 마음가짐)</li>
    				<li>H/D : <b>Humid(공기가 살짝 촉촉하거나 습한 곳)</b> / Dry(습도가 낮아 건조한 곳)</li>
    				<li>L/U : <b>Light(빛이 잘 드는 밝은 곳)</b> / Umbrous(빛이 잘 들지 않는 곳)</li>
    				<li>I/S : <b>Insensitive(적응을 잘하는)</b> / Sensitive(적응을 어려워하는)</li>
    				<% } else if (mmtiType.equals("PDUI")){ %>
    				<li>P/A : <b>Passive(소극적인 마음가짐)</b> / Active(적극적인 마음가짐)</li>
    				<li>H/D : Humid(공기가 살짝 촉촉하거나 습한 곳) / <b>Dry(습도가 낮아 건조한 곳)</b></li>
    				<li>L/U : Light(빛이 잘 드는 밝은 곳) / <b>Umbrous(빛이 잘 들지 않는 곳)</b></li>
    				<li>I/S : <b>Insensitive(적응을 잘하는)</b> / Sensitive(적응을 어려워하는)</li>
    				<% } else if (mmtiType.equals("PDUS")){ %>
    				<li>P/A : <b>Passive(소극적인 마음가짐)</b> / Active(적극적인 마음가짐)</li>
    				<li>H/D : Humid(공기가 살짝 촉촉하거나 습한 곳) / <b>Dry(습도가 낮아 건조한 곳)</b></li>
    				<li>L/U : Light(빛이 잘 드는 밝은 곳) / <b>Umbrous(빛이 잘 들지 않는 곳)</b></li>
    				<li>I/S : Insensitive(적응을 잘하는) / <b>Sensitive(적응을 어려워하는)</b></li>
    				<% } else if (mmtiType.equals("AHUI")){ %>
    				<li>P/A : Passive(소극적인 마음가짐) / <b>Active(적극적인 마음가짐)</b></li>
    				<li>H/D : <b>Humid(공기가 살짝 촉촉하거나 습한 곳)</b> / Dry(습도가 낮아 건조한 곳)</li>
    				<li>L/U : Light(빛이 잘 드는 밝은 곳) / <b>Umbrous(빛이 잘 들지 않는 곳)</b></li>
    				<li>I/S : <b>Insensitive(적응을 잘하는)</b> / Sensitive(적응을 어려워하는)</li>
    				<% } else if (mmtiType.equals("PDLI")){ %>
    				<li>P/A : <b>Passive(소극적인 마음가짐)</b> / Active(적극적인 마음가짐)</li>
    				<li>H/D : Humid(공기가 살짝 촉촉하거나 습한 곳) / <b>Dry(습도가 낮아 건조한 곳)</b></li>
    				<li>L/U : <b>Light(빛이 잘 드는 밝은 곳)</b> / Umbrous(빛이 잘 들지 않는 곳)</li>
    				<li>I/S : <b>Insensitive(적응을 잘하는)</b> / Sensitive(적응을 어려워하는)</li>
    				<% } else if (mmtiType.equals("PDLS")){ %>
    				<li>P/A : <b>Passive(소극적인 마음가짐)</b> / Active(적극적인 마음가짐)</li>
    				<li>H/D : Humid(공기가 살짝 촉촉하거나 습한 곳) / <b>Dry(습도가 낮아 건조한 곳)</b></li>
    				<li>L/U : <b>Light(빛이 잘 드는 밝은 곳)</b> / Umbrous(빛이 잘 들지 않는 곳)</li>
    				<li>I/S : Insensitive(적응을 잘하는) / <b>Sensitive(적응을 어려워하는)</b></li>
    				<% } else if (mmtiType.equals("AHUS")){ %>
    				<li>P/A : Passive(소극적인 마음가짐) / <b>Active(적극적인 마음가짐)</b></li>
    				<li>H/D : <b>Humid(공기가 살짝 촉촉하거나 습한 곳)</b> / Dry(습도가 낮아 건조한 곳)</li>
    				<li>L/U : Light(빛이 잘 드는 밝은 곳) / <b>Umbrous(빛이 잘 들지 않는 곳)</b></li>
    				<li>I/S : Insensitive(적응을 잘하는) / <b>Sensitive(적응을 어려워하는)</b></li>
    				<% } else if (mmtiType.equals("AHLI")){ %>
    				<li>P/A : Passive(소극적인 마음가짐) / <b>Active(적극적인 마음가짐)</b></li>
    				<li>H/D : <b>Humid(공기가 살짝 촉촉하거나 습한 곳)</b> / Dry(습도가 낮아 건조한 곳)</li>
    				<li>L/U : <b>Light(빛이 잘 드는 밝은 곳)</b> / Umbrous(빛이 잘 들지 않는 곳)</li>
    				<li>I/S : <b>Insensitive(적응을 잘하는)</b> / Sensitive(적응을 어려워하는)</li>
    				<% } else if (mmtiType.equals("AHLS")){ %>
    				<li>P/A : Passive(소극적인 마음가짐) / <b>Active(적극적인 마음가짐)</b></li>
    				<li>H/D : <b>Humid(공기가 살짝 촉촉하거나 습한 곳)</b> / Dry(습도가 낮아 건조한 곳)</li>
    				<li>L/U : <b>Light(빛이 잘 드는 밝은 곳)</b> / Umbrous(빛이 잘 들지 않는 곳)</li>
    				<li>I/S : Insensitive(적응을 잘하는) / <b>Sensitive(적응을 어려워하는)</b></li>
    				<% } else if (mmtiType.equals("ADUI")){ %>
    				<li>P/A : Passive(소극적인 마음가짐) / <b>Active(적극적인 마음가짐)</b></li>
    				<li>H/D : Humid(공기가 살짝 촉촉하거나 습한 곳) / <b>Dry(습도가 낮아 건조한 곳)</b></li>
    				<li>L/U : Light(빛이 잘 드는 밝은 곳) / <b>Umbrous(빛이 잘 들지 않는 곳)</b></li>
    				<li>I/S : <b>Insensitive(적응을 잘하는)</b> / Sensitive(적응을 어려워하는)</li>
    				<% } else if (mmtiType.equals("ADUS")){ %>
    				<li>P/A : Passive(소극적인 마음가짐) / <b>Active(적극적인 마음가짐)</b></li>
    				<li>H/D : Humid(공기가 살짝 촉촉하거나 습한 곳) / <b>Dry(습도가 낮아 건조한 곳)</b></li>
    				<li>L/U : Light(빛이 잘 드는 밝은 곳) / <b>Umbrous(빛이 잘 들지 않는 곳)</b></li>
    				<li>I/S : Insensitive(적응을 잘하는) / <b>Sensitive(적응을 어려워하는)</b></li>
    				<% } else if (mmtiType.equals("ADLI")){ %>
    				<li>P/A : Passive(소극적인 마음가짐) / <b>Active(적극적인 마음가짐)</b></li>
    				<li>H/D : Humid(공기가 살짝 촉촉하거나 습한 곳) / <b>Dry(습도가 낮아 건조한 곳)</b></li>
    				<li>L/U : <b>Light(빛이 잘 드는 밝은 곳)</b> / Umbrous(빛이 잘 들지 않는 곳)</li>
    				<li>I/S : <b>Insensitive(적응을 잘하는)</b> / Sensitive(적응을 어려워하는)</li>
    				<% } else if (mmtiType.equals("ADLS")){ %>
    				<li>P/A : Passive(소극적인 마음가짐) / <b>Active(적극적인 마음가짐)</b></li>
    				<li>H/D : Humid(공기가 살짝 촉촉하거나 습한 곳) / <b>Dry(습도가 낮아 건조한 곳)</b></li>
    				<li>L/U : <b>Light(빛이 잘 드는 밝은 곳)</b> / Umbrous(빛이 잘 들지 않는 곳)</li>
    				<li>I/S : Insensitive(적응을 잘하는) / <b>Sensitive(적응을 어려워하는)</b></li>
					<% } %>
						
						<!-- <li>P/A : Passive(소극적인 마음가짐) / Active(적극적인 마음가짐)</li>
						<h4> 이 영역은 보호자의 적극적 / 소극적인 식물 관리에 따라 달라져요.<br>같은 식물이라도 보호자에 따라 달라질 수 있는 후천적인 영역이에요.</h4>
						<li>H/D : Humid(공기가 살짝 촉촉하거나 습한 곳) / Dry(습도가 낮아 건조한 곳)</li>
						<h4>나의 반려식물은 이런 습도에서 잘 자라요.</h4>
						<li>L/U : Light(빛이 잘 드는 밝은 곳) / Umbrous(빛이 잘 들지 않는 곳)</li>
						<h4>나의 반려식물이 좋아하는 장소에는 빛이 이만큼 들어와요.</h4>
						<li>I/S : Insensitive(적응을 잘하는) / Sensitive(적응을 어려워하는)</li>
						<h4>나의 반려식물이 까다로운지, 주변 환경에 맞춰 잘 자라주는지 알 수 있는 유형이에요. </h4> -->
					</ul>
				</div>
			</div>
			<div class="share">
				<div class="url">
					<button class="copy_btn" type="button" onclick="javascript:copyUrl()">URL 복사하기</button>
				</div>
				<div class="facebook">
					<button class="facebook_share" type="button" onclick="javascript:shareFacebook()">Facebook 공유하기</button>
				</div>
				<div class="kakao">
					<button class="kakao_share" type="button" id="kakao_share"
						onclick="javascript:shareMessage()">카카오톡 공유하기</button>
				</div>
			</div>
			<div class="buttons">
				<ul>
					<li>
						<h3>다른 식물들은 어떤 유형일까?</h3> <a href="mmti_test.jsp">
							<button type="button">테스트 다시 하기</button>
					</a>
					</li>
					<li>
						<h3>무우럭이 궁금하다면?</h3> <a href="../member/login.jsp">
							<button type="button">무우럭 서비스 이용해보기</button>
					</a>
					</li>
					
				</ul>
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
	
</body>
</html>