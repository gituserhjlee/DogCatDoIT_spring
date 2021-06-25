<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<style type="text/css">
.body-container {
	max-width: 850px; margin: 10px auto 5px; padding-top: 20px;
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
.table-content tr > td {
	padding: 5px 0;
}
.table-content tbody tr > td:nth-child(1) {
	box-sizing: border-box;
	width: 100px;
	text-align: center;
	background: #eee;
	vertical-align: middle;
}
.table-content tbody tr > td:nth-child(2) {
	padding-left: 10px;
}
.table-content input[type=text], .table-content input[type=file], .table-content textarea {
	width: 97%;
}
</style>

<script type="text/javascript">
    function sendOk() {
        var f = document.boardForm;

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

   		f.action="${pageContext.request.contextPath}/zau/${mode}";

        f.submit();
    }
</script>
<div class="container body-container">
    <div class="body-title">
        <h2><i class="icofont-ebook"></i> 게시판 </h2>
    </div>
    
    <div class="body-main wx-700 ml-30 pt-15">
		<form name="boardForm" method="post">
		<table class="table table-border table-content">
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
					<c:if test="${mode=='update'}">
						<input type="hidden" name="num" value="${dto.num}">
						<input type="hidden" name="page" value="${page}">
					</c:if>
				    
				    <input type="hidden" name="categoryNum" value="${categoryNum}">
				      
					<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="btn">다시입력</button>
			        <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/zau/list';">${mode=='update'?'수정취소':'등록취소'}</button>
				</td>
			</tr>
		
		</table>
			</form>
			</div>
			</div>
			