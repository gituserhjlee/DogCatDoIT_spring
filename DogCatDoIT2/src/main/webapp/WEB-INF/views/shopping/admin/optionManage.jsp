<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<div class="optionMain" style="font-family: Jua;">
		<div style="text-align: center;  font-size: x-large; padding: 20px;">
			<span >상품 옵션 등록 </span>
			</div>	
			<c:if test="${mode ne 'detailupdate'}">
			<table class="table">
				
					
				<tr>
					<td style='padding: 5px 5px 0;'><input type="text" class="form-control"
						placeholder="옵션명을 입력하세요" value="${name}"></td>
				</tr>
				<tr>
					<td align='right'>
					<c:if test="${mode eq 'insert' }">
					<button type='button' class='btn btnSendOption  btn-secondary'
							style='padding: 10px 20px; border-radius:10px;'>등록</button>
					</c:if>
					<c:if test="${mode eq 'update' }">
					<button type='button' class='btn btnUpdateOption  btn-secondary' data-optionNum='${optionid}'
							style='padding: 10px 20px; border-radius:10px;'>수정</button>
					</c:if>	
					</td>
				</tr>
			</table>
			</c:if>
				
			<c:if test="${mode eq 'detailupdate' }">
			<tr>
	        <td colspan='2' style=' border:4px outset #F79F81; '>
	            <div style='clear: both; padding: 10px 10px;'>
	       
	                <div class="form-group" >
	                	이름
	                    <input type="text" class="form-control" value="${d.detailname}" id="willupdateName">
	                 </div>
	                 <div class="form-group" >
	                	수량
	                    <input type="number" class="form-control" value="${d.stock}" id="willupdateStock">
	                 </div>
	            </div>
	             <div style='padding: 0 13px 10px 10px; text-align: right;'>
	                <button type='button' class='btn UpdateDetail btn-secondary' style="border-radius:10px;" data-optionNum='${d.detailId}'>상세옵션 수정</button>
	            </div>
	        
			</td>
	    </tr>
			
			</c:if>

			<div id="Options"></div>
		</div>
	</div>
</div>

<style type="text/css">
.table {
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
	margin-top: 15px;
}

.optionMain span{
	display: inline-block;
	margin: 0 0 -1px;
	padding: 15px 25px;
	color:  #555555;
}

</style>

