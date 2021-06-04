<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="vo" items="${options}">
	<div class='answer' style='padding: 0 10px;'>
		<div style='clear: both; padding: 5px 5px; border-bottom: 1px solid #ccc;'>
			<h5>상세옵션명: ${vo.detailname} </h5><br> 
			<h5>재고: ${vo.stock}개</h5>
			<div style='padding: 0 13px 10px 10px; text-align: right;'>

				<button class="deleteDetailOption btn btn-outline-danger"
					style="cursor: pointer;" data-optionNum='${vo.detailId}'>삭제</button>
			</div>
		</div>
	</div>
</c:forEach>