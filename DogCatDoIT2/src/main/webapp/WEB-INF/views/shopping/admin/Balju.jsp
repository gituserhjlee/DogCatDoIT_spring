<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<div class="baljuMain">
			<form name="BaljuForm" id="BaljuForm">
				<span
					style='font-weight: bold; display: inline-block; margin: 0 0 -1px; padding: 15px 25px; color: #555555;'>발주
					업체 관리 </span>

				<div class="form-group">
					<input type="text" class="form-control" placeholder="업체명을 입력하세요"
						name="shopStoreName"> 
						<input type="tel"
						class="form-control" placeholder="업체 연락처를 입력하세요"
						name="shopStoreTel">
				</div>

				<div class="form-group">
					<button type="button" class="btn btn-outline-danger"
						onclick="daumPostcode();" style="border-radius: 10px;">우편번호</button>
					<input class="form-control" type="text" name="zip"
						id="zip" readonly="readonly" placeholder="우편번호"> <input
						type="text" name="shopStoreAddress1" id="addr1" class="form-control"
						placeholder="기본주소를 입력하세요" readonly="readonly"> <input
						type="text" name="shopStoreAddress2" id="addr2"
						class="form-control" placeholder="상세주소를 입력하세요">
				</div>
				<div class="form-group">
					<button type='button' class='btn btnSendOption btn-danger'
						onclick="insertStore()"
						style='padding: 10px 20px; border-radius: 10px;'>발주 업체 등록</button>
				</div>
			</form>
		</div>
		<div class="storelist"></div>
	</div>
</div>
<script>
function listShopStore(){
	$.ajax({
		url:"${pageContext.request.contextPath}/shopping/admin/BaljuStore",
		type:"GET",
		dataType:'html',
		success:function(data){
			$(".storelist").html(data);
		}
	})
}
</script>
<script>
	$(function() {
		listShopStore();
		$('#balju').addClass('active');
		$('#dashboard').removeClass('active');
		$('#orderManage').removeClass('active');
		$('#ItemManage').removeClass('active');
		$('#couponManage').removeClass('active');
		$('#stockManage').removeClass('active');
		$('#levelManage').removeClass('active');

	})
</script>
<script>
	function daumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullAddr = '';
						var extraAddr = '';
						if (data.userSelectedType === 'R') { //도로명 주소
							fullAddr = data.roadAddress;
						} else { //지번 주소
							fullAddr = data.jibunAddress;
						}
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
						document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('addr1').value = fullAddr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('addr2').focus();
					}
				}).open();
	}
</script>
<script>
	function insertStore() {
		var f=document.BaljuForm;
		var str=f.shopStoreName.value;
		if(!str){
			f.shopStoreName.focus();
			return false;
		}
		 str=f.shopStoreTel.value;
		if(!str){
			f.shopStoreTel.focus();
			return false;
		}
		 str=f.zip.value;
		if(!str){
			f.zip.focus();
			return false;
		}
		 str=f.shopStoreAddress1.value;
		if(!str){
			f.shopStoreAddress1.focus();
			return false;
		}
		 str=f.shopStoreAddress2.value;
			if(!str){
				f.shopStoreAddress2.focus();
				return false;
			}
		
		
		
		var params=$("#BaljuForm").serialize();
		$.ajax({
			url:"${pageContext.request.contextPath}/shopping/admin/Balju",
			type:"POST",
			data:params,
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
			dataType:'html',
			success:function(data){
				$(".storelist").html(data);
				f.shopStoreName.value="";
				f.shopStoreTel.value="";
				f.zip.value="";
				f.shopStoreAddress1.value="";
				f.shopStoreAddress2.value="";
			}
		});
	}
</script>