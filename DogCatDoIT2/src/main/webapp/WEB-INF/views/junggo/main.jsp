<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<style type="text/css">
.accordion {
	box-sizing: border-box;
	width: 100%;
	min-height: 50px;
	margin: 15px auto 5px;
}

.accordion h3.question {
	box-sizing: border-box;
    color:#333;
    font-weight:500;
    border:1px solid #ccc;
    background-color:#fff;
    padding:7px 15px 7px;
    border-radius:4px;	
    cursor:pointer;
    margin: 3px 0 0;
}
.accordion h3.question:hover {
	 background-color:#e6e6e6;
}

.accordion h3.question .q {
	font-weight: 600;
}
.accordion h3.question .subject:hover {
	color: #0d58ba;
}

.accordion div.answer {
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-top: none;
	min-height: 50px;
	padding: 3px 10px 10px;
	display: none;
}

.accordion div.answer > .category {
	height: 35px;
	line-height: 35px;
	border-bottom: 1px solid #eee;
}

.accordion div.answer > .content {
	padding: 7px 15px 5px;
}
.accordion div.answer > .content div:first-child {
	font-weight: 700;
	display: inline-block;
	vertical-align: top;
	padding-left: 5px;
}
.accordion div.answer > .content div:last-child {
	display: inline-block;
}

.accordion div.answer > .update {
	text-align: right;
}

.accordion h3.active {
	font-weight: 600;
	background-color: #F8FFFF;
}

</style>

<script type="text/javascript">
$(function(){
	var categoryNum = "${categoryNum}";
	var pageNo="${pageNo}";
	if(pageNo=="") {
		pageNo=1;
	}
	$("#tab-"+categoryNum).addClass("active");
	listPage(pageNo);

	$("ul.tabs li").click(function() {
		categoryNum = $(this).attr("data-categoryNum");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+categoryNum).addClass("active");
		
		listPage(1);
	});
});

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
			} else if(jqXHR.status===410) {
				listPage(1);
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

// 글리스트 및 페이징 처리
function listPage(page) {
	var $tab = $(".tabs .active");
	var categoryNum = $tab.attr("data-categoryNum");
	
	var url="${pageContext.request.contextPath}/junggo/list";
	var query="pageNo="+page+"&categoryNum="+categoryNum;
	var search=$('form[name=junggoSearchForm]').serialize();
	query=query+"&"+search;
	
	var selector = "#tab-content";
	
	var fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

// 검색
function searchList() {
	var f=document.junggoSearchForm;
	f.condition.value=$("#condition").val();
	f.keyword.value=$.trim($("#keyword").val());

	listPage(1);
}

// 새로고침
function reloadJunggo() {
	var f=document.junggoSearchForm;
	f.condition.value="all";
	f.keyword.value="";
	
	listPage(1);
}

// 글 삭제
function deleteJunggo(num, page) {
	var url="${pageContext.request.contextPath}/junggo/delete";
	
	var query="num="+num;
	
	if(! confirm("위 게시물을 삭제 하시 겠습니까 ? ")) {
		  return;
	}
	
	var fn = function(data){
		listPage(page);
	};
	
	ajaxFun(url, "post", query, "json", fn);
}

function articleView(num, page) {
	var url="${pageContext.request.contextPath}/junggo/article";
	var query="num="+num+"&pageNo="+page;
	
	var selector = "#tab-content";
	
	var fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

$(function(){
	$("body").on("click", ".btnSendReply", function(){
		var num=$(this).attr("data-num");
		
		var $tb = $(this).closest("table");
		var content=$tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/junggo/insertReply";
		var query="num="+num+"&content="+content+"&answer=0";
		
		var fn = function(data){
			$tb.find("textarea").val("");
			
			var state=data.state;
			if(state==="true") {
				listReply(1);
			} else if(state==="false") {
				alert("댓글을 추가 하지 못했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

function listReply(page) {
	var url = "${pageContext.request.contextPath}/junggo/listReply";
	var num = $(".btnSendReply").attr("data-num");
	var query = "num="+num+"&pageNo="+page;
	var selector = "#listReply";
	
	var fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

</script>

<div class="container body-container">

    
	<div class="body-main wx-800 ml-30 pt-15">
		<div class="alert-info">
			<i class="icofont-info-circle"></i>
</div>

		<div>
			<ul class="tabs">
				<li id="tab-0" data-categoryNum="0">모두</li>
				<c:forEach var="dto" items="${listCategory}">
					<li id="tab-${dto.categoryNum}" data-categoryNum="${dto.categoryNum}">${dto.category}</li>
				</c:forEach>
			</ul>
		</div>
		<div id="tab-content" style="padding: 15px 10px 5px; clear: both;"></div>
	</div>
</div>


