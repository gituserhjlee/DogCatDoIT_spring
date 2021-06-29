<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="body-container">
	<div>
		<div style="font-weight: bold; text-align: center; margin-bottom: 30px; margin-top: 30px;">
				<span style="font-size: 40px;">${title}</span>
		</div>
		
		<div class="messageBox">
			<div style="font-size: 25px; text-align: center; margin-bottom: 30px;">${message}
			</div>
		<div  style="text-align: center; margin-bottom: 30px;">
			<button type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/';" class="btn btn-outline-dark" >메인화면으로 이동</button>
		</div>
		</div>
	</div>
</div>