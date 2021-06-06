<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="template.jsp"/>
<div>
	<div>
		<div>
			회원 관리
		</div>
		<div>
			<div>
				회원 구분
				<select>
					<option>전체회원</option>
					<option>펫시터</option>
					<option>훈련사</option>
					<option>제휴업체</option>
				</select>
			</div>
			<div>
				회원리스트 뜨는 곳
			</div>
		</div>
	</div>
</div>