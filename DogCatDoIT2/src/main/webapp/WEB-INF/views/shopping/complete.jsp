<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jquery/js/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style2.css"
	type="text/css">
<style type="text/css">
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

.container {
	width: 1110px;
	margin: 30px auto 60px;
}

table {
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
}

.table1 tr {
	height: 35px;
}

.table1 .col1 {
	width: 20%;
}

.table1 .col2 {
	width: 15%;
	padding-left: 15px;
}

.table1 {
	margin: 15px auto 60px;
}

.table1 .tr-bot {
	border-bottom: 2px solid #ccc;
	height: 0;
}

.table1 .tr-top {
	border-top: 2px solid #ccc;
}

.table1 .gray {
	background: #eee;
}

.container .btnConfirm {
	background: #F79F81;
}
</style>

<div class="container">
	<h2>주문정보 확인</h2>
	<table class="table1">
		<tr class="tr-top">
			<td rowspan="11" class="gray col1" align="center">주문요약정보</td>
			<td class="col2">결제방식</td>
			<td class="col3">신용카드</td>
		</tr>
		<tr>
			<td class="col2">결제금액</td>
			<td class="col3"><fmt:formatNumber type="number"
					value="${dto.totalPayment}" maxFractionDigits="3" /> 원</td>
		</tr>
		<tr>
			<td class="col2">상품가격</td>
			<td class="col3"><fmt:formatNumber type="number"
					value="${dto.totalItemPrice}" maxFractionDigits="3" /> 원</td>
		</tr>
		<tr>
			<td class="col2">배송비</td>
			<td class="col3"><fmt:formatNumber type="number"
					value="${dto.deliveryPrice}" maxFractionDigits="3" /> 원</td>
		</tr>
		<tr>
			<td class="col2">할인금액</td>
			<td class="col3"><fmt:formatNumber type="number"
					value="${dto.totalDiscount}" maxFractionDigits="3" /> 원</td>
		</tr>
		<tr>
			<td colspan="2"><hr></td>
		</tr>
		<tr>
			<td class="col2">주문명</td>
			<td class="col3">${dto.orderName}</td>
		</tr>
		<tr>
			<td class="col2">주문번호</td>
			<td class="col3">${dto.orderIdx}</td>
		</tr>
		<tr>
			<td class="col2">주문자명</td>
			<td class="col3">${dto.orName}</td>
		</tr>
		<tr>
			<td class="col2">주문일자</td>
			<td class="col3">${dto.order_date}</td>
		</tr>
		<tr>
			<td class="col2">주문금액</td>
			<td class="col3"><fmt:formatNumber type="number"
					value="${dto.totalItemPrice + dto.deliveryPrice}" maxFractionDigits="3" />
				원</td>
		</tr>
		<tr class="tr-bot">
			<td colspan="3"></td>
		</tr>
	</table>

	<table>
		<tr align="center">
			<td>
				<button type="button" class="btnConfirm"
					onclick="location.href='${pageContext.request.contextPath}/shopping/mainPage'">확인</button>
			</td>
		<tr>
	</table>

</div>