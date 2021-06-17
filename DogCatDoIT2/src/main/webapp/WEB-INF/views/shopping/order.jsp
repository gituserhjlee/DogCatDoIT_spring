<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style2.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.form.js"></script>
<!-- Modal -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery/css/smoothness/jquery-ui.min.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery-ui.min.js"></script>

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
	margin-bottom: 60px;
}
.btnConfirm {
	background: #F79F81;
}

.btn {
	height: 38px;
}
.tright {
	text-align: right;
}

#orderForm input[type=text],
#orderForm input[type=number] {
	width: 165px;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
   -webkit-appearance: none;
   margin: 0;
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
	width: 500px;
}

.product-img {
	width: 60px;
	height: 60px;
	object-fit: cover;
}
.resultSpan {
	color: #e15748;
    font-size: 24px;
    position: relative;
    top: 5px;
    margin-left: 5px;
}

.modal .btnApplyCoupon {
	background: #F79F81;
	width: 360px;
	height: 50px;
}
.modal-footer {
	align-items: center;
}
.modal-body .searchResultLayout {
	margin: 20px auto 20px;
	text-align: center;
}
.modal-body .display-none {
	display: none;
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
	// 포인트 사용 keyup 이벤트 제어
	$("#pointDiscount").keyup(function() {
		let usePoint = parseInt($(this).val());
		let totalPayment = parseInt($("input[name=totalPayment]").val());
		if (usePoint > totalPayment) {
			alert("적용할 포인트가 결제하실 금액보다 많습니다.");
			$(this).val(0);
			calcTotalResult();
		}
	});

	// 포인트 사용 change 이벤트 제어
	$("#pointDiscount").change(function() {
		if($(this).val() == "")
			$(this).val(0);
		let userPoint = ${mdto.point};
		if ($(this).val() > userPoint) {
			alert("포인트가 부족합니다.");
			$(this).val(0);
		}
		calcTotalResult();
	});
	
});

$(function() {
	calcItemTotal();
	calcTotalItemDiscount();
	calcTotalResult();
});

// 리스프의 상품 합계(할인 전)
function calcItemTotal() {
	let tp = 0;
	$(".itemTotalAmount").each(function() {
		let p = $(this).attr("data-itemTotalAmount");
		tp += parseInt(p);
	});
	
	$(".totalItemPrice").text(toLocaleString(tp));
	$("input[name=totalItemPrice]").val(tp);
}

// 주문 상품 할인금액 합(각 아이템의 고유 할인 합)
function calcTotalItemDiscount() {
	let tdp = 0;
	$(".itemTotalAmount").each(function() {
		let dp = $(this).attr("data-itemTotalDiscount");
		tdp += parseInt(dp);
	});
	
	$(".totalItemDiscount").text(toLocaleString(tdp));
	$("input[name=totalItemDiscount]").val(tdp);
}

// 총 할인금액, 총 결제금액 호출
function calcTotalResult() {
	calcTotalDiscount();
	calcTotalPayment();
}

// 최종 할인금액(즉시할인 + 회원할인 + 쿠폰할인 + 포인트할인)
function calcTotalDiscount() {
	let td = 0;
	let totalItemDiscount = $("input[name=totalItemDiscount]").val();
	let memberDiscount = $("input[name=memberDiscount]").val();
	let couponDiscount = $("input[name=couponDiscount]").val();
	let pointDiscount = $("input[name=pointDiscount]").val();
	td = parseInt(totalItemDiscount) + 
		parseInt(memberDiscount) + 
		parseInt(couponDiscount) + 
		parseInt(pointDiscount);
	
	$(".totalDiscount").text(toLocaleString(td));
	$("input[name=totalDiscount]").val(td);
}

// 총 결제 금액( (판매가격 합 + 배송비) - (할인 합) )
function calcTotalPayment() {
	let tp = 0;
	let totalItemPrice = $("input[name=totalItemPrice]").val();
	let deliveryPrice = $("input[name=deliveryPrice]").val();
	let totalDiscount = $("input[name=totalDiscount]").val();
	
	tp = parseInt(totalItemPrice) + parseInt(deliveryPrice) - totalDiscount;
	
	$(".totalPayment").text(toLocaleString(tp));
	$("input[name=totalPayment]").val(tp);
}

