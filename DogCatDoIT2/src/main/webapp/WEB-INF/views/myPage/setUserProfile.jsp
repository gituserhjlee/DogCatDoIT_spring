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
			$(".setUserProfile-photo").css("background-size","200px");
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
<div style="width: 800px; min-height: 800px; float: left;">
	<div style="width: 100%; height: 100%; padding-left: 100px; padding-top: 30px;">
		<div>
			<h4 style="margin-bottom: 30px;">
				<c:if test="${mode=='insert'}">프로필 설정</c:if>
				<c:if test="${mode=='update'}">프로필 수정</c:if>
			</h4>
		</div>
		<div>
			<form name="userProfileForm" method="post" enctype="multipart/form-data">
				<div align="center">
					<div class="setUserProfile-photo" style="width: 200px; height: 200px; border-radius: 50%; background: #eee; text-align: center;	line-height: 200px; background: #eee; text-align: center;	line-height: 200px; background-image: url(${pageContext.request.contextPath}/uploads/userProfile/${dto.animalPhoto}); background-size: 200px;">
						<c:if test="${mode=='insert'}">사진</c:if>
					</div>
					<input type="file" class="setUserProfile-file" name="upload" style="display: none;">
				</div>
				<ul style="list-style: none; padding: 0">
					<li>이름 : <input type="text" name="animalName" value="${dto.getAnimalName()}"></li>
					<li>생일 : <input type="date" name="animalBirth" value="${dto.getAnimalBirth()}"></li>
					<li>종 : <input type="text" name="animalKind" value="${dto.getAnimalKind()}"></li>
					<li>지역 : <input type="text" name="region" value="${dto.getRegion()}"></li>
					<li>소개 : <textarea name="introduce">${dto.getIntroduce()}</textarea></li>
					<li><button type="button" onclick="sendOk();" style="float: right; background: white; border:1px solid #eee; border-radius: 5px; margin:20px 0;">완료</button></li>
				</ul>
				<c:if test="${mode=='update'}">
					<input type="hidden" name="profileNum" value="${dto.getProfileNum()}">
					<input type="hidden" name="animalPhoto" value="${dto.getAnimalPhoto()}"> 
				</c:if>
			</form>
		</div>
	</div>
</div>