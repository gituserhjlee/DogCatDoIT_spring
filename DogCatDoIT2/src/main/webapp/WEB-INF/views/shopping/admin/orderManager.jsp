<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/util.js"></script>

<style type="text/css">
.table-striped th, .modal-header, .stateBtn {
	background: #F79F81;
}

.modal-backdrop {
	opacity: 0.3;
}

.modal-dialog {
	max-width: 1000px;
}

.table {
	margin-bottom: 30px;
}

.gray {
	background: #eee;
}

.display-none {
	display: none;
}

.listOrderPaging {
	padding-bottom: 30px;
}

.orderName:hover, .orderName:active {
	text-decoration: underline;
	font-weight: 800;
	cursor: pointer;
}

.stateName1, .stateName3, .stateName4, .stateName5 {
	color: #007fc8;
}

.stateName2, .stateName6, .stateName8, .stateName10 {
	color: #1faa00;
}

.stateName7, .stateName9 {
	color: #ff6f00;
}

.condition-wrapper {
	margin-bottom: 15px;
}

.form-control {
	display: inline-block;
	width: 35%;
}

.form-control[name=condition] {
	width: 25%;
}

.form-control[name=keyword] {
	width: 45%;
}

.form-control[name=orderBy], .form-control[name=state] {
	width: 30%;
}

