<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<table style="margin: 5px auto; width: calc(100% - 20px);">
	<tr>
		<th class="right">no</th>
		<th class="right">제목</th>
		<th class="right">카테고리</th>
		<th>북마크 삭제</th>
	</tr>
	<c:forEach items="${bookmarkList}" var="bag"> <!-- <>안에  begin="0" end="16" 적어주면 범위 지정가능 -->
		<tr>
			<td class="top right">${bag.my_bookmark}</td>
			<td class="top right"><a href="../community/bbs_one1?bbs_no=${bag.bbs_no}">${bag.bbs_title}</a></td>
			<td class="top right">${bag.community_category}</td>
			<td class="top">
				<form action="del_bookmark">
					<input name="bookmark_no" value="${bag.bookmark_no}" type="hidden"/>
					<button type="submit">삭제</button>
				</form>
			</td>
		</tr>
	</c:forEach>
</table>