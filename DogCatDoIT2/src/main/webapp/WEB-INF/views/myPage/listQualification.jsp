<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div style="width: 800px; min-height: 800px; float: left;">
	<div style="width: 100%; height: 100%; padding-left: 100px; padding-top: 30px;">
		<div>
			<h4>자격신청내역</h4>
		</div>
		<div>
			<table>
				<tr>
					<td>신청일</td>
					<td>구분</td>
					<td>상태</td>
					<td>파일</td>
					<td>수정</td>
					<td>신청삭제</td>
				</tr>
				<c:if test="${empty list}">
					<tr>
						<td colspan="6">신청 내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.req_date}</td>
						<td>${dto.gubun}</td>
						<td>${dto.state}</td>
						<c:if test="${not empty dto.saveFilename}">
							<td><a href="${pageContext.request.contextPath}/myPage/download?requestNum=${dto.requestNum}"><i class="far fa-file"></i></a></td>
						</c:if>
						<td><button type="button" onclick="location.href='${pageContext.request.contextPath}/myPage/updateRequestQualification?requestNum=${dto.requestNum}'">수정</button></td>
						<td><button type="button" onclick="location.href='${pageContext.request.contextPath}/myPage/deleteRequestQualification?requestNum=${dto.requestNum}'">신청삭제</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>