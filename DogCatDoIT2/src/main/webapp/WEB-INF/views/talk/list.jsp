<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<style type="text/css">
.table-content tr {
	text-align: center;
}
.table-content tr:first-child {
	background: #eee;
}
.table-content tr > th {
	color: #777;
}
.table-content tr > td:nth-child(2) {
	box-sizing: border-box;
	padding-left: 10px;
	text-align: left;
}
.list-content{
	display: inline-block;
	max-width: 330px;
	white-space:nowrap; overflow:hidden; text-overflow:ellipsis;
	vertical-align: middle;
}
.unread{
	background: #fff;
}
</style>

<script type="text/javascript">
$(function(){
	var menu = "${menuItem}";
	$("#tab-"+menu).addClass("active");

	$("ul.tabs li").click(function() {
		tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");

		var url = "${pageContext.request.contextPath}/talk/"+tab+"/list";
		location.href=url;
	});
});

function searchList() {
	var f=document.searchForm;
	f.submit();
}

$(function() {
    $("#chkAll").click(function() {
	   if($(this).is(":checked")) {
		   $("input[name=nums]").prop("checked", true);
        } else {
		   $("input[name=nums]").prop("checked", false);
        }
    });
 
    $(".btnDelete").click(function(){
		var cnt = $("input[name=nums]:checked").length;

		if (cnt == 0) {
			alert("삭제할 쪽지를 먼저 선택 하세요 !!!");
			return;
		}
         
		if(confirm("선택한 쪽지를 삭제 하시 겠습니까 ? ")) {
			var f = document.listForm;
			f.action = "${pageContext.request.contextPath}/talk/${menuItem}/delete";
			f.submit();
		}
	});
});
</script>

<div class="container body-container">
    <div class="body-title">
		<h2><i class="icofont-ui-messaging"></i> 쪽지함 </h2>
    </div>
    
    <div class="body-main wx-800 ml-30 pt-15">
		<div>
			<ul class="tabs">
				<li id="tab-receive" data-tab="receive">받은 쪽지함</li>
				<li id="tab-send" data-tab="send">보낸 쪽지함</li>
			</ul>
		</div>
		<div id="tab-content" style="clear:both; padding: 20px 10px 0;">
		
			<table class="table">
				<tr>
					<td align="left" width="50%">
						<button type="button" class="btn btnDelete" title="삭제"><i class="icofont-trash"></i></button>
					</td>
					<td align="right">
						<button type="button" class="btn btn-dark" onclick="javascript:location.href='${pageContext.request.contextPath}/talk/write';">쪽지 쓰기</button>
					</td>
				</tr>
			</table>
			
			<form name="listForm" method="post">
				<table class="table table-border table-content">
					<tr> 
						<th width="40"><input type="checkbox" name="chkAll" id="chkAll" style="margin-top: 3px;"> </th>
						<th>내용</th>
						<th width="110">${menuItem=="receive"?"보낸사람":"받는사람"}</th>
						<th width="150">${menuItem=="receive"?"받은날짜":"보낸날짜"}</th>
						<th width="150">읽은날짜</th>
					</tr>
					
					<c:forEach var="dto" items="${list}">
					<tr class="${empty dto.identifyDay?'unread':''}"> 
						<td><input type="checkbox" name="nums" value="${dto.num}"> </td>
						<td>
							<div class="list-content"><a href="${articleUrl}&num=${dto.num}">${dto.content}</a></div>
						</td>
						<td>${menuItem=="receive"?dto.senderName:dto.receiverName}</td>
						<td>${dto.sendDay}</td>
						<td>${dto.identifyDay}</td>
					</tr>
					</c:forEach>
				</table>
				<input type="hidden" name="page" value="${page}">
				<input type="hidden" name="condition" value="${page}">
				<input type="hidden" name="keyword" value="${page}">
			</form>
		
			<table class="table">
				<tr>
					<td align="center">${dataCount==0?"쪽지함이 비었습니다.":paging}</td>
				</tr>
			</table>
			
			<table class="table">
				<tr>
					<td align="left" width="100">
						<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/talk/${menuItem}/list';" title="새로고침"> <i class="icofont-ui-reply"></i> </button>
					</td>
					<td align="center">
						<form name="searchForm" action="${pageContext.request.contextPath}/talk/${menuItem}/list" method="post">
							<select name="condition" class="selectField">
								<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
								<c:choose>
									<c:when test="${menuItem=='receive'}">
										<option value="senderName" ${condition=="senderName"?"selected='selected'":""}>보낸사람</option>
										<option value="senderId" ${condition=="senderId"?"selected='selected'":""}>아이디</option>
										<option value="sendDay" ${condition=="created"?"selected='selected'":""}>받은날짜</option>
									</c:when>
									<c:otherwise>
										<option value="receiverName" ${condition=="receiverName"?"selected='selected'":""}>받는사람</option>
										<option value="receiverId" ${condition=="receiverId"?"selected='selected'":""}>아이디</option>
										<option value="sendDay" ${condition=="created"?"selected='selected'":""}>보낸날짜</option>
									</c:otherwise>
								</c:choose>
							</select>
							<input type="text" name="keyword" value="${keyword}" class="boxTF">
							<button type="button" class="btn" onclick="searchList()" title="검색"> <i class="icofont-search-1"></i> </button>
						</form>
					</td>
					<td align="right" width="100">
						&nbsp;
					</td>
				</tr>
			</table>
		
		</div>
	</div>
</div>
