<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table style="margin: 5px auto; width: calc(100% - 20px);">
    <tr>
        <th class="top right bottom">no</th>
        <th class="top right bottom">문의 제목</th>
        <th class="top right bottom">문의 날짜</th>
        <th class="top right bottom">답변 유무</th>
        <th class="top right bottom">답변 날짜</th>
        <th class="top bottom">글 삭제</th>
    </tr>
    <c:forEach items="${inquiryList}" var="bag"> <!-- <>안에 begin="0" end="16" 적어주면 범위 지정 가능 -->
        <tr>
            <td class="top right bottom">${bag.myinquiry_no}</td>
            <td class="top right bottom"><a href="one_inquiry?inquiry_no=${bag.inquiry_no}">${bag.inquiry_title}</a></td>
            <td class="top right bottom">${bag.formattedInquiryUdate}</td>
            <td class="top right bottom">
                <c:choose>
                    <c:when test="${bag.answer_check eq '답변완료'}">
                        <span style="color: blue;">${bag.answer_check}</span>
                    </c:when>
                    <c:otherwise>
                        ${bag.answer_check}
                    </c:otherwise>
                </c:choose>
            </td>
            <td class="top right bottom">${bag.formattedInquiryAdate}</td>
            <td class="top bottom">
                <form action="del_inquiry">
                    <input name="inquiry_no" value="${bag.inquiry_no}" type="hidden"/>
                    <button type="submit">삭제</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
