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

<script>
$(function(){
	listReply(1);
});
</script>

<div class="container body-container">
    <div class="body-title">
        <h2><i class="icofont-google-talk"></i> 중고거래 게시판 </h2>
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
			
	
			</table>
			
		<table class="table">
			<tr>
				<td width="50%" align="left">
			    	<c:choose>
			    		<c:when test="${sessionScope.member.userId==dto.userId}">
			    			<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/junggo/update?num=${dto.num}&pageNo=${pageNo}';">수정</button>
			    		</c:when>
			    		<c:otherwise>
			    			<button type="button" class="btn" disabled="disabled">수정</button>
			    		</c:otherwise>
			    	</c:choose>
				    	<c:choose>
			    		<c:when test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
			    			<button type="button" class="btn" onclick="deleteJunggo('${dto.num}', '${pageNo}');">삭제</button>
			    		</c:when>
			    		<c:otherwise>
			    			<button type="button" class="btn" disabled="disabled">삭제</button>
			    		</c:otherwise>
			    	</c:choose>
				</td>
			
				<td align="right">
					<button type="button" class="btn" onclick="listPage('${pageNo}')">리스트</button>
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
				        <button type='button' class='btn btn-light btnSendReply' data-num="${dto.num}" style='padding:10px 20px;'>댓글 등록</button>
				    </td>
				 </tr>
			</table>

	<div id="listReply"></div>
			</div>
    </div>
</div>