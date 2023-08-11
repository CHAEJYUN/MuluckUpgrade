<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>매니저마이페이지</title>
<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->
<link rel="stylesheet" type="text/css"
	href="../resources/css/myPage.css">
<script type="text/javascript">

	//member_nickname
	function fillNickname(input) {
		if (input.value === '') {
		  input.value = "${info.member_nickname}";
		}
	}
	//member_birthyear
	function fillBirthyear(input) {
		if (input.value === '') {
		  input.value = "${info.member_birthyear}";
		}
	}
	
	//member_nickname
	function clearNickname(input) {
		if (input.value === "${info.member_nickname}") {
		  input.value = '';
		}
	}
	//member_birthyear
	function clearBirthyear(input) {
		if (input.value === "${info.member_birthyear}") {
		  input.value = '';
		}
	}
	
	//선택된 이미지로 show_img가 바뀌게 하기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#show_img').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
 	//이미지 삭제
  	function deleteImage() {
 		$('#show_img').attr('src', '../resources/upload/member/myprofile.png');
        //$('#file').value('C:\\Users\\LG\\Documents\\workspace-sts-3.9.14.RELEASE\\muluck\\src\\main\\webapp\\resources\\upload\\member\\myprofile.png');
		$('#file').val('');
		$('#member_img').val("myprofile.png");
    }
	
	$(function() {
  
/* 	    // del_img 버튼을 부르면 show_img 부분이 기본이미지로 바뀌게 하기
		$('#del_img').click(function() {
			$('#show_img').attr('src', '../resources/upload/member/myprofile.png');
	        $('#file').val('');
		}); */
	    
		//이전 패스워드가 정확하지 않다고 알림
	    $('#before_pw').blur(function() {
	        const beforePw = document.getElementById("before_pw").value;
	        const memberPw = "${info.member_pw}";

	        if (beforePw !== memberPw) {
	            $("#pwCheck").html("패스워드를 정확하게 입력해주세요.").css('color', 'red');
	            return false; // 폼 제출 중지
	        } else {
	            $("#pwCheck").html("");
	        }
	    });
	    
	    //이전 패스워드와 일치하지 않으면 수정 불가
	    $('#revise_up').submit(function(event) {
	        const beforePw = document.getElementById("before_pw").value;
	        const memberPw = "${info.member_pw}";

	        if (beforePw !== memberPw) {
	            event.preventDefault(); // Prevent form submission
	            $("#pwCheck").html("이전패스워드가 정확하지 않아 수정이 불가 합니다.").css('color', 'red');
	        } else {
	            $("#pwCheck").html("");
	        }
	    });
	    
	  //닉네임 중복 체크
		$('#member_nickname').blur(function() { //blur는 그곳에서 다른곳으로 커서가 이동했을때 를 뜻함
			const nickname = $('#member_nickname').val(); //const 나 let 을 사용해야한대(var는 전역변수 이기 때문)
			const memberNickname = "${info.member_nickname}";
			//console.log(id) //제대로 실행되는지 확인
			if (nickname !== memberNickname) {
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
				});//ajax
			}else{
				$("#nicknameResult").html("");
			}
			
		});//nickname 중복체크 완료
	    
	});
	
</script>
</head>
<body>
<%@ include file="manager_header.jsp"%>

