<%@ page import="com.multi.muluckup.member.InquiryVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>문의글</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/myPage.css">
 <!-- 토글 - 드롭다운 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../resources/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script type="text/javascript">
$(function() {
    $('#answer').hide();
	const inquiry_manager = ${bag.inquiry_manager};
	
	if(inquiry_manager !== 0){
		$('#answer').show();
		$.ajax({
			url: "manager",
			type: "post",
			data: {member_no: inquiry_manager},
			dataType: "json",
			success: function(result) {
				//console.log(result); // 전체 결과를 출력
				//console.log(result.member_no); // member_no 값만 출력
				//console.log(result.member_nickname); // member_nickname 값도 출력
				$("#manager").html(result.member_nickname);
			},
			error: function() {
				$("#manager").html("관리자"); //.css('color', 'red')
			}
		});
		
	}
	
})//function
</script>
</head>
<body>
<!-- 네비게이션바 header -->
<%@ include file="../../../nav_header.jsp"%>

<div id="my" style="display: flex; justify-content: space-between;">
	<!-- 메뉴카테고리 -->
	<div id="my_menu" style="flex: 2;">
		<div class="menu_list" id="menu_title">
			<a class="menu" style="color: #145f37; font-weight: 900; text-decoration: none; font-size: 30px;">마이페이지 </a>
		</div>
		<div class="menu_list">
			<a class="menu" href="${pageContext.request.contextPath}/member/mypage" style="text-decoration: none; font-weight: 500; font-size: 25px;">회원 정보 </a>
		</div>
		<div class="menu_list">
			<a class="menu" href="${pageContext.request.contextPath}/member/myActivity.jsp" style="text-decoration: none; font-weight: 500; font-size: 25px;">나의 활동 </a>
		</div>
		<div class="menu_list">
			<a class="menu" href="${pageContext.request.contextPath}/member/myFollow.jsp" style="text-decoration: none; font-weight: 500; font-size: 25px;">팔로우 </a>
		</div>
		<div class="menu_list">
			<a class="menu" href="${pageContext.request.contextPath}/member/myInquiry.jsp" style="text-decoration: underline; font-weight: bolder; background: lightgray; font-size: 25px;">문의하기 </a>
		</div>
	</div>
	<div id="my_screen" style="flex: 8; margin-top: 10px; margin-right: 10px;">
		<div style="max-height: 30px;  margin-left: 5%; margin-top: 20px; margin-bottom: 80px;">
			<a href="myInquiry.jsp"><button style="float: left;">이전</button></a>
		</div>
		<div class="borderline" style="margin-top: 15px;">
			<div style="margin-top: 10px;">
				<h2 style="font-size: 40px;">${bag.inquiry_title}</h2>
			 	<span>작성 일: ${bag.formattedInquiryUdate}</span>
			</div>
			<div style="margin: 1% 15%; height: 300px; text-align: center; background: lightgray;">
				<span style="font-size: 20px;">${bag.inquiry_content}</span>
			</div>
		</div>
		<div id="answer" class="borderline" style="display: flex; flex-direction: column; margin-top: 15px; margin-bottom: 10px;">
			<div style="flex: 2; text-align: left; margin-top: 10px; margin-left: 5%;">
				<span style="font-size: 20px; font-weight: bold;">문의 답변:</span>
			</div>
			<div style="flex:5; display: flex; flex-direction: row;">
				<div style="flex: 1; margin: 5px 10px; text-align: center;">
					<span id="manager" style="font-size: 20px;"></span>
				</div>
				<div style="flex: 5; margin: 5px 10px; text-align: center; background: lightgray;">
					<span style="font-size: 20px;">${bag.inquiry_answer}</span>
				</div>
				<div style="flex: 1; margin: 5px 10px; text-align: center;">
					<span style="font-size: 20px;">${bag.formattedInquiryAdate}</span>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>