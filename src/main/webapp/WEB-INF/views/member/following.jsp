<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<table style="margin: 5px auto; width: calc(100% - 20px);">
	<c:forEach items="${followingList}" var="bag"> <!-- <>안에  begin="0" end="16" 적어주면 범위 지정가능 -->
		<tr style="margin-top: 5px; margin-bottom: 5px;">
			<td class="bottom">
				<img id="show_img" width=40 height=40 alt="프로필 사진" style="border-radius: 50px;" src="../resources/upload/member/${bag.member_img}" onerror="this.src='../resources/upload/member/myprofile.png';">
			</td>
			<td class="bottom">${bag.member_nickname}</td>
			<td class="bottom">@${bag.member_id}</td>
			<td class="bottom">
				<form action="del_following">
					<input name="follow_no" value="${bag.follow_no}" type="hidden"/>
					<button type="submit">삭제</button>
				</form>
			</td>
		</tr>
	</c:forEach>
</table>