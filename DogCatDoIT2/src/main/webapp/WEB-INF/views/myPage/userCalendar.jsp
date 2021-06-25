<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<meta charset='utf-8' />
<link href='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.min.css' rel='stylesheet' />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<style type="text/css">
.table-article {
	margin-top: 10px;
}
.table-article tr > td {
	padding-left: 5px; padding-right: 5px;
}
.table-article tr > td:nth-child(1) {
	width: 100px; text-align: center; background: #eee;
}
</style>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/locales-all.min.js'></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dateUtil.js"></script>
<script>
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

var calendar=null;
var group="all";
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');

	calendar = new FullCalendar.Calendar(calendarEl, {
		headerToolbar: {
			left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
		},
		initialView: 'dayGridMonth', // 처음 화면에 출력할 뷰
		locale: 'ko',
		editable: true,
		navLinks: true,
		dayMaxEvents: true,
		events: function(info, successCallback, failureCallback) {
			var url="${pageContext.request.contextPath}/myPage/month";
			var startDay=info.startStr.substr(0, 10);
			var endDay=info.endStr.substr(0, 10);
            var query="start="+startDay+"&end="+endDay+"&group="+group;
            
        	var fn = function(data){
        		// var events = eval(data.list);
        		successCallback(data.list);
        	};
        	ajaxFun(url, "get", query, "json", fn);

		},
		selectable: true,
		selectMirror: true,
		select: function(info) {
			// 날짜의 셀을 선택하거나 드래그하면 입력 대화상자를 출력
			// insertSchedule(info.start, info.end, info.allDay); // start : Date 형
			insertSchedule(info.startStr, info.endStr, info.allDay); //startStr : 2021-06-06T07:00:00+09:00
			
	        calendar.unselect();
		},
		eventClick: function(info) {
			// 일정 제목을 선택할 경우 상세 일정
			viewSchedule(info.event);
		},
		eventDrop: function(info) {
			// 일정을 드래그 한 경우
			updateDrag(info.event);
		},
		eventResize: function(info) {
			// 일정의 크기를 변경 한 경우
			updateDrag(info.event);
		},
		loading: function(bool) {
			document.getElementById('scheduleLoading').style.display = bool ? 'block' : 'none';
		}
	});

	calendar.render();
});

$(function(){
	$("#tab-"+group).addClass("active");

	$("ul.tabs li").click(function() {
		group = $(this).attr("data-group");
		
		$("ul.tabs li").each(function(){
			$(this).removeClass("active");
		});
		
		$("#tab-"+group).addClass("active");
		
		calendar.refetchEvents();
	});
});

// 일정 등록 대화상자
function insertSchedule(start, end, allDay) {
	// 폼 초기화
	initForm(start, end, allDay, "insert");
	
	$('#schedule-dialog').dialog({
		  modal: true,
		  height: 625,
		  width: 600,
		  title: '일정 등록',
		  close: function(event, ui) {
		  }
	});
}

// 입력 및 수정 폼 초기화
function initForm(start, end, allDay, mode) {
	// 폼 reset
	$("form[name=scheduleForm]").each(function(){
		this.reset();
	});
	$("form[name=scheduleForm] input[name=mode]").val(mode);
	
	if(mode=="insert") {
		$(".btnScheduleSendOk").text("일정등록");
		$(".btnScheduleSendCancel").text("등록취소");
	} else {
		$(".btnScheduleSendOk").text("수정완료");
		$(".btnScheduleSendCancel").text("수정취소");
	}

	$("#form-repeat_cycle").hide();
	$("#form-eday").closest("tr").show();
	$("#form-allDay").removeAttr("disabled");
	
	var startDate, endDate, startTime, endTime;
	if(allDay) {
		startDate = start;
		endDate = "";
		if(end) endDate = daysLater(end, 0); // 종일 일정인 경우 끝나는 날짜가 +1 로 선택 되므로 -1 함 
		$("#form-allDay").prop("checked", true);
		
		$("#form-stime").val("").hide();
		$("#form-etime").val("").hide();
	} else {
		startDate = start.substr(0, 10);
		endDate = end.substr(0, 10);
		startTime = start.substr(11, 5);
		endTime = end.substr(11, 5);
		$("#form-allDay").prop("checked", false);
		
		$("#form-stime").val(startTime).show();
		$("#form-etime").val(endTime).show();
	}
	
	$("form[name=scheduleForm] input[name=sday]").val(startDate);
	$("form[name=scheduleForm] input[name=eday]").val(endDate);
	
	$("#form-sday").datepicker({showMonthAfterYear:true});
	$("#form-eday").datepicker({showMonthAfterYear:true});
}

