<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="vo" items="${options}">
	<div class='answer' style='padding: 0 10px; padding: 10px; font-family: "JUA"; '>
		<div
			style='height: 50px; clear: both; padding: 5px 5px;  '>
			<span style="color: #696969; ">
				<button class="deleteDetailOption btn  btn-danger"
					style="cursor: pointer;border-radius:10px;" data-optionNum='${vo.detailId}'>삭제</button>
				<button class="updateDetailOption btn  btn-outline-danger"
					style="cursor: pointer;border-radius:10px;" data-optionNum='${vo.detailId}' 
					onclick="location.href='${pageContext.request.contextPath}/shopping/admin/itemdetailOptionUpdate?itemid=${itemid}&detailid=${vo.detailId}'"
					>수정</button>
				상세옵션명: ${vo.detailname} / 재고: ${vo.stock}개
			</span>
			<br>
			<div style='padding: 0 13px 10px 10px; text-align: right;'></div>
		</div>
	</div>
</c:forEach>