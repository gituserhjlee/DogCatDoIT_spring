<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dateUtil.js"></script>
<script type="text/javascript">
function memberOk(){
	var f = document.memberForm;
	var str;
	
	str = f.userId.value;
	if(!str){
		alert("아이디를 입력하세요.");
		f.userId.focus();
		return;
	}
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
		f.userId.focus();
		return;
	}
	
	str = f.pwd.value;
	if(!str){
		alert("패스워드를 입력하세요.");
		f.pwd.focus();
		return;
	}
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
		f.pwd.focus();
		return;
	}

	if(str!=f.pwdCheck.value){
		alert("패스워드가 일치하지 않습니다.");
		f.pwdCheck.focus();
		return;
	}
	
	str = f.name.value;
	if(!str){
		alert("이름을 입력하세요.");
		f.name.focus();
		return;
	}
	
	str = f.birth.value;
	if(!str || isValidDateFormat(str)){
        alert("생년월일를 입력하세요[YYYY-MM-DD]. ");
        f.birth.focus();
        return;
		
	}
	
	str = f.tel.value;
	if(!str){
		alert("전화번호를 입력하세요.");
		f.tel.focus();
		return;					
	}
	
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel.focus();
        return;
    }	
	
    str = f.email.value;
    if(!str){
    	alert("이메일을 입력하세요.");
    	f.email.focus();
    	return;
    }
    
    f.action = "${pageContext.request.contextPath}/member/${mode}";
    f.submit();

}

function changeEmail(){
	var f = document.memberForm;
	
	var str = f.selectEmail.value;
	if(str!="direct")
		f.email.value=str;
		f.email.readOnly = true;
		f
}






























</script>