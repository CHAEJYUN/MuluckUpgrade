<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자활동페이지</title>
<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->
<link rel="stylesheet" type="text/css" href="../resources/css/myPage.css">
<script type="text/javascript">
$(function() {
	//관리자 no가 답한 문의글 목록
	const member_no = ${member_no};
	$.ajax({
		url: "manager_inquiry",
		type: "POST", // POST 요청으로 설정
 	    data: {member_no : member_no}, // member_no 값을 데이터로 전송 
		success: function(result) {
			$('#manager_inquiry').append(result).css("font-size", "25px");
		}//success
	})//ajax
})
</script>	
</head>
<body>
<%@ include file="manager_header.jsp"%>

<!-- 마이페이지 회원정보 -->
<div id="my" style="display: flex; justify-content: space-between;">
	<!-- 메뉴카테고리 -->
	<div id="my_menu" style="flex: 2; min-height: 450px">
		<div class="menu_list" id="menu_title">
			<a class="menu"
				style="color: #145f37; font-weight: 900; text-decoration: none; font-size: 30px;">
				관리자페이지 </a>
		</div>
		<div class="menu_list">
			<a class="menu" href="${pageContext.request.contextPath}/manager/managerPage"
				style="text-decoration: none; font-weight: 500; font-size: 25px;">
				관리자 정보 </a>
		</div>
		<div class="menu_list">
			<a class="menu" href="${pageContext.request.contextPath}/manager/managerActivity.jsp"
				style="text-decoration: underline; font-weight: bolder; background: lightgray; font-size: 25px;">
				관리자 활동 </a>
		</div>
	</div>
	
	<!-- 내용 -->
	<div class="borderline" id="my_screen" style="flex: 8; display: flex; flex-direction: column; margin-top: 10px; margin-right: 10px;">
		<div style="margin-top: 20px; margin-bottom: 30px;">
			<span style="font-size: 35px; font-weight: bolder;">관리자 </span>
			<span style="font-size: 35px; font-weight: bolder; color: #145f37;">${member_nickname}</span>
			<span style="font-size: 35px; font-weight: bolder;">의 활동</span>
		</div>
		<div style="flex: 8;" id="manager_inquiry"></div>
	</div>
</div>
</body>
</html>



