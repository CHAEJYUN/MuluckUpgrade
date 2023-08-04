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
<title>매니저마이페이지</title>
<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->
<link rel="stylesheet" type="text/css"
	href="../resources/css/myPage.css">
</head>
<body>
<%@ include file="manager_header.jsp"%>

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
			<a class="menu" href="${pageContext.request.contextPath}/manager/managerPage"
				style="text-decoration: none; font-weight: 500; font-size: 25px;">
				매니저 정보 </a>
		</div>
		<div class="menu_list">
			<a class="menu" href="${pageContext.request.contextPath}/manager/managerActivity.jsp"
				style="text-decoration: underline; font-weight: bolder; background: lightgray; font-size: 25px;">
				매니저 활동 </a>
		</div>
	</div>
	
	<!-- 내용 -->
	<div id="my_screen" style="flex: 8; flex-direction: column;">
	
	
	</div>
</div>
</body>
</html>



