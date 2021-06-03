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
* {
	box-sizing: border-box;
}
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
	height: 38px;
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
.no-margin-top {
	margin-bottom: 0;
}
.no-margin-bot {
	margin-top: 0;
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
	width: 400px;
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
	// 배송정보 raio버튼 선택 이벤트 
	$("input[name=deliveryInfo]").change(function() {
		const f = document.deliveryForm;
		
		if($("input[name=deliveryInfo]:checked").val()=="basic") { // 기본배송지(회원정보)
			// 주문자 정보를 배송정보에 복사
			$("#rcName").val($("#orName").val());
			$("#rcZip").val("${mdto.zip}");
			$("#rcAddr1").val("${mdto.addr1}");
			$("#rcAddr2").val("${mdto.addr2}");
			$("#rcTel1").val($("#orTel1").val());
			$("#rcTel2").val($("#orTel2").val());
			$("#rcTel3").val($("#orTel3").val());
			
			// 주소찾기 버튼 display:none;
			$("#deliveryForm .searchAddrBtn").css("display","none");
			// 인풋 요소들 disable:true
			$("#deliveryForm input").not("input[name=memo]").prop("disabled", true);
		} else { // 신규 배송지
			// 주소찾기 버튼 display:inline-block
			$("#deliveryForm .searchAddrBtn").css("display","inline-block");
			// 인풋 요소들 reset, disable:false
			$("#deliveryForm")[0].reset();
			$("#deliveryForm input").not("input[name=memo], input[name=rcZip], input[name=rcAddr1]").prop("disabled", false);
		}
	});
	
});

$(function() {
	let totalAmount = 68000;
	let point = ${mdto.point};

	// 포인트 사용 keyup 이벤트 제어
	$("#pointDiscount").keyup(function() {
		let usePoint = $(this).val();
		currentAmount = totalAmount - usePoint;
		if(currentAmount < 0) {
			alert("적용할 포인트가 결제하실 금액보다 많습니다.");
			$(this).val("");
			return false;
		}
	});
	
	// 포인트 사용 change 이벤트 제어
	$("#pointDiscount").change(function() {
		if($(this).val() > point) {
			alert("포인트가 부족합니다.");
			$(this).val("");
			return false;
		}
	});
	
});
</script>

<!-- 다음 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementsByName('rcZip')[0].value = data.zonecode; //5자리 새우편번호 사용
                document.getElementsByName('rcAddr1')[0].value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementsByName('rcAddr2')[0].focus();
            }
        }).open();
    }
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
					<input type="text" name="orName" id="orName" value="${mdto.name}" class="boxTF" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>
				<td>
					<input type="text" name="orAddr" id="orAddr" value="${mdto.addr}" class="boxTF" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td>핸드폰번호</td>
				<td>
					<input type="text" name="orTel1" id="orTel1" value="${mdto.tel1}" class="boxTF"> -
					<input type="text" name="orTel2" id="orTel2" value="${mdto.tel2}" class="boxTF">-
					<input type="text" name="orTel3" id="orTel3" value="${mdto.tel3}" class="boxTF">
				</td>
			</tr>
			<tr class="tr-bottom">
				<td>이&nbsp;&nbsp;&nbsp;메&nbsp;&nbsp;&nbsp;일</td>
				<td>
					<input type="text" name="orEmail" id="orEmail" class="boxTF" value="${mdto.email}">
				</td>
			</tr>
		</table>
		
		<div>
			<h2>배송정보</h2>
		</div>
		<table class="table2 no-margin-top">
			<tr class="tr-top">
				<td>배송지선택</td>
				<td>
					<input type="radio" id="basicDI" name="deliveryInfo" value="basic">
					<label for="basicDI">기본배송지(주문자정보와동일)</label>
					<input type="radio" id="newDI" name="deliveryInfo" value="new">
					<label for="newDI">신규배송지</label>
				</td>
			</tr>
		</table>
		<form name="deliveryForm" id="deliveryForm">
			<table class="table2 no-margin-bot">
				<tr>
					<td>받으실분</td>
					<td>
						<input type="text" name="rcName" id="rcName" class="boxTF">
					</td>
				</tr>
				<tr>
					<td rowspan="3">받으실곳</td>
					<td>
						<input type="text" name="rcZip" id="rcZip" class="boxTF" disabled="disabled">
						<button type="button" class="btn searchAddrBtn" onclick="daumPostcode()">우편번호검색</button>
					</td>
				</tr>
				<tr>
					<td class="td2">
						<input type="text" name="rcAddr1" id="rcAddr1" class="boxTF" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td class="td2">
						<input type="text" name="rcAddr2" id="rcAddr2" class="boxTF">
					</td>
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td>
						<input type="text" name="rcTel1" id="rcTel1" class="boxTF"> -
						<input type="text" name="rcTel2" id="rcTel2" class="boxTF"> -
						<input type="text" name="rcTel3" id="rcTel3" class="boxTF">
					</td>
				</tr>
				<tr class="tr-bottom">
					<td>남기실 말씀</td>
					<td>
						<input type="text" name="memo" id="memo" class="boxTF">
					</td>
				</tr>
			</table>
		</form>
		
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
					<input type="text" name="couponDiscount" class="boxTF tright" placeholder="0" disabled="disabled"> 원 
					<button type="button" class="btn">쿠폰적용및조회</button>
				</td>
			</tr>
			<tr>
				<td>포인트적용</td>
				<td>
					<input type="text" name="pointDiscount" id="pointDiscount" class="boxTF tright" placeholder="0"> 원 (보유포인트: ${mdto.point} 원)
				</td>
			</tr>
			<tr class="tr-bottom">
				<td>총 결제금액</td>
				<td>
					<span id="totalAmount">68000</span> 원
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
					<input type="radio" id="radio3" name="payMethod" value="dob">
					<label for="radio3">무통장입금</label>
					<input type="radio" id="radio4" name="payMethod" value="credit">
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