<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
<style type="text/css">
	.photo{
		width: 50px;
		height: 50px;
		border-radius: 50%;
		background: gray;
		text-align: center;
		line-height: 50px;
	}
</style>
</head>
<jsp:include page="template.jsp"/>
<div>
	<div>
		프로필 설정
	</div>
	<div>
		<div class="photo">
			사진
		</div>
		<ul>
			<li>이름 : <input type="text"></li>
			<li>생일 : <input type="date"></li>
			<li>종 : <input type="text"></li>
			<li>지역 : <input type="text"></li>
			<li>소개 : <textarea></textarea></li>
		</ul>
	</div>
</div>