<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
	function sendOk(){
		var f = document.expertForm;
		
		var str = f.subject.value;
		if(!str){
			alert("제목을 입력하세요. ");
			f.subject.focus();
			return;
		}
		
		str = f.content.value;
		if(!str){
			alert("내용을 입력하세요. ");
			f.content.focus();
			return;
		}
		
		f.action = "${pageContext.request.contextPath}/expert/${mode}";
		
		f.submit();
	}
</script>

<div class="container body-container"> 
	<div>
		<h2><i class="icofont-ebook"></i> 동물행동전문가 Q&A 게시판 </h2>
	</div>
	
	<div class="body-main wx-700 ml-40 pt-20">
		<form name="expertForm" method="post">
			<table class="table table-border table-content">
				<tr>
					<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					<td>
						<input type="text" name="subject" maxlength="100" class="boxTF" value="${dto.subject}">
					</td>
				</tr>
				
				<tr>
					<td>작성자</td>
					<td>${sessionScope.member.userName}</td>					
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
							<input type="hidden" name="expertNum" value="${dto.expertNum}">
							<input type="hidden" name="page" value="${page}">
							<input type="hidden" name="rows" value="${rows}">
						</c:if>
						
						<c:if test="${mode=='reply'}">
							<input type="hidden" name="groupNum" value="${dto.groupNum}">
							<input type="hidden" name="orderNo" value="${dto.orderNo}">
							<input type="hidden" name="depth" value="${dto.depth}">
							<input type="hidden" name="parent" value="${dto.parent}">
							<input type="hidden" name="expertNum" value="${dto.expertNum}">
							<input type="hidden" name="page" value="${dto.page}">
							<input type="hidden" name="rows" value="${dto.rows}">
														
						</c:if>
						
						<button type="button" class="btn btn-dark" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
<!-- 						<button type="reset" class="btn">다시입력</button>
 -->			        	<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/expert/list';">${mode=='update'?'수정취소':'등록취소'}</button>					
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>