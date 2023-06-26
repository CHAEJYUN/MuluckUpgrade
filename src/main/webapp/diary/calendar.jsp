<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>무우럭</title>
<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->

<link href="../resources/css/calendar.css" type="text/css"
	rel="stylesheet" />
<!--  jquery 점유율 줄어드는 추세 전부 자바스크립트로 변경할지 고민 근데 어려울듯, 최신 링크만 일단 걸어놓음 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- bootstrap 4 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<!-- fullcalendar -->
 <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js"></script>

<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<!--  요거 asset에 있는 icon으로 대체해도 될듯 -->
<!--emoji -->
<script src="https://cdn.jsdelivr.net/emojione/2.2.7/lib/js/emojione.min.js"></script>

<script>
	var events = [];
    document.addEventListener('DOMContentLoaded', function() {
	//dom에서(가상메모리?) 콘텐트 불러오고 에드 이벤트리스너로 받는다
    	var calendarEl = document.getElementById('calendar');
	//calendarel 변수는 id가 calendar인 doc
	
      var calendar = new FullCalendar.Calendar(calendarEl, {
    	  //여기서  위에 fullcalendar 라이브러리 가져오고 calendarE1 내부 어떻게 채울지 구성
    	 timeZone: 'UTC', //시간 UTC
        locale: 'ko', //언어 한국어
        selectable: true, // 여러 칸 선택가능
        /* editable: true, // 이동 가능 */
        displayEventTime: false, //시간 
        initialView: 'dayGridMonth', //초기화면 설정
        dayMaxEventRows : 2,
        viewOptions: {
        	  moreLinkClick: {
        	    DateFormat: { month: 'long', day: 'numeric', year: 'numeric' },
        	    content: 'content',
        	    className: 'popover',
        	    placement: 'bottom',
        	    trigger: 'click'
        	  }
        	},// 이벤트 많을 경우 더보기 표시
        	
        	events: function (fetchInfo, successCallback, failureCallback) {
        	    // 서버에서 이벤트 데이터 가져오기
        	    var event = {};
        	    $.ajax({
        	      url: 'list1',
        	      method: 'POST',
        	      data: JSON.stringify(event),
        	      contentType: 'application/json',
        	      success: function(response) {
        	        // 응답 데이터 처리
        	        console.log(response);
        	        var events = [];
        	        for (var i = 0; i < response.length; i++) {
        	          var event = response[i];
        	          var processedEvent = {
        	        	member_no:event.member_no,
        	        	calendar_id:event.calendar_id,
        	            title: event.calendar_title,
        	            start: event.calendar_start,
        	            end: event.calendar_end
        	          };
        	          events.push(processedEvent);
        	        };
        	        // 이벤트 데이터 전달하여 표시
        	        successCallback(events);
        	      },
        	      error: function(xhr, status, error) {
        	        console.log("표시 실패:", status, error);
        	        // 오류 발생 시 실패 콜백 호출
        	        failureCallback(error);
        	      }
        	    });
        	  },
        	

        select: function(info) { // 선택. ; 함수에서 기능들 실행
        	
          $('#addCalendarModal').modal('show'); // 누르면 모달 보여짐
          $("#addCalendar").off("click").on("click", function() { // off먼저 시키고 다시 켜야지 중복 적용이 안됨
            addCalendarClickHandler(info); //핸들러 콘트롤러 비슷한 개념인듯
            $('#addCalendarModal').modal('hide'); // 다 적었으면 끔
          });
          $("#cancelButton").on('click', function() {
				$('#addCalendarModal').modal('hide'); // 모달 닫는 코드
				});	
        },
        
        eventClick: function(info) { // 여기서 내용 수정, fullcalendar가 제공하는 것도 있는듯
          var eventTitle = info.event.title; // 내용 수정 변수
          var modal = $('#editCalendarModal'); // 모달 이름 
          $("#updateCalendar").off("click").on("click", function() {//off먼저 시키고 다시 켜야지 중복 적용이 안됨0 
            updateCalendarClickHandler(info); 
            modal.modal('hide');
          });
          $('#deleteCalendar').show().off('click').on('click', function() { 
            deleteCalendarClickHandler(info);
            modal.modal('hide');
          });
          $("#cancelButton1").on('click', function() {
				$('#editCalendarModal').modal('hide'); // 모달 닫는 코드
				});
          modal.modal('show');//모달 보여주기!
        
        }
      });
      var addCalendarClickHandler = function(info) { //addcch 기능 설정
        var content = $("#calendar_content").val();
        if (content == null || content == "") {
          alert("내용을 입력하세요.");
        } else {
          var event = {
            "title": content,
            "start": info.start, //캘린더내부에서 받아옴
            "end": info.end,
          };
          
          console.log(event);
          
          var eventData = {
        		  "calendar_title": content, //calendar_title형태로 db에 저장하기 위해 형태 바꿈
        		  "calendar_start": info.start,
        		  "calendar_end": info.end,
        		};
          $("#calendar_content").val(''); // 창 다시 띄울 때 전에 써져있던 내용 안 나오게!
          var source = [];
          console.log("추가된 일정:", event);
          // AJAX를 사용하여 서버에 이벤트를 추가하는 등의 작업 수행
         
         $.ajax({
            url: "insert1",  //ajax이렇게 하는게 아닌가?
            method: "POST",
            data:  {
      		  "calendar_title": content, //calendar_title형태로 db에 저장하기 위해 형태 바꿈
    		  "calendar_start": info.start,
    		  "calendar_end": info.end,
    		},// JSON.stringify(eventData),  // 이벤트 데이터를 JSON 문자열로 변환하여 전송
            //contentType: "application/json", //json 타입
            success: function(response) {
                console.log("성공" + response);
                var calendar_id = response.calendar_id;
                var event = {
                        "calendar_id": calendar_id,
                        "title": content,
                        "start": info.start,
                        "end": info.end,
                      };
                source.push(event);// 간략하게 이해한 거로는 source이라는 fullcalendar 자체 변수 사용해서 화면에 뛰움 
                console.log("저장된 이벤트:", source);
                calendar.addEventSource(source); //그리고 이걸 eventsource에 저장해서 calendar_id값 바꿈, events,eventsource,event 다양하게 있음 솔직히 왜 된건지 모르겠음
            },
              error: function(xhr, status, error) {
              	console.log("실패:", status, error);
              }
            	    });
            	  }
      };
      
      var updateCalendarClickHandler = function(info) { //addcalendar랑 비슷
    	  var eventTitle = $("#edit_calendar_content").val();
        if (eventTitle == null || eventTitle == "") {
          alert("내용을 입력하세요.");
        } else {
        	var calendar_id = info.event.extendedProps.calendar_id;
        	 //이거 calendar_id 가져올 수 있으면 calendar
        	var start = info.event.start;
        	var end = info.event.end;
        	var event = {
        			"calendar_id": calendar_id,
                    "title": eventTitle,
                    "start": start,
                    "end": end
                    
                  }; //fullcalendar 함수 내용 변경함수, 날짜 관련x, 날짜도 변경 가능하게 해야하나?event.setDates( start, end, [ options ] )
                  $("#edit_calendar_content").val(''); // 창 다시 띄울 때 전에 써져있던 내용 안 나오게!

                		  var eventData = {
                		  "calendar_id": calendar_id,	
                		  "calendar_title": eventTitle,
                		  "calendar_start": start,
                		  "calendar_end": end
                		};
                		  
          console.log(event);
          info.event.setProp('title', eventTitle);//이걸로 ui에 변경사항 바로 보이게 함
          // AJAX 사용, 서버 이벤트
          $.ajax({
            url: "update1",
            method: "POST",
            data: JSON.stringify(eventData), 
            contentType: "application/json",
            success: function(response) {
            	console.log(info.event.extendedProps);
              console.log("수정 성공:", response);
            },
            error: function(xhr, status, error) {
            	console.log(info.event.extendedProps);
            	console.log("수정 실패:", status, error);
            }
          });
        }
      };
      
      var deleteCalendarClickHandler = function(info) {
          if (confirm("'" + info.event.title + "'를 삭제하시겠습니까?")) {
            console.log(info.event);
            var calendar_id = info.event.extendedProps.calendar_id;
            var event = {
            	      "calendar_id": calendar_id,
            };
            $.ajax({
              url: "delete1",  
              method: "POST",
              data: JSON.stringify({ "calendar_id": calendar_id }), 
              contentType: "application/json",
              success: function(response) {
                console.log("삭제 성공:", response);
              },
              error: function(xhr, status, error) {
                console.log("삭제 실패:", status, error);
              }
            });
            info.event.remove();
          }
        };
        calendar.render();
        $('.calendar').css('font-size','50px !important');
    });
  </script>
