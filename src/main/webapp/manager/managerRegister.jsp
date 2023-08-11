<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
<meta name="description" content="" />
<meta name="author" content="" />
<title>매니저 승인</title>
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
	//매니저 승인 대기 버튼 눌려 있기
	$('#wait').css({'font-weight': 'bold', 'background-color': '#dedede'});
    $('#list').css({'font-weight': 'bold', 'background-color': '#f2f1df'});
	$.ajax({
		url: "manager_wait",
		type: "POST", // POST 요청으로 설정
		success: function(result) {
			$('#manager').append(result).css("font-size", "25px");
		}//success
	})//ajax
	
	//매니저 승인 대기 button 눌렀을때
	$('#wait').click(function() {
		$('#manager').empty() //기존의 manager에 있는 것 삭제됨
		$('#wait').css({'font-weight': 'bold', 'background-color': '#dedede'});
        $('#list').css({'font-weight': 'bold', 'background-color': '#f2f1df'});
		$.ajax({
			url: "manager_wait",
			method: "POST", // POST 요청으로 설정
			success: function(x) {
				$('#manager').append(x).css("font-size", "25px");
			}//success
		})//ajax
	})//wait
	
	//매니저 목록 button 눌렀을때
	$('#list').click(function() {
		$('#manager').empty() //기존의 manager에 있는 것 삭제됨
		$('#wait').css({'font-weight': 'bold', 'background-color': '#f2f1df'});
        $('#list').css({'font-weight': 'bold', 'background-color': '#dedede'});
		$.ajax({
			url: "manager_list",
			method: "POST", // POST 요청으로 설정
			success: function(x) {
				$('#manager').append(x).css("font-size", "25px");
			}//success
		})//ajax
	})//list	
	
})
</script>
</head>
<body>
<%@ include file="manager_header.jsp"%>
<div style="display: flex; flex-direction: column; margin-right: 10px;">
	<div id="btns" style="flex: 2;">
		<button class="borderbtn" id="wait" style="margin-right: 10px;">관리자 승인 대기</button>
		<button class="borderbtn" id="list">관리자 목록</button>
	</div>
	<div class="borderline"	id="manager" style="flex: 8; margin-bottom: 5px;"></div>
</div>

</body>
</html>