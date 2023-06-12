<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나눔</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
	
<script type="text/javascript">
	function showPage(page) {
		window.location.href = "shareList?page=" + page;
	}
</script>

<script type="text/javascript">
	function logout() {
		window.location.href = "member/logout";
	}
</script>

<style>
td {
	background: white;
	height: 30px;
}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/resources/css/business.css"
	rel="stylesheet">
<!-- jquery  -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->
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
		<video src="${pageContext.request.contextPath}/resources/img/pot.mp4"
			autoplay muted loop></video>
		<div class="inner">
			<h2>MULUCK</h2>
			<p>거래 나눔 페이지</p>
		</div>
	</figure>

	<section>
		<div class="inner">
			<h3 style="font-family: 'KOTRAHOPE'; font-size:50px">나눔 게시글 : ${count}</h3>
			<hr color="green">
			<%
				int pages = (int) request.getAttribute("pages");
			for (int p = 1; p <= pages; p++) {
			%>
			<button style="background: #eaf2df; color: #145f37; width: 50px;"
				class="pages" onclick="showPage(<%=p%>)"><%=p%></button>
			<%
				}
			%>
			<hr color="green">
			<div id="d1">
				<table class="table table-striped">
					<thead>
						<tr>
							<td class="left">게시판 번호</td>
							<td class="left">게시자</td>
							<td class="left">제목</td>
							<td class="left">게시시간</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="one" varStatus="loop">
							<c:if test="${one.business_share == true}">
								<tr>
									<td class="right"><c:out value="${loop.index+1}" /></td>
									<td class="right">${one.member_nickname}</td>
									<td class="right"><a href="businessList?business_no=${one.business_no}">${one.business_title}</a></td>
									<td class="right">${one.business_date}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>

</body>
</html>