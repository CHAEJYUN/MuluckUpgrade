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
<title>무우럭</title>
<%@ include file="diary_header.jsp"%>
</head>

<body>
	<!-- 네비게이션바 header -->
	<%@ include file="../../../nav_header.jsp"%>
		<input  type="hidden" name="member_no" value="${member_no}">

		<ul class="viewcard_total">
			<li class="viewcard">
				<div class="thumbnail1">
					<img class="thumbnail2" src="" onerror="this.src='../resources/img/mulucklogo.jpg'">
				</div>
				<div class="thumbnail_title">
					<p class="viewcard_title">${diary_nickname}의오늘은 어땠나요?</p>
					<a href="diary.jsp?diary_nickname=${diary_nickname}">&#x1F331 써보기 &#x1F331</a>
				</div>
			</li>
		</ul>
	<c:forEach items="${list}" var="bag">
		<div>
			<ul class="viewcard_total">
				<li class="viewcard">
					<div class="thumbnail1">
						<img class="thumbnail2" src="../resources/upload/diary/${bag.diary_img}" onerror="this.src='../resources/img/mulucklogo.jpg'">
					</div>
					<div class="thumbnail_title">
						<p class="viewcard_title">제목: ${bag.diary_title}</p>
						<p class="viewcard_contents">내용: ${bag.diary_contents}</p>
						<p class="viewcard_mood">기분: ${bag.diary_mood}</p>
						<p class="viewcard_date">날짜: ${bag.diary_date}</p>
					</div>
				</li>
			</ul>
		</div>
	</c:forEach>
</body>
</html>
