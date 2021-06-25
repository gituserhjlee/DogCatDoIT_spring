<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${list.size() > 0}">
	<div class="accordion"> 
	<c:forEach var="dto" items="${list}">
		<h3 class="question">
			<span class="q">Q.</span> <span class="subject">${dto.subject}</span>
		</h3>
		<div class="answer">
			<div class="category">분류 : ${dto.category}</div>
			<div class="content">
				<div>A.</div>
				<div>${dto.content}</div>
			</div>
			<c:if test="${sessionScope.member.userId=='admin'}">
				<div class="update">
					<a onclick="javascript:location.href='${pageContext.request.contextPath}/faq/update?num=${dto.num}&pageNo=${pageNo}';">수정</a>&nbsp;|
					<a onclick="deleteFaq('${dto.num}', '${pageNo}');">삭제</a>
				</div>
			</c:if>
		</div>
	</c:forEach>
	</div>
</c:if>
 
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
			<button type="button" class="btn" onclick="reloadFaq();">새로고침</button>
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
				<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/faq/created';">글올리기</button>
			</c:if>
		</td>
	</tr>
</table>
