<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="content-wrapper">
	<div class="container-fluid">
		<div class="optionMain">
			<span style='font-weight: bold;'>상품 옵션 등록 </span>
				
				<table class="table">
				
					
				<tr>
					<td style='padding: 5px 5px 0;'><input type="text" class="form-control"
						placeholder="옵션명을 입력하세요"></td>
				</tr>
				<tr>
					<td align='right'>
						<button type='button' class='btn btnSendOption btn-danger'
							style='padding: 10px 20px;'>옵션 등록</button>
					</td>
				</tr>
			</table>

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
		$('#dashboard').removeClass('active');
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
		var url = "${pageContext.request.contextPath}/shopping/admin/itemdetailOption";
		var query = "itemoptionid=" + itemoptionid;
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
			if(! stock) {
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
	});
	
	
	
	
	
</script>