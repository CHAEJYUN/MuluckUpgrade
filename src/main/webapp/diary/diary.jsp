<%@page import="com.sun.jmx.snmp.InetAddressAcl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>식물일기</title>
        <%@ include file="diary_header.jsp"%>
</head>

<body>
<!-- 네비게이션바 header -->
<%@ include file="../nav_header.jsp"%>

	<section class="page-section about-heading" id="text">
	<form action="insert3" method="POST" enctype="multipart/form-data">
		<div class="container">
			<div class="row">
				<div class="photo">
					<img class="photo_preview" id="preview" src="" onerror="this.src='../resources/img/mulucklogo.jpg';" />
					<input  type="file" name="file" onchange="readURL(this)">
					<ul class="navbar-nav px-lg-4">
						<li class="nav-item dropdown">
							
							<select name="dropdown">
							    <option value="&#x1F601">&#x1F601</option>
							    <option value="&#x1F614">&#x1F614</option>
							    <option value="&#x1F62D">&#x1F62D</option>
							    <option value="&#128529">&#128529</option>
							</select>
							
						</li>
					</ul>
				</div>
				<div class="bg-faded rounded p-5">
						<div class="weather" id="weather">
							<span></span>
							<span></span>
						</div>
					<br>
					<h2 class="section-heading mb-4">
						<span class="section-heading-lower">
						<div id="feel"><input type="hidden" name="diary_mood" id="diary_mood" ></div>
						<input type="hidden" name="diary_nickname" value="${param.diary_nickname}">
						<br>
						<input class="diary_title" name="diary_title" type="text" value="일기 제목 쓰세요" onfocus="this.value=''"></span>
					</h2>
					<p><input class="diary_contents" type="text" name="diary_contents" value="일기 내용 쓰세요" onfocus="this.value=''"></p>
					<input  type="hidden" name="member_no" value="${member_no}">
					<button class="button" type="submit">등록</button>
				</div>
			</div>
		</div>
	</form>
	</section>
</body>
</html>