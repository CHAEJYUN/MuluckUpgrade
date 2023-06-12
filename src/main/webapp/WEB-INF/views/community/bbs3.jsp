<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>커뮤니티</title>
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
<link href="../resources/css/community.css" type="text/css" rel="stylesheet" />
<style>
div {
	text-align: center;
}
</style>
<!-- 토글 - 드롭다운 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../resources/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</head>
<body>
<!-- 네비게이션바 header -->
<%@ include file="../../../nav_header.jsp"%>
	<!-- 화면 좌측 -->
	<!-- 카테고리 -->
	<div id="category_list">
	<div class="category_list">
		<a class="category" href="../community/community.jsp" style="text-decoration: none">
		<font size="5">무우럭</font></a>
	</div>
	<div class="category_list">
		<a class="category" href="bbs1" style="text-decoration: none">
		<font size="5">자유게시판</font></a>
	</div>
	<div class="category_list">
		<a class="category" href="bbs2" style="text-decoration: none">
		<font size="5">질문게시판</font></a>
	</div>
	<div class="category_list">
		<a class="category" href="bbs3" style="text-decoration: none">
		<font size="5">자랑게시판</font></a>
	</div>
	</div>
	<!-- 화면 우측 -->
	<!-- 로그인 해야만 게시글 작성 가능 -->
	<% if(session.getAttribute("member_no") != null){ %> 
	<!-- 글쓰기 버튼 -->
	<div id="insert_button">
		<button onclick="location.href='bbs_insert3'" class="button1">글쓰기</button>
	</div>
	<% } %>
	<!-- 화면 중앙 -->
	<div id="community_center">
	<!-- 게시판 검색 -->
	<div id="bbs_one">
		<form action="bbs_one3" method="get">
			<input name="bbs_no" >
			<button type="submit" class="button1">검색</button>
		</form>
	</div>
	<!-- 게시글 목록 -->
	<div id="bbs_list">
		<c:forEach items="${list}" var="bag">
		<div class="bbs_post">
			<img src="../resources/upload/community/${bag.bbs_img}" width=100 height=100 onerror="this.src='../resources/assets/img/무우럭.png"><br>
			<div class="bbs_content">
				<h5><a href="bbs_one3?bbs_no=${bag.bbs_no}">${bag.bbs_title}</a></h5><br>
				${bag.bbs_content}
			</div>
		</div>
			<br><br><hr><br><br>
		</c:forEach>
	</div>
	</div>
</body>
</html>