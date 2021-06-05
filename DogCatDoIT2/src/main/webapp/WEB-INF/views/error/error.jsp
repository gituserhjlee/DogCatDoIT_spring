<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.alert-error {
    color:#b94a48;
    background-color:#f2dede;
    border-color:#eed3d7;
    text-align: center;
    margin-bottom: 20px;
    padding: 20px;
}

.boxLayout {
    max-width:530px;
    padding: 30px 20px 100px;
    margin: 0 auto;
}

@media (min-width: 768px) {
  .boxLayout {
    margin-top: 70px;
  }
}
</style>

<div class="body-container">
	<div class="boxLayout">  
		<div class="alert-error">
			<strong>ERROR</strong><br>
			시스템에 에러가 발생 했습니다. <br>잠시후 다시 시도 하시기 바랍니다.<br>
			에러사유: <strong>${msg}</strong>
		</div>

		<p>
			<button type="button" class="btn btn-light btn-lg btn-block" onclick="javascript:location.href='${pageContext.request.contextPath}/';"> 메인화면으로 이동 &raquo; </button>
		</p>
	</div>    
</div>