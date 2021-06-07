<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="body-container">
	<div>
		<div style="text-align: center;">
				<span style="font-weight: bold;">${title}</span>
		</div>
		
		<div class="messageBox">
			<div>${message}
			</div>
		<div>
			<button type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/';" class="btnConfirm">메인화면으로 이동</button>
		</div>
		</div>
	</div>
</div>