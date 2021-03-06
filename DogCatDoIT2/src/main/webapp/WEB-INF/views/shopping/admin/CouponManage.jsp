<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<div style="padding: 20px;font-family: Jua;">
			<div
				style="text-align: center;  font-size: x-large; padding: 20px;">
				<span>쿠폰 관리 </span>
			</div>
			<form name="couponForm" id="couponForm">
				<div class="form-group">
					<button type='button' class='btn btnSendOption btn-secondary'
						onclick="insertCoupon()"
						style='padding: 10px 20px; border-radius: 10px; '>등록</button>
				</div>
				<div class="form-group">
						<input type="text" class="form-control" placeholder="쿠폰명을 입력하세요" name="couponName" id="couponName" onchange="couponNameCheck();">
						<p class="help-block" style="font-family: 'JUA'">기존의 쿠폰명과 중복되는 쿠폰명은 불가합니다</p>
						<input type="date" class="form-control" placeholder="마감일자를 입력하세요" name="deadline">
						<input type="number" class="form-control" placeholder="발행 개수를 입력하세요" name="stock"> 
						<input type="number" class="form-control" placeholder="할인율을 숫자로 입력하세요" name="rate">
				</div>
			
			</form>
			<div class="couponlist"></div>
		</div>

	</div>
</div>
<script>
function listCouponList(){
	$.ajax({
		url:"${pageContext.request.contextPath}/shopping/admin/CouponList",
		type:"GET",
		dataType:'html',
		success:function(data){
			$(".couponlist").html(data);
		}
	})
}
</script>
<script>
	$(function() {
		listCouponList();
		$('#couponManage').addClass('active');
		$('#ItemInsert').removeClass('active');
		$('#dashboard').removeClass('active');
		$('#orderManage').removeClass('active');
		$('#balju').removeClass('active');
		$('#stockManage').removeClass('active');
		$('#ItemManage').removeClass('active');
		$('#levelManage').removeClass('active');
		
	});
</script>
<script>
	function insertCoupon() {
		
		var f = document.couponForm;
		var str = f.couponName.value;
		if (!str) {
			f.couponName.focus();
			return false;
		}
		str = f.deadline.value;
		if (!str) {
			f.deadline.focus();
			return false;
		}
		str = f.stock.value;
		if (!str || str<1) {
			f.stock.focus();
			return false;
		}

		str = f.rate.value;
		if (!str || str<1) {
			f.rate.focus();
			return false;
		}
		if(confirm("정말 등록하시겠습니까 ? 수정, 삭제가 불가합니다 ") == true){
	        alert("등록되었습니다");
	    }
	    else{
	        return false ;
	    }
		
		 var params = $("#couponForm").serialize()
		$.ajax({
			url:"${pageContext.request.contextPath}/shopping/admin/CouponManage",
			type:"POST",
			data:params,
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
			dataType:'html',
			success:function(data){
				$(".couponlist").html(data);
				f.reset();
			}
		})

	}
	
	function couponNameCheck() {
		var str = $("#couponName").val();
		str = str.trim();		
		var url="${pageContext.request.contextPath}/shopping/admin/couponCheck";
		var query="couponName="+str;
		
		$.ajax({
			type:"post"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				var p=data.passed;
				if(p==="true") {
					var s="<span style='color:blue;font-weight:bold;'>"+str+"</span> 쿠폰명이 사용 가능합니다.";
					$("#couponName").next(".help-block").html(s);
				} else {
					var s="<span style='color:red;font-weight:bold;'>"+str+"</span> 쿠폰명을 사용할 수 없습니다.";
					$("#couponName").next(".help-block").html(s);
					$("#couponName").val("");
					$("#couponName").focus();
				}
			}
		    ,error:function(e) {
		    	console.log(e.responseText);
		    }
		});
	}
</script>