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
	
	str = f.tel1.value;
	if(!str){
		alert("전화번호를 입력하세요.");
		f.tel1.focus();
		return;					
	}

    str = f.tel2.value;
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel2.focus();
        return;
    }
	
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel.focus();
        return;
    }	
	
    str = f.tel3.value;
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel3.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel3.focus();
        return;
    }
    str = f.email1.value;
    if(!str){
    	alert("이메일을 입력하세요.");
    	f.email1.focus();
    	return;
    }
    str = f.email2.value;
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email2.focus();
        return;
    }
    
    f.action = "${pageContext.request.contextPath}/member/${mode}";
    f.submit();

}

function changeEmail(){
	var f = document.memberForm;
	
	var str = f.selectEmail.value;
	if(str!="direct")
		f.email2.value=str;
		f.email2.readOnly = true;
		f.email1.focus();
	} 
	else{
		f.email2.value="";
		f.email2.readOnly = false;
		f.email1.focus();
	}
}

function userIdCheck(){
	var str = $("#userId").val();
	str = str.trim();
	
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		$("#userId").focus();
		return;
	}
	
	var url = "${pageContext.request.contextPath}/member/userIdCheck";
	$.post(url, {userId:str}, function(data){
		var p = data.passed;
		if(p=="true"){
			var s="<span>"+str+"</span> 아이디는 사용 가능합니다.";
			$("#userId").parent().next(".help-block").html(s);
		}else{
			var s ="<span>"+str+"</span> 아이디는 사용할 수 없습니다.";
			$("#userId").parent().next(".help-block").html(s);
			$("#userId").val("");
			$("#userId").focus();
			
		}
	}, "json");
}

</script>

<div class="body-container">
	<div class="body-title">
		<h3><i class="fas fa-user"></i> ${mode=="member"?"회원가입":"회원 정보 수정"} </h3>
	</div>
	
	<div class="body-main">
		<form name="memberForm" method="post">
		<table class="table table-content">
			<tr>
				<td>
					<label>아이디</label>
				</td>
				<td>
					<p>
						<input type="text" name="userId" id="userId" maxlength="15" class="boxTF lg" 
							value="${dto.userId}"
							onchange="userIdCheck();"
							${mode=="update" ? "readonly='readonly' ":""}
							placeholder="아이디">
					</p>
					<p class="help-block">아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.</p>
				</td>
			</tr>
			
			<tr>
				<td>
					<label>패스워드</label>
				</td>
				<td>
					<p>
						<input type="password" name="pwd" maxlength="15" class="boxTF lg"
							placeholder="패스워드">
					</p>
					<p class="help-block">패스워드는 5~10자 이내, 하나 이상의 숫자나 특수문자를 포함해야 합니다.</p>
				</td>
			</tr>
			
			<tr>
				<td>
					<label>패스워드 확인</label>
				</td>
				<td>
					<p>
						<input type="password" name="pwd" maxlength="15" class="boxTF lg"
							placeholder="패스워드 확인">
					</p>
					<p class="help-block">패스워드를 한번 더 입력해주세요.</p>
				</td>
			</tr>
			
			<tr>
				<td>
					<label>이름</label>
				</td>
				<td>
					<p>
						<input type="text" name="name" maxlength="30" class="boxTF lg"
							value="${dto.name}"
							${mode=="update" ? "readonly='readonly' ":""} placeholder="이름">
					</p>
				</td>
			</tr>
			
			<tr>
				<td>
					<label>생년월일</label>
				</td>
				<td>
					<p>
						<input type="text" name="birth" maxlength="boxTF lg"
							value="${dto.birth}" placeholder="생년월일">
					</p>
					<p class="help-block">생년월일은 YYYY-MM-DD 형식으로 입력해야 합니다.</p>
				</td>
			</tr>
			
			<tr>
				<td>
					<label>이메일</label>
				</td>
				<td>
					<p>
						<select name="selectEmail" onchange="changeEmail();" class="selectField">
							<option value="">선택</option>
							<option value="naver.com" ${dto.email2=="naver.com" ? "selected='selected'" : ""}>네이버 메일</option>
							<option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>한 메일</option>
							<option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected='selected'" : ""}>핫 메일</option>
							<option value="gmail.com" ${dto.email2=="gmail.com" ? "selected='selected'" : ""}>지 메일</option>
							<option value="direct">직접입력</option>
						</select>
						<input type="text" name="email1" maxlength="30" class="boxTF md" value="${dto.email1}">
						<span>@</span>
						<input type="text" name="email2" maxlength="30" class="boxTF md" value="${dto.email2}" readonly="readonly">						
					</p>
				</td>
			</tr>
			
			<tr>
				<td>
					<label>전화번호</label>
				</td>
				<td>
					<p>
						<select class="selectField" id="tel1">
							<option value=""></option>
						</select>
					</p>
				</td>
			</tr>
			
		</table>
		</form>
	</div>
</div>
















