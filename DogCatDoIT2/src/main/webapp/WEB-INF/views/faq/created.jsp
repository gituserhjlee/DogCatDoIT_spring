<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.table-content tr > td:nth-child(1) {
	width: 100px;
	text-align: center;
	background: #eee;
}
.table-content tr > td:nth-child(2) {
	padding-left: 10px;
}
.table-content input[type=text], .table-content input[type=file], .table-content textarea {
	width: 97%;
}

.table-category {
	border-spacing: 1px;
	background: #999;
	width: 100%;
}

.table-category thead tr {
	text-align: center;
	background: #eee;
	height: 35px;
}
.table-category thead tr>th {
	color:  #787878;
}

.table-category tbody tr, .table-category tfoot tr {
	text-align: center;
	background: #fff;
	height: 30px;
}

.table-category input {
	border:1px solid #ccc;
	padding:3px 5px 5px;
	background-color:#fff;
	width:100%;
	box-sizing:border-box;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
.table-category button {
	border:1px solid #ccc;
	padding:3px 5px 5px;
	background-color:#fff;
	width:100%;
	box-sizing:border-box;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
.table-category input[disabled] {
    pointer-events: none;
    border: none;
    text-align: center;
}
.table-category select {
	border:1px solid #ccc;
	padding:3px 5px 5px;
	background-color:#fff;
	width:100%;
	box-sizing:border-box;
	font-family:"맑은 고딕", 나눔고딕, 돋움, sans-serif;
}
.table-category select[disabled] {
    pointer-events: none;
    border: none;
    text-align: center;
}
.btnSpanIcon {
	cursor: pointer;
}
</style>

<script type="text/javascript">
function sendOk() {
    var f = document.faqForm;

    if(! f.categoryNum.value) {
        alert("카테고리를 선택하세요. ");
        f.categoryNum.focus();
        return;
    }
    
	var str = f.subject.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

	str = f.content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }
    
    f.action="${pageContext.request.contextPath}/faq/${mode}";
    f.submit();
}
</script>

<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status===403) {
				login();
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	// 카테고리 수정 대화상자
	$("body").on("click", ".btnCategoryUpdate", function(){
		$("form[name=categoryForm]").each(function(){
			this.reset();
		});
		
		$("#category-dialog").dialog({
			  modal: true,
			  height: 500,
			  width: 500,
			  title: '카테고리 수정',
			  open : function(){
				var url="${pageContext.request.contextPath}/faq/listAllCategory?tmp="+(new Date()).getTime();
				$(".category-list").load(url);  
			  },
			  close: function(event, ui) {
				  $("form[name=faqForm] select[name=categoryNum]").find('option').remove();

				  var url="${pageContext.request.contextPath}/faq/listCategory";
				  var query="mode=enabled";
					
				  var fn=function(data) {
						$.each(data.listCategory, function(index, item){
							var categoryNum = item.categoryNum;
							var category = item.category;
							var s = "<option value='"+categoryNum+"'>"+category+"</option>";
							$("form[name=faqForm] select[name=categoryNum]").append(s);
						});
						
						var mode="${mode}";
						if(mode=="update") {
							$("form[name=faqForm] select[name=categoryNum]").val("${dto.categoryNum}");
						}
				  };
				  ajaxFun(url, "get", query, "json", fn);

			  }
		});
	});
	// $('.category-dialog').dialog("close"); // 창종료

	// 카테고리 등록
	$("body").on("click", ".btnCategorySend", function(){	
		var $tr=$(this).closest("tr");
		var category = $tr.find("input[name=category]").val().trim();
		var enabled = $tr.find("select[name=enabled]").val().trim();
		var orderNo = $tr.find("input[name=orderNo]").val().trim();
		
		if(! category) {
			$tr.find("input[name=category]").focus();
			return false;
		}
		
		if(! /^[0-9]+$/.test(orderNo)) {
			$tr.find("input[name=orderNo]").focus();
			return false;
		}
		
		category = encodeURIComponent(category);
		var url="${pageContext.request.contextPath}/faq/insertCategory";
		var query="category="+category+"&enabled="+enabled+"&orderNo="+orderNo;
		
		var fn = function(data){
			// var state=data.state;
			$("form[name=categoryForm]").each(function(){
				this.reset();
			});
			
			url="${pageContext.request.contextPath}/faq/listAllCategory?tmp="+(new Date()).getTime();
			$(".category-list").load(url); 
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});

	// 카테고리 수정
	$("body").on("click", ".btnUpdateIcon", function(){	
		var $tr=$(this).closest("tr");
		$tr.find("input").prop("disabled", false);
		$tr.find("select").prop("disabled", false);
		
		$tr.find(".btnUpdateIcon").hide();
		$tr.find(".btnDeleteIcon").hide();

		$tr.find(".btnUpdateOkIcon").show();
		$tr.find(".btnUpdateCancelIcon").show();
	});

	// 카테고리 수정 완료
	$("body").on("click", ".btnUpdateOkIcon", function(){	
		var $tr=$(this).closest("tr");
		var categoryNum = $tr.find("input[name=categoryNum]").val();
		var category = $tr.find("input[name=category]").val().trim();
		var enabled = $tr.find("select[name=enabled]").val().trim();
		var orderNo = $tr.find("input[name=orderNo]").val().trim();
		
		if(! category) {
			$tr.find("input[name=category]").focus();
			return false;
		}
		
		if(! /^[0-9]+$/.test(orderNo)) {
			$tr.find("input[name=orderNo]").focus();
			return false;
		}
		
		category = encodeURIComponent(category);
		var url="${pageContext.request.contextPath}/faq/updateCategory";
		var query="categoryNum="+categoryNum+"&category="+category+"&enabled="+enabled+"&orderNo="+orderNo;
		
		var fn = function(data){
			var state=data.state;
			if(state=="false") {
				alert("카테고리 삭제가 불가능합니다.");
				return false;
			}
			
			url="${pageContext.request.contextPath}/faq/listAllCategory?tmp="+(new Date()).getTime();
			$(".category-list").load(url); 
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});

	// 카테고리 수정 취소
	$("body").on("click", ".btnUpdateCancelIcon", function(){	
		var $tr=$(this).closest("tr");
		$tr.find("input").prop("disabled", true);
		$tr.find("select").prop("disabled", true);
		
		$tr.find(".btnUpdateOkIcon").hide();
		$tr.find(".btnUpdateCancelIcon").hide();

		$tr.find(".btnUpdateIcon").show();
		$tr.find(".btnDeleteIcon").show();
	});

	// 카테고리 삭제
	$("body").on("click", ".btnDeleteIcon", function(){	
		var $tr=$(this).closest("tr");
		var categoryNum = $tr.find("input[name=categoryNum]").val();
		
		var url="${pageContext.request.contextPath}/faq/deleteCategory";
		var query="categoryNum="+categoryNum;
		
		var fn = function(data){
			url="${pageContext.request.contextPath}/faq/listAllCategory?tmp="+(new Date()).getTime();
			$(".category-list").load(url); 
		};
		
		ajaxFun(url, "post", query, "json", fn);
		
	});
});
</script>

<div class="container body-container">
	<div class="body-title">
		<h2><i class="icofont-support-faq"></i> 자주하는 질문 </h2>
	</div>
    
	<div class="body-main wx-800 ml-30 pt-15">
		<form name="faqForm" method="post">
		<table class="table table-border table-content">
			<tr> 
				<td>카테고리</td>
				<td > 
					<select name="categoryNum" class="selectField">
						<c:forEach var="vo" items="${listCategory}">
							<option value="${vo.categoryNum}" ${dto.categoryNum==vo.categoryNum?"selected='selected'":""}>${vo.category}</option>
						</c:forEach>
					</select>
					<button type="button" class="btn btnCategoryUpdate"> 변경 </button>
				</td>
			</tr>
		
			<tr> 
				<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
				<td> 
					<input type="text" name="subject" maxlength="100" class="boxTF" value="${dto.subject}">
				</td>
			</tr>
		
			<tr> 
				<td>작성자</td>
				<td> 
					${sessionScope.member.userName}
				</td>
			</tr>
		
			<tr> 
				<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
				<td valign="top"> 
					<textarea name="content" class="boxTA">${dto.content}</textarea>
				</td>
			</tr>
		</table>
		
		<table class="table">
			<tr> 
				<td align="center">
					<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
					<button type="reset" class="btn">다시입력</button>
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/faq/main?pageNo=${pageNo}';">${mode=='update'?'수정취소':'등록취소'}</button>
					<c:if test="${mode=='update'}">
						<input type="hidden" name="num" value="${dto.num}">
						<input type="hidden" name="pageNo" value="${pageNo}">
					</c:if>
				</td>
			</tr>
		</table>
		</form>
		
		<div id="category-dialog" style="display: none;">
			<form name="categoryForm" method="post">
			<table class="table-category">
				<thead>
					<tr> 
						<th width="170">카테고리</th>
						<th width="90">활성</th>
						<th width="80">출력순서</th>
						<th>변경</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center" height="30" bgcolor="#fff">
						<td> <input type="text" name="category"> </td>
						<td>
							<select name="enabled">
								<option value="1">활성</option>
								<option value="0">비활성</option>
							</select>
						</td>
						<td> <input type="text" name="orderNo"> </td>
						<td> <button type="button" class="btnCategorySend">등록하기</button> </td>
					</tr>
				</tbody>
				<tfoot class="category-list">
				</tfoot>
			</table>
			</form>
		</div>
		
	</div>
</div>	
