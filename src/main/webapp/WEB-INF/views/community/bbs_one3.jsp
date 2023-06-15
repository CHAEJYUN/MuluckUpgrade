<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page import="com.multi.muluckup.community.BbsVO" %>
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
<!-- js -->
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
$(function() {
	//댓글 목록
	$.ajax({
		url : "rr_list",
		data : {
			bbs_no : ${bag.bbs_no}
		},
		success : function(x) {
			$('#reply_list').append(x + "<br>")	
		}
	})
	//댓글 작성
	$('#b1').click(function() {
		reply_content = $('#reply').val()
		button = $('<button>').html('<img src="../resources/assets/img/delete.png">');
		div = $('<div>').append("${member_nickname}", " : ", reply_content, " ", button);
		$.ajax({
			url : "rr",
			data : {
				bbs_no : ${bag.bbs_no},
				reply_content : reply_content,
				member_no : ${member_no}, //세션
			},
			success : function() {
				alert('댓글 작성 완료')
				$('#reply_list').append(div);
				$('#reply').val('')
			}
		})
	}) //b1
	/* 좋아요 */
	$('#heart').click(function() {
		//bbs_no값 넘어갔는지 //alert(${bag.bbs_no}+ "----------")
		//좋아요 실행
		if ($('#heartImage').attr('src') === "../resources/assets/img/unlike.png") {
			$.ajax({
				url : "heart_ok",
				data : {
					bbs_no : ${bag.bbs_no},
					member_no : ${member_no}
				},
				success : function(x) {
					alert('좋아요 성공')
					$('#heartImage').attr('src', "../resources/assets/img/like.png");
				}
			})
		}
		//좋아요 취소
		else if ($('#heartImage').attr('src') === "../resources/assets/img/like.png") {
			$.ajax({
				url : "heart_no",
				data : {
					bbs_no : ${bag.bbs_no},
					member_no : ${member_no}
				},
				success : function(x) {
					alert('좋아요 취소')
					$('#heartImage').attr('src', "../resources/assets/img/unlike.png");
				}
			})
		}
	}) //heart
	/* 북마크 */
	$('#bookmark').click(function() {
		//북마크 저장
		if ($('#bookmarkImage').attr('src') === "../resources/assets/img/unbookmark.png") {
			$.ajax({
				url : "bookmark_ok",
				data : {
					bbs_no : ${bag.bbs_no},
					member_no : ${member_no}
				},
				success : function(x) {
					alert('북마크 성공')
					$('#bookmarkImage').attr('src', "../resources/assets/img/bookmark.png");
				}
			})
		}
		//북마크 취소
		else if ($('#bookmarkImage').attr('src') === "../resources/assets/img/bookmark.png") {
			$.ajax({
				url : "bookmark_no",
				data : {
					bbs_no : ${bag.bbs_no},
					member_no : ${member_no}
				},
				success : function(x) {
					alert('북마크 취소')
					$('#bookmarkImage').attr('src', "../resources/assets/img/unbookmark.png");
				}
			})
		}
	}) //bookmark
	/* 팔로우 & 언팔로우 */
	$('#follow').click(function() {
		//언팔로우 상태일 때 -> 팔로잉 상태로
		if($('#follow').text() == '팔로우') { 
			$.ajax({
				url : "ff_ok",
				data : {
					follower_user: ${member_no},
					following_user: ${bag.member_no}
				},
				success : function(x) {
					alert('팔로우 성공')
					$('#follow').text('팔로잉');
				}
			})
		}
		//팔로잉 상태일 때 -> 언팔로우 상태로
		else if($('#follow').text() == '팔로잉') { 
			$.ajax({
				url : "ff_no",
				data : {
					follower_user: ${member_no},
					following_user: ${bag.member_no}
				},
				success : function(x) {
					alert('언팔로우 성공')
					$('#follow').text('팔로우');
				}
			})
		}
	}) //follow
}) //$
</script>
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
	<div id ="category_all">
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
	<!-- 화면 중앙 -->
	<div id="community_center">
	<!-- 게시판 검색 -->
	<div id="bbs_one">
		<form action="bbs_one1" method="get">
			<input name="bbs_no">
			<button type="submit" class="button1">검색</button>
		</form>
	</div>
	<!-- 유저 프로필 -->
	<div class="user">
		<img id="user" src="../resources/upload/member/myprofile.png" width=40 height=40  style="border-radius: 50px;">
		${member_nickname}
		<!-- 팔로우 버튼 -->
		<button id="follow">팔로우</button>
	</div>
	<!-- 검색 결과 -->
	<div class="bbs_one">
		<h3>${bag.bbs_title}</h3><br>
		<img src="../resources/upload/community/${bag.bbs_img}" width=250 height=250 onerror="this.src='../resources/assets/img/무우럭.png'"><br><br>
		${bag.bbs_content}<br>
	</div>
	  <!-- 세션(본인만 수정/삭제 가능) -->
	  <% 
	  	 if(session.getAttribute("member_no") != null){
	  	 int member_no_s = (int) session.getAttribute("member_no");
	 	 BbsVO bag = (BbsVO)request.getAttribute("bag");
	     int member_no = bag.getMember_no();
	     if(member_no_s == member_no) { %>
	<!-- 수정/삭제 버튼 -->
	<div id="up_del_button">
		<button onclick="location.href='bbs_update3'" class="button1">수정</button>
		<button onclick="location.href='bbs_delete3'" class="button1">삭제</button>
	</div>
	  <% }} %>
	<!-- 좋아요/북마크 버튼 -->
	<div id="heart_book_button">
		<button id="heart" class="button2">
			<img id="heartImage" src="../resources/assets/img/unlike.png" width="30" height="30"></button>
		<button id="bookmark" class="button2">
			<img id="bookmarkImage" src="../resources/assets/img/unbookmark.png" width="30" height="30"></button>
	</div>
	<!-- 댓글 -->
	<div id="bbs_reply">
		<input id="reply">
		<button id="b1">댓글 작성</button>
	</div>
	<div id="reply_list">
		<c:forEach items="${list}" var="bag"> 
			- ${bag.reply_content}<br>
		</c:forEach>
	</div>
	</div>
</body>
</html>