<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
</style>

<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.submit();
}
</script>

<div class="container body-container">
    <div class="body-title">
		<h2><i class="icofont-clip-board"></i> 공지사항 </h2>
    </div>
    
    <div class="body-main wx-800 ml-30">
		<table class="table">
			<tr>
				<td align="left" width="50%">
					${dataCount}개(${page}/${total_page} 페이지)
				</td>
				<td align="right">
					&nbsp;
				</td>
			</tr>
		</table>
		
		<table class="table table-border table-content">
			<tr> 
				<th width="60">번호</th>
				<th>제목</th>
				<th width="100">작성자</th>
				<th width="80">작성일</th>
				<th width="60">조회수</th>
				<th width="50">첨부</th>
			</tr>
		 
			<c:forEach var="dto" items="${noticeList}">
			<tr> 
				<td><span style="display: inline-block;padding:1px 3px; background: #ED4C00; color: #fff">공지</span></td>
				<td>
					<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
				</td>
				<td>${dto.name}</td>
				<td>${dto.created}</td>
				<td>${dto.hitCount}</td>
				<td>
					<c:if test="${dto.fileCount != 0}">
						<a href="${pageContext.request.contextPath}/notice/zipdownload?num=${dto.num}"><i class="icofont-file-zip"></i></a>
					</c:if>		      
				</td>
			</tr>
			</c:forEach>
		 
			<c:forEach var="dto" items="${list}">
			<tr> 
				<td>${dto.listNum}</td>
				<td>
					<a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
					<c:if test="${dto.gap < 1}">
						<img src='${pageContext.request.contextPath}/resources/img/new.gif'>
					</c:if>
				</td>
				<td>${dto.name}</td>
				<td>${dto.created}</td>
				<td>${dto.hitCount}</td>
				<td>
					<c:if test="${dto.fileCount != 0}">
						<a href="${pageContext.request.contextPath}/notice/zipdownload?num=${dto.num}"><i class="icofont-file-zip"></i></a>
					</c:if>		      
				</td>
			</tr>
			</c:forEach>
		</table>
		 
		<table class="table">
			<tr>
				<td align="center">
					${dataCount==0 ? "등록된 게시물이 없습니다.":paging}
				</td>
			</tr>
		</table>
		
		<table class="table">
			<tr>
				<td align="left" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/notice/list';">새로고침</button>
				</td>
				<td align="center">
					<form name="searchForm" action="${pageContext.request.contextPath}/notice/list" method="post">
						<select name="condition" class="selectField">
							<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
							<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
							<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
							<option value="name" ${condition=="name"?"selected='selected'":""}>작성자</option>
							<option value="created" ${condition=="created"?"selected='selected'":""}>등록일</option>
						</select>
						<input type="text" name="keyword" value="${keyword}" class="boxTF">
						<button type="button" class="btn" onclick="searchList()">검색</button>
					</form>
				</td>
				<td align="right" width="100">
					<c:if test="${sessionScope.member.userId=='admin'}">
						<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/notice/created';">글올리기</button>
					</c:if>
				</td>
			</tr>
		</table>
	</div>

</div>