<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<table class="table">
	<thead class="thead-dark" style="text-align: center;">
		<tr>
			<th scope="col" style="vertical-align: middle"></th>
			<th scope="col" style="vertical-align: middle">업체명</th>
			<th scope="col" style="vertical-align: middle">연락처</th>
			<th scope="col" style="vertical-align: middle">우편<br>번호
			</th>
			<th scope="col" style="vertical-align: middle">기본주소</th>
			<th scope="col" style="vertical-align: middle">상세주소</th>
			<th scope="col" style="vertical-align: middle">거래<br>여부
			</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty shops}">
  		등록된 업체가 없습니다.
  		</c:if>
		<c:forEach var="s" items="${shops}">
			<tr style="<c:if test="${s.enabled eq '0' }">
				color:gray; text-decoration:line-through ;
			</c:if> ">

				<th scope="row">
				<c:if test="${s.enabled eq true}">
				<button class="btn btn-outline-danger"
						style="border-radius: 10px;"
						onclick='deleteShop(${s.shopStoreId});'>중단</button>
						</c:if></th>
				<td>${s.shopStoreName }</td>
				<td>${s.shopStoreTel }</td>
				<td>${s.zip }</td>
				<td>${s.shopStoreAddress1 }</td>
				<td>${s.shopStoreAddress2 }</td>

				<c:if test="${s.enabled eq true}">
					<td>거래중</td>
				</c:if>
				<c:if test="${s.enabled eq false}">
					<td>중단</td>
				</c:if>
			</tr>

		</c:forEach>


	</tbody>
</table>

