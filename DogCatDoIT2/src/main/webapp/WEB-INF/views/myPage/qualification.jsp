<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
function sendRequest() {
	f = document.requestQualificationForm
	
	f.submit();
}
</script>
<div style="width: 800px; min-height: 800px; float: left;">
	<div style="width: 100%; height: 100%; padding-left: 100px; padding-top: 30px;">
		<div>
			<h4>자격신청</h4>
		</div>
		<div>
			<form action="${pageContext.request.contextPath}/myPage/${mode}RequestQualification" method="post" name="requestQualificationForm" enctype="multipart/form-data">
				<p>
					<input type="radio" name="gubun" value="petsitter">펫시터
					<input type="radio" name="gubun" value="trainer">훈련사
					<input type="radio" name="gubun" value="company">제휴업체
				</p>
				<p>
					아이디 : <input type="text" value="${userId}" readonly="readonly" name="userId">
				</p>
				<p>
					이름 : <input type="text" value="${name}" readonly="readonly" name="name">
				</p>
				<p>
					전화번호 : <input type="text" value="${tel}" readonly="readonly" name="tel">
				</p>
				<p>
					자격증 파일 : <input type="file" name="upload" value="${dto.originalFilename}">
				</p>
				<p>
					<button type="button" onclick="sendRequest();">신청하기</button>
				</p>
				<c:if test="${mode=='update'}">
					<input type="hidden" name="requestNum" value="${dto.requestNum}">
					<input type="hidden" name="saveFilename" value="${dto.saveFilename}">
					<input type="hidden" name="originalFilename" value="${dto.originalFilename}">
				</c:if>
			</form>
		</div>
	</div>
</div>