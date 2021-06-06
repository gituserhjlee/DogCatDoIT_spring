<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
<script type="text/javascript">
$(function () {
	$(".setUserProfile-photo").click(function () {
		$(".setUserProfile-file").click();
	});
});
function sendOk() {
	var f = document.userProfileForm;
	
	f.action = "${pageContext.request.contextPath}/myPage/setUserProfile";
	f.submit();
}
</script>
<jsp:include page="template.jsp"/>
<div class="myPage-body">
	<div class="myPage-insideBody">
		<div>
			프로필 설정
		</div>
		<div>
			<form name="userProfileForm" method="post">
				<div>
					<div class="setUserProfile-photo">
						사진
					</div>
					<input type="file" class="setUserProfile-file" name="animalPhoto">
				</div>
				<ul>
					<li>이름 : <input type="text" name="animalName"></li>
					<li>생일 : <input type="date" name="animalBirth"></li>
					<li>종 : <input type="text" name="animalKind"></li>
					<li>지역 : <input type="text" name="region"></li>
					<li>소개 : <textarea name="introduce"></textarea></li>
					<li><button type="button" onclick="sendOk();">완료</button></li>
				</ul>
			</form>
		</div>
	</div>
</div>