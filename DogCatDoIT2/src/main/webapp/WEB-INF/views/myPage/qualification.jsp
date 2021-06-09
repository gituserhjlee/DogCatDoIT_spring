<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="myPage-body">
	<div class="myPage-insideBody">
		<div>
			자격신청
		</div>
		<div>
			<p>
				<input type="radio" name="자격분류" value="펫시터">펫시터
				<input type="radio" name="자격분류" value="훈련사">훈련사
				<input type="radio" name="자격분류" value="제휴업체">제휴업체
			</p>
			<p>
				회원 정보 받아오는 곳
			</p>
			<p>
				자격증 파일 : <input type="file">
			</p>
			<p>
				<button type="button">신청하기</button>
			</p>
		</div>
	</div>
</div>