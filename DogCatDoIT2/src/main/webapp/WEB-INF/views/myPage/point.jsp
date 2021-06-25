<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap4/css/bootstrap-icons.css" type="text/css">
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

$(function() {
	listPage(1);
});

function listPage(pageNum) {
	let url = "${pageContext.request.contextPath}/myPage/point/HistoryList";
	let month = $(".month").val();
	let query = "pageNum="+pageNum+"&month="+month;
	let fn = function(data) {
		printList(data);
	};
	
	ajaxFun(url, "get", query, "json",fn);	
}

function printList(data) {
	let dataCount = data.dataCount;
	let totalPage = data.total_page;
	let pageNum = data.pageNum;
	let offset = data.offset;
	let paging = data.paging;
	let point = data.point;
	
	$(".point").text(point);
	$(".dataCount").text(dataCount);
	$(".totalPage").text(totalPage);
	$(".pageNum").text(pageNum);
	
	if(dataCount==0) {
		$(".list").empty();
		$(".paging").html("조회된 포인트 내역이 없습니다.");
		return false;
	}
	
	let out = "";
	let listNum = parseInt(offset) + parseInt(0);
	for(let idx=0; idx< data.list.length; idx++) {
		let amount = data.list[idx].amount;
		let by_what = data.list[idx].by_what;
		let get_date = data.list[idx].get_date;
		
		out += "<tr>";
		out += "<td align='center'>" + (++listNum) + "</td>";
		out += "<td align='center'>" + amount + "</td>";
		out += "<td align='center'>" + by_what + "</td>";
		out += "<td align='center'>" + get_date + "</td>";
		out += "</tr>";
	}
	
	$(".list").html(out);
	$(".paging").html(paging);
}


$("body").on("change", ".month", function() {
	listPage(1);
});
</script>

<div style="width: 800px; min-height: 800px; float: left;">
	<div style="width: 100%; height: 100%; padding-left: 100px; padding-top: 30px;">
		<div>
			<h4 style="margin-bottom: 30px;">포인트</h4>
		</div>
		<div>
			<span>내 포인트 : <span class="point"></span> </span>
			<span style="float: right; display: inline-block;">
				조회기간
				<select class="month">
					<option value="1">1개월</option>
					<option value="3">3개월</option>
					<option value="6">6개월</option>
					<option value="12">1년</option>
				</select>
			</span>
			
			<div class="row" style="margin: 20px 5px 10px;">
				<div class="col">
					<span style="font-weight: 600; font-size: 80%;">총 <span class="dataCount"></span> 건</span>
				</div>
				<div class="col" style="text-align: right;">
					<span style="font-weight: 600; font-size: 80%;">
						[ <span class="pageNum"></span> / <span class="totalPage"></span> ]
					</span>
				</div>
			</div>
			
			<table style="clear: both; margin-top: 20px;">
				<thead>
					<tr style="font-weight: bold; border-bottom: 0.5px solid #eee; border-top: 0.5px solid #eee;" height="40">
						<td width="100" align="center">번호</td>
						<td width="150" align="center">금액</td>
						<td width="250" align="center">내용</td>
						<td width="200" align="center">일자</td>
					</tr>
				</thead>
				<tbody class="list">
				</tbody>
			</table>
			
			<div class="paging" style="text-align: center; margin: 60px auto 30px;">
			</div>
		</div>
	</div>
</div>