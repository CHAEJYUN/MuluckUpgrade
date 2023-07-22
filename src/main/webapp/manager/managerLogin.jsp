<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<!-- <script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>-->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->
<link rel="stylesheet" type="text/css" href="../resources/css/login_join.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
 <!-- 패스워드 숨김보임 기능 눈 이모티콘 -->
<script type="text/javascript">

$(function() {
	// 페이지 로드 시 아이디 저장 체크 박스 상태 확인
	var savedId = localStorage.getItem('savedId');
	if (savedId) {
		$('#member_id').val(savedId);
		$('#idSave').prop('checked', true);
	} else {
	    $('#member_id').val(''); // 저장된 아이디가 없으면 입력란 비우기
	}
	
	//페이지 로드시  URL에서 error 파라미터가 있는지 확인하고 로그인 실패 한것이면 알림
    var urlParams = new URLSearchParams(window.location.search);
    var error = urlParams.get('error');
    if (error === 'true') {
        alert("로그인에 실패했습니다.");
    }
	
	//로그인 버튼 선택시 회원인지 확인
	$('#mLoginForm').submit(function(event) {
		event.preventDefault(); // 폼 전송 동작 중지
		var member_id = $('#member_id').val();
		var member_pw = $('#member_pw').val();
		var idSaveChecked = $('#idSave').is(':checked');
		// 아이디 저장 체크 박스 상태 저장
		if (idSaveChecked) {
			localStorage.setItem('savedId', member_id);
		} else {
			localStorage.removeItem('savedId');
		}
		$.ajax({
			url: "mLogin",
			type: "post",
			data: {member_id: member_id, member_pw: member_pw},
			dataType: "text",
			success: function(result) {
				console.log('result>> ' + result)
				if(result === 'true'){
					//alert('성공했어요') //성공하는지 확인
					window.location.href = "../manager/managerHome.jsp"; // 메인 페이지로 이동(다솜님페이지로) "../main/home.jsp";
				} else {
					// 로그인 실패
			        $("#mLoginResult").html("아이디 또는 비밀번호를 잘못 입력했습니다. <br>입력하신 내용을 다시 확인해주세요.").css('color','red');
					if (idSaveChecked) {
						$('#member_pw').val('');
						$('#member_pw').focus();
					} else {
						$('#member_id').val('');
						$('#member_pw').val('');
						$('#member_id').focus();
					}
				}
			},
			error: function() {
				$("#mLoginResult").html("에러가 발생하였습니다.").css('color', 'red');
			}
		});
	});
	
	// 패스워드 숨김/보임
	$('.pw i').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-eye-slash")
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-eye")
            .prev('input').attr('type','password');
        }
    });
	
	
});
</script>
<style type="text/css">
/* 패스워드 숨김/보임 */
div.pw{
    position: relative;
}
div.pw i{
    position: absolute;
    left: 80%;
    top: 26%;
    color: black
}
</style>
</head>
<body>
	<div class="muluck_logo">
		<a href="${pageContext.request.contextPath}/home.jsp"><img src="../resources/assets/img/무우럭.png"
			alt="로고"></a>
	</div>
	<div class="myform">
		<div class="go_login"><a href="${pageContext.request.contextPath}/member/login.jsp"><button>X</button></a></div>
		<div id="login_title" class="title">관리자 로그인</div>
		<div class="center">
			<form id="mLoginForm" action="mLogin" method="post">
				<input class="input_login" id="member_id" name="member_id"
					placeholder="  아이디" value="${member_id}" /> 
				<div class="pw">
					<input class="input_login" id="member_pw" name="member_pw" type="password" placeholder="  패스워드" />
					<i class="fa fa-eye"></i>	<!-- 패스워드 숨김/보임 -->
				</div>	
					
				<div class="text1">
					<input class="input_login" type="checkbox" id="idSave"> 아이디
					저장
				</div>
				<div class="sameCheck" id="mLoginResult"></div>
				<button class="btn black_btn" type="submit">로그인</button>
			</form>
			<a href="join.jsp"><button class="btn white_btn" type="submit">회원가입</button></a>
			<div class="text1">
				<a href="${pageContext.request.contextPath}/member/idpwFind.jsp">아이디 찾기 / 패스워드 변경</a>
			</div>
			<div>
				<hr style="color: gray; margin-left: 5%; margin-right: 5%;">
				<a href="${pageContext.request.contextPath}/member/login.jsp"><button class="btn white_btn" type="submit">회원 로그인으로 이동</button></a>
			</div>
		</div>
	</div>
</body>
</html>