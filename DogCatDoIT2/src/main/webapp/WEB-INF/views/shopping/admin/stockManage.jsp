<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<div style="padding:20px;">
		<div style="text-align: center; font-family: Jua; font-size: x-large; padding: 20px;">
				<span>발주 가능 목록 </span>
				<button class="btn btn-outline-danger" style="float:right;  border-radius:10px; font-family:Ubuntu, sans-serif;" onclick="location.href='${pageContext.request.contextPath}/shopping/admin/BaljuOrder'">발주 현황보기</button>
			</div>
			<table class="table" style="text-align: center;">
				<thead class="thead-dark" style="text-align: center;">
					<tr>
						<th scope="col" style="vertical-align: middle">주문수량</th>
						<th scope="col" style="vertical-align: middle">업체명</th>
						<th scope="col" style="vertical-align: middle">상품명</th>
						<th scope="col" style="vertical-align: middle">옵션명</th>
						<th scope="col" style="vertical-align: middle">상세옵션명</th>
						<th scope="col" style="vertical-align: middle">재고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="o" items="${options}">
						<tr>
							<th scope="row">
							<form method="post" action="${pageContext.request.contextPath}/shopping/admin/insertBalju" onsubmit="return baljucheck(${o.detailId});">
								<button class="btn btn-secondary" style="border-radius: 10px;">발주</button>
								<input type="number" name="count" id="count${o.detailId}" style="width: 100px;">
								<input type="hidden" name="id" value="${o.detailId}">
							</form>
							</th>
							<td>${o.shopStoreName}</td>
							<td>${o.itemName}</td>
							<td>${o.optionName}</td>
							<td>${o.detailname}</td>
							<td>${o.stock}개</td>
								


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
<script>
function baljucheck(detailId){
	var p="#count"+detailId
	 if (!$(p).val()){
		 $(p).focus();
		return false;
	} 
	if ($(p).val()<1){
		 $(p).focus();
		return false;
	} 
	if(confirm("정말 발주하시겠습니까 ? ") == true){
        alert("발주되었습니다");
        return true;
    }
    else{
        return false ;
    }
}
</script>