$(function(){
	$("#form-allDay").click(function(){
		if(this.checked==true) {
			$("#form-stime").val("").hide();
			$("#form-etime").val("").hide();
		} else if(this.checked==false && $("#form-repeat").val()==0){
			$("#form-stime").val("00:00").show();
			$("#form-etime").val("00:00").show();
		}
	});

	$("#form-sday").change(function(){
		$("#form-eday").val($("#form-sday").val());
	});
	
	$("#form-repeat").change(function(){
		if($(this).val()=="0") {
			$("#form-repeat_cycle").val("0").hide();
			
			$("#form-allDay").prop("checked", true);
			$("#form-allDay").removeAttr("disabled");
			
			$("#form-eday").val($("#form-sday").val());
			$("#form-eday").closest("tr").show();
		} else {
			$("#form-repeat_cycle").show();
			
			$("#form-allDay").prop("checked", true);
			$("#form-allDay").attr("disabled","disabled");

			$("#form-stime").val("").hide();
			$("#form-eday").val("");
			$("#form-etime").val("");
			$("#form-eday").closest("tr").hide();
		}
	});
});

// 일정 등록완료 및 수정 완료
$(function(){
	$(".btnScheduleSendOk").click(function(){
		if($("#form-repeat_cycle").val()=="") {
			$("#form-repeat_cycle").val("0");
		}
		
		if(! check()) {
			return false;
		}
		
		// 종일일정의 경우 종료일자는 종료일자+1로 저장해서 불러와야 함
		if($("#form-eday").val() && $("#form-allDay").is(":checked")) {
			$("#form-eday").val(daysLater($("#form-eday").val(), 2));
		}
		
		var mode = $("form[name=scheduleForm] input[name=mode]").val();

		var query=$("form[name=scheduleForm]").serialize();
		var url="${pageContext.request.contextPath}/myPage/"+mode+"UserCalendar";

		var fn = function(data) {
			var state=data.state;
			
			if(state=="true") {
				group="all";
				
				// 모든 소스의 이벤트를 다시 가져와 화면에 다시 렌더링
				calendar.refetchEvents();
			}
			
			$('#schedule-dialog').dialog("close");
		};
		ajaxFun(url, "post", query, "json", fn);
	});
});

// 등록 대화상자 닫기
$(function(){
	$(".btnScheduleSendCancel").click(function(){
		$('#schedule-dialog').dialog("close");
	});
});

// 등록내용 유효성 검사
function check() {
	if(! $("#form-subject").val()) {
		$("#form-subject").focus();
		return false;
	}

	if(! $("#form-sday").val()) {
		$("#form-sday").focus();
		return false;
	}

	if($("#form-eday").val()) {
		var s1=$("#form-sday").val().replace("-", "");
		var s2=$("#form-eday").val().replace("-", "");
		if(s1>s2) {
			$("#form-sday").focus();
			return false;
		}
	}
	
	if($("#form-stime").val()!="" && !isValidTime($("#form-stime").val())) {
		$("#form-stime").focus();
		return false;
	}

	if($("#form-etime").val()!="" && !isValidTime($("#form-etime").val())) {
		$("#form-etime").focus();
		return false;
	}
	
	if($("#form-etime").val()) {
		var s1=$("#form-stime").val().replace(":", "");
		var s2=$("#form-etime").val().replace(":", "");
		if(s1>s2) {
			$("#form-stime").focus();
			return false;
		}
	}	
	
	if($("#form-repeat").val()!="0" && ! /^(\d){1,2}$/g.test($("#form-repeat_cycle").val())) {
		$("#form-repeat_cycle").focus();
		return false;
	}
	
	if($("#form-repeat").val()!="0" && $("#form-repeat_cycle").val()<1) {
		$("#form-repeat_cycle").focus();
		return false;
	}
	
	return true;
}