.searchForm .table td, .table th {
	border: none;
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
		setDays('date', 7);
		listPage(1);
	});

	function listPage(page) {
		let state = $(".slt[name=state]").val();
		let orderBy = $(".slt[name=orderBy]").val();
		let url = "${pageContext.request.contextPath}/ordermanager/list";
		let query = "pageNo=" + page + "&state=" + state + "&orderBy="
				+ orderBy;
		let params = $("form[name=searchForm]").serialize();
		query += "&" + params;
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

		$(".orderCount").text(orderCount);
		$(".page").text(page);
		$(".totalPage").text(totalPage);

		if (orderCount == 0) {
			$(".listOrderResult").empty();
			$(".listOrderPaging").html("????????? ?????? ????????? ????????????.");
			return false;
		}

		let out = "";
		for (let idx = 0; idx < data.listOrder.length; idx++) {
			let orderIdx = data.listOrder[idx].orderIdx;
			let order_date = data.listOrder[idx].order_date;
			let orderName = data.listOrder[idx].orderName;
			let orName = data.listOrder[idx].orName;
			let diName = data.listOrder[idx].diName;
			let totalItemPrice = data.listOrder[idx].totalItemPrice;
			let deliveryPrice = data.listOrder[idx].deliveryPrice;
			let strTotalItemPrice = toLocaleString(totalItemPrice);
			let strDeliveryPrice = toLocaleString(deliveryPrice);
			let state = data.listOrder[idx].state;
			let stateName = data.listOrder[idx].stateName;

			out += "<tr>";
			out += "<td class='text-center'>" + orderIdx + "</td>";
			out += "<td class='text-center'>" + order_date + "</td>";
			out += "<td><span class='orderName' data-orderIdx='" + orderIdx + "'>"
					+ orderName + "<span></td>";
			out += "<td class='text-center'>" + orName + " / " + diName
					+ "</td>";
			out += "<td class='text-center'>" + strTotalItemPrice + " / "
					+ strDeliveryPrice + "</td>";
			out += "<td class='stateName" + state + " text-center'>"
					+ stateName + "</td>";
			out += "</tr>";

		}

		$(".listOrderResult").html(out);
		$(".listOrderPaging").html(paging);
	}

	// ???????????? ?????????
	function setDays(mode, term) {

		let beforeDay = new Date();
		if (mode == "date") {
			beforeDay.setDate(beforeDay.getDate() - term);
		} else if (mode == "month") {
			beforeDay.setMonth(beforeDay.getMonth() - term);
		}
		beforeDay.setDate(beforeDay.getDate() + 1);

		$("#eDate").val(getFormatDate(new Date()));
		$("#sDate").val(getFormatDate(beforeDay));
	}

	// ?????? ?????? 'yyyy-MM-dd'??? ??????
	function getFormatDate(date) {
		let year = date.getFullYear();
		let month = ("0" + (date.getMonth() + 1)).slice(-2);
		let day = ("0" + date.getDate()).slice(-2);
		return year + "-" + month + "-" + day;
	}

	// ???????????? ?????? ??????
	$(function() {
		$("body").on('click', ".orderName", function() {
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
		names = [ "orderName", "orderIdx", "orName", "orTel", "totalItemPrice",
				"deliveryPrice", "totalPayment", "totalDiscount", "orderMemo",
				"diName", "diTel", "diAddr1", "diAddr2", "diZip" ];
		for (let i = 0; i < names.length; i++) {
			printData(data, names[i]);
		}

		let out = "";
		for (let idx = 0; idx < data.order.itemList.length; idx++) {
			let itemName = data.order.itemList[idx].itemName;
			let optionName = data.order.itemList[idx].optionName;
			let detailName = data.order.itemList[idx].detailName;
			let count = data.order.itemList[idx].count;
			let totalPrice = data.order.itemList[idx].totalPrice;
			let itemId = data.order.itemList[idx].itemId;
			let optionId = data.order.itemList[idx].optionId;
			let detailId = data.order.itemList[idx].detailId;

			out += "<tr>";
			out += "<td class='text-center'>" + itemId + "</td>";
			out += "<td>" + itemName + "</td>";
			out += "<td class='text-center'>" + optionId + " / " + detailId
					+ "</td>";
			out += "<td class='text-center'>" + optionName + " / " + detailName
					+ "</td>";
			out += "<td class='text-center'>" + count + "</td>";
			out += "<td class='text-center'>" + toLocaleString(totalPrice)
					+ "</td>";
			out += "</tr>";
		}

		$(".listOrderDetailResult").html(out);

		let orderIdx = data.order.orderIdx;
		$(".stateBtn").attr("data-orderIdx", orderIdx);

		let state = data.order.state;
		setState(state);
	}

	function printData(data, name) {
		let selector = ".m-" + name;
		let value = data.order[name];
		if (name.indexOf("total") >= 0 || name.indexOf("Price") >= 0) {
			value = toLocaleString(value);
		}
		$(selector).text(value);
	}

	function setState(state) {
		if (state == 6) {
			$(".stateChangeContainer").addClass("display-none");
			$(".stateOrderComplete").removeClass("display-none");
			return;
		}

		$(".stateChangeContainer").removeClass("display-none");
		$(".stateOrderComplete").addClass("display-none");

		$("select[name=m-state] option").filter(function() {
			return $(this).val() == state;
		}).prop("selected", true);
	}

	$("body")
			.on(
					"click",
					".stateBtn",
					function() {
						let url = "${pageContext.request.contextPath}/ordermanager/updateState";
						let orderIdx = $(this).attr("data-orderIdx");
						let state = $("select[name=m-state] option").filter(
								function() {
									return $(this).prop("selected");
								}).val();
						let query = "orderIdx=" + orderIdx + "&state=" + state;
						let fn = function(data) {
							if (data.flag == "true") {
								setState(state);
								alert("??????????????? ??????????????????.");
							} else {
								alert("???????????? ????????? ??????????????????.");
							}
						};

						ajaxFun(url, "post", query, "json", fn);
					});

	// ????????????, ???????????? select ?????????
	$("body").on("change", ".slt", function() {
		listPage(1);
	});
	
	function closeModal() {
		let page = $("page").text();
		listPage(page);
	}
</script>

<div class="content-wrapper">
	<div class="baljuMain" style="font-family: Jua; font-size: 90%">

		<div style="text-align: center; font-size: x-large; padding: 20px;">
			<span> ???????????? </span>
		</div>
		<form id="searchForm" class="searchForm" name="searchForm">
			<div class="container" style="width: 100%; margin-bottom: 50px;">
				<table class="table"
					style="width: 70%; margin: 0 auto; border: 1px solid black;">

					<tr>
						<td scope="row" class="align-middle" style="width: 20%; font-size: 130%">????????????</td>
						<td>
							<div class="btn-group" role="group"
								style="position: relative; bottom: 0;">
								<button type="button" class="btn btn-secondary btn-light"
									onclick="setDays('date',1);">??????</button>
								<button type="button" class="btn btn-secondary btn-light"
									onclick="setDays('date',7);">1??????</button>
								<button type="button" class="btn btn-secondary btn-light"
									onclick="setDays('month',1);">1??????</button>
								<button type="button" class="btn btn-secondary btn-light"
									onclick="setDays('month',3);">3??????</button>
							</div>
							<div style="margin-top: 5px;">
								<input class="form-control" type="date" name="sDate" value="" id="sDate">
								~ <input class="form-control" type="date" name="eDate" value=""
									id="eDate">
							</div>
						</td>
					</tr>

					<tr>
						<td scope="row" style="width: 20%; font-size: 130%" valign="middle">????????????</td>
						<td>
							<div class="condition-wrapper">
								<select class="form-control" name="condition"
									style="margin-right: 15px;">
									<option value="orderIdx">????????????</option>
									<option value="orName">?????????</option>
									<option value="diName">?????????</option>
								</select> <input class="form-control" type="text" name="keyword">
							</div>
						</td>
					</tr>

					<tr>
						<td colspan="2" align="center">
							<button type="button" class="btn"
								style="width: 150px; height: 50px; font-size: 120%; background-color: #F79F81;"
								onclick="listPage(1)">??????</button>
						</td>
					</tr>
				</table>
			</div>
		</form>

		<hr>
		<div style="margin-bottom: 10px;" align="right">
			<div style="width: 40%; margin-bottom: 5px;">
				<select class="form-control slt" name="state" style="margin-right: 5px;">
					<option value="">????????????</option>
					<option value="0">??????</option>
					<option value="1">????????????</option>
					<option value="2">????????????</option>
					<option value="3">????????????</option>
					<option value="4">????????????</option>
					<option value="5">????????????</option>
					<option value="6">????????????</option>
					<option value="7">????????????</option>
					<option value="8">????????????</option>
					<option value="9">????????????</option>
					<option value="10">????????????</option>
				</select> <select class="form-control slt" name="orderBy" style="margin-right: 15px;">
					<option value="">????????????</option>
					<option value="ASC">????????????</option>
					<option value="DESC">????????????</option>
				</select>
			</div>
		</div>
		<div class="row" style="margin-bottom: 20px;">
			<div class="col-sm-6" style="padding-left: 35px;">
				?????? (??? <span class="orderCount"></span> ???)
			</div>
			<div class="col-sm-6" align="right" style="padding-right: 35px;">
				(<span class="page"></span> / <span class="totalPage"></span>)
			</div>
		</div>

		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col" class="text-center" style="width: 8%;">????????????</th>
					<th scope="col" class="text-center" style="width: 19%;">????????????</th>
					<th scope="col" class="text-center" style="width: 34%;">????????????</th>
					<th scope="col" class="text-center" style="width: 13%;">????????? / ?????????</th>
					<th scope="col" class="text-center" style="width: 15%;">???????????? / ?????????</th>
					<th scope="col" class="text-center" style="width: 11%;">????????????</th>
				</tr>
			</thead>
			<tbody class="listOrderResult">
			</tbody>
		</table>

		<div class="listOrderPaging" align="center"></div>

	</div>
</div>


<!-- modal -->
<div class="modal" tabindex="-1" id="detailModal" data-backdrop="static"
	data-keyboard="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">?????? ????????????</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="closeModal();">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<h4>??????</h4>
				<table class="table table-bordered">
					<tr>
						<td class="gray">?????????</td>
						<td colspan="3"><span class="m-orderName"></span></td>
					</tr>
					<tr>
						<td class="gray">????????????</td>
						<td colspan="3"><span class="m-orderIdx"></span></td>
					</tr>
					<tr>
						<td class="gray">????????????</td>
						<td colspan="3">
							<div class="row stateChangeContainer">
								<div class="col-5">
									<select class="form-control" name="m-state" style="width: 95%">
										<option value="1" disabled="disabled">???????????? (??????)</option>
										<option value="2">????????????</option>
										<option value="3" disabled="disabled">???????????? (??????)</option>
										<option value="4">????????????</option>
										<option value="5">????????????</option>
										<option value="6">????????????</option>
										<option value="7" disabled="disabled">???????????? (??????)</option>
										<option value="8">????????????</option>
										<option value="9" disabled="disabled">???????????? (??????)</option>
										<option value="10">????????????</option>
									</select>
								</div>
								<div class="col">
									<button type="button" class="btn stateBtn" data-orderIdx="">????????????
										????????????</button>
								</div>
							</div>
							<div class="stateOrderComplete display-none">
								<h1>
									<span class="badge badge-lg bg-success">????????????</span>
								</h1>
							</div>
						</td>
					</tr>
					<tr>
						<td class="gray" width="20%">????????????</td>
						<td width="30%"><span class="m-orName"></span></td>
						<td class="gray" width="20%">?????????</td>
						<td width="30%"><span class="m-orTel"></span></td>
					</tr>
					<tr>
						<td class="gray">????????????</td>
						<td><span class="m-totalItemPrice"></span> ???</td>
						<td class="gray">?????????</td>
						<td><span class="m-deliveryPrice"></span> ???</td>
					</tr>
					<tr>
						<td class="gray">????????????</td>
						<td><span class="m-totalPayment"></span> ???</td>
						<td class="gray">????????????</td>
						<td><span class="m-totalDiscount"></span> ???</td>
					</tr>
					<tr>
						<td class="gray">????????????</td>
						<td colspan="3"><span class="m-orderMemo"></span></td>

					</tr>
				</table>

				<h4>????????????</h4>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th class="gray text-center" scope="col" style="width: 12%;">????????????</th>
							<th class="gray text-center" scope="col" style="width: 26%;">?????????</th>
							<th class="gray text-center" scope="col" style="width: 14%;">????????????</th>
							<th class="gray text-center" scope="col" style="width: 24%;">?????????</th>
							<th class="gray text-center" scope="col" style="width: 12%;">????????????</th>
							<th class="gray text-center" scope="col" style="width: 12%;">????????????</th>
						</tr>
					</thead>
					<tbody class="listOrderDetailResult">
					</tbody>
				</table>

				<h4>??????</h4>
				<table class="table table-bordered">
					<tr>
						<td class="gray" width="20%">????????????</td>
						<td width="30%"><span class="m-diName"></span></td>
						<td class="gray" width="20%">?????????</td>
						<td width="30%"><span class="m-diTel"></span></td>
					</tr>
					<tr>
						<td class="gray">?????????</td>
						<td colspan="3"><span class="m-diAddr1"></span> <span
							class="m-diAddr2"></span> [<span class="m-diZip"></span>]
					</tr>
				</table>

			</div>
		</div>
	</div>
</div>

