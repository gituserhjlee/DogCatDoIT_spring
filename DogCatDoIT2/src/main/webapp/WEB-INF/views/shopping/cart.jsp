<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style2.css" type="text/css">
<style type="text/css">
* {
	box-sizing: border-box;
}
#cartForm {
	box-sizing: border-box;

}
.container {
	width: 1110px;
	margin: 0 auto;
}
#cartForm input, #cartForm label {
	display: inline-block;
}
#cartForm .boxTF {
	border:1px solid #999;
	padding:3px 5px 5px;
	border-radius:4px;
	background-color:#fff;
	font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
}
#cartForm .boxTF[readonly] {
	background-color:#eee;
}
#cartForm label {
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
	width: 50px;
}
.table1 th:nth-child(2) {
	width: 550px;
}
.table1 th:nth-child(3) {
	width: 130px;
}
.table1 th:nth-child(4) {
	width: 110px;
}
.table1 th:nth-child(5) {
	width: 110px;
}
.table1 th:nth-child(6) {
	width: 130px;
}

.table1 td:nth-child(1) {
	width: 50px;
}
.table1 td:nth-child(2) {
	width: 100px;
	padding: 20px 20px 20px 20px;
}
.table1 td:nth-child(3) {
	width: 450px;
	padding: 20px 10px 20px 10px;
	text-align: left;
	
}
.table1 td:nth-child(4) {
	width: 130px;
}
.table1 td:nth-child(5) {
	width: 110px;
}
.table1 td:nth-child(6) {
	width: 110px;
}
.table1 td:nth-child(7) {
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

#cartForm input[type=text] {
	width: 165px;
}

#cartForm input[name*=Addr] {
	width: 400px;
}
#cartForm input[name=orAddr] {
	width: 500px;
}

#cartForm input[name*=Tel] {
	width: 65px;
}

#cartForm input[name=orderMemo] {
	width: 800px;
}
#cartForm input[name=count] {
	width: 30px;
}
.product-img {
	width: 60px;
	height: 60px;
	object-fit: cover;
}
</style>

<script type="text/javascript">
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
	cartList();
	
	$(".orderBtn").click(function() {
		cartList();
		alert("미구현");
	})
	
	$(".chkBox").change(function() {
		let id = $(this).attr("data-detailId");
		console.log(id);
	});
	
	$(".deleteBtn").click(function() {
		let selector = ".chkBox:checked";
		if($(selector).length==0)
			return false;
		
		if(confirm("선택한 상품들을 장바구니에서 삭제하시겠습니까?"))
			deleteCart(selector);
	});
	
	$(".deleteAllBtn").click(function() {
		let selector = ".chkBox";
		if($(selector).length==0)
			return false;
		
		if(confirm("모든 상품들을 장바구니에서 삭제하시겠습니까?"))
			deleteCart(selector);
	});
	
});

function deleteCart(selector) {
	let arr = [];
	$(selector).each(function() {
		arr.push($(this).attr("data-detailId"));
	});
	
	let url="${pageContext.request.contextPath}/order/deleteCart";
	let query = "detailIds="+arr.join(",");
	let fn = function(data) {
		if(data.state == "true") {
			cartList();
		} else {
			alert("삭제에 실패했습니다.");
		}
	}
	ajaxFun(url, "post", query, "json", fn);
	
}

function calcTotal() {
	let tp = 0;
	$("input[name=totalPrice]").each(function() {
		tp += parseInt($(this).val());
	});
	
	$("#totalAmount").text(tp);
}

function cartList() {
	let url="${pageContext.request.contextPath}/order/cartList";
	let query = "";
	let fn = function(data) {
		printGuest(data);
		calcTotal();
	}
	ajaxFun(url, "post", query, "json", fn);
}

function printGuest(data) {
	let out = "";
	for(let idx=0; idx < data.itemList.length; idx++) {
		let detailId = data.itemList[idx].detailId;
		let itemId = data.itemList[idx].itemId;
		let saveFilename = data.itemList[idx].saveFilename;
		let itemName = data.itemList[idx].itemName;
		let optionName = data.itemList[idx].optionName;
		let detailName = data.itemList[idx].detailName;
		let itemSalePrice = data.itemList[idx].itemSalePrice;
		let count = data.itemList[idx].count;
		let itemSalePriceStr = toLocaleString(itemSalePrice); // 3자리 콤마 문자열
		let totalPriceStr = toLocaleString(itemSalePrice*count); // 3자리 콤마 문자열
		
		
		out += "<tr>"
		out += "<td><input type='checkbox' checked='checked' class='chkBox' data-detailId='"+detailId+"'></td>";
		out += "<td><a href='${pageContext.request.contextPath}/shopping/article?num="+itemId+"'>";
		out += "<img class='product-img' src='${pageContext.request.contextPath}/uploads/item/"+saveFilename+"' alt='사진'></a></td>";
		out += "<td>"+ itemName +"<br>[옵션: "+optionName+" "+detailName+" ]<br>";
		out += "<button type='button' class='btn'>옵션 수정</button></td>";
		out += "<td>"+itemSalePriceStr+"원</td>";
		out += "<td>"+count+"</td>";
		out += "<td>기본배송</td>";
		out += "<td>"+totalPriceStr+"원";
		out += "<input type='hidden' name='totalPrice' value='"+ (itemSalePrice*count) +"'></td>";
		out += "</tr>";

	}
	$("#cartForm .itemList").html(out);
}


</script>

<div class="container">
	<form id="cartForm" name="cartForm" method="post">
	<h2> 장바구니 </h2>
	<table class="table1">
			<thead>
				<tr class="tr-top">
					<th>선택</th>
					<th colspan="2">상품정보</th>
					<th>판매가</th>
					<th>수량</th>
					<th>배송비</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody class="itemList">
			</tbody>
			<tfoot>
				<tr class="tr-bottom">
					<td colspan="7" align="right">
						상품금액합계: <span id="totalAmount"></span>원
					</td>
				</tr>
			</tfoot>
		</table>
		<table>
			<tr>
				<td>
					<button type="button" class="btn deleteAllBtn">전체삭제</button>
					<button type="button" class="btn deleteBtn">선택상품삭제</button>
				</td>
				<td align="right">
					<button type="button" class="btn orderBtn">구매하기</button>
				</td>
			<tr>
		</table>
		
	</form>
</div>