// 시간 형식 유효성 검사
function isValidTime(data) {
	if(! /(\d){2}[:](\d){2}/g.test(data)) {
		return false;
	}
	
	var t=data.split(":");
	if(t[0] < 0 || t[0] > 23 || t[1] < 0 || t[1] > 59) {
		return false;
	}

	return true;
}

//  일정 상세 보기
function viewSchedule(calEvent) {
	$("form[name=scheduleForm]").each(function(){
		this.reset();
	});

	var userCalendarNum=calEvent.id;
	var title=calEvent.title;
	var color=calEvent.backgroundColor;
	// var start=calEvent.start;
	// var end=calEvent.end;
	var start=calEvent.startStr;
	var end=calEvent.endStr;
	var allDay=calEvent.allDay;	
	var sday=calEvent.extendedProps.sday;
	var eday=calEvent.extendedProps.eday;
	var stime=calEvent.extendedProps.stime;
	var etime=calEvent.extendedProps.etime;
	
	var memo=calEvent.extendedProps.memo;
	var created=calEvent.extendedProps.created;
	var repeat=calEvent.extendedProps.repeat;
	var repeat_cycle=calEvent.extendedProps.repeat_cycle;

	$(".btnScheduleUpdate").attr("data-num", userCalendarNum);
	$(".btnScheduleDelete").attr("data-num", userCalendarNum);
	
	// 수정폼 초기화
	initForm(start, end, allDay, "update");
	$("#form-subject").val(title);
	$("#form-color").val(color);
	$("#form-num").val(userCalendarNum);
	$("#form-memo").val(memo);
	if(repeat!=0) {
		$("#form-repeat_cycle").val(repeat_cycle);
		$("#form-repeat").val(repeat);

		$("#form-repeat_cycle").show();
		
		$("#form-allDay").prop("checked", true);
		$("#form-allDay").attr("disabled","disabled");

		$("#form-stime").val("").hide();
		$("#form-eday").val("");
		$("#form-etime").val("");
		$("#form-eday").closest("tr").hide();		
	}
	
	// 일정보기
	var s;
	$(".table-article .subject").html(title);
	
	if(color=="green") s = "개인일정";
	else if(color=="blue") s = "가족일정";
	else if(color=="tomato") s = "회사일정";
	else s = "기타일정";
	
	if(allDay) s +=", 종일일정";
	else s +=", 시간일정";
	
	$(".table-article .color").html(s);
	
	s = sday;
	if( stime ) s+=" "+stime;
	
	if( eday && allDay ) s += " ~ " + daysLater(eday, 0);
	else if( eday ) s += " ~ " + eday;
	
	if( etime ) s+=" "+etime;
	
	$(".table-article .period").html(s);

	if(repeat!=0 && repeat_cycle!=0) s="반복일정, 반복주기 : "+repeat_cycle+"년"
	else s="반복안함";
	$(".table-article .repeat").html(s);
	
	$(".table-article .created").html(created);
	
	if(! memo) memo="";
	$(".table-article .memo").html(memo);

	$('#viewSchedule-dialog').dialog({
		  modal: true,
		  height: 420,
		  width: 600,
		  title: '상세 일정',
		  open: function() {
		  },
		  close: function(event, ui) {
		  }
	});	
}

// 일정 상세 대화상자 종료
$(function(){
	$(".btnScheduleClose").click(function(){
		$('#viewSchedule-dialog').dialog("close");
	});
});

// 수정 폼
$(function(){
	$(".btnScheduleUpdate").click(function(){
		$('#viewSchedule-dialog').dialog("close");
		
		$('#schedule-dialog').dialog({
			  modal: true,
			  height: 625,
			  width: 600,
			  title: '일정 수정',
			  close: function(event, ui) {
			  }
		});
	});
});