<!-- 마이페이지 회원정보 -->
<div id="my" style="display: flex; justify-content: space-between;">
	<!-- 메뉴카테고리 -->
	<div id="my_menu" style="flex: 2;  min-height: 430px">
		<div class="menu_list" id="menu_title">
			<a class="menu"
				style="color: #145f37; font-weight: 900; text-decoration: none; font-size: 30px;">
				매니저페이지 </a>
		</div>
		<div class="menu_list">
			<a class="menu" href="${pageContext.request.contextPath}/manager/managerPage"
				style="text-decoration: underline; font-weight: bolder; background: lightgray; font-size: 25px;">
				매니저 정보 </a>
		</div>
		<div class="menu_list">
			<a class="menu" href="${pageContext.request.contextPath}/manager/managerActivity.jsp"
				style="text-decoration: none; font-weight: 500; font-size: 25px;">
				매니저 활동 </a>
		</div>
	</div>
	<div id="my_screen" style="flex: 8; display: flex; flex-direction: column;">
		<div id="my_info" style="flex: 9; display: flex;">
			<div class="borderline" style="flex: 1; margin-right: 10px;">
				<form action="profile_up" method="post" enctype="multipart/form-data">
					<input name="member_no" value=${member_no} type="hidden" />
					<input type="hidden" name="member_img" id="member_img" />
					<!-- 이미지 넣기 -->
					<div style="margin-bottom: 10px; margin-top: 20px;">
						<img id="show_img" width=100 height=100 alt="프로필 사진" style="border-radius: 50px;" src="../resources/upload/member/${info.member_img}" onerror="this.src='../resources/upload/member/myprofile.png';">
					</div>
					<div style="margin-bottom: 10px;">
						<label for="file">
							<div style="width: 90px; height: auto; background: white; border: 2px solid rgb(77, 77, 77);"> 사진 변경</div>
						</label>
				        <button id="del_img" type="button" style="width: 90px; height: auto; background: white; border: 2px solid rgb(77, 77, 77)" onclick="deleteImage()"> 사진 삭제</button>
						<input type="file" id="file" name="file" style="display: none;" onchange="readURL(this)"><br>
					</div>
					<div style="margin-bottom: 10px;">
						<span>닉네임: </span> <input name="member_nickname" id="member_nickname" value="${info.member_nickname}"  onfocus="clearNickname(this)" onblur="fillNickname(this)">
					</div>
					<div id="nicknameResult" style="margin-bottom: 10px;"></div>
					<div style="margin-bottom: 10px;">
						<span>성별: </span>
						 <input type="radio" name="member_gender" value="M" ${info.member_gender == 'M' ? 'checked' : ''}>남 
						 <input type="radio" name="member_gender" value="F" ${info.member_gender == 'F' ? 'checked' : ''}>여
						 <input type="radio" name="member_gender" value="U" ${info.member_gender == 'U' ? 'checked' : ''}>기타
					</div>
					<div style="margin-bottom: 10px;">
						<span>출생연도: </span> <input name="member_birthyear" id="member_birthyear" value="${info.member_birthyear}" maxlength="4" onfocus="clearBirthyear(this)" onblur="fillBirthyear(this)"  placeholder="4자리 숫자 입력(ex.2000)">
					</div>
					<button type="submit" style="margin-bottom: 10px; background: black; color: white;">변경사항 저장</button>
				</form>
			</div>
			<div class="borderline" style="flex: 2; margin-left: 5px; margin-right: 10px;">
				<form action="revise_up" method="post" id="revise_up">
					<input name="member_no" value=${member_no} type="hidden"/>
					<div style="display: flex; flex-direction: row; margin-top: 40px; margin-bottom: 10px;">
						<span style="flex: 0.1;"></span><span style="flex: 0.3;">email:</span>
						<input style="flex: 0.3;" id="member_email" name="member_email" type="email" value="${info.member_email}">
					</div>
					<div
						style="display: flex; flex-direction: row; margin-bottom: 10px;">
						<span style="flex: 0.1;"></span><span style="flex: 0.3;">id:</span>
						<span style="flex: 0.3;" id="member_id">${info.member_id}</span>
					</div>
					<div
						style="display: flex; flex-direction: row; margin-bottom: 10px;">
						<span style="flex: 0.1;"></span><span style="flex: 0.3;">이전
							패스워드:</span> <input style="flex: 0.3;" id="before_pw" type="password"
							placeholder=" 패스워드(8자 이상)" minlength="8" required>
					</div>
					<div id="pwCheck" style="margin-bottom: 10px;"></div>
					<div style="display: flex; flex-direction: row; margin-bottom: 10px;">
						<span style="flex: 0.1;"></span><span style="flex: 0.3;">바꿀 패스워드:</span> 
							<input style="flex: 0.3;" id="after_pw" name="member_pw" type="password" placeholder=" 패스워드(8자 이상)" minlength="8">
					</div>
					<div style="display: flex; flex-direction: row; margin-bottom: 10px;">
						<span style="flex: 0.1;"></span><span style="flex: 0.3;">이름:</span>
						<input style="flex: 0.3;" id="member_name" name="member_name" value="${info.member_name}">
					</div>
					<div style="display: flex; flex-direction: row; margin-bottom: 10px;">
						<span style="flex: 0.1;"></span><span style="flex: 0.3;">연락처:</span>
						<input style="flex: 0.3;" id="member_tel" type="tel"
							name='member_tel' placeholder="전화번호(-없이 숫자만 입력)" minlength="11"
							maxlength="11" value="${info.member_tel}">
					</div>
					<button type="submit" style="margin-bottom: 10px; background: black; color: white;">상세정보 수정</button>
				</form>
			</div>
		</div>
		<div class="borderline"	style="flex: 1; margin-top: 10px; margin-right: 10px;">
			<form action="drop"  method="post">
				<input name="member_no" value= ${member_no} type="hidden" />
				<span>계정탈퇴를 하시면 모든 데이터가 사라집니다. 탈퇴를 진행하시겠습니까? </span><a><button type="submit">회원탈퇴</button></a>
			</form>
		</div>
	</div>
</div>
</body>
</html>