function ajaxFun(url, method, query, dataType, fn){
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
		},
		error:function(e) {
			console.log(e.responseText);
		}
	});
}

$(function() {
	// 쿠폰 모달창 오픈
	$('.couponBtn').on('click', function(){
		$('#couponModal').modal('show');
	});
	
	// 쿠폰 검색
	$("#searchCoupon").on("click", function() {
		let couponName = $(this).closest("form").find("input").val();
		
		if(!couponName.trim()) {
			return false;
		}
		
		let url = "${pageContext.request.contextPath}/order/readCoupon";
		let query = "couponName="+couponName;
		let fn = function(data) {
			
			console.log(data);
			
			if(data.state=="false") {
				$(".result-none").removeClass("display-none");
				$(".searchResult").addClass("display-none");
				$(".btnApplyCoupon").prop("disabled",true);
			} else {
				$(".result-none").addClass("display-none");
				$(".searchResult").removeClass("display-none");
				$(".btnApplyCoupon").prop("disabled",false);
				showResult(data);
				$(".btnApplyCoupon").attr("data-couponName", data.coupon.couponName);
				$(".btnApplyCoupon").attr("data-rate", data.coupon.rate);
			}
		};
		
		ajaxFun(url, "get", query, "JSON", fn);
	});
	
	// 쿠폰 적용
	$(".btnApplyCoupon").click(function() {
		$('#couponModal').modal('hide');
		let rate = $(this).attr("data-rate");
		calcCouponDiscount(rate);
		calcTotalResult();
		
		let info = "[ 적용된 쿠폰: "+$(this).attr("data-couponName")+" ]";
		$(".couponInfo").text(info);
		
		let couponName = $(this).attr("data-couponName");
		$("input[name=couponName]").val(couponName);
		
		modalReset();
	});
	
	function calcCouponDiscount(rate) {
		let totalItemPrice = $("input[name=totalItemPrice]").val();
		let couponDiscount = parseInt(totalItemPrice * rate / 100);
		$("input[name=couponDiscount]").val(couponDiscount);
	}
	
	function showResult(data) {
		$(".searchResultLayout .couponName").text(data.coupon.couponName);
		$(".searchResultLayout .rate").text(data.coupon.rate+" %");
		$(".searchResultLayout .deadline").text("~ "+data.coupon.deadline);
	}
	
	function modalReset() {
		$(".coupon-search-layout").find("input").val("");
		$(".result-none").addClass("display-none");
		$(".searchResultLayout .couponName").text("");
		$(".searchResultLayout .rate").text("");
		$(".searchResultLayout .deadline").text("");
		$(".btnApplyCoupon").prop("disabled",true);
	}
	
});

</script>
<!-- 아임포트 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

function makeName() {
	let orderName = "주문명: ${itemList[0].itemName} [${itemList[0].optionName}-${itemList[0].detailName}]";
	let count = $(".itemList .itemTotalAmount").length;
	if(count > 1) {
		orderName += " 외 "+(count-1)+"건";
	}
	return orderName;
}

function payOrder() {
	let f = document.orderForm; 
	let totalPayment = document.getElementsByName("totalPayment")[0].value;
	let name = makeName();
		
	IMP.request_pay({
	    pg : 'inicis',
	    pay_method : 'card',
	    merchant_uid : 'dogcatdoit_' + new Date().getTime(),
	    name : name,
//		    amount : totalPayment,
		// for test
	    amount : 100,
	    buyer_email : '${mdto.email}',
	    buyer_name : '${mdto.name}',
	    buyer_tel : '${mdto.tel}',
	    buyer_addr : '${mdto.addr}',
	    buyer_postcode : '${mdto.zip}'
	}, function(rsp) {
	    if ( rsp.success ) {
	    	
	    	document.getElementsByName("orderName")[0].value = name;
			f.action = "${pageContext.request.contextPath}/order/insert";
			f.submit();
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	
	        alert(msg);
	    }
	});
}