// 일정 삭제
$(function(){
	$(".btnScheduleDelete").click(function(){
		var userCalendarNum = $(this).attr("data-num");
		
		if(confirm("일정을 삭제 하시겠습니까 ?")) {
			var url="${pageContext.request.contextPath}/myPage/deleteUserCalendar";
			var query="userCalendarNum="+userCalendarNum;
			
			var fn = function(data){
				var event = calendar.getEventById(userCalendarNum);
		        event.remove();
			};
			
			ajaxFun(url, "post", query, "json", fn);
		}
		
		 $("#viewSchedule-dialog").dialog("close");		
	});
});

function updateDrag(calEvent) {
	var userCalendarNum=calEvent.id;
	var title=calEvent.title;
	var color=calEvent.backgroundColor;
	var start=calEvent.startStr;
	var end=calEvent.endStr;
	var allDay=calEvent.allDay;
	var memo=calEvent.extendedProps.memo;
	var repeat=calEvent.extendedProps.repeat;
	var repeat_cycle=calEvent.extendedProps.repeat_cycle;
	
	var startDate="", endDate="", startTime="", endTime="", all_day="";
	if(allDay) {
		startDate = start;
		endDate = end;
		all_day = "1";
	} else {
		startDate = start.substr(0, 10);
		endDate = end.substr(0, 10);
		startTime = start.substr(11, 5);
		endTime = end.substr(11, 5);
	}
	
	var query="userCalendarNum="+userCalendarNum+"&subject="+title+"&color="+color+"&all_day="+all_day
			+"&sday="+startDate+"&eday="+endDate+"&stime="+startTime+"&etime="+endTime
			+"&memo="+memo+"&repeat="+repeat+"&repeat_cycle="+repeat_cycle;
	var url="${pageContext.request.contextPath}/myPage/updateUserCalendar";

	var fn = function(data) {
	};
	ajaxFun(url, "post", query, "json", fn);
}
</script>
<div style="width: 800px; min-height: 800px; float: left;">
	<div style="width: 100%; height: 100%; padding-left: 100px; padding-top: 30px;">
	  	<div>
	  		<h4 style="height: 30px; margin-bottom: 30px;">일정</h4>
	  	</div>
	  	<div class="body-main pt-15">
			<div>    
				<ul class="tabs">
					<li id="tab-all" data-group="all">전체일정</li>
					<li id="tab-green" data-group="green">개인일정</li>
					<li id="tab-blue" data-group="blue">가족일정</li>
					<li id="tab-tomato" data-group="tomato">회사일정</li>
					<li id="tab-purple" data-group="purple">기타일정</li>
				</ul>
			</div>
			<div id="tab-content" style="padding: 25px 10px 15px; clear: both;">
				<div id="calendar" style="width: 100%"></div>
			</div>
			<div id='scheduleLoading' style="display: none;">loading...</div>
		</div>
    </div>
</div>

