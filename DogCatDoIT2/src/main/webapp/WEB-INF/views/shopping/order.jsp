<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style2.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>

<style type="text/css">
.container {
	width: 1110px;
	margin: 0 auto;
}
table {
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
	margin: 15px auto 60px;
}
table tr {
	border-bottom: 1px solid #ccc;
	vertical-align: middle;
}
.tr-top {
	border-top: 2px solid #ccc;
}
.tr-bottom {
	border-bottom: 2px solid #ccc;
}

/* 상품 리스트 */
.table1 td:nth-child(1) {
	width: 550px;
}
.table1 td:nth-child(2) {
	width: 60px;
}
.table1 td:nth-child(3) {
	width: 120px;
}
.table1 td:nth-child(4) {
	width: 150px;
}
.table1 td:nth-child(5) {
	width: 100px;
}
.table1 td:nth-child(6) {
	width: 120px;
}
.table1 thead tr{
	height: 35px;
}
.table1 td {
	text-align: center;
}
.table1 tbody tr{
	height: 100px;
}
.table1 tfoot tr{
	height: 70px;
}
.table1 thead tr{
	background: #eee;
}

/* 주문 입력 정보 테이블 */
.table2 tr {
	height: 55px;
}
.table2 td:first-child:not(.td2) {
	width: 175px;
	background: #eee;
	text-align: center;
}
.table2 td:last-child {
	width: 935px;
	padding: 12px 10px 11px 15px;
}

/* 제출 버튼 */
.btn-container {
	align-content: center;
}
.tright {
	text-align: right;
}
input[type=text] {
	width: 165px;
}
input[name*=Addr] {
	width: 300px;
}
input[name*=Tel] {
	width: 65px; 
}
input[name=memo] {
	width: 900px;
}

</style>

<script type="text/javascript">
$(function() {
	$("input[name=deliveryInfo]").click()
});

</script>

</head>
<body>
	<div class="container">
		<div>
			<h2>상품 리스트</h2>
		</div>
		<table class="table1">
			<thead>
				<tr class="tr-top">
					<td>상품정보</td>
					<td>적립금</td>
					<td>판매가</td>
					<td>수량</td>
					<td>배송비</td>
					<td>합계</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>상품1</td>
					<td>0원</td>
					<td>34,000원</td>
					<td>2개</td>
					<td>기본배송</td>
					<td>68,000원</td>
				</tr>
				<tr>
					<td>상품2</td>
					<td>0원</td>
					<td>34,000원</td>
					<td>1개</td>
					<td>기본배송</td>
					<td>34,000원</td>
				</tr>
			</tbody>
			<tfoot>
				<tr class="tr-bottom">
					<td colspan="6" align="right">상품금액합계: <span>68,000원</span> </td>
				</tr>
			</tfoot>
		</table>
		
		<div>
			<h2>주문자 정보</h2>
		</div>
		<table class="table2">
			<tr class="tr-top">
				<td>주문하시는분</td>
				<td>
					<input type="text" name="orName" class="boxTF" value="구매자1" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>
				<td>
					<input type="text" name="orAddr" class="boxTF" value="서울시 서대문구 연희동 1-1">
				</td>
			</tr>
			<tr>
				<td>핸드폰번호</td>
				<td>
					<input type="text" name="orTel1" value="010" class="boxTF"> -
					<input type="text" name="orTel2" value="1111" class="boxTF">-
					<input type="text" name="orTel3" value="2222" class="boxTF">
				</td>
			</tr>
			<tr class="tr-bottom">
				<td>이&nbsp;&nbsp;&nbsp;메&nbsp;&nbsp;&nbsp;일</td>
				<td>
					<input type="text" name="orEmail" class="boxTF" value="test@naver.com">
				</td>
			</tr>
		</table>
		
		<div>
			<h2>배송정보</h2>
		</div>
		<table class="table2">
			<tr class="tr-top">
				<td>배송지선택</td>
				<td>
					<input type="radio" id="radio1" name="deliveryInfo">
					<label for="radio1">기본배송지(주문자정보와동일)</label>
					<input type="radio" id="radio2" name="deliveryInfo">
					<label for="radio2">신규배송지</label>
				</td>
			</tr>
			<tr>
				<td>받으실분</td>
				<td>
					<input type="text" name="rcName" class="boxTF">
				</td>
			</tr>
			<tr>
				<td rowspan="3">받으실곳</td>
				<td>
					<input type="text" name="rcZip" class="boxTF">
					<button type="button" class="btn">우편번호검색</button>
				</td>
			</tr>
			<tr>
				<td class="td2">
					<input type="text" name="rcAddr1" class="boxTF">
				</td>
			</tr>
			<tr>
				<td class="td2">
					<input type="text" name="rcAddr2" class="boxTF">
				</td>
			</tr>
			<tr>
				<td>핸드폰번호</td>
				<td>
					<input type="text" name="rcTel1" class="boxTF"> -
					<input type="text" name="rcTel2" class="boxTF"> -
					<input type="text" name="rcTel3" class="boxTF">
				</td>
			</tr>
			<tr class="tr-bottom">
				<td>남기실 말씀</td>
				<td>
					<input type="text" name="memo" class="boxTF">
				</td>
			</tr>
		</table>
		
		<div>
			<h2>결제금액</h2>
		</div>
		<table class="table2">
			<tr class="tr-top">
				<td>상품합계금액</td>
				<td>
					68000 원
				</td>
			</tr>
			<tr>
				<td>배&nbsp;&nbsp;송&nbsp;&nbsp;비</td>
				<td>
					0 원
				</td>
			</tr>
			<tr>
				<td>즉시할인액</td>
				<td>
					0 원
				</td>
			</tr>
			<tr>
				<td>회원할인</td>
				<td>
					0 원
				</td>
			</tr>
			<tr>
				<td>쿠폰적용</td>
				<td>
					<input type="text" name="couponDiscount" class="boxTF tright" placeholder="0"> 원 
					<button type="button" class="btn">쿠폰적용및조회</button>
				</td>
			</tr>
			<tr>
				<td>포인트적용</td>
				<td>
					<input type="text" name="pointDiscount" class="boxTF tright" placeholder="0"> 원 (보유포인트: 0 원)
				</td>
			</tr>
			<tr class="tr-bottom">
				<td>총 결제금액</td>
				<td>
					68,000 원
				</td>
			</tr>
		</table>
		
		<div>
			<h2>결제수단</h2>
		</div>
		<table class="table2">
			<tr class="tr-top tr-bottom">
				<td>결제방법</td>
				<td>
					<input type="radio" id="radio3" name="payMethod">
					<label for="radio3">무통장입금</label>
					<input type="radio" id="radio4" name="payMethod">
					<label for="radio4">신용카드</label>
				</td>
			</tr>
		</table>
		
		<div class="btn-container" align="center">
			<button type="button" class="btnConfirm">결제하기</button>
		</div>
		
		
	</div>
</body>
</html>