<%@page import="java.util.Collections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul class="viewcard_total viewcard_total1">
	<li class="viewcard">
		<div class="thumbnail1">
			<img class="thumbnail2" src="" onerror="this.src='../resources/img/mulucklogo.jpg'">
		</div>
		<div class="thumbnail_title">
			<p class="viewcard_title">새로운 반려식물 일기를 써봐요!</p>
			<a href="diary_first.jsp">&#x1F331 써보기 &#x1F331</a>
		</div>
	</li>
</ul>
<!-- 식물 nickname에 대한 list 가져오기 -->
 	<ul class="viewcard_total">
<c:forEach items="${list}" var="bag">
 		<li class="viewcard">
			<div class="thumbnail1">
				<img class="thumbnail2" src="../resources/upload/diary/${bag.diary_img}" onerror="this.src='../resources/img/mulucklogo.jpg'" alt="썸네일사진">
			</div>
			<div class="thumbnail_title">
				<p class="viewcard_nickname">
					<a href="cardview_individual?diary_nickname=${bag.diary_nickname}&member_no=${member_no}">${bag.diary_nickname}</a>
				</p>
				<p class="viewcard_date">${bag.diary_date}</p>
			</div>
		</li>
</c:forEach>
	</ul>