<style>
font-family: 'KOTRAHOPE';
</style>


</head>
<body>

	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light" id="mainNav2" style="font-family: 'KOTRAHOPE'; font-size: '25px'" >
		<div class="container px-4 px-lg-5"   >
			<a class="navbar-brand" href="${pageContext.request.contextPath}/main/home.jsp">Muluck</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto py-4 py-lg-0">
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" 
					id="#userNickname">${member_nickname} 님 환영합니다.</a></li>
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
						href="${pageContext.request.contextPath}/member/mypage">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
						href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<header>
		<h1 class="site-heading text-center text-faded d-none d-lg-block" style="font-family: 'KOTRAHOPE';">
			<!-- <span class="site-heading-lower">무우럭</span>
                <span class="site-heading-upper text-primary mb-3">muluck</span> -->
			<div>
				<a href="${pageContext.request.contextPath}/main/home.jsp">
				<img src="${pageContext.request.contextPath}/resources/assets/img/무우럭.png" style="margin-left: auto; margin-right: auto; display: block;"/></a>
			</div>
		</h1>
	</header>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav" style="font-family: 'KOTRAHOPE';">
		<div class="container">
			<a class="navbar-brand text-uppercase fw-bold d-lg-none"
				href="index.jsp">Start Bootstrap</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="${pageContext.request.contextPath}/main/home.jsp">홈</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="${pageContext.request.contextPath}/community/community.jsp">커뮤니티</a></li>
					<ul class="navbar-nav px-lg-4">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="myplant.jsp" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 나의 식물 </a>
							<ul class="dropdown-menu dropdown-menu-dark">
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/diary/calendar.jsp">캘린더</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/diary/cardview.jsp">식물 일지</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/card/list">반려식물 등록증</a></li>
								<li><a class="dropdown-item" href="${pageContext.request.contextPath}/mmti/mmti_main.jsp">MMTI 테스트</a></li>
							</ul></li>
					</ul>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase" href="${pageContext.request.contextPath}/business/business_main.jsp">거래/나눔</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	
	
	<center><div id='calendar'
		style="width: 80%; background-color: #F2F1DF; place-content: center; text-align: center; font-family: KOTRAHOPE; font-size: 20px;"></div></center> <!-- <center>사용해서 중앙으로 이동 -->
	<footer class="footer text-faded text-center py-5"
		style="text-align: center;">
		<div class="container">
			<p class="m-0 small">Copyright &copy; Your Website 2023</p>
		</div>
	</footer>

	<!-- 입력 모달 -->
	<div class="modal fade" id="addCalendarModal" tabindex="-1" 
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-family: 'KOTRAHOPE';">
		<div class="modal-dialog modal-dialog-centered"" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="font-family: 'KOTRAHOPE';">일정을 입력하세요.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
		<div class="modal-body">
  <div class="form-group">
    <button class="emoji-button" onclick="insertEmojiInputModal('\u{1F331}')">&#x1F331;</button> <!-- 솔직히 내가 한거 아님 그냥 알려준거 붙여넣었음🌱 이모지 -->
    <button class="emoji-button" onclick="insertEmojiInputModal('\u{1FAB4}')">&#x1FAB4;</button> <!-- 🪴 이모지 -->
    <button class="emoji-button" onclick="insertEmojiInputModal('\u{1F4A6}')">&#x1F4A6;</button> <!-- 💦 이모지 -->
    <button class="emoji-button" onclick="insertEmojiInputModal('\u{1F33F}')">&#x1F33F;</button> <!-- 🌿 이모지 -->
    <button class="emoji-button" onclick="insertEmojiInputModal('\u{2702}')">&#x2702;</button>

    <label for="add_calendar_content" class="col-form-label">일정내용</label> 
    <input type="text" class="form-control" id="calendar_content" />
  </div>
