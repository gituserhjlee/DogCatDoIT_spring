<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<style type="text/css">
.body-container {
	max-width: 800px; margin: 10px auto 5px; padding-top: 20px;
}

.table-list {
	width: 100%;
}

.table-list tr {
	height: 35px;
	border-bottom: 1px solid #ccc;
	text-align: center;
}
.table-list thead tr:first-child {
	border-top: 2px solid #ccc;
	background: #eee;
	height: 35px;
}

.table-list tr > th {
	color: #777;
}

.table-list tr > td:nth-child(2) {
	box-sizing: border-box;
	padding-left: 10px;
	text-align: left;
}
.table-paging tr > td {
	height: 40px;
	line-height: 40px;
	text-align:center;
	padding: 5px;
	box-sizing: border-box;
}

.table-footer {
	margin: 10px auto;
}
.table-footer tr {
	height:45px;
}
</style>

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
		<h2><i class="icofont-google-talk"></i> 자유게시판 </h2>
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
				
			</tr>
		 
			<c:forEach var="dto" items="${list}">
			<tr> 
				<td>${dto.listNum}</td>
				<td>
					<c:url var="url" value="/zau/article">
						<c:param name="num" value="${dto.num}"/>
						<c:param name="page" value="${page}"/>
						<c:if test="${not empty keyword}">
							<c:param name="condition" value="${condition}"/>
							<c:param name="keyword" value="${keyword}"/>
						</c:if>
					</c:url>
					<a href="${url}">${dto.subject}</a>
				</td>
			
				<td>${dto.name}</td>
				<td>${dto.regi_date}</td>
				<td>${dto.read_count}</td>
			</tr>
			</c:forEach>
		</table>
		 
		<table class="table table-borderless table-paging">
			<tr>
				<td align="center">${dataCount==0?"등록된 게시물이 없습니다.":paging}</td>
			</tr>
		</table>
		
		<table class="table table-borderless table-footer">
			<tr>
				<td align="left" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/zau/list';">새로고침</button>
				</td>
				<td align="center">
					<form name="searchForm" action="${pageContext.request.contextPath}/zau/list" method="post">
						<select name="condition" class="selectField">
							<option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
							<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
							<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
							<option value="name" ${condition=="name"?"selected='selected'":""}>작성자</option>
							<option value="regi_date" ${condition=="regi_date"?"selected='selected'":""}>등록일</option>
						</select>
						<input type="text" name="keyword" value="${keyword}" class="boxTF">
						<button type="button" class="btn" onclick="searchList()">검색</button>
					</form>
				</td>
				<td align="right" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/zau/created';">글올리기</button>
				</td>
			</tr>
		</table>
	</div>

</div>