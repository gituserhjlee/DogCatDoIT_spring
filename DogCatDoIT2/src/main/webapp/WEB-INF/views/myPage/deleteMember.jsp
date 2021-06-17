<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
function deleteMember() {
	var f = document.deleteForm;
	
	var str = f.check.value;
	if(str!="독캣두잇 번창하세요"){
		alert("똑띠 입력해주세요");
		f.check.focus();
		return;
	}
	
	f.submit();
}
</script>
<div style="width: 800px; min-height: 800px; float: left;">
	<div style="width: 100%; height: 100%; padding-left: 100px; padding-top: 30px;">
		<div>
			<h4>회원 탈퇴</h4>
		</div>
		<div>
			<p>탈퇴를 원하시면 '독캣두잇 번창하세요'를 입력해주세요.</p>
			<form name="deleteForm" method="post" action="${pageContext.request.contextPath}/myPage/deleteMember">
				<p>
					<input type="text" name="check">
					<button type="button" onclick="deleteMember()">회원탈퇴</button>
				</p>
			</form>
		</div>
	</div>
</div>