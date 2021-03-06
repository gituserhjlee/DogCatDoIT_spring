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
	if(!str){
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
	if(str!="direct") {
		f.email2.value=str;
		f.email2.readOnly = true;
		f.email1.focus();
	} 
	else {
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
	
	<div class="body-main wx-750 content-center pt-15">
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
							placeholder="아이디는 5~10자이며 첫글자는 영문자이어야 합니다.">
					</p>
<!-- 					<p class="help-block">아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.</p>
 -->		 		</td>
			</tr>
			
			<tr>
				<td>
					<label>패스워드</label>
				</td>
				<td>
					<p>
						<input type="password" name="pwd" maxlength="15" class="boxTF lg"
							placeholder="패스워드는 5~10자 이내, 하나 이상의 숫자나 특수문자를 포함해야 합니다.">
					</p>
			<!-- 		<p class="help-block">패스워드는 5~10자 이내, 하나 이상의 숫자나 특수문자를 포함해야 합니다.</p>
			 -->	</td>
			</tr>
			
			<tr>
				<td>
					<label>패스워드 확인</label>
				</td>
				<td>
					<p>
						<input type="password" name="pwdCheck" maxlength="15" class="boxTF lg"
							placeholder="패스워드를 한번 더 입력해주세요.">
					</p>
		<!-- 			<p class="help-block">패스워드를 한번 더 입력해주세요.</p>
		 -->		</td>
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
							value="${dto.birth}" placeholder="생년월일은 YYYY-MM-DD 형식으로 입력해야 합니다.">
					</p>
		<!-- 			<p class="help-block">생년월일은 YYYY-MM-DD 형식으로 입력해야 합니다.</p>
		 -->		</td>
			</tr>
			
			<tr>
				<td>
					<label>이메일</label>
				</td>
				<td>
					 <div class="form-row">
					 	<div>
								<input type="text" name="email1" class="form-control sm" value="${dto.email1}">
						</div>
						<div>
								<p class="form-control-plaintext text-center">@</p>
						</div>
						<div>
							<input type="text" name="email2" class="form-control sm" value="${dto.email2}" readonly="readonly">						
						</div>
						<div class="col col-sm-2">
							<select class="form-control" id ="selectEmail" name="selectEmail" onchange="changeEmail();">
								<option value="">선택</option>
								<option value="naver.com" ${dto.email2=="naver.com" ? "selected='selected'" : ""}>네이버 메일</option>
								<option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>한 메일</option>
								<option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected='selected'" : ""}>핫 메일</option>
								<option value="gmail.com" ${dto.email2=="gmail.com" ? "selected='selected'" : ""}>지 메일</option>
								<option value="direct">직접입력</option>
							</select>
						</div>

					
					</div>
						
				</td>
			</tr>
			
			<tr>
				<td>
					<label>전화번호</label>
				</td>
				<td>
					 <div class="form-row">
					 	<div class="col col-sm-3">
							<select class="form-control" id="tel1" name="tel1" >
								<option value="">선택</option>
								<option value="010" ${dto.tel1=="010" ? "selected='selected'" : ""}>010</option>
								<option value="02" ${dto.tel1=="02" ? "selected='selected'" : ""}>02</option>
								<option value="031" ${dto.tel1=="031" ? "selected='selected'" : ""}>031</option>
								<option value="032" ${dto.tel1=="032" ? "selected='selected'" : ""}>032</option>
								<option value="033" ${dto.tel1=="033" ? "selected='selected'" : ""}>033</option>
								<option value="041" ${dto.tel1=="041" ? "selected='selected'" : ""}>041</option>
								<option value="042" ${dto.tel1=="042" ? "selected='selected'" : ""}>042</option>
								<option value="043" ${dto.tel1=="043" ? "selected='selected'" : ""}>043</option>
								<option value="044" ${dto.tel1=="044" ? "selected='selected'" : ""}>044</option>
								<option value="051" ${dto.tel1=="051" ? "selected='selected'" : ""}>051</option>
								<option value="052" ${dto.tel1=="052" ? "selected='selected'" : ""}>052</option>
								<option value="053" ${dto.tel1=="053" ? "selected='selected'" : ""}>053</option>
								<option value="054" ${dto.tel1=="054" ? "selected='selected'" : ""}>054</option>
								<option value="055" ${dto.tel1=="055" ? "selected='selected'" : ""}>055</option>
								<option value="061" ${dto.tel1=="061" ? "selected='selected'" : ""}>061</option>
								<option value="062" ${dto.tel1=="062" ? "selected='selected'" : ""}>062</option>
								<option value="063" ${dto.tel1=="063" ? "selected='selected'" : ""}>063</option>
								<option value="064" ${dto.tel1=="064" ? "selected='selected'" : ""}>064</option>
								<option value="070" ${dto.tel1=="070" ? "selected='selected'" : ""}>070</option>
							
							</select>
						</div>
						<div class="col col-sm-1">
							<p class="form-control-plaintext text-center">-</p>
						</div>
						<div class="col col-sm-2">
							<input type="text" name="tel2" class="form-control sm" value="${dto.tel2}">
						</div>
						<div class="col col-sm-1">
	 						<p class="form-control-plaintext text-center">-</p>
	 					</div>
	 					<div class="col col-sm-2">
							<input type="text" name="tel3" class="form-control sm" value="${dto.tel3}">
						</div>

					</div>

				</td>
			</tr>
			
<%-- 			<tr>
				<td>
					<label>우편번호</label>
				</td>
	<!-- 			<td>			
					<button type="button" class="btn" onclick="daumPostcode();" style="display: inline;">우편번호</button>          
				</td>
	 -->			<td width="20%">
	 				<button type="button" class="btn" onclick="daumPostcode();" style="display: inline;">우편번호</button>          
	
						<input maxlength="boxTF lg" type="text" name="zip" id="zip" class="form-control" value="${dto.zip}"
							readonly="readonly">
				</td>
			</tr>
			 --%>
			 
			<tr>
            <td>
               <label>우편번호</label>
            </td>
            <td>
            <div class="form-row">
               <div>
                  <input type="text" name="zip" id="zip" class="form-control sm" value="${dto.zip}"
                     readonly="readonly">
               </div>
               <div>
                  <button type="button" class="btn btn-dark btn-outline-hover-dark" style="font-family: Jua; font-size: 18px;" onclick="daumPostcode();" >우편번호</button>             
               </div>
         
            </div>
               
            </td>
         </tr>
			
			<tr>
				<td>
					<label>주소</label>
				</td>
				<td>
					<p>
						<input type="text" name="addr1" id="addr1" maxlength="50" 
							class="boxTF lg" readonly="readonly" value="${dto.addr1}"
							placeholder="기본 주소">
					</p>
					<p>
						<input type="text" name="addr2" id="addr2" maxlength="50" 
							class="boxTF lg" value="${dto.addr2}"  placeholder="나머지 주소">
					</p>
				</td>
			</tr>
			
			<c:if test="${mode=='member'}">
				<tr>
					<td>
						<label>약관동의</label>
					</td>
					<td>
						<p style="padding-top: 5px;">
							<label>
								<input id="agree" name="agree" type="checkbox" checked="checked"
									onchange="form.sendButton.disabled = !checked"> <a href="#">이용약관</a>에 동의합니다.
							</label>
						</p>
					</td>
				</tr>
			</c:if>
		</table>
		<table class="table table-footer">
			<tr> 
				<td class="text-center">
					<button type="button"  class="btn btn-dark btn-outline-hover-dark" style="font-family: Jua; font-size: 18px;" name="sendButton" class="btn" onclick="memberOk();">${mode=="member"?"회원가입":"정보수정"}</button>
<%-- 					<button type="reset" style="font-family: Jua; font-size: 18px;" class="btn">다시입력</button>
					<button type="button" style="font-family: Jua; font-size: 18px;" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/';">${mode=="member"?"가입취소":"수정취소"}</button>
 --%>				</td>
			</tr>
			<tr>
				<td style="color: blue;">${message}</td>
			</tr>
		</table>
		
		</form>
	</div>
	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                if (data.userSelectedType === 'R') { 
                    fullAddr = data.roadAddress;

                } else { 
                    fullAddr = data.jibunAddress;
                }


				    if(data.userSelectedType === 'R'){
                    
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호
                document.getElementById('addr1').value = fullAddr;

                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>	
</div>


