<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="container body-container">
	<div class="body-title">
		<h2><i class="icofont-ebook"></i>동물행동전문가 Q&A 게시판 </h2>
	</div>
	
	<div class="body-main wx-800 ml-30">
		<table class="table">
			<tr>
				<td align="left" width="50%">
					${dataCount}개(${page}/${total_page} 페이지)
				</td>
				
				<td align="right">
					<form action="${pageContext.request.contextPath}/expert.list" name="expertListForm" method="post">
						<select name="rows" class="selectField" onchange="expertList();">
							<option value="10" ${rows==10?"selected='selected' " :"" }>10개씩 출력</option>
							<option value="20" ${rows==20?"selected='selected' " :"" }>20개씩 출력</option>
							<option value="30" ${rows==30?"selected='selected' " :"" }>30개씩 출력</option>
							<option value="50" ${rows==50?"selected='selected' " :"" }>50개씩 출력</option>
							<option value="1000" ${rows==100?"selected='selected' " :"" }>100개씩 출력</option>
						</select>
						<input type="hidden" name="condition" value="${condition}">
						<input type="hidden" name="keyword" value="${keyword}">
					</form>				
				</td>
			</tr>
		</table>
		
		<table class="table table-boarder table-content">
			<tr>
				<th width="60">번호</th>
				<th>제목</th>
				<th width="80">작성자</th>
				<th width="80">작성일</th>
				<th width="60">조회수</th>
			</tr>
			
			<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.expertNum}</td>
				<td>
					<c:forEach var="n" begin="1" end="${dto.depth}">
						&nbsp;
					</c:forEach>
					<c:if test="${dto.depth!=0}">└&nbsp;</c:if>
					<a href="${articleUrl}&expertNum=${dto.expertNum}">${dto.subject}</a>
<%-- 					<c:if test="${dto.gap < 1}">
						<img src='${pageContext.request.contextPath}/resources/images/new.gif'>
					</c:if>
 --%>				</td>	
 
					
				<td>${dto.name}</td>			
				<td>${dto.created}</td>			
				<td>${dto.hitCount}</td>			
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
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/expert/list';">새로고침</button>
				</td>
				
				<td align="center">
					<form name="searchForm" action="${pageContext.request.contextPath}/expert/list" method="post">
						<select name="condition" class="selectField">
							<option value="all" ${condition=="all"?"selected='selected'":""}>제목+내용</option>
							<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
							<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
							<option value="name" ${condition=="name"?"selected='selected'":""}>작성자</option>
							<option value="created" ${condition=="created"?"selected='selected'":""}>등록일</option>
						</select>
						<input type="text" name="keyword" value="${keyword}" class="boxTF">
						<input type="hidden" name="rows" value="${rows}">
						<button type="button" class="btn" onclick="seacrchList()">검색</button>
					</form>
				</td>
				<td align="right" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/expert/created';">글올리기</button>
				</td>
			</tr>
		</table>
		
	</div>
</div>