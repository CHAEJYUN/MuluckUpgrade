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
<script type="text/javascript">
$(function() {
    $('#answer').hide();
    $('#write').hide();
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
		});//ajax
	} else {
		$('#write').show();
	}
	
	// 문의글 답변
    $('#answer_send').click(function() {
        const member_no = '${member_no}';
        const answer = $('#inquiry_answer').val().replace(/\n/g, "<br>");
        const inquiry_no = '${bag.inquiry_no}';
        
        $.ajax({
            type: "POST", // POST 방식으로 데이터 전송
            url: "inquiry_answer",
            data: {
                inquiry_no: inquiry_no,
                inquiry_manager: member_no,
                inquiry_answer: answer
            },
            success: function(x) {
                if (x === true) {
                    window.location.href = "${pageContext.request.contextPath}/manager/managerInquiry.jsp";
                }
            },
            error: function(xhr, status, error) {
                console.log(error);
                // 요청 실패 시 처리할 로직
            }//error
        });//ajax
	});	// 문의글 답변
	
	
	//문의글 수정
	$('#inquiry_modify').click(function() {
		$('#write').show();
		$('#inquiry_answer').focus(); //커서를 수정부분으로 옮김
	})
	
});//function
</script>
</head>
<body>
<!-- 네비게이션바 header -->
<%@ include file="../../../manager/manager_header.jsp"%>

<div id="my" style="display: flex; justify-content: space-between;">
	<div id="my_screen" style="flex: 8; margin-top: 10px; margin-right: 10px;">
		<div style="max-height: 30px;  margin-left: 5%; margin-top: 20px; margin-bottom: 80px;">
			<a href="managerInquiry.jsp"><button style="float: left;">이전</button></a>
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
		
		<!-- 답변 -->
		<div id="answer" class="borderline" style="display: flex; flex-direction: column; margin-top: 30px; margin-bottom: 10px;">
			<div style="flex: 2; text-align: left; margin-top: 10px; margin-left: 5%;">
				<span style="font-size: 20px; font-weight: bold;">문의 답변:</span>
				<button id="inquiry_modify" type="button" style="margin-right: 60px; float: right;">수정하기</button>
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
		
		<!-- 답변쓰기 -->
		<div id="write" class="borderline" style="display: flex; flex-direction: row; margin-top: 30px; margin-bottom: 10px;">
			<!-- <input name="member_no" value=${member_no} type="hidden"/> -->
			<div style="flex: 1; margin: auto 10px; text-align: center;">
				${member_nickname}
			</div>
			<textarea id="inquiry_answer" name="inquiry_answer" rows="5" style="flex: 5; margin: 5px 10px; padding: 2px 5px;" placeholder=" 문의 답변을 입력하세요."></textarea>
			<button id="answer_send" type="button" style="flex: 1; margin: auto 10px; text-align: center;">답변완료</button>
		</div>
	</div>
</div>
</body>
</html>