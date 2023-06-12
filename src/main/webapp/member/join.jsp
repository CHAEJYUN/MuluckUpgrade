<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/login_join.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	//유효성 검증 (초기값은 false로 설정)
	let isValidEmail = false;
	let isValidId = false;
	let isValidPassword = false;
	let isValidTel = false;
	let isValidTelCheck = false;
	let isValidName = false;
	let isValidNickname = false;
	let isValidPvAgree = false;
	
	// 모든 필드의 유효성 검증을 체크하고 회원가입 버튼을 활성화/비활성화
	function checkValidation() {
		if (isValidEmail && isValidId && isValidPassword && isValidTel && isValidTelCheck && isValidName && isValidNickname && isValidPvAgree) {
		  $('#join').prop('disabled', false).css({'background-color': '#000000', 'color': '#ffffff'});
		} else {
		  $('#join').prop('disabled', true);
		}
	}
	
$(function() { //페이지가 로딩될때 실행
	
	// 초기에 버튼 비활성화
    checkValidation();

//이메일 중복 체크
	$('#email').blur(function() { //blur는 그곳에서 다른곳으로 커서가 이동했을때 를 뜻함
		const email = $('#email').val(); //const 나 let 을 사용해야한대(var는 전역변수 이기 때문)
		//console.log(email) //제대로 실행되는지 확인
		
		// 이메일 형식 확인을 위한 정규 표현식
	    const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	    
	    // 이메일 칸이 비어있을 때
	    if (email === "") {
	        $("#emailResult").html(""); // 오류 메시지 초기화
	        return;
	    }

	    // 이메일 형식이 아닌 경우
	    if (!emailPattern.test(email)) {
	        $("#emailResult").html("이메일 형식이 아닙니다.").css('color', 'red');
	        return;
	    }
	    
	    // 이메일 중복 체크를 위한 Ajax 요청
		$.ajax({
			url: "emailCheck", //controller에서 요청 받을 주소
			type: "post",
			dataType: "json",
			data: {member_email : email},
			success: function(result) {
				//이메일 칸이 비어있지 않을 떄
				if(email != ""){
					//이미 등록된 이메일
					if(result === 1){
						$("#emailResult").html("이미 등록된 이메일입니다.").css('color','red');
					}else if(result === 0){
						$("#emailResult").html("사용가능한 이메일입니다.").css("color", "green");
						isValidEmail = true;
						checkValidation();
					}
				}
			},//success
	        error: function() {
	            // 오류 처리
	        }
		})//ajax
	})//email 중복체크 완료
	
//아이디 중복 체크
	$('#id').blur(function() { //blur는 그곳에서 다른곳으로 커서가 이동했을때 를 뜻함
		const id = $('#id').val(); //const 나 let 을 사용해야한대(var는 전역변수 이기 때문)
		//console.log(id) //제대로 실행되는지 확인
		$.ajax({
			url: "idCheck", //controller에서 요청 받을 주소
			type: "post",
			dataType: "json",
			data: {member_id : id},
			success: function(result) {
				if(id != ""){
					if(result == 1){
						$("#idResult").html("이미 사용중인 아이디입니다.").css('color','red');
					}else if(result == 0){
						if(id.length <6 || id.length > 12){
							$("#idResult").html("아이디는 6~12자 이내여야 합니다.").css('color','red');
						}else{
							$("#idResult").html("사용가능한 아이디입니다.").css("color", "green");
							isValidId = true;
							checkValidation();
						}
					}
				}
			}//seccess 
/* 			에러가 나면 알리게 함
			 ,
			error: function() {
				alert("에러입니다.");
			} //error */
		})//ajax
	})//id 중복체크 완료
		
//패스워드 동일 체크
	$('#pw2').blur(function() {
		if($('#pw').val() != "" || $('#pw2').val() != ""){
			if($('#pw').val() != $('#pw2').val()){
				if($('#pw2').val() != ''){
					$('#pwResult').html("비밀번호가 일치하지 않습니다.").css("color", "red");
				}//if
			} else {
				if($('#pw').val().length <8){
					$("#pwResult").html("패스워드는 8자 이상이여야 합니다.").css('color','red');
				}else{
					$('#pwResult').html("비밀번호가 일치합니다.").css("color", "green");
					isValidPassword = true;
					checkValidation();
				}
			}//else
		}
	})//패스워드 동일체크 완료
	
	//name
	$('#name').blur(function() { //blur는 그곳에서 다른곳으로 커서가 이동했을때 를 뜻함
		const name = $('#name').val(); //const 나 let 을 사용해야한대(var는 전역변수 이기 때문)
		if (name !== '') {
			isValidName = true;
			checkValidation();
		}
		
	})//name
	
//닉네임 중복 체크
	$('#nickname').blur(function() { //blur는 그곳에서 다른곳으로 커서가 이동했을때 를 뜻함
		const nickname = $('#nickname').val(); //const 나 let 을 사용해야한대(var는 전역변수 이기 때문)
		//console.log(id) //제대로 실행되는지 확인
		$.ajax({
			url: "nicknameCheck", //controller에서 요청 받을 주소
			type: "post",
			dataType: "json",
			data: {member_nickname : nickname},
			success: function(result) {
				if(nickname != ""){
					if(result == 1){
						$("#nicknameResult").html("이미 사용중인 닉네임입니다.").css('color','red');
					}else if(result == 0){
						$("#nicknameResult").html("사용가능한 닉네임입니다.").css("color", "green");
						isValidNickname = true;
						checkValidation();
					}
				}//if
			}//seccess 
		})//ajax
	})//nickname 중복체크 완료
	
//전화번호 인증
    $('#telSend').click(function() {
        const tel = $('#tel').val();

        if (tel.trim().length === 0) {
            alert("전화번호를 입력해주세요.");
            return;
        }

        // 전화번호 인증 요청을 서버로 전송
        $.ajax({
            url: "phoneAuth",
            type: "POST",
            data: { tel: tel },
            success: function(response) {
                if (response === true) {
                    alert("인증번호가 전송되었습니다.");
                    $("#telResult").html("인증번호를 입력해주세요").css('color','red');
                    isValidTel = true;
                } else {
                    alert("이미 가입된 전화번호 입니다.");
                    $("#telResult").html("이미 가입된 전화번호 입니다.").css('color','red');
                }
            },
            error: function(xhr, status, error) {
                console.log("Error: " + error);
            }
        });
    });
    
// 인증 코드 확인 버튼 클릭 이벤트
    $('#codeCheck').click(function() {
    	const code = $('#code').val();

        if (code.trim().length === 0) {
            //alert("인증 번호를 입력해주세요.");
            $("#telResult").html("인증 번호를 입력해주세요.").css('color','red');
            return;
        }

        // 인증 코드 확인 요청을 서버로 전송
        $.ajax({
            url: "phoneAuthOk",
            type: "POST",
            data: { code: code },
            success: function(response) {
                if (response === true) {
                    //alert("인증 번호가 일치합니다.");
                    $("#telResult").html("인증 번호가 일치합니다.").css('color','green');
                    isValidTelCheck = true;
                    checkValidation();
                    
                } else {
                    //alert("인증 번호가 일치하지 않습니다.");
                    $("#telResult").html("인증 번호가 일치하지 않습니다.").css('color','red');
                }
            },
            error: function(xhr, status, error) {
                console.log("Error: " + error);
            }
        });
    });
    
// pv_agree 체크 이벤트
	$('#pv_agree').click(function () {
	  isValidPvAgree = $(this).is(':checked');
	  checkValidation();
	});
    
})//페이지가 로딩되자마자
</script>
</head>
<body>
	<div class="muluck_logo"><a href="login.jsp"><img src="../resources/assets/img/무우럭.png" alt="로고"></a></div>
	<div class="myform">
	<div class="go_login"><a href="login.jsp"><button>X</button></a></div>
		<div class="title">회원가입</div>
		<div class="center">
			<form action="join" method="get">
				<table id="table1">
					<tr>
						<td colspan="2"><input class="input_join solo" id="email" name="member_email" type="email" placeholder=" 이메일" 
							required oninvalid="this.setCustomValidity('필수 입력 항목입니다.')" oninput="setCustomValidity('')"/></td>
					</tr>
					<tr>
						<td colspan="2"><div class="sameCheck" id="emailResult"></div></td>
					</tr>
					<tr>
						<td colspan="2"><input class="input_join solo" id="id" name="member_id" type="text" placeholder=" 아이디(6-12자의 영문,숫자,기호만 사용)" minlength = "6" maxlength = "12"
							required oninvalid="this.setCustomValidity('필수 입력 항목입니다.')" oninput="setCustomValidity('')"/></td>
						<!-- placeholder=" 4-10자 사이의 영문,숫자" -->
					</tr>
					<tr>
						<td colspan="2"><div class="sameCheck" id="idResult"></div></td>
					</tr>
					<tr>
						<td colspan="2"><input class="input_join solo" id="pw" name="member_pw" type="password" placeholder=" 패스워드(8자 이상)" minlength="8"
							required oninvalid="this.setCustomValidity('필수 입력 항목입니다.')" oninput="setCustomValidity('')"/></td>
					</tr>
					<tr>
						<td colspan="2"><input class="input_join solo" id="pw2" name="member_pw2" type="password" placeholder=" 패스워드 확인" minlength="8"
							required oninvalid="this.setCustomValidity('필수 입력 항목입니다.')" oninput="setCustomValidity('')"/></td>
					</tr>
					<tr>
						<td colspan="2"><div class="sameCheck" id="pwResult"></div></td>
					</tr>
					<tr>
						<td colspan="2"><input class="input_join solo" id="name" name="member_name" type="text" placeholder=" 이름" 
							required oninvalid="this.setCustomValidity('필수 입력 항목입니다.')" oninput="setCustomValidity('')"/></td>
					</tr>
					<tr>
						<td><input class="input_join notsolo" id="tel" type="tel" name='member_tel' placeholder="전화번호(-없이 숫자만 입력)" minlength="11" maxlength="11" 
							required oninvalid="this.setCustomValidity('필수 입력 항목입니다.')" oninput="setCustomValidity('')"/></td>
						<td><button class="checkbtn" id="telSend" type="button">인증번호</button></td>
					</tr>
					<tr>
						<td><input class="input_join notsolo" id="code" name="code" placeholder="인증 코드를 입력"
							required oninvalid="this.setCustomValidity('필수 입력 항목입니다.')" oninput="setCustomValidity('')"></td>
					    <td><button class="checkbtn" id="codeCheck">인증</button></td>
					</tr>
					<tr>
						<td colspan="2"><div class="sameCheck" id="telResult"></div></td>
					</tr>
					<tr>
						<td colspan="2"><input class="input_join solo" id="nickname" name="member_nickname" type="text" placeholder=" 닉네임" 
							required oninvalid="this.setCustomValidity('필수 입력 항목입니다.')" oninput="setCustomValidity('')"/></td>
					</tr>
					<tr>
						<td colspan="2"><div class="sameCheck" id="nicknameResult"></div></td>
					</tr>
				</table>
				<div class="text">가. 개인정보의 수집 및 이용 목적
					무우럭(muluck)은 원활한 고객상담, 서비스 제공을 위하여 아래의 최소한의 개인정보를 필수로 수집하고 있습니다. 
					처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
        
	                나. 정보주체와 법정대리인의 권리ㆍ의무 및 행사방법
	                ① 정보주체(만 14세 미만인 경우에는 법정대리인을 말함)는 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.
	                ② 제1항에 따른 권리 행사는 개인정보보호법 시행규칙 별지 제8호 서식에 따라 작성 후 서면, 전자우편 등을 통하여 하실 수 있으며, 기관은 이에 대해 지체 없이 조치하겠습니다.
	                ③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
	                ④ 개인정보 열람 및 처리정지 요구는 개인정보 보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.
	                ⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.
	                ⑥ 정보주체 권리에 따른 열람의 요구, 정정ㆍ삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.
	                
	                다. 수집하는 개인정보의 항목
	                - 필수항목: 이메일, 아이디, 비밀번호, 이름, 전화번호, 닉네임, 성별, 연령대
	                - 선택항목: 프로필 사진
	                
	                라. 개인정보의 보유 및 이용기간
	                무우럭(muluck)은 법령에 따른 개인정보 보유ㆍ이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유ㆍ이용기간 내에서 개인정보를 처리ㆍ보유합니다.
	                
	                - 수집근거: 정보주체의 동의
	                - 보존기간: 회원 탈퇴 요청 전까지(1년 경과 시 재동의)
	                - 보존근거: 정보주체의 동의
	                
	                마. 동의 거부 권리 및 동의 거부에 따른 불이익
	                위 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있으나, 동의를 거부할 경우 회원 가입이 제한됩니다.
				</div>
				<div id="assentCheck">
					<input type="checkbox" name="pv_agree" id="pv_agree" 
						required oninvalid="this.setCustomValidity('필수 동의 항목입니다.')" oninput="setCustomValidity('')"> [필수]약관에 동의합니다
					<div class="sameCheck" id="agreeResult"></div>
				</div>
			<button class="btn" type="submit" id="join">회원가입</button>
			</form>
		</div>
	</div>
</body>
</html>