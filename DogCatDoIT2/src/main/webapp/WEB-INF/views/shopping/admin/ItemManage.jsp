<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="content-wrapper">
	<div class="container-fluid">
		<div class="Itemmain">
			<input id="tab1" type="radio" name="tabs" value="r1"
				checked="checked"> <label for="tab1">상품 현황</label> <input
				id="tab2" type="radio" name="tabs" value="r2"> <label
				for="tab2">상품 등록</label>


			<section id="c1">
				${dataCount}개(${page}/${total_page} 페이지)
				<div
					style="display: flex; flex-wrap: wrap; justify-content: space-around;">
					<c:forEach var="i" items="${items}">
						<div class="card" style="width: 40%">
							<img class="card-img-top"
								src="${pageContext.request.contextPath}/uploads/item/${i.saveFileName}"
								alt="Card image cap" width="130px" height="130px"
								onclick="javascript:location.href='${pageContext.request.contextPath}/shopping/admin/optionManage?num=${i.itemId}';">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">${i.itemName}</li>
								<li class="list-group-item">재고:${i.stock}</li>
								<li class="list-group-item">설명:${i.des}</li>


							</ul>
						</div>
					</c:forEach>

				</div>
				${dataCount==0?"등록된 게시물이 없습니다.":paging}
			</section>

			<section id="c2">
				<div class="body-main">
					<form name="boardForm" method="post" enctype="multipart/form-data"
						onsubmit="return submitContents(this);">
						<table class="table table-content">
							<tbody>
								<tr>
									<td>상품명</td>
									<td><input type="text" name="itemName"
										class="form-control" value=""></td>
								</tr>
								<!-- <tr>
									<td>옵션 <button type="button" class="btn btn-danger" name="optionplus">
											추가</button></td>
									<td><input type="text" name="optionName"
										class="form-control" value="" placeholder="옵션명을 입력하세요(ex. 색상, 맛 등 )">
										
									<div>
									<input type="text" name="detailoption"
										class="form-control" value=""
										placeholder="상세옵션명을 입력하세요 (ex. S,M,L )"> <input
										type="number" name="itemstock" class="form-control" value=""
										placeholder="수량을 입력하세요">
										<button type="button" class="btn btn-danger" name="detailplus">
											상세 옵션 추가</button></div></td>
								</tr>
 -->
								<tr>
									<td>카테고리</td>
									<td><select class="custom-select" name="itemCategoryId">
											<option selected>카테고리를 선택하세요</option>
											<c:forEach var="c" items="${category}">
												<option value="${c.itemCategoryId}">${c.itemCategoryName}</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<td>업체명</td>
									<td><select class="custom-select" name="shopStoreId">
											<option selected>업체명을 선택하세요</option>
											<c:forEach var="s" items="${store}">
												<option value="${s.shopStoreId}">${s.shopStoreName}</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<td>상품 설명</td>
									<td><input type="text" name="des" class="form-control"
										value=""></td>
								</tr>
								<tr>
									<td>상품 원가</td>
									<td><input type="number" name="itemOriginalPrice"
										class="form-control" value="" placeholder="숫자만 입력"></td>
								</tr>
								<tr>
									<td>상품 판매가</td>
									<td><input type="number" name="itemSalePrice"
										class="form-control" value="" placeholder="숫자만 입력"></td>
								</tr>
								<tr>
									<td>할인율(%)</td>
									<td><input type="number" name="discountRate"
										class="form-control" value="" placeholder="숫자만 입력"></td>
								</tr>
								<tr>
									<td>재고량</td>
									<td><input type="number" name="stock" class="form-control"
										value="" placeholder="숫자만 입력"></td>
								</tr>
								<tr>
									<td>상품제조사</td>
									<td><input type="text" name="manufacturer"
										class="form-control" value=""></td>
								</tr>

								<tr>
									<td>대표사진</td>
									<td><input type="file" name="upload"
										class="form-control-file" accept="image/*"></td>
								</tr>
								<tr>
									<td style="vertical-align: top;">상세내용</td>
									<td><textarea name="content" id="content"
											style="height: 270px;">${dto.content}</textarea></td>
								</tr>
								

								<c:if test="${mode=='update' }">
									<tr>
										<td>첨부된파일</td>
										<td><c:if test="${not empty dto.saveFilename}">
												<a
													href="${pageContext.request.contextPath}/bbs/deleteFile?num=${dto.num}&page=${page}"><i
													class="bi bi-trash"></i></a>
											</c:if> ${dto.originalFilename}</td>
									</tr>
								</c:if>
							</tbody>

							<tfoot>
								<tr>
									<td class="text-center" colspan="2" style="padding-top: 15px;">
										<button type="submit" class="btn btn-danger">${mode=='update'?'수정완료':'등록하기'}&nbsp;<i
												class="bi bi-check2"></i>
										</button>
										<button type="reset" class="btn btn-secondary">다시입력</button>
										<button type="button" class="btn btn-secondary"
											onclick="javascript:location.href='${pageContext.request.contextPath}/shopping/admin/ItemManage';">${mode=='update'?'수정취소':'등록취소'}&nbsp;<i
												class="bi bi-x"></i>
										</button> <c:if test="${mode=='update'}">
											<input type="hidden" name="num" value="${dto.num}">
											<input type="hidden" name="saveFilename"
												value="${dto.saveFilename}">
											<input type="hidden" name="originalFilename"
												value="${dto.originalFilename}">
											<input type="hidden" name="page" value="${page}">
										</c:if>
									</td>
								</tr>
							</tfoot>
						</table>
					</form>

				</div>
			</section>


		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/shopAdmin/css/ItemManage.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript">
	function check() {
		var f = document.boardForm;

		var str = f.itemName.value;
		if (!str) {
			alert("상품명을 입력하세요. ");
			f.itemName.focus();
			return false;
		}

		str = f.itemCategoryId.value;
		if (str === '카테고리를 선택하세요') {
			alert("카테고리를 입력하세요. ");
			f.itemCategoryId.focus();
			return false;
		}

		str = f.shopStoreId.value;
		if (str === '업체명을 선택하세요') {
			alert("업체명을 입력하세요. ");
			f.shopStoreId.focus();
			return false;
		}

		str = f.des.value;
		if (!str) {
			alert("설명을 입력하세요. ");
			f.des.focus();
			return false;
		}

		str = f.itemOriginalPrice.value;
		if (!str) {
			alert("원가를 입력하세요. ");
			f.itemOriginalPrice.focus();
			return false;
		}

		str = f.itemSalePrice.value;
		if (!str) {
			alert("판매가를 입력하세요. ");
			f.itemSalePrice.focus();
			return false;
		}

		str = f.discountRate.value;
		if (!str) {
			alert("할인율을 입력하세요. ");
			f.discountRate.focus();
			return false;
		}

		str = f.stock.value;
		if (!str) {
			alert("재고량을 입력하세요. ");
			f.stock.focus();
			return false;
		}

		str = f.manufacturer.value;
		if (!str) {
			alert("제조사를 입력하세요. ");
			f.manufacturer.focus();
			return false;
		}

		str = f.upload.value;
		if (!str) {
			alert("상품 대표 사진을 등록하세요. ");
			f.upload.focus();
			return false;
		}

		str = f.content.value;
		if (!str || str == "<p>&nbsp;</p>") {
			alert("상세내용을 등록하세요. ");
			f.content.focus();
			return false;
		}

		f.action = "${pageContext.request.contextPath}/shopping/admin/item/${mode}";

		return true;
	}
