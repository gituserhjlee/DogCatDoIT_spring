<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div>
	<div>
		<h3>관리자 페이지</h3>
	</div>
	<div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/cAdmin/memberManager">회원 관리</a></li>
			<li><a href="${pageContext.request.contextPath}/cAdmin/qualificationManager">자격 신청 관리</a></li>
			<li><a href="${pageContext.request.contextPath}/cAdmin/postManager">게시글 관리</a></li>
		</ul>
	</div>
</div>