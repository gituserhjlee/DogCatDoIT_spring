<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
function deleteProfile(profileNum, animalPhoto) {
	if(confirm("삭제하시겠습니까?")){
		location.href='${pageContext.request.contextPath}/myPage/deleteUserProfile?profileNum='+profileNum+'&animalPhoto='+animalPhoto;
	}
}
$(function () {
	$("#insert").click(function() {
		$("#insertbtn").click();
	});
});
</script>
<div style="width: 800px; min-height: 800px; float: left;">
	<div style="width: 100%; height: 100%; padding-left: 100px; padding-top: 30px;">
		<div>
			<h4 style="margin-bottom: 30px;">프로필</h4>
		</div>
		<c:forEach var="dto" items="${list}">
			<div style="clear: both; padding-top: 20px; height: 320px;">
				<div style="width: 200px; height: 200px; border-radius: 50%; background: #eee; text-align: center;	line-height: 200px; background-image: url(${pageContext.request.contextPath}/uploads/userProfile/${dto.animalPhoto}); background-size: 200px; float: left;"></div>
				<div style="float: left;">
					<ul style="list-style: none; float: left;">
						<li>이름 : ${dto.animalName}</li>
						<li>생일 : ${dto.animalBirth}</li>
						<li>나이 : ${dto.animalAge}</li>
						<li>종 : ${dto.animalKind}</li>
						<li>지역 : ${dto.region}</li>
						<li>소개 : ${dto.introduce}</li>
					</ul>
					<div style="clear: both; padding-bottom: 20px;">
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/myPage/updateUserProfile?profileNum=${dto.profileNum}'" style="background: white; border:1px solid #eee; border-radius: 5px; margin-top: 20px;">수정</button>
						<button type="button" onclick="deleteProfile('${dto.profileNum}','${dto.animalPhoto}')" style="background: white; border:1px solid #eee; border-radius: 5px; margin-top: 20px;">삭제</button>
					</div>
				</div>
			</div>
		</c:forEach>
		<c:if test="${countUserProfile<=3}">
			<div style="border: 1px solid #eee; width: 200px; height: 200px; border-radius: 50%; background: white; text-align: center; line-height: 200px; font-size: 150px; color: #eee; margin-bottom: 30px; cursor: pointer;" id="insert">+
				<button type="button" onclick="location.href='${pageContext.request.contextPath}/myPage/insertUserProfile'" id="insertbtn" style="display: none;">추가</button>
			</div>
		</c:if>
	</div>
</div>