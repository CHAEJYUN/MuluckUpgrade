<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<table style="margin: 5px auto; width: calc(100% - 20px);">
	<tr>
		<th class="right">no</th>
		<th class="right">매니저 닉네임</th>
		<th>확인</th>
	</tr>
	<c:forEach items="${manager_list}" var="bag"> <!-- <>안에  begin="0" end="16" 적어주면 범위 지정가능 -->
		<tr>
			<td class="top right">${bag.no}</td>
			<td class="top right"><a href="../manager/manager_information?member_no=${bag.member_no}">${bag.member_nickname}</a></td>
			<td class="top">
				<form action=wait>
					<input name="member_no" value="${bag.member_no}" type="hidden"/>
					<a href="../manager/manager_information?member_no=${bag.member_no}"><button type="button">확인</button></a>
				</form>
			</td>
		</tr>
	</c:forEach>
</table>