<div id="schedule-dialog" style="display: none;">
	<form name="scheduleForm">
		<table style="width: 100%; margin: 20px auto 0; border-spacing: 0; border-collapse: collapse;">
			<tr>
				<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
					<label style="font-weight: 900;">제목</label>
				</td>
				<td style="padding: 0 0 15px 15px;">
					<p style="margin-top: 1px; margin-bottom: 5px;">
						<input type="text" name="subject" id="form-subject" maxlength="100" class="boxTF" style="width: 95%;">
					</p>
					<p class="help-block">* 제목은 필수 입니다.</p>
				</td>
			</tr>
			
			<tr>
				<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
					<label style="font-weight: 900;">일정분류</label>
				</td>
				<td style="padding: 0 0 15px 15px;">
					<p style="margin-top: 1px; margin-bottom: 5px;">
						<select name="color" id="form-color" class="selectField">
							<option value="green">개인일정</option>
							<option value="blue">가족일정</option>
							<option value="tomato">회사일정</option>
							<option value="purple">기타일정</option>
						</select>
					</p>
				</td>
			</tr>

			<tr>
				<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
					<label style="font-weight: 900;">종일일정</label>
				</td>
				<td style="padding: 0 0 15px 15px;">
					<p style="margin-top: 5px; margin-bottom: 5px;">
						<input type="checkbox" name="all_day" id="form-allDay" value="1" checked="checked">
						<label for="allDay">하루종일</label>
					</p>
				</td>
			</tr>

			<tr>
				<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
					<label style="font-weight: 900;">시작일자</label>
				</td>
				<td style="padding: 0 0 15px 15px;">
					<p style="margin-top: 1px; margin-bottom: 5px;">
						<input type="text" name="sday" id="form-sday" maxlength="10" class="boxTF" readonly="readonly" style="width: 25%; background: #fff;">
						<input type="text" name="stime" id="form-stime" maxlength="5" class="boxTF" style="width: 15%; display: none;" placeholder="시작시간">
					</p>
					<p class="help-block">* 시작날짜는 필수입니다.</p>
				</td>
			</tr>

			<tr>
				<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
					<label style="font-weight: 900;">종료일자</label>
				</td>
				<td style="padding: 0 0 15px 15px;">
					<p style="margin-top: 1px; margin-bottom: 5px;">
						<input type="text" name="eday" id="form-eday" maxlength="10" class="boxTF" readonly="readonly" style="width: 25%; background: #fff;">
						<input type="text" name="etime" id="form-etime" maxlength="5" class="boxTF" style="width: 15%; display: none;" placeholder="종료시간">
					</p>
					<p class="help-block">종료일자는 선택사항이며, 시작일자보다 작을 수 없습니다.</p>
				</td>
			</tr>

			<tr>
				<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
					<label style="font-weight: 900;">일정반복</label>
				</td>
				<td style="padding: 0 0 15px 15px;">
					<p style="margin-top: 1px; margin-bottom: 5px;">
						<select name="repeat" id="form-repeat" class="selectField">
							<option value="0">반복안함</option>
							<option value="1">년반복</option>
						</select>
						<input type="text" name="repeat_cycle" id="form-repeat_cycle" maxlength="2" class="boxTF" style="width: 20%; display: none;" placeholder="반복주기">
					</p>
				</td>
			</tr>
			  
			<tr>
				<td width="100" valign="top" style="text-align: right; padding-top: 5px;">
					<label style="font-weight: 900;">메모</label>
				</td>
				<td style="padding: 0 0 15px 15px;">
					<p style="margin-top: 1px; margin-bottom: 5px;">
						<textarea name="memo" id="form-memo" class="boxTA" style="width:93%; height: 70px;"></textarea>
					</p>
				</td>
			</tr>
			  
			<tr height="45">
				<td align="center" colspan="2">
					<div class="insert-button">
						<button type="button" class="btn btn-dark btnScheduleSendOk">일정등록</button>
						<button type="button" class="btn btnScheduleSendCancel">등록취소</button>
					</div>
					<input type="hidden" id="form-num" name="userCalendarNum" value="0">
					<input type="hidden" id="form-mode" name="mode" value="insert">
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="viewSchedule-dialog" style="display: none;">
	<table class="table table-article" border="1">
		<tr>
			<td>제목</td>
			<td><p class="subject"></p></td>
		</tr>
		
		<tr>
			<td>일정분류</td>
			<td><p class="color"></p></td>
		</tr>

		<tr>
			<td>날짜</td>
			<td><p class="period"></p></td>
		</tr>

		<tr>
			<td>일정반복</td>
			<td><p class="repeat"></p></td>
		</tr>

		<tr>
			<td>등록일</td>
			<td><p class="created"></p></td>
		</tr>
		
		
		<tr height="70">
			<td valign="top">메모</td>
			<td valign="top"><p class="memo" style="white-space: pre;"></p></td>
		</tr>
	</table>
	
	<table class="table">
		<tr> 
			<td align="right">
				<button type="button" class="btn btnScheduleUpdate">일정수정</button>
				<button type="button" class="btn btnScheduleDelete">일정삭제</button>
				<button type="button" class="btn btnScheduleClose">종료</button>
			</td>
		</tr>
	</table>

</div>