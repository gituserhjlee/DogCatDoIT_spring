<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<div style="padding:20px;">
		<div style="text-align: center; font-family: Jua; font-size: x-large; padding: 20px;">
				<span>상품 발주 현황 </span>
			</div>
			<table class="table" style="text-align: center;">
				<thead class="thead-dark" style="text-align: center;">
					<tr>
						<th scope="col" style="vertical-align: middle">상품명</th>
						<th scope="col" style="vertical-align: middle">옵션명</th>
						<th scope="col" style="vertical-align: middle">상세옵션명</th>
						<th scope="col" style="vertical-align: middle">주문수량</th>
						<th scope="col" style="vertical-align: middle">주문일시</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="o" items="${list}">
						<tr>
							<!-- <th scope="row">
							
							</th> -->
							<td>${o.itemName}</td>
							<td>${o.optionName}</td>
							<td>${o.detailName}</td>
							<td>${o.count}</td>
							<td>${o.registered}</td>
								


						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$(function() {
		$('#stockManage').addClass('active');
		$('#ItemInsert').removeClass('active');
		$('#dashboard').removeClass('active');
		$('#orderManage').removeClass('active');
		$('#balju').removeClass('active');
		$('#couponManage').removeClass('active');
		$('#ItemManage').removeClass('active');
		$('#levelManage').removeClass('active');
	});
	
	
</script>