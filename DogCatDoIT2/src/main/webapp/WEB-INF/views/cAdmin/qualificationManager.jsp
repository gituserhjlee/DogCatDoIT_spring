<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style type="text/css">
.hover-tr:hover {
	cursor: pointer;
	background: #fffdfd;
}

.table-content tr {
	text-align: center;
}
.table-content tr:first-child {
	background: #eee;
}
.table-content tr > th {
	color: #777;
}
</style>
<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status == 403) {
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}
	
function detailedMember(requestNum, userId, gubun) {
	var dlg = $("#member-dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 승인 " : function() {
		    	   approveOk(requestNum, userId, gubun); 
		       },
		       " 거절 " : function() {
		    	   rejectOk(requestNum, userId, gubun);
			   },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  height: 520,
		  width: 800,
		  title: "자격신청정보",
		  close: function(event, ui) {
		  }
	});

	var url = "${pageContext.request.contextPath}/cAdmin/qualificationDetail";
	var query = "requestNum="+requestNum;
	
	var fn = function(data){
		$('#member-dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", query, "html", fn);
}

function approveOk(requestNum, userId, gubun) {
	if(confirm("승인하시겠습니까?")){
		var url = "${pageContext.request.contextPath}/cAdmin/updateQualification";
		var query = "mode=approve&requestNum="+requestNum+"&userId="+userId+"&gubun="+gubun;
		
		var fn = function(data){
			alert("승인되었습니다.");
			window.location.reload();
		};
		ajaxFun(url, "post", query, "json", fn);
	}
}

function rejectOk(requestNum, userId, gubun) {
	if(confirm("승인 거절하시겠습니까?")){
		var url = "${pageContext.request.contextPath}/cAdmin/updateQualification";
		var query = "mode=reject&requestNum="+requestNum+"&userId="+userId+"&gubun="+gubun;
		
		var fn = function(data){
			alert("승인 거절되었습니다.");
			window.location.reload();
		};
		ajaxFun(url, "post", query, "json", fn);
	}
}
</script>
<main>
	<h1>Admin Page</h1>
	
	<div class="body-container">
	    <div class="body-title">
			<h2> 자격 신청 관리 </h2>
	    </div>
	    
	    <div class="body-main wx-950 ml-30">
				
			<table class="table">
				<tr>
					<td align="left" width="50%">
						${requestCount}개(${page}/${total_page} 페이지)
					</td>
					<td align="right">
						상태
						<select id="selectMember" class="selectField" onchange="searchList();">
							<option>전체</option>
							<option>요청중</option>
							<option>승인완료</option>
							<option>승인거절</option>
						</select>
					</td>
					<td align="right">
						구분
						<select id="selectMember" class="selectField" onchange="searchList();">
							<option>전체</option>
							<option>펫시터</option>
							<option>훈련사</option>
							<option>제휴업체</option>
						</select>
					</td>
				</tr>
			</table>
				
			<table class="table table-border table-content">
				<tr>
					<th style="width: 60px; color: #787878;"><input type="checkbox"></th>
					<th style="width: 60px; color: #787878;">번호</th>
					<th style="width: 100px; color: #787878;">아이디</th>
					<th style="width: 100px; color: #787878;">이름</th>
					<th style="width: 120px; color: #787878;">전화번호</th>
					<th style="width: 100px; color: #787878;">구분</th>
					<th style="width: 100px; color: #787878;">상태</th>
					<th style="width: 120px; color: #787878;">신청일</th>
					<th style="width: 80px; color: #787878;">파일</th>
				</tr>
				 
				<c:forEach var="dto" items="${list}">
					<tr class="hover-tr" onclick="detailedMember('${dto.requestNum}','${dto.userId}','${dto.gubun}');">
					 	<td align="center"><input type="checkbox"></td>
						<td align="center">${dto.listNum}</td>
						<td align="center">${dto.userId}</td>
						<td align="center">${dto.name}</td>
						<td align="center">${dto.tel}</td>
						<td align="center">${dto.gubun}</td>
						<td align="center">${dto.state}</td>
						<td align="center">${dto.req_date}</td>
						<c:if test="${not empty dto.saveFilename}">
							<td align="center"><a href="${pageContext.request.contextPath}/myPage/download?requestNum=${dto.requestNum}"><i class="far fa-file"></i></a></td>
						</c:if>
					</tr>
				</c:forEach> 
			</table>
				 
			<table class="table">
				<tr>
					<td align="center">
						${empty list? "등록된 자료가 없습니다.":paging}
					</td>
				</tr>
			</table>
				
			<table class="table">
				<tr>
					<td align="left" width="100">
						<button type="button" class="btn">승인</button>
						<button type="button" class="btn">거절</button>
						<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/cAdmin/qualificationManager';">새로고침</button>
					</td>
					<td align="right" width="100">&nbsp;</td>
				</tr>
			</table>
			
	    </div>
	</div>
	<div id="member-dialog" style="display: none;"></div>
</main>