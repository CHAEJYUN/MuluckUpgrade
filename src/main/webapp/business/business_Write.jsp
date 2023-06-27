<%@page import="com.multi.muluckup.business.BusinessVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String bShareString = request.getParameter("b_share");
boolean bShare = bShareString != null && bShareString.equals("true");

BusinessVO vo = new BusinessVO();
vo.setBusiness_share(bShare);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/resources/css/business.css"
	rel="stylesheet">
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<!-- jquery  -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script type="text/javascript">
	function logout() {
		window.location.href = "member/logout";
	}
</script>
<!-- 토글 - 드롭다운 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../resources/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</head>
<body>
<!-- 네비게이션바 header -->
<%@ include file="../nav_header.jsp"%>
	
	<h1 class="mt-2"></h1>
	<div class="container">
		<!--Bootstrap의 container클래스를 사용하면 좌우 여백을 만들 수 있음 해당 클래스는 max-width 속성을 가지고있어서 반응형 웹을 만들때 유용함  -->
		<h1 class="mt-4 text-start" style="font-family: 'KOTRAHOPE'">게시글 작성</h1>

		<br>
		<form class="was-validated" action="insert" method="post"
			enctype="multipart/form-data">

			<div class="mb-3">
				<input name="business_title" class="form-control" id="validationTextarea" 
					placeholder="제목을 입력해주세요" style="font-family: 'KOTRAHOPE'" required>
				<div class="invalid-feedback" style="font-family: 'KOTRAHOPE'">게시글 제목을 입력해주세요!</div>
			</div>

			<div class="mb-3">
				<input name="business_write" type="text" class="form-control"
					id="validationTextarea" style="height: 300px; font-family: 'KOTRAHOPE'; font-size: 20px" required>
				<div class="invalid-feedback" style="font-family: 'KOTRAHOPE'">게시 내용을 입력해주세요.</div>
			</div>

			<div class="form-check text-start">
				<input name="business_share" type="radio" value="false"
					class="form-check-input" id="validationFormCheck2"
					name="radio-stacked"  required> <label
					class="form-check-label"  style="font-family: 'KOTRAHOPE'" for="validationFormCheck2" >중고거래</label>
			</div>

			<div class="form-check mb-3 text-start">
				<input name="business_share" type="radio" value="true"
					class="form-check-input" id="validationFormCheck3"
					name="radio-stacked" required> <label
					class="form-check-label" style="font-family: 'KOTRAHOPE'" for="validationFormCheck3">나눔</label>
					
				<div class="invalid-feedback text-start">두개의 항목 중 1개를 선택해주세요</div>
			</div>



			<div class="mb-3">
				<input name="file" type="file" class="form-control"
					aria-label="파일 예시" formnovalidate>
				<!-- formnovalidate 속성을 추가하면 해당 필드는 폼 유효성에서 제외됨-->
				<div class="invalid-feedback">예시로서의 잘못된 파일 입력입니다.</div>
			</div>
		<!-- 위도와 경도 값을 저장할  hidden input 추가 -->
			<input type="hidden" name="latitude" id="latitude">
			<input type="hidden" name="longitude" id="longitude">
			
			<!-- kakao maps -->
			
			<div id="map" style="width: 100%; height: 350px;"></div>
			<p>
				<em>거래/나눔 장소를 클릭해주세요!</em>
			</p>
			<div id="clickLatlng"></div>

			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1dbba6b49b07b20d9d61a143073f3d6c"></script>
			<script>
			
			//클릭한 위치의 위도와 경도 값을 hidden input에 전달하는 함수
			function setLatLng(latitude, longitude){
				 document.getElementById('latitude').value = latitude;
			     document.getElementById('longitude').value = longitude;
			}
			
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				// 지도를 클릭한 위치에 표출할 마커입니다
				var marker = new kakao.maps.Marker({
					// 지도 중심좌표에 마커를 생성합니다 
					position : map.getCenter()
				});
				// 지도에 마커를 표시합니다
				marker.setMap(map);

				// 지도에 클릭 이벤트를 등록합니다
				// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
				kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

							// 클릭한 위도, 경도 정보를 가져옵니다 
							var latlng = mouseEvent.latLng;

							// 마커 위치를 클릭한 위치로 옮깁니다
							marker.setPosition(latlng);

							var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
							message += '경도는 ' + latlng.getLng() + ' 입니다';

							var resultDiv = document.getElementById('clickLatlng');
							resultDiv.innerHTML = message;
							
							//위도와 경도 정보를 서버로 전송하여 DB에 저장
							var latitude=latlng.getLat();
							var longitude=latlng.getLng();
							setLatLng(latitude, longitude);	
							maps(latitude, longitude);

						});
			</script>
			
			<!-- 작성하기 버튼 -->
			<div class="mb-3 text-end">
				<button class="btn btn-primary" type="submit">작성하기</button>
			</div>
		</form>

	</div>
</body>
</html>
