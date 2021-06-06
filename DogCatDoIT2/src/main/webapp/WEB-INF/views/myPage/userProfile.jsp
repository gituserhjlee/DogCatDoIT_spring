<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="template.jsp"/>
<div class="myPage-body">
	<div class="myPage-insideBody">
		<div>
			프로필
		</div>
		<div>
			<div>
				<div class="setUserProfile-photo">
					사진
				</div>
			</div>
			<ul>
				<li>이름 : 이름</li>
				<li>생일 : 생일</li>
				<li>종 : 종</li>
				<li>지역 : 지역</li>
				<li>소개 : 소개</li>
				<li>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/myPage/setUserProfile'">수정</button>
					<button type="button">삭제</button>
				</li>
			</ul>
		</div>
	</div>
</div>