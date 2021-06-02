<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
function sendLogin(){
	var f = document.loginForm;
	
	if(! f.userId.value){
		alert("아이디를 입력하세요.");
		f.userId.focus();
		return;
	}
	
	if(! f.pwd.value){
		alert("패스워드를 입력하세요.");
		f.pwd.focus();
		return;
	}
	
	f.action= "${pageContext.request.contextPath}/member/login";
	f.submit();
}
</script>

<div class="body-contatiner">
	<div style="text-align: center;">
		<span style="font-weight: bold; font-size: 27px; color: #424951;">회원 로그인</span>
	</div>
	
	<form name="loginForm" method="post">
		<table style="margin: 15px auto; width: 100%; border-spacing: 0;">
			<tr align="center">
				<td>
					<input type="text" name="userId" class="loginTF" 
					maxlength="15" tabindex="1" placeholder="아이디">
				</td>
			</tr>
			<tr align="center">
				<td>
					<input type="password" name="pwd" class="loginTF"
					maxlength="20" tabindex="2" placeholder="패스워드">
				</td>
			</tr>
			<tr>
				<td>
					<button type="button" onclick="sendLogin();"
					 class="btnConfirm">로그인</button>
				</td>
			</tr>
			
			<tr align="center">
				<td>
					<a href="${pageContext.request.contextPath}/">아이디찾기</a>&nbsp;&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/">패스워드찾기</a>&nbsp;&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/member/member">회원가입</a>
				</td>
			</tr>
			
			<tr align="center">
				<td>
					<span style="color: green;">${message}</span>
				</td>
			</tr>
		</table>
	</form>
</div>
