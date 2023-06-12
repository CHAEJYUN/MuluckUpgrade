<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>캘린더</title>
<link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->

<link href="../resources/css/styles.css" type="text/css"
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
<script>
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
        	    $.ajax({
        	      url: 'list',
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
        	            title: event.calendar_title,
        	            start: event.calendar_start,
        	            end: event.calendar_end,
        	            calendar_id: event.calendar_id
        	          };
        	          events.push(processedEvent);
        	        }
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
          $('#deleteCalendar').show().off('click').on('click', function() { //적용된 캘린더 크기
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
            "end": info.end
          };
          
          calendar.addEvent(event); //fullcalendar 기능?
          console.log(event);
          var eventData = {
        		  "calendar_title": content,
        		  "calendar_start": info.start,
        		  "calendar_end": info.end
        		};
          $("#calendar_content").val(''); // 창 다시 띄울 때 전에 써져있던 내용 안 나오게!
          
          console.log("추가된 일정:", event);
          // AJAX를 사용하여 서버에 이벤트를 추가하는 등의 작업 수행
          $.ajax({
            url: "insert",  //ajax이렇게 하는게 아닌가?
            method: "POST",
            data: JSON.stringify(eventData),  // 이벤트 데이터를 JSON 문자열로 변환하여 전송
            contentType: "application/json", //json 타입
            success: function(response) {//성공되면 콘솔 표시
            var calendarIds = response.calendarIds;	
              console.log("추가 성공:", response);
            },
            error: function(xhr, status, error) {
              console.log("추가 실패:", status, error);
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
        	  if (!calendar_id) {
        	      calendar_id = info.event.id; // calendar_id가 없는 경우 event id를 사용할 수도 있습니다.
        	    }//이거 calendar_id 가져올 수 있으면 calendar
        	var start = info.event.start;
        	var end = info.event.end;
        	var event = {
        			"calendar_id": calendar_id,
                    "title": eventTitle,
                    "start": start,
                    "end": end
                    
                  }; //fullcalendar 함수 내용 변경함수, 날짜 관련x, 날짜도 변경 가능하게 해야하나?event.setDates( start, end, [ options ] )
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
            url: "update",
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
              url: "delete",  
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
    });
  </script>



</head>
<body>
	<!-- 네비게이션바 header -->
	<%@ include file="../nav_header.jsp"%>
	
	<div id='calendar'
		style="width: 80%;"background-color: #F2F1DF; place-content: center; text-align: center;"></div>
	<footer class="footer text-faded text-center py-5"
		style="text-align: center;">
		<div class="container">
			<p class="m-0 small">Copyright &copy; Your Website 2023</p>
		</div>
	</footer>

	<!-- 입력 모달 -->
	<div class="modal fade" id="addCalendarModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="add_calendar_content" class="col-form-label">일정
							내용</label> <input type="text" class="form-control" id="calendar_content" />
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="addCalendar" data-dismiss="modal">추가</button>
					<button type="button" id="cancelButton" class="btn btn-secondary">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 수정 및 삭제 모달 -->
	<div class="modal fade" id="editCalendarModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정을 수정 또는
						삭제하세요.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
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