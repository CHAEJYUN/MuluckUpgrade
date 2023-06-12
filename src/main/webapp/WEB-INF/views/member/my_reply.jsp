<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<table style="margin: 5px auto; width: calc(100% - 20px);">
	<tr>
		<th class="right">no</th>
		<th class="right">제목</th>
		<th class="right">내 댓글</th>
		<th>댓글 삭제</th>
	</tr>
	<c:forEach items="${replyList}" var="bag"> <!-- <>안에  begin="0" end="16" 적어주면 범위 지정가능 -->
		<tr>
			<td class="top right">${bag.my_no}</td>
			<td class="top right"><a href="../community/bbs_one1?bbs_no=${bag.bbs_no}">${bag.bbs_title}</a></td>
			<td class="top right">${bag.reply_content}</td>
			<td class="top">
				<form action="del_reply">
					<input name="reply_no" value="${bag.reply_no}" type="hidden"/>
					<button type="submit">삭제</button>
				</form>
			</td>
		</tr>
	</c:forEach>
</table>