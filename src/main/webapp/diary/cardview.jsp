<%@page import="com.sun.jmx.snmp.InetAddressAcl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>무우럭</title>
<%@ include file="diary_header.jsp"%>

<!-- 식물일기 페이지 접속 시 최초 목록 출력하는 ajax -->
<script type="text/javascript">
      $(function() {
	$.ajax({
		url: "cardview_list",
		success: function(x) {
			$('#result').html(x)
		}
	})
})
</script>	
<link href="../resources/css/diary.css" type="text/css" rel="stylesheet" />
</head>

<body>
<!-- 네비게이션바 header -->
<%@ include file="../nav_header.jsp"%>

<!-- 식물일기 목록 표시하는 div -->
<div id="result"></div>

</body>
</html>