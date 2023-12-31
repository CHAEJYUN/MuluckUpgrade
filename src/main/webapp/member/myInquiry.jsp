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
<title>나의문의</title>
<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->
<link rel="stylesheet" type="text/css" href="../resources/css/myPage.css">
 <!-- 토글 - 드롭다운 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../resources/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script type="text/javascript">
$(function() {
	const member_no = ${member_no};
	
	//시작하자마자 문의글 목록 불러오기
	$.ajax({
		url: "my_inquiry",
		type: "POST", // POST 요청으로 설정
	    data: {inquiry_writer : member_no}, // member_no 값을 데이터로 전송
		success: function(result) {
			$('#inquiry_result').append(result).css("font-size", "15px");
		}//success
	})//ajax
})
</script>
</head>
<body>
<!-- 네비게이션바 header -->
<%@ include file="../nav_header.jsp"%>

<!-- 마이페이지 회원정보 -->
<div id="my" style="display: flex; justify-content: space-between;">
	<!-- 메뉴카테고리 -->
	<div id="my_menu" style="flex: 2;">
		<div class="menu_list" id="menu_title">
			<a class="menu"
				style="color: #145f37; font-weight: 900; text-decoration: none; font-size: 30px;">
				마이페이지 </a>
		</div>
		<div class="menu_list">
			<a class="menu" href="${pageContext.request.contextPath}/member/mypage"
				style="text-decoration: none; font-weight: 500; font-size: 25px;">
				회원 정보 </a>
		</div>
		<div class="menu_list">
			<a class="menu" href="${pageContext.request.contextPath}/member/myActivity.jsp"
				style="text-decoration: none; font-weight: 500; font-size: 25px;">
				나의 활동 </a>
		</div>
		<div class="menu_list">
			<a class="menu" href="${pageContext.request.contextPath}/member/myFollow.jsp"
				style="text-decoration: none; font-weight: 500; font-size: 25px;">
				팔로우 </a>
		</div>
		<div class="menu_list">
			<a class="menu" href="${pageContext.request.contextPath}/member/myInquiry.jsp"
				style="text-decoration: underline; font-weight: bolder; background: lightgray; font-size: 25px;">
				문의하기 </a>
		</div>
	</div>
	<div class="borderline" id="my_screen" style="flex: 8; display: flex; flex-direction: column; margin-top: 10px; margin-right: 10px;">
		<div style="margin-top: 20px;"><span style="font-size: 35px; font-weight: bolder;">문의 목록</span></div>
		<div style="flex: 2; max-height: 30px;  margin-right: 5%; margin-top: 15px; margin-bottom: 20px;">
			<a href="writeInquiry.jsp"><button style="float: right;">문의하기</button></a>
		</div>
		<div style="flex: 8;" id="inquiry_result"></div>
	</div>
</div>
</body>
</html>