</div>
<div class="modal-footer">
  <button type="button" class="btn btn-warning" id="addCalendar" data-dismiss="modal">추가</button>
  <button type="button" id="cancelButton" class="btn btn-secondary">취소</button>
</div>

<script>
  function insertEmojiInputModal(emoji) {//"insertEmoji('\u{1F331}')"이런 이모지 가져오는 펑션
	  var calendarContent = document.getElementById('calendar_content');
	    calendarContent.value += emoji; //calendarcontent.value = 이모지 붙인 걸로 다시 설정 -이게 다시 돌아감
  }
</script>

			</div>
		</div>
	</div>

	<!-- 수정 및 삭제 모달 -->
	<div class="modal fade" id="editCalendarModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-family: 'KOTRAHOPE';">
		<div class="modal-dialog modal-dialog-centered" role="document"> <!--부트스트랩 참고 modal-dialog modal-dialog-centered 사용 모달 중앙 정렬 -->
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel" style="font-family: 'KOTRAHOPE';">일정을 수정 또는
						삭제하세요.</h5>
						
						
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						 <button class="emoji-button" onclick="insertEmoji('\u{1F331}')">&#x1F331;</button> <!-- 🌱 이모지 -->
    					<button class="emoji-button" onclick="insertEmoji('\u{1FAB4}')">&#x1FAB4;</button> <!-- 🪴 이모지 -->
    <button class="emoji-button" onclick="insertEmoji('\u{1F4A6}')">&#x1F4A6;</button> <!-- 💦 이모지 -->
    <button class="emoji-button" onclick="insertEmoji('\u{1F33F}')">&#x1F33F;</button> <!-- 🌿 이모지 -->
    <button class="emoji-button" onclick="insertEmoji('\u{2702}')">&#x2702;</button>
						<label for="edit_calendar_content" class="col-form-label">일정
							내용</label> <input type="text" class="form-control"
							id="edit_calendar_content" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="updateCalendar">수정</button>
					<button type="button" class="btn btn-danger" id="deleteCalendar">삭제</button>
					<button type="button" id="cancelButton1" class="btn btn-secondary">취소</button>
				</div>
			<script>
  function insertEmoji(emoji) {
    var calendarContent = document.getElementById('edit_calendar_content');
    calendarContent.value += emoji;
  }
</script>
			
			</div>
		</div>
	</div>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>

</body>
</html>