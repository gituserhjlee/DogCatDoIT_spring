<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="content-wrapper">
	<div class="container-fluid">
		<div style="padding: 20px; font-family: Jua;">
			<div
				style="text-align: center; font-size: x-large; padding: 20px;">
				<span>쇼핑몰 등급 관리 </span>
			</div>
		<div class="levels"></div>
		<form name="levelForm" id="levelForm">
			<div class="form-group">
					<input type="text" class="form-control" placeholder="등급명을 입력하세요" onchange="levelNameCheck();"
						name="levelName"  id="levelName" value="${level.levelName}">
					<p class="help-block" style="font-family: 'JUA'">기존의 등급명과 중복되는 등급명은 불가합니다</p>
					 <input
						type="number" class="form-control" placeholder="시작 기준가격을 입력하세요(이상)"
						name="moneyStart"  id="moneyStart" value="${level.moneyStart}">
					 <input
						type="number" class="form-control" placeholder="끝 기준가격을 입력하세요(이상)"
						name="moneyEnd"  id="moneyEnd" value="${level.moneyEnd}">
					 <input
						type="number" class="form-control" placeholder="할인율을 입력하세요"
						name="rate"  id="rate" value="${level.rate}">
					<c:if test="${mode eq 'insert'}">
					<button type='button' class='btn btnSendOption btn-secondary'
							style='padding: 10px 20px; border-radius: 10px; float:right;'
							onclick="insertLevel();"
							>등급 등록
					</button>	
					</c:if>
					<c:if test="${mode eq 'update'}">
					<input type="hidden" name="levelId" value="${level.levelId}">
					<button type='button' class='btn btnSendOption btn-secondary'
							style='padding: 10px 20px; border-radius: 10px; float:right;'
							onclick="updateLevel(${level.levelId});"
							>등급 수정
					</button>
					
					</c:if>
				</div>
		</form>
			
		</div>
	</div>
</div>

<script>
function listLevels() {
	$.ajax({
				url : "${pageContext.request.contextPath}/shopping/admin/LevelList",
				type : "GET",
				dataType : 'html',
				success : function(data) {
					$(".levels").html(data);
				}
			})
}

function insertLevel(){
	var f = document.levelForm;
	var str = f.levelName.value;
	if (!str) {
		f.levelName.focus();
		return false;
	}
	str = f.moneyStart.value;
	if (!str || str<0) {
		f.moneyStart.focus();
		return false;
	}
	str = f.moneyEnd.value;
	if (!str || str<0 || str<f.moneyStart.value) {
		f.moneyEnd.focus();
		return false;
	}
	str = f.rate.value;
	if (!str|| str<0) {
		f.rate.focus();
		return false;
	}
	var params = $("#levelForm").serialize();
	$.ajax({
		url : "${pageContext.request.contextPath}/shopping/admin/levels",
		data:params,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		type : "POST",
		dataType : 'html',
		success : function(data) {
			$(".levels").html(data);
			f.reset();
		}
	})
	
}

function updateLevel(){
	var f = document.levelForm;
	var str = f.levelName.value;
	if (!str) {
		f.levelName.focus();
		return false;
	}
	str = f.moneyStart.value;
	if (!str || str<0) {
		f.moneyStart.focus();
		return false;
	}
	str = f.moneyEnd.value;
	if (!str || str<0 || parseInt(str)<parseInt(f.moneyStart.value)) {
		f.moneyEnd.focus();
		return false;
	}
	str = f.rate.value;
	if (!str|| str<0) {
		f.rate.focus();
		return false;
	}
	var params = $("#levelForm").serialize();
	console.log(str)
	console.log(params)
	$.ajax({
		url : "${pageContext.request.contextPath}/shopping/admin/updatelevels",
		data:params,
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		type : "POST",
		dataType:'text',

		success : function(data) {
			if(data==='true'){
				alert('수정되었습니다');
	 	        window.location.href = "${pageContext.request.contextPath}/shopping/admin/levelManage";
			}
		}
	})
	
}

function levelNameCheck() {
	var str = $("#levelName").val();
	str = str.trim();		
	var url="${pageContext.request.contextPath}/shopping/admin/levelCheck";
	var query="levelName="+str;
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			var p=data.passed;
			if(p==="true") {
				var s="<span style='color:blue;font-weight:bold;'>"+str+"</span> 쿠폰명이 사용 가능합니다.";
				$("#levelName").next(".help-block").html(s);
			} else {
				var s="<span style='color:red;font-weight:bold;'>"+str+"</span> 쿠폰명을 사용할 수 없습니다.";
				$("#levelName").next(".help-block").html(s);
				$("#levelName").val("");
				$("#levelName").focus();
			}
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}
</script>
<script>
 $(function(){

	
	$("body").on("click", ".btnDeleteLevel", function(){
		
		var levelId = $(this).attr("data-id");
		$.ajax({
			url : "${pageContext.request.contextPath}/shopping/admin/deletelevels",
			data: {"levelId":levelId},
			type : "POST",
			dataType:'text',
			success:function(data){
				if(data==='true'){
					alert("삭제되었습니다");
		 	        window.location.href = "${pageContext.request.contextPath}/shopping/admin/levelManage";
				}
			}
			
		})
	})	
	
}) 


</script>
<script>
$(function() {
	listLevels();
	$('#levelManage').addClass('active');
	$('#dashboard').removeClass('active');
	$('#orderManage').removeClass('active');
	$('#ItemManage').removeClass('active');
	$('#ItemInsert').removeClass('active');
	$('#couponManage').removeClass('active');
	$('#stockManage').removeClass('active');
	$('#balju').removeClass('active');

})
</script>