<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
function check() {
	var f = document.checkForm;
	
	var str = f.pwd.value;
    if(!str) {
        alert("패스워드를 입력하세요. ");
        f.pwd.focus();
        return;
    }
	
	f.submit();
}
</script>
<div class="myPage-body">
	<div class="myPage-insideBody">
		<div>
			회원 정보 확인
		</div>
		<form name="checkForm" method="post" action="${pageContext.request.contextPath}/myPage/checkPwd">
			<p>아이디 : <input type="text" value="${sessionScope.member.userId}" readonly="readonly" name="userId"></p>
			<p>
				패스워드 : 
				<input type="password" name="pwd">
				<button type="button" onclick="check()">확인</button>
			</p>
			<p>
				${message}
			</p>
			<input type="hidden" value="${mode}" name="mode">
		</form>
	</div>
</div>