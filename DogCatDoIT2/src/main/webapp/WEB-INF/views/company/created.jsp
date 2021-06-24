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
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
    function check() {
        var f = document.boardForm;

    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return false;
        }

    	str = f.content.value;
        if(!str || str=="<p>&nbsp;</p>") {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return false;
        }

    	f.action="${pageContext.request.contextPath}/company/${mode}";

        return true;
    }
</script>

<div class="container body-container">
	<div class="body-title" style="margin-bottom: 20px;">
		<h2>업체등록</h2>
	</div>
    
	<div class="body-main wx-850 ml-30 pt-15">
		<form name="companyForm" method="post" enctype="multipart/form-data" onsubmit="return submitContents(this);">
		<table class="table table-border table-content">
			<tr> 
				<td>업체이름</td>
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
				<td valign="top">상세정보</td>
				<td valign="top"> 
					<textarea name="content" id="content" style="width: 30%; margin:0 auto; ">${dto.content}</textarea>
				</td>
			</tr>
			  
			<tr>
				<td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
				<td > 
					<input type="file" name="upload" class="boxTF">
				</td>
			</tr>
			  
			<c:if test="${mode=='update' }">
				<tr>
					<td>첨부된파일</td>
					<td>
						<c:if test="${not empty dto.saveFilename}">
							<a href="${pageContext.request.contextPath}/company/deleteFile?boardnum=${dto.boardnum}&page=${page}"><i class="fal fa-trash-alt"></i></a>
						</c:if>
						${dto.originalFilename}
					</td>
				</tr>
			</c:if>

		</table>
			
		<table class="table">
			<tr> 
				<td align="center">
					<button type="reset" class="btn btn-md btn-outline-dark" style="font-size: 17px;">다시입력</button>
					<button type="submit" class="btn btn-md btn-success" style="font-size: 17px;">${mode=='update'?'수정완료':'등록하기'}</button>
					<button type="button" class="btn btn-md btn-outline-primary" onclick="javascript:location.href='${pageContext.request.contextPath}/company/list';" style="font-size: 17px;">${mode=='update'?'수정취소':'등록취소'}</button>
					<c:if test="${mode=='update'}">
						<input type="hidden" name="num" value="${dto.num}">
						<input type="hidden" name="saveFilename" value="${dto.saveFilename}">
						<input type="hidden" name="originalFilename" value="${dto.originalFilename}">
						<input type="hidden" name="page" value="${page}">
					</c:if>
				</td>
			</tr>
		</table>
		</form>
	</div>
    
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content",
	sSkinURI: "${pageContext.request.contextPath}/resources/se/SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
		}
	},
	fOnAppLoad : function(){
		},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["content"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	
	try {
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>    
</div>