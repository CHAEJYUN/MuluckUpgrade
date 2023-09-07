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
<title>문의작성</title>
<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->
<link rel="stylesheet" type="text/css" href="../resources/css/myPage.css">
 <!-- 토글 - 드롭다운 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../resources/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<script type="text/javascript">
	//유효성 검증 (초기값은 false로 설정)
	let isValTitle = false;
	
	// 타이틀 필드의 유효성 검증을 체크하고 회원가입 버튼을 활성화/비활성화
	function checkValidation() {
		if (isValTitle) {
		  $('#inquiry_send').prop('disabled', false).css({'background-color': '#000000', 'color': '#ffffff'});
		} else {
		  $('#inquiry_send').prop('disabled', true).css({'background-color': '#f0f0f0', 'color': '#1010104d'});
		}
	}
	
	//content 300자 이내 지정
	function checkTextareaLength(textarea, maxLength) {
		  if (textarea.value.length > maxLength) {
		    textarea.value = textarea.value.slice(0, maxLength);
		  }
		}

$(function() {
	// 초기에 버튼 비활성화
    checkValidation();
	//inquiry_title비어있을때 알림
	$('#inquiry_title').blur(function() {
		const title = $('#inquiry_title').val();
		if(title !== '') {
			$("#result_title").html("");
			isValTitle = true;
			checkValidation();
		}else{
			$("#result_title").html("제목을 입력해주세요.");
			isValTitle = false;
			checkValidation();
		}
	})//result_title
	
	//inquiry_content비어있을때 알림
	$('#inquiry_content').blur(function() {
		const content = $('#inquiry_content').val();
		if(content !== '') {
			$("#result_content").html("");
			checkValidation();
		}else{
			$("#result_content").html("내용을 입력해주세요.");
			checkValidation();
		}
	})//result_content

	
	//유효성 검사후 버튼누르면 폼전송
	$('#inquiry_send').click(function() {
		if (isValTitle) {
			submitForm();
		}
	});
	
	function submitForm() {
		const title = $('#inquiry_title').val();
		const content = $('#inquiry_content').val().replace(/\n/g, "<br>"); // 개행 문자 \n을 <br> 태그로 변환
		const member_no = '${member_no}'; //member_no가 inquiry_writer임
		
		 $.ajax({
		      url: "inquiry_write",
		      method: "POST",
		      data: {
	    	  	inquiry_writer: member_no,
		    	inquiry_title: title,
		    	inquiry_content: content
		      },
		      success: function(x) {
		    	  if(x === true){
	        		window.location.href = "${pageContext.request.contextPath}/member/myInquiry.jsp";
		    	  }else{
	                console.log('result>> 작성 실패');
                    $('#inquiry_title').val('');
                    $('#inquiry_content').val('');
                    checkValidation();
		    	  }
		      },
		      error: function(xhr, status, error) {
		        console.log(error);
		        // 요청 실패 시 처리할 로직
		      }//error
	    });//ajax
	}//sumitForm
	
})//function
</script>
</head>
<body>
<!-- 네비게이션바 header -->
<%@ include file="../nav_header.jsp"%>

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
	<div class="borderline" id="my_screen" style="flex: 8; display: flex; flex-direction: column; margin-top: 10px; margin-right: 10px;">
		<div style="flex: 1; max-height: 30px;  margin-left: 5%; margin-top: 20px; margin-bottom: 20px;">
			<a href="myInquiry.jsp"><button style="float: left;">이전</button></a>
		</div>
		<div style="flex: 9; margin-top: 20px;">
			<form onsubmit="return false;">
				<div style="display: flex; flex-direction: row; margin-bottom: 10px;">
					<span style="flex: 3;">문의 제목:</span> 
					<input id="inquiry_title" style="flex: 7; margin-right: 20%;" name="inquiry_title" type="text" placeholder=" 30글자 이내의 타이틀" maxlength="30">
				</div>
				<div id="result_title" class="nullCheck"></div>
				<div style="display: flex; flex-direction: row; margin-bottom: 10px;">
					<span style="flex: 3;">문의 내용:</span> 
					<textarea id="inquiry_content" name="inquiry_content" style="flex: 7; padding: 10px; margin-right: 20%; height: 300px;" placeholder=" 문의내용을 300글자 내로 입력하세요." oninput="checkTextareaLength(this, 300)"></textarea>
				</div>
				<div id="result_content" class="nullCheck"></div>
				<div style="margin-top: 20px; margin-bottom: 30px;">
					<button type="submit" id="inquiry_send" onclick="checkValidation()">작성 완료</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>



