<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
<meta name="description" content="" />
<meta name="author" content="" />
<title>문의답변</title>
<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" type="text/css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/manager.css">
<script type="text/javascript">
$(function() {
/* 	// member_no 값을 변수에 저장
	const memberNo = '${member_no}'; */
	
	//답변 대기 문의 버튼 눌려 있기
	$('#wait').css({'font-weight': 'bold', 'background-color': '#dedede'});
    $('#complete').css({'font-weight': 'bold', 'background-color': '#f2f1df'});
	$.ajax({
		url: "inquiry_wait",
		type: "POST", // POST 요청으로 설정
/* 	    data: {member_no : memberNo}, // member_no 값을 데이터로 전송 */
		success: function(result) {
			$('#inquiry').append(result).css("font-size", "25px");
		}//success
	})//ajax
	
	//답변 대기 문의 button 눌렀을때
	$('#wait').click(function() {
		$('#inquiry').empty() //기존의 inquiry에 있는 것 삭제됨
		$('#wait').css({'font-weight': 'bold', 'background-color': '#dedede'});
        $('#complete').css({'font-weight': 'bold', 'background-color': '#f2f1df'});
		$.ajax({
			url: "inquiry_wait",
			method: "POST", // POST 요청으로 설정
/* 		    data: {member_no: memberNo}, // member_no 값을 데이터로 전송 */
			success: function(x) {
				$('#inquiry').append(x).css("font-size", "25px");
			}//success
		})//ajax
	})//wait
	
	//답변 완료 문의 button 눌렀을때
	$('#complete').click(function() {
		$('#inquiry').empty() //기존의 inquiry에 있는 것 삭제됨
		$('#wait').css({'font-weight': 'bold', 'background-color': '#f2f1df'});
        $('#complete').css({'font-weight': 'bold', 'background-color': '#dedede'});
		$.ajax({
			url: "inquiry_complete",
			method: "POST", // POST 요청으로 설정
/* 		    data: {member_no: memberNo}, // member_no 값을 데이터로 전송 */
			success: function(x) {
				$('#inquiry').append(x).css("font-size", "25px");
			}//success
		})//ajax
	})//complete	
	
})
</script>
</head>
<body>
<%@ include file="manager_header.jsp"%>
<div style="display: flex; flex-direction: column; margin-right: 10px;">
	<div id="btns" style="flex: 2;">
		<button class="borderbtn" id="wait" style="margin-right: 10px;">답변 대기 문의</button>
		<button class="borderbtn" id="complete">답변 완료 문의</button>
	</div>
	<div class="borderline"	id="inquiry" style="flex: 8; margin-bottom: 5px;">
	</div>
</div>

</body>
</html>