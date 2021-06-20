<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery/css/smoothness/jquery-ui.min.css" type="text/css">

<style type="text/css">

.table-content tr > td {
	padding-left: 5px; padding-right: 5px;
}
.list-content{
	display: inline-block;
	max-width: 330px;
	white-space:nowrap; overflow:hidden; text-overflow:ellipsis;
	vertical-align: middle;
}
.dialog-header {
	padding: 5px 0;
}
.dialog-receiver-list {
	padding: 5px;
	border: 1px solid #ccc;
	overflow-y: scroll;
	width: 95%;
	height: 220px;
	margin: 5px 0;
}
.dialog-receiver-list ul, .dialog-receiver-list li{
	list-style: none;
	padding: 0;
}
.dialog-footer {
	text-align: right;
	padding: 5px 0;
}
.ui-dialog-titlebar {
  background-color: white;
  background-image: none;
  border: none;
  color: #000;
}
.ui-dialog-titlebar-close {
  background-color: white;
  border: none;
}
.table th {
	border-top: none; 
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery-ui.min.js"></script>
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

$(function(){
	$(".btnReplyTalk").click(function(){
		$("#reply-dialog").dialog({
			  modal: true,
			  height: 450,
			  width: 400,
			  title: '답장하기',
			  close: function(event, ui) {
			  }
		});

	});


	$(".btnSendOk").click(function(){
		$("#reply-dialog").dialog("close");
		
		var f = document.replyForm;
		if(!f.content.value) {
			alert("내용을 입력하세요. ");
			f.content.focus();
			return false;
		}
		
		f.action="${pageContext.request.contextPath}/talk/write";
		f.submit();
	});
	
	$(".btnSendCancel").click(function(){
		$("#reply-dialog").dialog("close");
	});

});



function deleteTalk() {
	var query = "nums=${dto.num}&${query}";
	var url = "${pageContext.request.contextPath}/talk/${menuItem}/delete?" + query;

	if(confirm("쪽지를 삭제 하시 겠습니까 ? ")) {
			location.href=url;
	}
}


</script>

<div class="container body-container">
    <div class="body-title" style="margin-bottom: 25px;">
		<h2>쪽지함 </h2>
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
					<td align="left" width="50%" >
						<c:if test="${menuItem=='receive'}">
							<button type="button" class="btn btnReplyTalk btn-md btn-info" style="font-size: 17px; margin-top: 16px;">답장</button>
						</c:if>
					</td>
					<td align="right">
						<button type="button" class="btn btn-md btn-secondary" style="font-size: 17px; margin-top: 16px;" onclick="javascript:location.href='${pageContext.request.contextPath}/talk/write';">쪽지 쓰기</button>
					</td>
				</tr>
			</table>
			
			<table class="table table-border table-content">
				<tr>
					<td colspan="2" align="left">
						<c:choose>
							<c:when test="${menuItem=='receive'}">
								보낸사람 : ${dto.senderName}(${dto.senderId})
							</c:when>
							<c:when test="${menuItem=='send'}">
								받는사람 : ${dto.receiverName}(${dto.receiverId})
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td width="50%" align="left">
						<c:choose>
							<c:when test="${menuItem=='receive'}">
								받은날짜 : ${dto.sendDay}
							</c:when>
							<c:when test="${menuItem=='send'}">
								보낸날짜 : ${dto.sendDay}
							</c:when>
						</c:choose>
					</td>
					<td width="50%" align="left">
						읽은날짜 : ${empty dto.identifyDay ? "읽지 않음": dto.identifyDay}
					</td>
				</tr>
				<tr>
					<td colspan="2" valign="top" height="170">
						${dto.content}
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						이전쪽지 :
						<c:if test="${not empty preDto}">
							<div class="list-content"><a href="${pageContext.request.contextPath}/talk/${menuItem}/article?${query}&num=${preDto.num}">${preDto.content}</a></div>
						</c:if>
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						다음쪽지 :
						<c:if test="${not empty nextDto}">
							<div class="list-content"><a href="${pageContext.request.contextPath}/talk/${menuItem}/article?${query}&num=${nextDto.num}">${nextDto.content}</a></div>
						</c:if>
					</td>
				</tr>
			</table>

			<table class="table">
				<tr>
					<td width="50%">
						<button type="button" class="btn btn-md btn-outline-danger" style="font-size: 17px;" onclick="deleteTalk();">삭제</button>
					</td>
				
					<td align="right">
						<button type="button" class="btn btn-md btn-outline-secondary" style="font-size: 17px;" onclick="javascript:location.href='${pageContext.request.contextPath}/talk/${menuItem}/list?${query}';">리스트</button>
					</td>
				</tr>
			</table>
		
		</div>
	</div>
	
	<div id="reply-dialog" style="display: none;">
		<form name="replyForm" method="post">
		<table class="table">
			<tr> 
				<td valign="top" style="padding-left: 10px;"> 
					<textarea name="content" class="boxTA" style="width: 97%;"></textarea>
				</td>
			</tr>
			<tr>
				<td align="right" style="padding-top: 0;">
					<button type="button" class="btn btn-sm btn-success btnSendOk" style="font-size: 17px; margin-top: 24px;">보내기</button>
					<button type="button" class="btn btn-sm btn-outline-primary btnSendCancel" style="font-size: 17px; margin-top: 24px;">취소</button>
					<input type="hidden" name="receivers" value="${dto.senderId}">
				</td>
			</tr>
		</table>
		</form>
	</div>
	
</div>
