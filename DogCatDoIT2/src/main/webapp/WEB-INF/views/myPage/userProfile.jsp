<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
function deleteProfile() {
	if(confirm("삭제하시겠습니까?")){
		location.href='${pageContext.request.contextPath}/myPage/deleteUserProfile?profileNum=${profileNum}&animalPhoto=${animalPhoto}';
	}
}
</script>
<div style="width: 800px; min-height: 800px; float: left;">
	<div style="width: 100%; height: 100%; padding-left: 100px; padding-top: 30px;">
		<div>
			<h4>프로필</h4>
		</div>
		<div>
			<div>
				<div style="width: 200px; height: 200px; border-radius: 50%; background: #eee; text-align: center;	line-height: 200px; background-image: url(${pageContext.request.contextPath}/uploads/userProfile/${animalPhoto})">
				</div>
			</div>
			<ul style="list-style: none;">
				<li>이름 : ${animalName}</li>
				<li>생일 : ${animalBirth}</li>
				<li>나이 : ${animalAge}</li>
				<li>종 : ${animalKind}</li>
				<li>지역 : ${region}</li>
				<li>소개 : ${introduce}</li>
				<li>
					<c:if test="${countUserProfile!=3}">
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/myPage/insertUserProfile'">추가</button>
					</c:if>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/myPage/updateUserProfile?orderNum=${orderNum}'">수정</button>
					<button type="button" onclick="deleteProfile()">삭제</button>
				</li>
			</ul>
			<c:if test="${countUserProfile==2}">
				<a href="${pageContext.request.contextPath}/myPage/userProfile?orderNum=1">1</a>&nbsp;
				<a href="${pageContext.request.contextPath}/myPage/userProfile?orderNum=2">2</a>
			</c:if>
			<c:if test="${countUserProfile==3}">
				<a href="${pageContext.request.contextPath}/myPage/userProfile?orderNum=1">1</a>&nbsp;
				<a href="${pageContext.request.contextPath}/myPage/userProfile?orderNum=2">2</a>&nbsp;
				<a href="${pageContext.request.contextPath}/myPage/userProfile?orderNum=3">3</a>
			</c:if>
		</div>
	</div>
</div>