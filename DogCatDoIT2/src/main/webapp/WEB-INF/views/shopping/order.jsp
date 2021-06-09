<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style2.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.form.js"></script>

<style type="text/css">
* {
	box-sizing: border-box;
}
#orderForm {
	box-sizing: border-box;

}
.container {
	width: 1110px;
	margin: 0 auto;
}
#orderForm input, #orderForm label {
	display: inline-block;
}
#orderForm .boxTF {
	border:1px solid #999;
	padding:3px 5px 5px;
	border-radius:4px;
	background-color:#fff;
	font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
}
#orderForm .boxTF[readonly] {
	background-color:#eee;
}
#orderForm label {
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
.table1 th:nth-child(1) {
	width: 600px;
}
.table1 th:nth-child(2) {
	width: 130px;
}
.table1 th:nth-child(3) {
	width: 110px;
}
.table1 th:nth-child(4) {
	width: 110px;
}
.table1 th:nth-child(5) {
	width: 130px;
}

.table1 td:nth-child(1) {
	width: 100px;
	padding: 20px 20px 20px 20px;
}
.table1 td:nth-child(2) {
	width: 500px;
	padding: 20px 10px 20px 10px;
	text-align: left;
	
}
.table1 td:nth-child(3) {
	width: 130px;
}
.table1 td:nth-child(4) {
	width: 110px;
}
.table1 td:nth-child(5) {
	width: 110px;
}
.table1 td:nth-child(6) {
	width: 130px;
}

.table1 thead tr {
	height: 38px;
}

.table1 td, .table1 th {
	text-align: center;
}

.table1 tbody tr {
	height: 100px;
}

.table1 tfoot tr {
	height: 70px;
}

.table1 thead tr {
	background: #eee;
}

/* 주문 입력 정보 테이블 */
.table2 tr {
	height: 55px;
}

.table2 td:first-child:not(.td2 ) {
	width: 175px;
	background: #eee;
	text-align: center;
}

.table2 td:last-child {
	width: 910px;
	padding: 12px 10px 11px 15px;
}
.table2 td:firstst-child {
	width: 170px;
}

/* 제출 버튼 */
.btn-container {
	align-content: center;
}

.tright {
	text-align: right;
}

#orderForm input[type=text] {
	width: 165px;
}

#orderForm input[name*=Addr] {
	width: 400px;
}
#orderForm input[name=orAddr] {
	width: 500px;
}

#orderForm input[name*=Tel] {
	width: 65px;
}

#orderForm input[name=orderMemo] {
	width: 800px;
}

.product-img {
	width: 60px;
	height: 60px;
	object-fit: cover;
}
</style>

