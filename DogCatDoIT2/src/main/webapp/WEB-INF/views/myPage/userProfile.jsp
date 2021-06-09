<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="myPage-body">
	<div class="myPage-insideBody">
		<div>
			프로필
		</div>
		<div>
			<div>
				<div class="setUserProfile-photo" style="background-image: url(${pageContext.request.contextPath}/uploads/userProfile/${animalPhoto})">
				</div>
			</div>
			<ul>
				<li>이름 : ${animalName}</li>
				<li>생일 : ${animalBirth}</li>
				<li>나이 : ${animalAge}</li>
				<li>종 : ${animalKind}</li>
				<li>지역 : ${region}</li>
				<li>소개 : ${introduce}</li>
				<li>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/myPage/insertUserProfile'">추가</button>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/myPage/updateUserProfile?orderNum=${orderNum}'">수정</button>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/myPage/deleteUserProfile?profileNum=${profileNum}&animalPhoto=${animalPhoto}'">삭제</button>
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