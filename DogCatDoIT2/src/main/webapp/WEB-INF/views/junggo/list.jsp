<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.submit();
}
</script>

<div class="container body-container">
	<div class="body-title">
		<h2><i class="icofont-google-talk"></i> 중고거래 게시판 </h2>
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
					<a href="#" onclick="articleView('${dto.num}', '${pageNo}')">${dto.subject}</a>
				</td>
			
				<td>${dto.name}</td>
				<td>${dto.regi_date}</td>
				<td>${dto.read_count}</td>
			</tr>
			</c:forEach>
		</table>
	
 
<table class="table">
	<tr>
		<td align="center">
			${dataCount==0?"등록된 게시물이 없습니다.":paging}
		</td>
	</tr>
</table>

<table class="table">
	<tr>
		<td align="left" width="100">
			<button type="button" class="btn" onclick="reloadJunggo();">새로고침</button>
		</td>
		<td align="center">
			<form name="searchForm" method="post">
				<select id="condition" name="condition" class="selectField">
					<option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
					<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
					<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
				</select>
				<input type="text" id="keyword" name="keyword" class="boxTF" value="${keyword}">
				<button type="button" class="btn" onclick="searchList();">검색</button>
			</form>
		</td>
		<td align="right" width="100">
			<c:if test="${sessionScope.member.userId=='admin'}">
				<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/junggo/created';">글올리기</button>
			</c:if>
		</td>
	</tr>
</table>
</div></div>