<script type="text/javascript">
$(function() {
	// 배송정보 raio버튼 선택 이벤트 
	$("input[name=deliveryInfo]").change(function() {
		const f = document.deliveryForm;

		if ($("input[name=deliveryInfo]:checked").val() == "basic") { // 기본배송지(회원정보)
			// 주문자 정보를 배송정보에 복사
			$("#diName").val($("#orName").val());
			$("#diZip").val("${mdto.zip}");
			$("#diAddr1").val("${mdto.addr1}");
			$("#diAddr2").val("${mdto.addr2}");
			$("#diTel1").val($("#orTel1").val());
			$("#diTel2").val($("#orTel2").val());
			$("#diTel3").val($("#orTel3").val());
			
			// 주소찾기 버튼 display:none;
			$("#deliveryForm .searchAddrBtn").css("display", "none");
					
			// 인풋 요소들 disable:true
			$("#deliveryForm input").not("input[name=orderMemo]")
									.prop("readonly", true);
		} else { // 신규 배송지
			// 주소찾기 버튼 display:inline-block
			$("#deliveryForm .searchAddrBtn").css("display", "inline-block");
					
			// 인풋 요소들 reset, disable:false
			$("#deliveryForm input").each(function() {$(this).not("input:radio").val("");});
			
			$("#deliveryForm input").not("input[name=orderMemo], input[name=diZip], input[name=diAddr1]")
									.prop("readonly", false);
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
		if (currentAmount < 0) {
			alert("적용할 포인트가 결제하실 금액보다 많습니다.");
			$(this).val("0");
			return false;
		}
	});

	// 포인트 사용 change 이벤트 제어
	$("#pointDiscount").change(function() {
		if ($(this).val() > point) {
			alert("포인트가 부족합니다.");
			$(this).val("0");
			return false;
		}
	});
});

$(function() {
	$(".btnConfirm").click(function() {
		
		// 테스트용
		$("input[name=totalAmount]").val("68000");
		
		let f = document.orderForm;
		
		let url = "${pageContext.request.contextPath}/order/insert";
		let query = new FormData(f);
		let query2 = $("#orderForm").serialize();
		
		f.action = "${pageContext.request.contextPath}/order/insert";
		
		// item, itemOption 테스트 출력
		console.log("itemId: ${item.itemId}");
		console.log("itemCategoryId: ${item.itemCategoryId}");
		console.log("shopStoreId: ${item.shopStoreId}");
		console.log("itemName: ${item.itemName}");
		console.log("itemOriginalPrice: ${item.itemOriginalPrice}");
		console.log("itemSalePrice: ${item.itemSalePrice}");
		console.log("discountRate: ${item.discountRate}");
		console.log("discountedPrice: ${item.discountedPrice}");
		console.log("registered: ${item.registered}");
		console.log("saveFileName: ${item.saveFileName}");
		console.log("des: ${item.des}");
		console.log("enabled: ${item.enabled}");
		console.log("manufacturer: ${item.manufacturer}");
		console.log("upload: ${item.upload}");
		
		console.log("============================");
		console.log('detailId: ${itemOption.detailId}');
		console.log('itemoptionid: ${itemOption.itemoptionid}');
		console.log('stock: ${itemOption.stock}');
		console.log('detailname: ${itemOption.detailname}');
		console.log('optionName: ${itemOption.optionName}');
		console.log("============================");
		console.log('count: ${count}');
// 		f.submit();
		
	});
});
</script>
<!-- 아임포트 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
$(function() {
	IMP.init('imp79933058');
	
	$(".btnConfirm2").click(function() {
		IMP.request_pay({
		    pg : 'inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : 100,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
		    if ( rsp.success ) {
		    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		    	jQuery.ajax({
		    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
		    		type: 'POST',
		    		dataType: 'json',
		    		data: {
			    		imp_uid : rsp.imp_uid
			    		//기타 필요한 데이터가 있으면 추가 전달
		    		}
		    	}).done(function(data) {
		    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		    		if ( everythings_fine ) {
		    			var msg = '결제가 완료되었습니다.';
		    			msg += '\n고유ID : ' + rsp.imp_uid;
		    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		    			msg += '\결제 금액 : ' + rsp.paid_amount;
		    			msg += '카드 승인번호 : ' + rsp.apply_num;
		
		    			alert(msg);
		    		} else {
		    			//[3] 아직 제대로 결제가 되지 않았습니다.
		    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		    		}
		    	});
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		
		        alert(msg);
		    }
		});
		
		$(".btnConfirm3").click(function() {
			// 구매완료 테스트용
		});
		
	});
});

</script>

<!-- 다음 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function daumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementsByName('diZip')[0].value = data.zonecode; //5자리 새우편번호 사용
						document.getElementsByName('diAddr1')[0].value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementsByName('diAddr2')[0].focus();
					}
				}).open();
	}
</script>

