<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.multi.muluckup.business.BusinessVO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/resources/css/business.css"
	rel="stylesheet">
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
<%@ include file="../../../nav_header.jsp"%>

	<h1 class="mt-2"></h1>
	<IMG SRC="../resources/upload/${savedName}">
	<div class="container">
		<div class="mb-3 ">
				<button class="btn btn-primary" onclick="location.href='../business/business_main.jsp';">완료</button>
		</div>
	</div>
</body>
</html>

</body>
</html>