<script>
	$(function() {
		$('#ItemManage').addClass('active');
		$('#ItemInsert').removeClass('active');
		$('#dashboard').removeClass('active');
		$('#orderManage').removeClass('active');
		$('#balju').removeClass('active');
		$('#couponManage').removeClass('active');
		$('#stockManage').removeClass('active');
		$('#levelManage').removeClass('active');
		//옵션 리스트 자동으로 불러오기
		listOption();
	})
	function listOption() {
		var num = ${num};
		var url = "${pageContext.request.contextPath}/shopping/admin/itemOption";
		var query = "itemid=" + num;
		var fn = function(data) {
			$('#Options').html(data);
		}
		ajaxFun(url, "get", query, "html", fn);
	}
	function listdetailOption(itemoptionid) {
		var num = ${num};
		var url = "${pageContext.request.contextPath}/shopping/admin/itemdetailOption";
		var query = "itemoptionid=" + itemoptionid+"&itemid="+num;
		var selector = "#listdetailoption"+itemoptionid
		var fn = function(data) {
			$(selector).html(data);
		};
		ajaxFun(url, "get", query, "html", fn);

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
	// 옵션 등록
	$(function() {
		$(".btnSendOption")
				.click(
						function() {
							var num = ${num};
							var $tb = $(this).closest("table");
							var name = $tb.find("input").val().trim();
							if (!name) {
								$tb.find("input").focus();
								return false;
							}
							content = encodeURIComponent(name);

							var url = "${pageContext.request.contextPath}/shopping/admin/itemOption";
							var query = "itemid=" + num + "&optionName=" + name;
							var fn = function(data) {
								$tb.find("input").val("");
								$('#Options').html(data);
							};

							ajaxFun(url, "post", query, "html", fn);
						});
		$(".btnUpdateOption")
		.click(
				function() {
					var num = ${num};
					var $tb = $(this).closest("table");
					var name = $tb.find("input").val().trim();
					var optionid = $(this).attr("data-optionNum");

					if (!name) {
						$tb.find("input").focus();
						return false;
					}
					content = encodeURIComponent(name);

					var url = "${pageContext.request.contextPath}/shopping/admin/itemOptionUpdate";
					var query = "optionid=" + optionid + "&optionName=" + name+"&itemid="+num;
					var fn = function(data) {
						$tb.find("input").val("");
						$('#Options').html(data);
				        window.location.href = "${pageContext.request.contextPath}/shopping/admin/optionManage?num="+num;

					};

					ajaxFun(url, "post", query, "html", fn);
				});
		
		$("body").on("click", ".btnDetailOptionLayout", function(){
			var $tr = $(this).closest("tr").next().next();
			var isVisible = $tr.is(":visible");
			var itemoptionid = $(this).attr("data-optionNum");
			if (isVisible) {
				$tr.hide();
			} else {
				$tr.show();
				// 답글 리스트
				listdetailOption(itemoptionid);

			}
		})	
		$("body").on("click", ".SendDetail", function(){
			
			var num = ${num};//상품의 번호
			var itemoptionid=$(this).attr("data-optionNum");//큰 옵션의 번호
			var $td=$(this).closest("td");
			var detailname = $td.find("input:eq(0)").val().trim();
			var stock = $td.find("input:eq(1)").val().trim();
			
			if(! detailname) {
				$td.find("input:eq(0)").focus();
				return false;
			}
			if(! stock || stock<0) {
				$td.find("input:eq(1)").focus();
				return false;
			}
			detailname = encodeURIComponent(detailname);
			var url = "${pageContext.request.contextPath}/shopping/admin/itemdetailOption";
			query="itemoptionid="+itemoptionid+"&stock="+stock+"&detailname="+detailname;
			var fn=function(data){
				$td.find("input").val("");
				if(data.state=="true") {
				
				 listdetailOption(itemoptionid);
				}

			};
			ajaxFun(url, "post", query, "json", fn);

		})
		
		$("body").on("click", ".UpdateDetail", function(){
			var num = ${num};//상품의 번호
			var detailid=$(this).attr("data-optionNum");//큰 옵션의 번호
			var detailname = $("#willupdateName").val().trim();
			var stock = $("#willupdateStock").val().trim();
			console.log(stock)
			if(! detailname) {
				$("#willupdateName").focus();
				return false;
			}
			if(! stock ||stock<0) {
				$("#willupdateStock").focus();
				return false;
			}
			detailname = encodeURIComponent(detailname);
			var url = "${pageContext.request.contextPath}/shopping/admin/itemdetailOptionUpdate";
			query="detailid="+detailid+"&stock="+stock+"&detailname="+detailname;
			var fn=function(data){
				if(data==='success'){
		        window.location.href = "${pageContext.request.contextPath}/shopping/admin/optionManage?num="+num;					
				}else{
					alert("수정실패")
				}

			};
			console.log('보내기전')
			ajaxFun(url, "post", query, "text", fn);

		})
		
		
		$("body").on("click",".deleteOption", function(){
			var num = ${num};
			var optionid=$(this).attr("data-optionNum");
			var url = "${pageContext.request.contextPath}/shopping/admin/itemOptionDelete";
			var query =  "itemid=" + num +"&optionid=" + optionid;
			var fn = function(data) {
				$('#Options').html(data);
			};
			ajaxFun(url, "post", query, "html", fn);

		})
		
		
		$("body").on("click",".deleteDetailOption", function(){
			var num = ${num};
			var detailid=$(this).attr("data-optionNum");
			var url = "${pageContext.request.contextPath}/shopping/admin/itemdetailOptionDelete";
			var query =  "itemid=" + num +"&detailid=" + detailid;
			var fn = function(data) {
				$('#Options').html(data);
			};
			ajaxFun(url, "post", query, "html", fn);

		})
		
		
	});
	
	
	
	
	
</script>