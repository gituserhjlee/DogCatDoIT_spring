<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jquery/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style2.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap4/css/bootstrap-icons.css"
	type="text/css">

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

.table1 tr {
	vertical-align: middle;
	border-bottom: 1px solid #ccc;
}

.tr-top {
	border-top: 2px solid #ccc;
}

.tr-bottom {
	border-bottom: 2px solid #ccc;
}

/* 상품 리스트 */
.table1 th:nth-child(1) {
	width: 60px;
}

.table1 th:nth-child(2) {
	width: 150px;
}

.table1 th:nth-child(3) {
	width: 410px;
}

.table1 th:nth-child(4) {
	width: 100px;
}

.table1 th:nth-child(5) {
	width: 120px;
}

.table1 th:nth-child(6) {
	width: 120px;
}

.table1 th:nth-child(7) {
	width: 120px;
}

.table1 td:nth-child(3) {
	padding-left: 20px;
	text-align: left;
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

.table1 thead tr {
	background: #eee;
}

/* 제출 버튼 */
.btn-container {
	align-content: center;
}

.tright {
	text-align: right;
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

.modal-dialog {
	max-width: 800px;
}

.listOrderPaging {
	margin-bottom: 30px;
}

.gray {
	background: #eee;
	font-weight: 600;
}

.display-none {
	display: none;
}

.product-img {
	width: 60px;
	height: 60px;
	object-fit: cover;
}

.listOrderDetailResult td {
	height: 85px;
	vertical-align: middle;
}

.listOrderDetailResult td:nth-child(1) {
	border-right-width: 0;
	padding-left: 32px;
}

.listOrderDetailResult td:nth-child(2) {
	border-left-width: 0;
}

.cell-center {
	text-align: center;
}

.btn-control {
	width: 120px;
	height: 40px;
	margin: 0 10px;
}
</style>

<script type="text/javascript">
	function login() {
		location.href = "${pageContext.request.contextPath}/member/login";
	}

	function ajaxFun(url, method, query, dataType, fn) {
		$.ajax({
			type : method,
			url : url,
			data : query,
			dataType : dataType,
			success : function(data) {
				fn(data);
			},
			beforeSend : function(jqXHR) {
				jqXHR.setRequestHeader("AJAX", true);
			},
			error : function(jqXHR) {
				if (jqXHR.status === 403) {
					login();
					return false;
				}

				console.log(jqXHR.responseText);
			}
		});
	}

	$(function() {
		listPage(1);
	});

	function listPage(page) {
		let url = "${pageContext.request.contextPath}/ordermanager/orderList";
		let query = "pageNo=" + page;
		let fn = function(data) {
			printList(data);
		};

		ajaxFun(url, "get", query, "json", fn);
	}

	function printList(data) {
		let orderCount = data.orderCount;
		let totalPage = data.total_page;
		let page = data.pageNo;
		let paging = data.paging;
		let offset = data.offset;

		$(".orderCount").text(orderCount);
		$(".page").text(page);
		$(".totalPage").text(totalPage);

		if (orderCount == 0) {
			$(".listOrderResult").empty();
			$(".listOrderPaging").html("조회된 구매 내역이 없습니다.");
			return false;
		}

		let out = "";
		let listNum = parseInt(offset) + parseInt(0);
		const stateArr = [ 4, 5 ];
		for (let idx = 0; idx < data.listOrder.length; idx++) {
			let orderIdx = data.listOrder[idx].orderIdx;
			let order_date = data.listOrder[idx].order_date;
			let orderName = data.listOrder[idx].orderName;
			let state = data.listOrder[idx].state;
			let stateName = data.listOrder[idx].stateName;
			out += "<tr>";
			out += "<td>" + (++listNum) + "</td>";
			out += "<td>" + order_date + "</td>";
			out += "<td>" + orderName + "</td>";
			out += "<td>" + orderIdx + "</td>";
			out += "<td style='color: #007FC8;'>" + stateName + "</td>";
			out += "<td><button type='button' class='btn confirmBtn ";
			if (stateArr.indexOf(state) < 0)
				out += "display-none";
			out += "' data-orderIdx='" + orderIdx + "'>구매확정</button></td>";
			out += "<td><button type='button' class='btn detailBtn' data-orderIdx='"+ orderIdx +"'>상세</button></td>";
			out += "</tr>";

		}

		$(".listOrderResult").html(out);
		$(".listOrderPaging").html(paging);
	}
	// 구매확정 버튼 이벤트
	$("body")
			.on(
					"click",
					".confirmBtn",
					function() {
						let orderIdx = $(this).attr("data-orderIdx");
						let pageNo = $(".page").text();
						let state = 6;
						let url = "${pageContext.request.contextPath}/ordermanager/updateState";
						let query = "orderIdx=" + orderIdx + "&state=" + state;
						let fn = function(data) {
							if (data.flag == "true") {
								listPage(pageNo);
							}
						}

						ajaxFun(url, "post", query, "json", fn);
					});

	// 주문상세 관련
	$(function() {
		$("body").on('click', ".detailBtn", function() {
			let orderIdx = $(this).attr("data-orderIdx");
			loadModal(orderIdx);
			$('#detailModal').modal('show');
		});
	});

	function loadModal(orderIdx) {
		let url = "${pageContext.request.contextPath}/ordermanager/orderInfo";
		let query = "orderIdx=" + orderIdx;
		let fn = function(data) {
			printOrderInfo(data);
		};

		ajaxFun(url, "get", query, "json", fn);
	}

	function printOrderInfo(data) {
		names = [ "orderName", "orderIdx", "order_date", "orName", "orTel",
				"totalItemPrice", "deliveryPrice", "totalPayment",
				"totalDiscount", "orderMemo", "diName", "diTel", "diAddr1",
				"diAddr2", "diZip" ];
		for (let i = 0; i < names.length; i++) {
			printData(data, names[i]);
		}

		let out = "";
		let deliveryPrice = data.order.deliveryPrice;
		let delivery_rowspan = data.order.itemList.length;
		for (let idx = 0; idx < data.order.itemList.length; idx++) {
			let saveFilename = data.order.itemList[idx].saveFilename;
			let itemName = data.order.itemList[idx].itemName;
			let optionName = data.order.itemList[idx].optionName;
			let detailName = data.order.itemList[idx].detailName;
			let itemSalePrice = data.order.itemList[idx].itemSalePrice;
			let count = data.order.itemList[idx].count;
			let totalPrice = data.order.itemList[idx].totalPrice;
			out += "<tr>";
			out += "<td style='width: 15%;'>";
			out += "<img class='product-img' src='${pageContext.request.contextPath}/uploads/item/" + saveFilename + "' alt='사진'>";
			out += "</td>";
			out += "<td>" + itemName + "<br>[ 옵션 : " + optionName + " "
					+ detailName + " ]</td>";
			if (idx == 0)
				out += "<td style='width: 14%;' class='cell-center' rowspan='"
						+ delivery_rowspan + "'>기본배송<br>"
						+ toLocaleString(deliveryPrice) + " 원</td>";
			out += "<td style='width: 14%;' class='cell-center'>"
					+ toLocaleString(itemSalePrice) + " 원</td>";
			out += "<td style='width: 14%;' class='cell-center'>" + count
					+ "</td>";
			out += "<td style='width: 14%;' class='cell-center'>"
					+ toLocaleString(totalPrice) + " 원</td>";
			out += "</tr>";
		}

		$(".listOrderDetailResult").html(out);
		let state = data.order.state;
		setControlBtns(state);
		let orderIdx = data.order.orderIdx;
		$("#detailModal").attr("data-orderIdx", orderIdx);
	}

	function printData(data, name) {
		let selector = ".m-" + name;
		let value = data.order[name];
		if (name.indexOf("total") >= 0 || name.indexOf("Price") >= 0) {
			value = toLocaleString(value);
		}
		$(selector).text(value);
	}

	function setControlBtns(state) {
		const conditionOfOc = [ 1, 3, 4 ];
		const conditionOfEaRa = [ 4, 5, 8, 10 ];
		if (conditionOfOc.indexOf(state) >= 0) {
			$(".orderCancelBtn").removeClass("display-none");
			$(".exchangeApplyBtn, .refundApplyBtn").addClass("display-none");
			return;
		}

		if (conditionOfEaRa.indexOf(state) >= 0) {
			$(".orderCancelBtn").addClass("display-none");
			$(".exchangeApplyBtn, .refundApplyBtn").removeClass("display-none");
			return;
		}

		$(".orderCancelBtn, .exchangeApplyBtn, .refundApplyBtn").addClass(
				"display-none");
	}

	// 버튼 이벤트들
	function changeState(obj) {
		let orderIdx = $("#detailModal").attr("data-orderIdx");
		let pageNo = $(".page").text();
		let state = obj.getAttribute("data-state");
		let url = "${pageContext.request.contextPath}/ordermanager/updateState";
		let query = "orderIdx=" + orderIdx + "&state=" + state;
		let fn = function(data) {
			if (data.flag == "false") {
				alert(data.stateName + "완료");
				return;
			}

			alert(data.stateName + "완료");
			$("#detailModal").modal("hide");
			listPage(pageNo);
		}

		ajaxFun(url, "post", query, "json", fn);

	}
</script>

<div class="container">
	<h2>구매내역조회</h2>

	<div class="row" style="margin: 20px auto; font-size: 110%; font-weight: 600;">
		<div class="col-sm-6">
			목록 (총 <span class="orderCount"></span> 개)
		</div>
		<div class="col-sm-6" align="right">
			페이지 (<span class="page"></span> / <span class="totalPage"></span>)
		</div>
	</div>

	<table class="table1">
		<thead>
			<tr class="tr-top">
				<th>번호</th>
				<th>주문일시</th>
				<th>주문명</th>
				<th>주문번호</th>
				<th>주문상태</th>
				<th>구매확정</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody class="listOrderResult">
		</tbody>
		<tfoot>
			<tr class="tr-bot">
				<td colspan="8"></td>
			</tr>
		</tfoot>
	</table>

	<div class="listOrderPaging" align="center"></div>

</div>

<!-- modal -->
<div class="modal" tabindex="-1" id="detailModal" data-orderIdx="">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<h2 class="modal-title">주문 상세정보</h2>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<h4>주문정보</h4>
				<table class="table table-bordered">
					<tr>
						<td class="gray">주문명</td>
						<td colspan="3"><span class="m-orderName"></span></td>
					</tr>
					<tr>
						<td class="gray">주문번호</td>
						<td><span class="m-orderIdx"></span></td>
						<td class="gray">주문날짜</td>
						<td><span class="m-order_date"></span></td>
					</tr>
					<tr>
						<td class="gray" width="20%">구매자명</td>
						<td width="30%"><span class="m-orName"></span></td>
						<td class="gray" width="20%">연락처</td>
						<td width="30%"><span class="m-orTel"></span></td>
					</tr>
					<tr>
						<td class="gray">주문금액</td>
						<td><span class="m-totalItemPrice"></span> 원</td>
						<td class="gray">배송비</td>
						<td><span class="m-deliveryPrice"></span> 원</td>
					</tr>
					<tr>
						<td class="gray">결제금액</td>
						<td><span class="m-totalPayment"></span> 원</td>
						<td class="gray">할인금액</td>
						<td><span class="m-totalDiscount"></span> 원</td>
					</tr>
					<tr>
						<td class="gray">주문메모</td>
						<td colspan="3"><span class="m-orderMemo"></span></td>
					</tr>
				</table>

				<h4>주문상품정보</h4>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th class="gray text-center" scope="col" colspan="2">상품정보</th>
							<th class="gray text-center" scope="col">배송</th>
							<th class="gray text-center" scope="col">상품금액</th>
							<th class="gray text-center" scope="col">수량</th>
							<th class="gray text-center" scope="col">합계</th>
						</tr>
					</thead>
					<tbody class="listOrderDetailResult">
					</tbody>
				</table>

				<h4>배송지정보</h4>
				<table class="table table-bordered">
					<tr>
						<td class="gray" width="20%">수취인명</td>
						<td width="30%"><span class="m-diName"></span></td>
						<td class="gray" width="20%">연락처</td>
						<td width="30%"><span class="m-diTel"></span></td>
					</tr>
					<tr>
						<td class="gray">배송지</td>
						<td colspan="3"><span class="m-diAddr1"></span> <span
							class="m-diAddr2"></span> [<span class="m-diZip"></span>]
					</tr>
				</table>

				<div align="center">
					<button type="button" class="btn orderCancelBtn btn-control gray"
						data-state="2" onclick="changeState(this)">주문취소</button>
					<button type="button" class="btn exchangeApplyBtn btn-control gray"
						data-state="9" onclick="changeState(this)">교환신청</button>
					<button type="button" class="btn refundApplyBtn btn-control gray"
						data-state="7" onclick="changeState(this)">환불신청</button>
				</div>

			</div>
		</div>
	</div>
</div>