$(function() {
	IMP.init('imp79933058');
	
	$(".btnConfirm").click(function() {
		f = document.orderForm;
		if(!f.diName.value.trim()) {
			f.diName.focus();
			alert("받으실분을 입력해주세요.");
			return false;
		}
		
		if(!f.diZip.value.trim()) {
			f.diZip.focus();
			alert("받으실 우편번호를 입력해주세요.");
			return false;
		}
		
		if(!f.diAddr2.value.trim()) {
			f.diAddr2.focus();
			alert("받으실 상세주소를 입력해주세요.");
			return false;
		}
		
		if(!f.diTel1.value.trim() || !(/^[0-9]{3}$/).test(f.diTel1.value)) {
			f.diTel1.focus();
			alert("휴대폰 번호를 입력해주세요.");
			return false;
		}
		
		if(!f.diTel2.value.trim() || !(/^[0-9]{4}$/).test(f.diTel2.value)) {
			f.diTel2.focus();
			alert("휴대폰 번호를 입력해주세요.");
			return false;
		}
		
		if(!f.diTel3.value.trim() || !(/^[0-9]{4}$/).test(f.diTel3.value)) {
			f.diTel3.focus();
			alert("휴대폰 번호를 입력해주세요.");
			return false;
		}
		
		payOrder();
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
		<table class="table1 itemList">
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
				<c:forEach items="${itemList}" var="item" varStatus="st">
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/shopping/article?num=${item.itemId}">
							<img class="product-img"
								src="${pageContext.request.contextPath}/uploads/item/${item.saveFilename}"
								alt="사진">
						</a>
					</td>
					<td>
						${item.itemName}<br>
						[옵션 : ${item.optionName}&nbsp;${item.detailName}]
					</td>
					<td>
						<fmt:formatNumber type="number" value="${item.itemSalePrice}" maxFractionDigits="3"/>원
					</td>
					<td>${item.count}개</td>
					<td>
						기본배송
					</td>
					<td class="itemTotalAmount" data-itemTotalAmount="${item.itemSalePrice * item.count}" data-itemTotalDiscount="${item.discountPrice}">
						<fmt:formatNumber type="number" value="${item.itemSalePrice * item.count}" maxFractionDigits="3"/>원
						<c:if test="${from=='cart'}">
							<input type="hidden" name="itemList[${st.index}].cartIdx" value="${item.cartIdx}">
						</c:if>
						<input type="hidden" name="itemList[${st.index}].totalPrice" value="${item.itemSalePrice * item.count}">
						<input type="hidden" name="itemList[${st.index}].detailId" value="${item.detailId}">
						<input type="hidden" name="itemList[${st.index}].count" value="${item.count}">
					</td>
				</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr class="tr-bottom">
					<td colspan="6" align="right" style="text-align: right; padding-right: 15px;">
						상품금액합계: <span class="resultSpan"><span class="totalItemPrice" ></span>원</span>
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
					<input type="text" name="orTel1" id="orTel1" value="${mdto.tel1}" class="boxTF" readonly="readonly"> - 
					<input type="text" name="orTel2" id="orTel2" value="${mdto.tel2}" class="boxTF" readonly="readonly"> - 
					<input type="text" name="orTel3" id="orTel3" value="${mdto.tel3}" class="boxTF" readonly="readonly">
				</td>
			</tr>
			<tr class="tr-bottom">
				<td>이&nbsp;&nbsp;&nbsp;메&nbsp;&nbsp;&nbsp;일</td>
				<td>
					<input type="text" name="orEmail" id="orEmail" class="boxTF" value="${mdto.email}" readonly="readonly">
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
						<input type="text" name="diTel1" id="diTel1" class="boxTF" maxlength="3"> -  
						<input type="text" name="diTel2" id="diTel2" class="boxTF" maxlength="4"> - 
						<input type="text" name="diTel3" id="diTel3" class="boxTF" maxlength="4">
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
		<table class="table2 payAmountTable">
			<tr class="tr-top">
				<td>상품합계금액</td>
				<td>
					<span class="totalItemPrice"></span> 원
					<input type="hidden" name="totalItemPrice">
				</td>
			</tr>
			<tr>
				<td>배&nbsp;&nbsp;송&nbsp;&nbsp;비</td>
				<td><fmt:formatNumber type="number" value="2500" maxFractionDigits="3"/> 원
					<input type="hidden" name="deliveryPrice" value="2500">
				</td>
			</tr>
			<tr>
				<td>즉시할인액</td>
				<td >
					<span class="totalItemDiscount"></span> 원
					<input type="hidden" name="totalItemDiscount">
				</td>
			</tr>
			<tr>
				<td>회원할인</td>
				<td>
					<span class="memberDiscount">0</span> 원
					<input type="hidden" name="memberDiscount" value="0">
				</td>
			</tr>
			<tr>
				<td>쿠폰할인액</td>
				<td>
					<input type="text" name="couponDiscount" id="couponDiscount" class="boxTF tright" value="0" readonly="readonly"> 원
					<button type="button" class="btn couponBtn">쿠폰적용및조회</button>
					<span class="couponInfo"></span>
					<input type="hidden" name="couponName">
				</td>
			</tr>
			<tr>
				<td>포인트적용</td>
				<td>
					<input type="number" name="pointDiscount" id="pointDiscount" class="boxTF tright" value="0">
					 원 (보유포인트: <fmt:formatNumber type="number" value="${mdto.point}" maxFractionDigits="3"/> 원)
				</td>
			</tr>
			<tr>
				<td>총 할인금액</td>
				<td>
					<span class="totalDiscount"></span> 원
					<input type="hidden" name="totalDiscount">
				</td>
			</tr>
			<tr class="tr-bottom">
				<td>총 결제금액</td>
				<td><span class="totalPayment"></span> 원
					<input type="hidden" name="totalPayment">
				</td>
			</tr>
		</table>

		<div class="btn-container" align="center">
			<button type="button" class="btnConfirm">결제하기</button>
			<input type="hidden" name="from" value="${from}">
			<input type="hidden" name="orderName">
		</div>

	</form>
	
	<!-- Modal -->
	<div class="modal fade" id="couponModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  	<div class="modal-dialog">
	    	<div class="modal-content">
		      	<div class="modal-header">
		       	 	<h5 class="modal-title" id="exampleModalLabel">쿠폰할인</h5>
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		         		<span aria-hidden="true">&times;</span>
		        	</button>
		      	</div>
		      	
		     	<div class="modal-body">
		      		<form class="coupon-search-layout" method="post">
			      		<div class="form-row">
						    <div class="col-8">
						    	<input type="text" class="form-control" name="couponName" placeholder="사용하실 쿠폰의 이름을 입력하세요.">
						    </div>
						    <div class="col">
							     <button class="btn form-control" type="button" id="searchCoupon">조회</button>
						    </div>
					  	</div>
		      		</form>
		      		
			      	<div class="searchResultLayout">
			      		<table class="table table-striped">
			      			<thead>
			      				<tr>
			      					<th scope="col">쿠폰명</th>
			      					<th scope="col">할인율</th>
			      					<th scope="col">사용기한</th>
			      				</tr>
			      			</thead>
			      			<tbody>
			      				<tr class="searchResult display-none">
								    <td class="couponName">
								    </td>
								    <th scope="row" class="rate">
								    </th>
								    <td class="deadline">
								    </td>
							    </tr>
							    <tr class="result-none display-none">
							    	<td colspan="3" align="center">
							    		사용할 수 없는 쿠폰입니다.
							    	</td>
							    <tr>
			      			</tbody>
			      		</table>
			      	</div>
		      	</div>
		      	
		      	<div align="center">
			      	<p><strong>쿠폰은 1장만 사용 가능합니다.</strong></p>
		      	</div>
		      	
		      	<div class="modal-footer mx-auto">
		        	<button type="button" class="btn btnApplyCoupon" disabled="disabled" 
		        	data-couponName="" data-rate="">쿠폰 사용</button>
	      	  	</div>
	    	</div>
	  	</div>
	</div>
	
</div>
