<%@page import="com.multi.muluckup.business.BusinessVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나눔</title>
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	function logout() {
		window.location.href = "member/logout";
	}
</script>

<style>
td {
	background: white;
	height:30px;
}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">
	
	 <!-- Bootstrap CSS -->
  <link href="${pageContext.request.contextPath}/resources/css/business.css" rel="stylesheet">
  <!-- jquery  -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <!-- 토글 - 드롭다운 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../resources/js/scripts.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
  
</head>
<body>
<!-- 네비게이션바 header -->
<%@ include file="../../../nav_header.jsp"%>
	
	<figure>
	<video src="${pageContext.request.contextPath}/resources/img/pot.mp4" autoplay muted loop></video>
	<div class="inner">
		<h2>MULUCK</h2>
		<p>거래 나눔 페이지</p>
	</div>
	</figure>

<section>
	<div class="inner">
		<div class="post">
			<div class="post-header">
				<h2 class="post-title" style="font-family: 'KOTRAHOPE'; font-size:60px">${vo.business_title}</h2>
				<h3 style="font-family: 'KOTRAHOPE'">
				<c:if test= "${vo.business_share== false}"> 거래 </c:if>
				<c:if test= "${vo.business_share== true}"> 나눔 </c:if>
				</h3>
				<p class="post-author">작성자: ${vo.member_nickname}</p>
			</div>
			<hr>
			
			<div class="post-content">
			<%
				BusinessVO vo=new BusinessVO();
				String BusinessImage=vo.getBusiness_image();
				if(BusinessImage==null){
					BusinessImage="LOGO.png";
				}
			%>
					<IMG SRC="../resources/upload/${vo.business_image}" width="550px" hight="500px">
					
				<div> ${vo.business_write}</div>
				
				<div id="map" style="width:100%;height:350px;"></div>
				<div id="clickLatlng"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1dbba6b49b07b20d9d61a143073f3d6c"></script>
				<script>
					var mapContainer = document.getElementById('map');
					var mapOption = {
						center: new kakao.maps.LatLng(${latitude},${longitude}),
						level: 3
					};
					var map = new kakao.maps.Map(mapContainer, mapOption);
					var marker = new kakao.maps.Marker({
						position: map.getCenter()
					});
					marker.setMap(map);
					kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
						var latlng = mouseEvent.latLng;
						marker.setPosition(latlng);
						var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
						message += '경도는 ' + latlng.getLng() + ' 입니다';
						var resultDiv = document.getElementById('clickLatlng');
						resultDiv.innerHTML = message;
					});
				</script>
				<hr>
				<table>
					<!-- 추가적인 게시글 내용 표시 -->
				</table>
			</div>
		</div>
	</div>
</section>
	
</body>
</html>