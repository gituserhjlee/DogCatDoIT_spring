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

.table-border tfoot tr:first-child {
	border-top: 1px solid #ccc;
}
</style>

<script type="text/javascript">
$(function(){
	$("form input[name=upload]").change(function(){
		if(! $(this).val()) return false;
		
		var b=false;
		$("form input[name=upload]").each(function(){
			if(! $(this).val()) {
				b=true;
				return false;
			}
		});
		if(b) {
			return false;
		}
			
		var $tr = $(this).closest("tr").clone(true); // 이벤트도 복제
		$tr.find("input").val("");
		$("#tb").append($tr);
	});
});

  <c:if test="${mode=='update'}">
  function deleteFile(fileNum) {
		var url="${pageContext.request.contextPath}/notice/deleteFile";
		$.post(url, {fileNum:fileNum}, function(data){
			$("#f"+fileNum).remove();
		}, "json");
  }
</c:if>
</script>

<script type="text/javascript">
    function sendOk() {
        var f = document.noticeForm;

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

    	f.action="${pageContext.request.contextPath}/notice/${mode}";

        f.submit();
    }
</script>

<div class="container body-container">
    <div class="body-title">
		<h2><i class="icofont-clip-board"></i> 공지사항 </h2>
    </div>
    
    <div class="body-main wx-700 ml-30 pt-15">
		<form name="noticeForm" method="post" enctype="multipart/form-data">
		<table class="table table-border table-content">
			<tbody id="tb">
				<tr> 
					<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					<td> 
						<input type="text" name="subject" maxlength="100" class="boxTF" value="${dto.subject}">
					</td>
				</tr>
			
				<tr> 
					<td>공지여부</td>
					<td> 
						<input type="checkbox" name="notice" value="1" ${dto.notice==1 ? "checked='checked' ":"" } > 공지
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
			  
				<tr>
					<td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
					<td> 
						<input type="file" name="upload" class="boxTF">
					</td>
				</tr>
			</tbody>
              
			<c:if test="${mode=='update'}">
				<tfoot>
					<c:forEach var="vo" items="${listFile}">
						<tr id="f${vo.fileNum}"> 
							<td>첨부된파일</td>
							<td> 
								<a href="javascript:deleteFile('${vo.fileNum}');"><i class="icofont-bin"></i></a> 
								${vo.originalFilename}
							</td>
						  </tr>
					</c:forEach>
				</tfoot>
			</c:if>
		</table>
			
		<table class="table">
			<tr> 
				<td align="center">
					<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
					<button type="reset" class="btn">다시입력</button>
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/notice/list';">${mode=='update'?'수정취소':'등록취소'}</button>
					<c:if test="${mode=='update'}">
						<input type="hidden" name="num" value="${dto.num}">
						<input type="hidden" name="page" value="${page}">
					</c:if>
				</td>
			</tr>
		</table>
		</form>
	</div>
    
</div>