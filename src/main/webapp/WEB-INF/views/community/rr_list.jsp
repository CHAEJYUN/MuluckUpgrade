<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items="${list}" var="bag">
${member_nickname} : ${bag.reply_content}  
	<button id="r_del_btn"><img src="../resources/assets/img/delete.png"></button><br>
</c:forEach>
</body>
</html>