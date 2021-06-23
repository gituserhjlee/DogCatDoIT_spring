<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util.js"></script>

<style type="text/css">
.container {
	width: 1110px;
	margin: 0 auto;
}
.gray {
	background: #eee;
}
.display-none {
	display: none;
}
.product-img {
	width: 60px;
	height: 60px;
	object-fit: cover;
}
</style>

<div class="container">
	<h2> 주문 상세정보 </h2>
	     	 
	      	 	<table class="table table-bordered">
	      	 		<tr>
	      	 			<td class="gray">주문일자</td>
	      	 			<td><span class="order_date"></span></td>
	      	 			<td class="gray">주문번호</td>
	      	 			<td><span class="orderIdx"></span></td>
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
						    <th class="gray text-center" scope="col">상품주문번호</th>
						    <th class="gray text-center" scope="col" colspan="2" >상품정보</th>
						    <th class="gray text-center" scope="col">상품금액(수량)</th>
						    <th class="gray text-center" scope="col">배송비</th>
						    <th class="gray text-center" scope="col">진행상태</th>
						    <th class="gray text-center" scope="col" colspan="2">상품금액</th>
					    </tr>
					</thead>
					<tbody class="listOrderDetailResult">
						<tr>
							<td>
								<span class='sodIdx'>1</span>
							</td>
							<td>
								<img class="product-img"
									src="${pageContext.request.contextPath}/uploads/item/${item.saveFilename}"
									alt="사진">
							</td>
							<td>
								<span class='itemName'>샘플상품명</span><br>
								[옵션 : <span class='optionName'>샘플옵션1</span>&nbsp;<span class='detailName'>샘플옵션2</span>]
							</td>
							<td>
								<span class=""></span>
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
	      	 			<td colspan="3">
	      	 			<span class="m-diAddr1"></span>
	      	 			<span class="m-diAddr2"></span>
	      	 			[<span class="m-diZip"></span>]
	      	 		</tr>
      	 		</table>
				
</div>


<!-- 

<tr>
	      	 			<td class="gray">주문상태</td>
	      	 			<td colspan="3">
	      	 				<div class="row stateChangeContainer">
	      	 					<div class="col-5">
			      	 				<select class="form-control" name="m-state">
			      	 					<option value="1" disabled="disabled">주문완료 (고객)</option>
			      	 					<option value="2">주문취소</option>
			      	 					<option value="3" disabled="disabled">결제완료 (고객)</option>
			      	 					<option value="4">배송준비</option>
			      	 					<option value="5">배송출발</option>
			      	 					<option value="6">구매확정</option>
			      	 					<option value="7" disabled="disabled">환불신청 (고객)</option>
			      	 					<option value="8">환불완료</option>
			      	 					<option value="9" disabled="disabled">교환신청 (고객)</option>
			      	 					<option value="10">교환완료</option>
			      	 				</select>
	      	 					</div>
	      	 					<div class="col">
			      	 				<button type="button" class="btn stateBtn" data-orderIdx="">주문상태 수정완료</button>
	      	 					</div>
	      	 				</div>
	      	 				<div class="stateOrderComplete display-none">
	      	 					<h1><span class="badge badge-lg bg-success">구매확정</span></h1>
	      	 				</div>
	      	 			</td>
	      	 		</tr>


 -->