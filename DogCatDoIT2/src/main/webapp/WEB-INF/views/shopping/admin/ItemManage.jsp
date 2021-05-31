<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="content-wrapper">
	<div class="container-fluid">
		<div class="Itemmain">
			<input id="tab1" type="radio" name="tabs" checked>
			<!--디폴트 메뉴-->
			<label for="tab1">상품 등록</label> <input id="tab2" type="radio"
				name="tabs"> <label for="tab2">상품 현황</label>



			<section id="content1">
				<div class="body-main">
					<form name="boardForm" method="post" enctype="multipart/form-data"
						onsubmit="return submitContents(this);">
						<table class="table table-content">
							<tbody>
								<tr>
									<td>상품명</td>
									<td><input type="text" name="name" class="form-control"
										value=""></td>
								</tr>
								<tr>
									<td>상품 설명</td>
									<td><input type="text" name="description" class="form-control"
										value=""></td>
								</tr>
								<tr>
									<td>상품 원가</td>
									<td><input type="number" name="originalPrice" class="form-control"
										value="" placeholder="숫자만 입력"></td>
								</tr>
								<tr>
									<td>상품 정가</td>
									<td><input type="number" name="salePrice" class="form-control"
										value="" placeholder="숫자만 입력"></td>
								</tr>
								<tr>
									<td>할인율</td>
									<td><input type="number" name="discount" class="form-control"
										value="" placeholder="ex. 2%->2라고 입력"></td>
								</tr>
								<tr>
									<td>재고량</td>
									<td><input type="number" name="stock" class="form-control"
										value="" placeholder="숫자만 입력"></td>
								</tr>
								<tr>
									<td>상품제조사</td>
									<td><input type="text" name="manufacturer" class="form-control"
										value=""></td>
								</tr>
							
								<tr>
									<td>대표사진</td>
									<td><input type="file" name="upload"
										class="form-control-file"></td>
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

			<section id="content2">
				<p>상품현황의 내용</p>
			</section>


		</div>

	</div>
</div>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/shopAdmin/css/ItemManage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	function check() {
		var f = document.boardForm;

		var str = f.name.value;
		if (!str) {
			alert("상품명을 입력하세요. ");
			f.name.focus();
			return false;
		}
		
		str = f.description.value;
		if (!str) {
			alert("설명을 입력하세요. ");
			f.description.focus();
			return false;
		}
		
		str = f.originalPrice.value;
		if (!str) {
			alert("원가를 입력하세요. ");
			f.originalPrice .focus();
			return false;
		}
		
		str = f.salePrice.value;
		if (!str) {
			alert("정가를 입력하세요. ");
			f.salePrice .focus();
			return false;
		}

		str = f.discount.value;
		if (!str) {
			alert("할인율을 입력하세요. ");
			f.discount.focus();
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
		console.log(str)
		if(!str || str=="<p>&nbsp;</p>"){
			alert("상세내용을 등록하세요. ");
			f.content.focus();
			return false;
		}
		
		f.action = "${pageContext.request.contextPath}/shopping/admin/item/${mode}";

		return true;
	}
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
	
	var oEditors = [];
	nhn.husky.EZCreator
			.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "content",
				sSkinURI : "${pageContext.request.contextPath}/resources/smartEditor/SmartEditor2Skin.html",
				htParams : {
					bUseToolbar : true,
					fOnBeforeUnload : function() {
					}
				}, //boolean
				fOnAppLoad : function() {
					//예제 코드
					//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
				},
				fCreator : "createSEditor2"
			});

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