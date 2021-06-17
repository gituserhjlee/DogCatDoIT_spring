<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div style="width: 800px; min-height: 800px; float: left;">
	<div style="width: 100%; height: 100%; padding-left: 100px; padding-top: 30px;">
		<div>
			<h4>포인트</h4>
		</div>
		<div>
			<p>내 포인트 : </p>
		</div>
		<div>
			<p>포인트 내역</p>
			<p>
				조회기간
				<select>
					<option>기간</option>
					<option>1개월</option>
					<option>3개월</option>
					<option>6개월</option>
					<option>1년</option>
				</select>
			</p>
			<table>
				<tr>
					<td>번호</td>
					<td>금액</td>
					<td>내용</td>
					<td>일자</td>
				</tr>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>번호</td>
						<td>${dto.amount}</td>
						<td>${dto.by_what}</td>
						<td>${get_date}</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${empty list}">
				포인트 내역이 없습니다.
			</c:if>
		</div>
	</div>
</div>