<div class="container">
	<form id="orderForm" name="orderForm" method="post">
		<div>
			<h2>상품 리스트</h2>
		</div>
		<table class="table1">
			<thead>
				<tr class="tr-top">
					<th colspan="2">상품정보</th>
					<th>판매가</th>
					<th>수량</th>
					<th>배송비</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<!-- 동적할당 필요 -->
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/shopping/article?num=${item.itemId}">
							<img class="product-img"
								src="${pageContext.request.contextPath}/uploads/item/${item.saveFileName}"
								alt="사진">
						</a>
					</td>
					<td>
						${item.itemName}<br>
						[옵션 : ${itemOption.optionName}&nbsp;${itemOption.detailname}]
					</td>
					<td>
						<fmt:formatNumber type="number" value="${item.itemSalePrice}" maxFractionDigits="3"/>원
					</td>
					<td>${count}개</td>
					<td>
						기본배송<br>
						<fmt:formatNumber type="number" value="2500" maxFractionDigits="3"/>원
						</td>
					<td>
						<fmt:formatNumber type="number" value="${item.itemSalePrice * count}" maxFractionDigits="3"/>원
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr class="tr-bottom">
					<td colspan="6" align="right">
						상품금액합계: <span>68,000원</span>
					</td>
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
					<input type="text" name="orName" id="orName" value="${mdto.name}" class="boxTF orName" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>
				<td>
					<input type="text" name="orAddr" id="orAddr" value="${mdto.addr}" class="boxTF" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>핸드폰번호</td>
				<td>
					<input type="text" name="orTel1" id="orTel1" value="${mdto.tel1}" class="boxTF"> - 
					<input type="text" name="orTel2" id="orTel2" value="${mdto.tel2}" class="boxTF"> - 
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
		<div id="deliveryForm">
			<table class="table2">
				<tr class="tr-top">
					<td>배송지선택</td>
					<td>
						<input type="radio" id="basicDI" name="deliveryInfo" value="basic">
						<label for="basicDI">기본배송지(주문자정보와동일)</label>
						<input type="radio" id="newDI" name="deliveryInfo" value="new">
						<label for="newDI">신규배송지</label>
					</td>
				</tr>
				<tr>
					<td>받으실분</td>
					<td>
						<input type="text" name="diName" id="diName" class="boxTF">
					</td>
				</tr>
				<tr>
					<td rowspan="3">받으실곳</td>
					<td>
						<input type="text" name="diZip" id="diZip" class="boxTF" readonly="readonly">
						<button type="button" class="btn searchAddrBtn" onclick="daumPostcode()">우편번호검색</button>
					</td>
				</tr>
				<tr>
					<td class="td2">
						<input type="text" name="diAddr1" id="diAddr1" class="boxTF" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td class="td2">
						<input type="text" name="diAddr2" id="diAddr2" class="boxTF">
					</td>
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td>
						<input type="text" name="diTel1" id="diTel1" class="boxTF"> -  
						<input type="text" name="diTel2" id="diTel2" class="boxTF"> - 
						<input type="text" name="diTel3" id="diTel3" class="boxTF">
					</td>
				</tr>
				<tr class="tr-bottom">
					<td>남기실 말씀</td>
					<td>
						<input type="text" name="orderMemo" id="orderMemo" class="boxTF">
					</td>
				</tr>
			</table>
		</div>

		<div>
			<h2>결제금액</h2>
		</div>
		<table class="table2">
			<tr class="tr-top">
				<td>상품합계금액</td>
				<td>68000 원
					<input type="hidden" name="totalItemPrice" value="68000">
				</td>
			</tr>
			<tr>
				<td>배&nbsp;&nbsp;송&nbsp;&nbsp;비</td>
				<td>0 원
					<input type="hidden" name="deliveryPrice" value="0">
				</td>
			</tr>
			<tr>
				<td>즉시할인액</td>
				<td>0 원</td>
			</tr>
			<tr>
				<td>회원할인</td>
				<td>0 원</td>
			</tr>
			<tr>
				<td>쿠폰적용</td>
				<td>
					<input type="text" name="couponDiscount" class="boxTF tright" value="0" readonly="readonly"> 원
					<button type="button" class="btn">쿠폰적용및조회</button>
				</td>
			</tr>
			<tr>
				<td>포인트적용</td>
				<td>
					<input type="text" name="pointDiscount" id="pointDiscount" class="boxTF tright" value="0">
					 원 (보유포인트: ${mdto.point} 원)
				</td>
			</tr>
			<tr class="tr-bottom">
				<td>총 결제금액</td>
				<td><span id="totalAmount">68000</span> 원
					<input type="hidden" name="totalAmount">
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
					<input type="radio" id="radio3" name="payCondition" value="1" data-condition="1">
					<label for="radio3">무통장입금</label> 
					<input type="radio" id="radio4" name="payCondition" value="2" data-condition="2">
					<label for="radio4">신용카드</label>
				</td>
			</tr>
		</table>

		<div class="btn-container" align="center">
			<button type="button" class="btnConfirm">결제하기</button>
			<button type="button" class="btnConfirm2">결제하기2</button>
			<button type="button" class="btnConfirm3">완료</button>
		</div>

	</form>
</div>
