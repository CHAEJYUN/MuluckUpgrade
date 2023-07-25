<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<table style="margin: 5px auto; width: calc(100% - 20px);">
	<tr>
		<th class="right">no</th>
		<th class="right">제목</th>
		<th class="right">작성자</th>
		<th class="right">날짜</th>
		<th class="right">답변자</th>
		<th class="right">답변날짜</th>
		<th>답변수정</th>
	</tr>
	<c:forEach items="${completeList}" var="bag"> <!-- <>안에  begin="0" end="16" 적어주면 범위 지정가능 -->
		<tr>
			<td class="top right">${bag.no}</td>
			<td class="top right"><a href="../manager/one_inquiry?inquiry_no=${bag.inquiry_no}">${bag.inquiry_title}</a></td>
			<td class="top right">${bag.writer_nickname}</td>
			<td class="top right">${bag.formattedInquiryUdate}</td>
			<td class="top right">${bag.answer_nickname}</td>
			<td class="top right">${bag.formattedInquiryAdate}</td>
			<td class="top">
				<form action="modify">
					<input name="inquiry_no" value="${bag.inquiry_no}" type="hidden"/>
					<button type="submit">수정</button>
				</form>
			</td>
		</tr>
	</c:forEach>
</table>