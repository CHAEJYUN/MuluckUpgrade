<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>나의 활동</title>
<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/myPage.css">
<script type="text/javascript">
	$(function() {
		// member_no 값을 변수에 저장
		const memberNo = '${member_no}';
		
		//시작하자마자 갯수들가져오기
		$.ajax({
			url: "load",
			type: "POST", // POST 요청으로 설정
		    data: {member_no : memberNo}, // member_no 값을 데이터로 전송
			success: function(result) {
				$('#count_post').html(result.count_post).css("color", "green");
				$('#count_reply').html(result.count_reply).css("color", "green");
				$('#count_get_heart').html(result.count_get_heart).css("color", "green");
				$('#count_bookmark').html(result.count_bookmark).css("color", "green");
			}//success
		})//ajax
		
		//시작하자마자 게시글 버튼 눌려 있기
		$('#post').css({'font-weight': 'bold', 'background-color': '#dedede'});
        $('#reply').css({'font-weight': 'medium', 'background-color': '#f2f1df'});
        $('#bookmark').css({'font-weight': 'medium', 'background-color': '#f2f1df'});
		$.ajax({
			url: "my_post",
			type: "POST", // POST 요청으로 설정
		    data: {member_no : memberNo}, // member_no 값을 데이터로 전송
			success: function(result) {
				$('#my_result').append(result).css("font-size", "15px");
			}//success
		})//ajax
		
		//게시글 button 눌렀을때
		$('#post').click(function() {
			$('#my_result').empty() //기존의 my_result에 있는 것 삭제됨
			$('#post').css({'font-weight': 'bold', 'background-color': '#dedede'});
	        $('#reply').css({'font-weight': 'medium', 'background-color': '#f2f1df'});
	        $('#bookmark').css({'font-weight': 'medium', 'background-color': '#f2f1df'});
			$.ajax({
				url: "my_post",
				method: "POST", // POST 요청으로 설정
			    data: {member_no: memberNo}, // member_no 값을 데이터로 전송
				success: function(x) {
					$('#my_result').append(x).css("font-size", "15px");
				}//success
			})//ajax
		})//post
		
		//댓글 button 눌렀을때
		$('#reply').click(function() {
			$('#my_result').empty() //기존의 my_result에 있는 것 삭제됨
			$('#post').css({'font-weight': 'medium', 'background-color': '#f2f1df'});
	        $('#reply').css({'font-weight': 'bold', 'background-color': '#dedede'});
	        $('#bookmark').css({'font-weight': 'medium', 'background-color': '#f2f1df'});
			$.ajax({
				url: "my_reply",
				method: "POST", // POST 요청으로 설정
			    data: { member_no: memberNo }, // member_no 값을 데이터로 전송
				success: function(x) {
					$('#my_result').append(x).css("font-size", "15px");
				}//success
			})//ajax
		})//post
		
		//북마크 button 눌렀을때
		$('#bookmark').click(function() {
			$('#my_result').empty() //기존의 my_result에 있는 것 삭제됨
			$('#post').css({'font-weight': 'medium', 'background-color': '#f2f1df'});
	        $('#reply').css({'font-weight': 'medium', 'background-color': '#f2f1df'});
	        $('#bookmark').css({'font-weight': 'bold', 'background-color': '#dedede'});
			$.ajax({
				url: "my_bookmark",
				method: "POST", // POST 요청으로 설정
			    data: { member_no: memberNo }, // member_no 값을 데이터로 전송
				success: function(x) {
					$('#my_result').append(x).css("font-size", "15px");
				}//success
			})//ajax
		})//post
		
	})
</script>
 <!-- 토글 - 드롭다운 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../resources/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
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
					style="text-decoration: underline; font-weight: bolder; background: lightgray; font-size: 25px;">
					나의 활동 </a>
			</div>
			<div class="menu_list">
				<a class="menu" href="${pageContext.request.contextPath}/member/myFollow.jsp"
					style="text-decoration: none; font-weight: 500; font-size: 25px;">
					팔로우 </a>
			</div>
			<div class="menu_list">
				<a class="menu" href="${pageContext.request.contextPath}/member/myInquiry.jsp"
					style="text-decoration: none; font-weight: 500; font-size: 25px;">
					문의하기 </a>
			</div>
		</div>
		<div id="my_screen" style="flex: 8; display: flex; flex-direction: row;">
			<div class="borderline" style="flex: 1; flex-basis: 100px; margin-right: 10px; text-align: center;">
				<div style="margin-top: 20px; margin-bottom: 35px; font-weight: bolder; font-size: 23px;">통계</div>
				<div class="stats" style="font-size: 18px;">작성 게시글:  <div id="count_post" style="display: inline-block; font-size: 18px; font-weight: bold;"></div></div>
				<div class="stats" style="font-size: 18px;">작성 댓글:  <div id="count_reply" style="display: inline-block; font-size: 18px; font-weight: bold;"></div></div>
				<div class="stats" style="font-size: 18px;">받은 좋아요:  <div id="count_get_heart" style="display: inline-block; font-size: 18px; font-weight: bold;"></div></div>
				<div class="stats" style="font-size: 18px;">북마크 수: <div id="count_bookmark" style="display: inline-block; font-size: 18px; font-weight: bold;"></div></div>
			</div>
			<div style="flex: 9; display: flex; flex-direction: column; margin-right: 10px;">
				<div id="btns" style="flex: 2; margin-bottom: 10px;">
					<button class="borderbtn" id="post">게시글</button>
					<button class="borderbtn" id="reply">댓글</button>
					<button class="borderbtn" id="bookmark">북마크</button>
				</div>
				<div class="borderline"	id="my_result" style="flex: 8; margin-bottom: 5px;">
				</div>
			</div>
		</div>
	</div>

</body>
</html>