</script>
<script type="text/javascript">
/* $(function(){
	$('button[name=optionplus]').on('click',function(){
		var $tr=$(this).closest("tr").clone(true);//이벤트도 복제 
		$tr.find("input").val("");

		$(this).closest("tr").after($tr);
		
	})
}) 
$(function(){
	$('button[name=detailplus]').on('click',function(){
		var $tr=$(this).closest("div").clone(true);//이벤트도 복제 
		$tr.find("input").val("");

		$(this).closest("div").after($tr);
		
	})
})  */

	$(function() {
		$('input:radio[name=tabs]').on(
				'click',
				function() {
					var valueCheck = $("input[name=tabs]:checked").val(); // 체크된 Radio 버튼의 값을 가져옵니다.
					if (valueCheck === 'r1') {
						$('#c1').show(100)
						$('#c2').hide(100)
					} else {
						$('#c1').hide(100)
						$('#c2').show(100)
						var textSpaceHeight = 270; //스마트에디터 높이

						oEditors.getById["content"].exec(
								"MSG_EDITING_AREA_RESIZE_STARTED", []);

						oEditors.getById["content"].exec("RESIZE_EDITING_AREA",
								[ 0, textSpaceHeight ]); //타입은 px단위의 Number입니다. 

						oEditors.getById["content"].exec(
								"MSG_EDITING_AREA_RESIZE_ENDED", []);

						oEditors.getById["content"].exec("SE_FIT_IFRAME", []);

					}
				});
	})
	$(function() {
		$('#c1').show(100)
		$('#c2').hide(100)
		$('#content').height(270);

	});
	var oEditors = [];
	nhn.husky.EZCreator
			.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "content",
				sSkinURI : "${pageContext.request.contextPath}/resources/se/SmartEditor2Skin.html",
				htParams : {
					bUseToolbar : true,
					fOnBeforeUnload : function() {
					}
				}, //boolean
				fOnAppLoad : function() {
					//예제 코드
					//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
					//$("#content").hide();
				},
				fCreator : "createSEditor2"
			});
	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [ sHTML ]);
	}

	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}

	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.

		try {
			// elClickedObj.form.submit();
			return check();
		} catch (e) {
		}
	}

	function setDefaultFont() {
		var sDefaultFont = '돋움';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}

	$(function() {
		$('#ItemManage').addClass('active');
		$('#dashboard').removeClass('active');

	})
	

</script>

<style type="text/css">
.body-container {
	max-width: 850px;
	margin: 10px auto 5px;
	padding-top: 20px;
}

.table-content {
	margin-top: 25px;
}

.table-content tbody tr {
	border-bottom: 1px solid #ccc;
	height: 40px;
}

.table-content tbody tr:first-child {
	border-top: 1px solid #ccc;
}

.table-content tr>td {
	padding: 5px 0;
}

.table-content tbody tr>td:nth-child(1) {
	box-sizing: border-box;
	width: 100px;
	text-align: center;
	background: #eee;
	vertical-align: middle;
}

.table-content tbody tr>td:nth-child(2) {
	padding-left: 10px;
}

.table-content input[type=text], .table-content input[type=file],
	.table-content textarea {
	width: 97%;
}
</style>