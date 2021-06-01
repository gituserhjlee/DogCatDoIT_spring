<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="template.jsp"/>
<div class="myPage-body">
	<div class="myPage-insideBody">
		<div>
			쿠폰
		</div>
		<div>
			사용 가능한 쿠폰
		</div>
		<div>
			쿠폰 사용 내역
			<p>
				조회기간
				<select>
					<option>기간</option>
					<option>1개월</option>
					<option>3개월</option>
					<option>6개월</option>
					<option>1년</option>
				</select>
			</p>
		</div>
	</div>
</div>