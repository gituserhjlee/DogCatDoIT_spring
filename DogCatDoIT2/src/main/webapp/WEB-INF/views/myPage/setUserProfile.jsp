<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
$(function () {
	$(".setUserProfile-photo").click(function () {
		$(".setUserProfile-file").click();
	});
	
	$(".setUserProfile-file").change(function () {
		var file = this.files[0];
		
		if(!file.type.match("image.*")){
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function (e) {
			$(".setUserProfile-photo").empty();
			$(".setUserProfile-photo").css("background-image","url("+e.target.result+")");
		};
		reader.readAsDataURL(file);
	});
});
function sendOk() {
	var f = document.userProfileForm;

	f.action = "${pageContext.request.contextPath}/myPage/${mode}UserProfile";
	f.submit();
}
</script>
<div class="myPage-body">
	<div class="myPage-insideBody">
		<div>
			프로필 설정
		</div>
		<div>
			<form name="userProfileForm" method="post" enctype="multipart/form-data">
				<div>
					<div class="setUserProfile-photo">
						사진
					</div>
					<input type="file" class="setUserProfile-file" name="upload">
				</div>
				<ul>
					<li>이름 : <input type="text" name="animalName" value="${dto.getAnimalName()}"></li>
					<li>생일 : <input type="date" name="animalBirth" value="${dto.getAnimalBirth()}"></li>
					<li>종 : <input type="text" name="animalKind" value="${dto.getAnimalKind()}"></li>
					<li>지역 : <input type="text" name="region" value="${dto.getRegion()}"></li>
					<li>소개 : <textarea name="introduce">${dto.getIntroduce()}</textarea></li>
					<li>프로필 번호 :
						<c:if test="${countUserProfile==0}">
							<input type="text" name="orderNum" value="1" readonly="readonly">
						</c:if> 
						<c:if test="${countUserProfile!=0}">
							<input type="radio" name="orderNum" value="1">1
							<input type="radio" name="orderNum" value="2">2
							<input type="radio" name="orderNum" value="3">3
						</c:if>
					</li>
					<li><button type="button" onclick="sendOk();">완료</button></li>
				</ul>
				<c:if test="${mode=='update'}">
					<input type="hidden" name="profileNum" value="${dto.getProfileNum()}">
					<input type="hidden" name="animalPhoto" value="${dto.getAnimalPhoto()}"> 
				</c:if>
			</form>
		</div>
	</div>
</div>