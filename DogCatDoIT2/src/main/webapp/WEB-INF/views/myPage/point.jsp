<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div style="width: 800px; min-height: 800px; float: left;">
	<div style="width: 100%; height: 100%; padding-left: 100px; padding-top: 30px;">
		<div>
			<h4 style="margin-bottom: 30px;">포인트</h4>
		</div>
		<div>
			<span>내 포인트 : ${point}</span>
			<span style="float: right; display: inline-block;">
				조회기간
				<select>
					<option>기간</option>
					<option>1개월</option>
					<option>3개월</option>
					<option>6개월</option>
					<option>1년</option>
				</select>
			</span>
			
			<table style="clear: both; margin-top: 20px;">
				<tr style="font-weight: bold; border-bottom: 0.5px solid #eee; border-top: 0.5px solid #eee;" height="40">
					<td width="100" align="center">번호</td>
					<td width="150" align="center">금액</td>
					<td width="250" align="center">내용</td>
					<td width="200" align="center">일자</td>
				</tr>
				<c:forEach var="dto" items="${list}">
					<tr height="40">
						<td align="center">번호</td>
						<td align="center">${dto.amount}</td>
						<td align="center">${dto.by_what}</td>
						<td align="center">${dto.get_date}</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${empty list}">
				포인트 내역이 없습니다.
			</c:if>
		</div>
	</div>
</div>