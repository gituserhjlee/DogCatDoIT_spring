<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

function detailedMember(userId) {
	var dlg = $("#member-dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 수정 " : function() {
		    	   updateOk(); 
		       },
		       " 삭제 " : function() {
		    	   deleteOk(userId);
			   },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  height: 520,
		  width: 800,
		  title: "회원상세정보",
		  close: function(event, ui) {
		  }
	});

	var url = "${pageContext.request.contextPath}/cAdmin/memberDetail";
	var query = "userId="+userId;
	
	var fn = function(data){
		$('#member-dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", query, "html", fn);
}
	
function updateOk() {
	var f = document.detailedMemberForm;
	
	if(! f.clevel.value) {
		f.clevel.focus();
		return;
	}
	
	if(confirm("회원등급 : "+f.clevel.value+" 포인트 : "+f.point.value+" 설정하시겠습니까?")){
		var url = "${pageContext.request.contextPath}/cAdmin/updateMember";
		var query=$("#detailedMemberForm").serialize();

		var fn = function(data){
			window.location.reload();
			console.log(data);
			alert("수정완료");
		};
		ajaxFun(url, "post", query, "json", fn);
			
		$('#member-dialog').dialog("close");
	}
}

function deleteOk(userId) {
	if(confirm("선택한 계정을 삭제 하시겠습니까 ?")) {
		var url = "${pageContext.request.contextPath}/cAdmin/deleteMember";
		var query = "userId="+userId;
		var fn = function (data) {
			alert("삭제완료.");
			window.location.reload();
		};
		ajaxFun(url,"post",query,"json",fn);
	}
	
	$('#member-dialog').dialog("close");
}

function selectClevelChange() {
	var f = document.detailedMemberForm;
	
	var s = f.clevel.value;
	
	if(! s) {
		return;
	}
}

function searchList() {
	var f=document.searchForm;
	f.action="${pageContext.request.contextPath}/cAdmin/memberManager";
	f.submit();
}
</script>

<main>
	<div class="body-container">
	    <div class="body-title">
			<h2> 회원 관리 </h2>
	    </div>
	    
	    <div class="body-main wx-950 ml-30">
			<form method="post" name="searchForm">	
				<table class="table">
					<tr>
						<td align="left" width="50%">
							${memberCount}개(${page}/${total_page} 페이지)
						</td>
						<td align="right">
							<select name="qualificationName" class="selectField" onchange="searchList();">
								<option value="">회원전체</option>
								<option value="general" ${qName=='general'? "selected='selected'":""}>일반 회원</option>
								<option value="petsitter" ${qName=='petsitter'? "selected='selected'":""}>펫시터</option>
								<option value="trainer" ${qName=='trainer'? "selected='selected'":""}>훈련사</option>
								<option value="company" ${qName=='company'? "selected='selected'":""}>제휴 업체</option>
							</select>
						</td>
					</tr>
				</table>
			</form>
				
			<table class="table table-border table-content">
				<tr> 
					<th style="width: 60px; color: #787878;">번호</th>
					<th style="width: 100px; color: #787878;">아이디</th>
					<th style="width: 100px; color: #787878;">이름</th>
					<th style="width: 200px; color: #787878;">전화번호</th>
					<th style="width: 130px; color: #787878;">자격정보</th>
					<th style="width: 80px; color: #787878;">포인트</th>
					<th style="width: 170px; color: #787878;">이메일</th>
					<th style="width: 220px; color: #787878;">커뮤니티 등급</th>
					<th style="width: 180px; color: #787878;">쇼핑몰 등급</th>
				</tr>
				 
				<c:forEach var="dto" items="${list}">
					<tr class="hover-tr" onclick="detailedMember('${dto.userId}');"> 
						<td>${dto.listNum}</td>
						<td>${dto.userId}</td>
						<td>${dto.name}</td>
						<td>${dto.tel}</td>
						<td>${dto.qualificationName}</td>
						<td>${dto.point}</td>
						<td>${dto.email}</td>
						<td>
						<c:set var="b">${dto.clevel}</c:set>
						${map[b]}</td>
						<td>${dto.levelName}</td>
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
						<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/cAdmin/memberManager';">새로고침</button>
					</td>
					<td align="right" width="100">&nbsp;</td>
				</tr>
			</table>
			
	    </div>
	</div>
	<div id="member-dialog" style="display: none;"></div>
</main>
