<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
		<table class="table" style="border:2px solid #F79F81; font-family: 'JUA';">
				<thead style="text-align: center;background: #F79F81 ">
				<tr style="font-weight: lighter; ">
					<th scope="col" style="vertical-align: middle;font-weight: lighter;">등급명</th>
					<th scope="col" style="vertical-align: middle;font-weight: lighter;">구매가격(이상)</th>
					<th scope="col" style="vertical-align: middle;font-weight: lighter;">구매가격(이하)</th>
					<th scope="col" style="vertical-align: middle;font-weight: lighter;">할인율</th>
					<th scope="col" style="vertical-align: middle;font-weight: lighter;">수정</th>
					<th scope="col" style="vertical-align: middle;font-weight: lighter;">삭제</th>
				</tr>
				</thead>
				<tbody>
					<c:if test="${empty list}">
			  		등록된 쇼핑 등급이 없습니다.
			  		</c:if>
					<c:forEach items="${list}" var="l">
						<tr>
							<td>${l.levelName}</td>
							<td>${l.moneyStart}</td>
							<td>${l.moneyEnd}</td>
							<td>${l.rate}% 할인</td>
							<td>
							<button type="button" class='btn btn-secondary btnUpdateLevel' 
							style='padding: 10px 20px; border-radius: 10px;'  
							data-id="${l.levelId}" onclick="location.href='${pageContext.request.contextPath}/shopping/admin/updatelevels?levelId=${l.levelId}'">수정</button>
							</td>
							<td><button type="button" class='btn btn-secondary btnDeleteLevel' style='padding: 10px 20px; border-radius: 10px;' data-id="${l.levelId}">삭제</button></td>
						</tr>
			
					</c:forEach>
				</tbody>
			
		</table>