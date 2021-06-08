<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<table class="table">
	<thead class="thead-dark">
		<tr>
			<th scope="col">번호</th>
			<th scope="col">업체명</th>
			<th scope="col">업체 연락처</th>
			<th scope="col">우편번호</th>
			<th scope="col">기본주소</th>
			<th scope="col">상세주소</th>
			<th scope="col">거래여부</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty shops}">
  		등록된 업체가 없습니다.
  		</c:if>
		<c:forEach var="s" items="${shops}">

			<tr>
				<th scope="row">${s.shopStoreId }</th>
				<td>${s.shopStoreName }</td>
				<td>${s.shopStoreTel }</td>
				<td>${s.zip }</td>
				<td>${s.shopStoreAddress1 }</td>
				<td>${s.shopStoreAddress2 }</td>
				<td>${s.enabled}</td>
			</tr>
		</c:forEach>


	</tbody>
</table>
