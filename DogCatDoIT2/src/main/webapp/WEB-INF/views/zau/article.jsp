<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style type="text/css">
.body-container {
	max-width: 700px; margin: 10px auto 5px; padding-top: 20px;
}

.table-content {
	margin-top: 25px;
}
.table-content tr {
	border-bottom: 1px solid #ccc;
}
.table-content thead tr:first-child {
	border-top: 2px solid #ccc;
}

.table-content tr > td {
	/*padding: 7px 5px;*/
}

.table-footer {
	margin: 5px auto;
}
.table-footer tr {
	height:45px;
}
.table-footer tr>td {
	padding-left: 0;
	padding-right: 0;
}

.table-reply {
	margin-top: 15px;
}
.table-reply tr>td {
	padding-left: 0;
	padding-right: 0;
}
</style>

<script type="text/javascript">
<c:if test="${dto.userId == sessionScope.member.userId || sessionScope.member.userId == 'admin' }">
function deleteBoard() {
	if(confirm("게시물을 삭제 하시겠습니까 ?")) {
		var num = "${dto.num}";
		var url="${pageContext.request.contextPath}/zau/delete?num="+num+"&${query}";
		location.href=url;
	}
}
</c:if>

</script>

<script type="text/javascript">
function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status===403) {
				login();
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	$(".btnSendBoardLike").click(function(){
		if(! confirm("게시물에 공감 하십니까 ? ")) {
			return false;
		}
		
		var url="${pageContext.request.contextPath}/zau/insertBoardLike";
		var num="${dto.num}";
		var query="num="+num;
		
		var fn = function(data){
			var state=data.state;
			if(state==="true") {
				var count = data.boardLikeCount;
				$("#boardLikeCount").text(count);
			} else if(state==="false") {
				alert("게시글 공감은 한번만 가능합니다. !!!");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

$(function(){
	listPage(1);
});

function listPage(page) {
	var url = "${pageContext.request.contextPath}/zau/listReply";
	var query = "num=${dto.num}&pageNo="+page;
	var selector = "#listReply";

	var fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

$(function(){
	$(".btnSendReply").click(function(){
		var num="${dto.num}";
		var $tb = $(this).closest("table");
		var content=$tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/zau/insertReply";
		var query="num="+num+"&content="+content+"&answer=0";
		
		var fn = function(data){
			$tb.find("textarea").val("");
			
			var state=data.state;
			if(state==="true") {
				listPage(1);
			} else if(state==="false") {
				alert("댓글을 추가 하지 못했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});


$(function(){
	$("body").on("click", ".deleteReply", function(){
		if(! confirm("게시글을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		var replyNum=$(this).attr("data-replyNum");
		var page=$(this).attr("data-pageNo");
		
		var url="${pageContext.request.contextPath}/zau/deleteReply";
		var query="replyNum="+replyNum+"&mode=reply";
		
		var fn = function(data){
			listPage(page);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

$(function(){
	$("body").on("click", ".btnSendReplyLike", function(){
		var replyNum=$(this).attr("data-replyNum");
		var replyLike=$(this).attr("data-replyLike");
		var $btn = $(this);
		
		var msg="게시글이 마음에 들지 않으십니까 ?";
		if(replyLike==="1") {
			msg="게시글에 공감하십니까 ?";
		}
		if(! confirm(msg)) {
			return false;
		}
		
		var url="${pageContext.request.contextPath}/zau/insertReplyLike";
		var query="replyNum="+replyNum+"&replyLike="+replyLike;
		
		var fn = function(data){
			var state=data.state;
			if(state==="true") {
				var likeCount=data.likeCount;
				var disLikeCount=data.disLikeCount;
				
				$btn.parent("td").children().eq(0).find("span").html(likeCount);
				$btn.parent("td").children().eq(1).find("span").html(disLikeCount);
			} else if(state==="false") {
				alert("게시글 공감 여부는 한번만 가능합니다. !!!");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

function listReplyAnswer(answer) {
	var url="${pageContext.request.contextPath}/zau/listReplyAnswer";
	var query="answer="+answer;
	var selector="#listReplyAnswer"+answer;
	
	var fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);	
}

function countReplyAnswer(answer) {
	var url="${pageContext.request.contextPath}/zau/countReplyAnswer";
	var query="answer="+answer;
	
	var fn = function(data){
		var count=data.count;
		var vid="#answerCount"+answer;
		$(vid).html(count);
	};
	
	ajaxFun(url, "post", query, "json", fn);
}

$(function(){
	$("body").on("click", ".btnReplyAnswerLayout", function(){
		var $trReplyAnswer = $(this).closest("tr").next();
		
		var isVisible = $trReplyAnswer.is(':visible');
		var replyNum = $(this).attr("data-replyNum");
			
		if(isVisible) {
			$trReplyAnswer.hide();
		} else {
			$trReplyAnswer.show();
            
			listReplyAnswer(replyNum);
			
			countReplyAnswer(replyNum);
		}
	});
	
});

$(function(){
	$("body").on("click", ".btnSendReplyAnswer", function(){
		var num="${dto.num}";
		var replyNum=$(this).attr("data-replyNum");
		var $td=$(this).closest("td");
		
		var content=$td.find("textarea").val().trim();
		if(! content) {
			$td.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/zau/insertReply";
		var query="num="+num+"&content="+content+"&answer="+replyNum;
		
		var fn = function(data){
			$td.find("textarea").val("");
			
			var state=data.state;
			if(state==="true") {
				listReplyAnswer(replyNum);
				countReplyAnswer(replyNum);
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

$(function(){
	$("body").on("click", ".deleteReplyAnswer", function(){
		if(! confirm("게시글을 삭제하시겠습니까 ? ")) {
		    return;
		}
		
		var replyNum=$(this).attr("data-replyNum");
		var answer=$(this).attr("data-answer");
		
		var url="${pageContext.request.contextPath}/zau/deleteReply";
		var query="replyNum="+replyNum+"&mode=answer";
		
		var fn = function(data){
			listReplyAnswer(answer);
			countReplyAnswer(answer);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});
</script>


<div class="container body-container">
    <div class="body-title">
        <h2><i class="icofont-google-talk"></i> 자유게시판 </h2>
    </div>
    
    <div class="body-main wx-700 ml-30 pt-15">
		<table class="table table-border table-content">
			<tr>
				<td colspan="2" align="center">
					${dto.subject}
				</td>
			</tr>
			
			<tr>
				<td width="50%" align="left">
					이름 : ${dto.name}
				</td>
				<td width="50%" align="right">
					${dto.regi_date} | 조회 ${dto.read_count}
				</td>
			</tr>
			
			<tr>
				<td colspan="2" valign="top" height="200">
					${dto.content}
				</td>
			</tr>
				<tr>
				<td colspan="2">
					이전글 :
					<c:if test="${not empty preReadDto}">
						<a href="${pageContext.request.contextPath}/zau/article?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
					</c:if>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					다음글 :
					<c:if test="${not empty nextReadDto}">
						<a href="${pageContext.request.contextPath}/zau/article?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
					</c:if>
				</td>
			</tr>
	
			</table>
			
		<table class="table">
			<tr>
				<td width="50%" align="left">
			    	<c:choose>
			    		<c:when test="${sessionScope.member.userId==dto.userId}">
			    			<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/zau/update?num=${dto.num}&page=${page}';">수정</button>
			    		</c:when>
			    		<c:otherwise>
			    			<button type="button" class="btn" disabled="disabled">수정</button>
			    		</c:otherwise>
			    	</c:choose>
				    	<c:choose>
			    		<c:when test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
			    			<button type="button" class="btn" onclick="deleteBoard();">삭제</button>
			    		</c:when>
			    		<c:otherwise>
			    			<button type="button" class="btn" disabled="disabled">삭제</button>
			    		</c:otherwise>
			    	</c:choose>
				</td>
			
				<td align="right">
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/zau/list?${query}';">리스트</button>
				</td>
		</tr>
</table>	
		
	    <div>
			<table class="table table-borderless table-reply">
				<tr height='30'> 
					<td align='left'>
						<span style='font-weight: bold;' >댓글쓰기</span><span> - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span>
					</td>
				</tr>
				<tr>
					<td align="right" style='padding:5px 0 0 5px;'>
						<textarea class='boxTA' style='width:99%; height: 70px;'></textarea>
					</td>
				</tr>
				<tr>
				   <td align='right'>
				        <button type='button' class='btn btn-light btnSendReply' style='padding:10px 20px;'>댓글 등록</button>
				    </td>
				 </tr>
			</table>

	<div id="listReply"></div>
			
    </div>
</div></div>  