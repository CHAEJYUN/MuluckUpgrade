<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>정보확인</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" type="text/css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/manager.css">
<script type="text/javascript">
	$('#wait').hide();
	$('#modify').hide();
	const manager_no = ${bag.member_no}; //불러온 회원 정보의 no
	const manager_status = ${bag.member_manager}; //불러온 회원 정보의 member_manager
	
	if (manager_status == 2) { //매니저 승인 대기상태 일떄
		$('#wait').show();
	}else if(manager_status == 1) { //매니저 일떄
		$('#modify').hide();
		
	//매니저 활동 불러오는거 적을 부분
	
	
	}else { //회원 상태일때
		$('#wait').hide();
		$('#modify').hide();
	}
	
	
	
</script>
</head>
<body>
<%-- <%@ include file="../../../manager/manager_header.jsp"%> 아래꺼 써도 된대..--%>
<%@ include file="/manager/manager_header.jsp"%>

<div id="my" style="display: flex; justify-content: space-between;">
	<div id="my_screen" style="flex: 8; margin-top: 10px; margin-right: 10px;">
		<div style="max-height: 30px;  margin-left: 5%; margin-top: 20px; margin-bottom: 80px;">
			<a href="managerRegister.jsp"><button style="float: left;">이전</button></a>
		</div>
		<div class="borderline" style="margin-top: 15px; margin-bottom: 30px;">
			<div style="margin-top: 10px;">
				<h2 style="font-size: 40px; margin-top: 20px; margin-bottom: 10px;">${bag.member_nickname}</h2>
			</div>
			<div style="margin: 1% 15%; height: 300px; background: lightgray;">
				<h4 class="info" style="padding-top: 20px;">NO: ${bag.member_no}</h4>
				<h4 class="info">id: ${bag.member_id}</h4>
				<h4 class="info">email: ${bag.member_email}</h4>
				<h4 class="info">name: ${bag.member_name}</h4>
				<h4 class="info">tel: ${bag.member_tel}</h4>
			</div>
		</div>
		 
		<!-- 매니저 승인 대기 상태 일때 -->
		<div id="wait" class="borderline" style="display: flex; flex-direction: row; margin-bottom: 30px; padding-top: 20px; padding-bottom: 20px;">
			<button id="manager_yes" type="button" style="flex: 1; margin: auto 10px; text-align: center;">매니저 승인</button>
			<button id="manager_no" type="button" style="flex: 1; margin: auto 10px; text-align: center;">매니저 탈락</button>
			
			<!-- 승인인지 탈릭인지 메일 보내기 -->
		</div>
		
		<%--
		<!-- 이미 매니저 상태 일때 -->
		<div id="modify" class="borderline" style="display: flex; flex-direction: row; margin-bottom: 30px; padding-top: 20px; padding-bottom: 20px;">
			<button id="manager_no" type="button" style="flex: 1; margin: auto 10px; text-align: center;">매니저 퇴출</button>
			
			매니저 활동내역불러오는 부분
		</div>
		 --%>
	</div>
</div>

</body>
</html>