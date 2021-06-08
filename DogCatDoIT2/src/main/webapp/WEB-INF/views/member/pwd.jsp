<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
	function sendOk(){
		var f = document.pwdForm;
		
		var str = f.pwd.value;
		if(!str){
			alert("패스워드를 입력하세요. ");
			f.pwd.focus();
			return;
		}
		
		f.action= "${pageContext.request.contextPath}/member/pwd";
		f.submit();
	}
</script>

<div class="body-container">
	<div>
	<div style="text-align: center;">
		<span>패스워드 재확인</span>
	</div>
	
	<form name="pwdForm" method="post">
	<table>
		<tr>
			<td style="text-align: left;">
				정보보호를 위해 패스워드를 다시 한 번 입력해주세요.
			</td>
		</tr>
		
		<tr align="center">
			<td>
				&nbsp;
				<input type="text" name="userId" class="loginTF" maxlength="15"
					value="${sessionScope.member.userId}" readonly="readonly">
				&nbsp;
			</td>
		</tr>
		
		<tr align="center">
			<td>
				&nbsp;
				<input type="password" name="pwd" id="pwd" class="loginTF" maxlength="20"
					tabindex="1" placeholder="패스워드">
				&nbsp;	
			</td>
		</tr>
		
		<tr align="center">
			<td>
				&nbsp;
				<button type="button" onclick="sendOk();" class="btnConfirm">확인</button>
				<input type="hidden" name="mode" value="${mode}">
				&nbsp;
			</td>
		</tr>
		<tr align="center">
			<td>&nbsp;</td>
		</tr>
	</table>
	</form>
	
	<table style="border-collapse: collapse;">
		<tr align="center">
			<td><span>${message}</span> </td>
		</tr>
	</table>
</div>
</div>























