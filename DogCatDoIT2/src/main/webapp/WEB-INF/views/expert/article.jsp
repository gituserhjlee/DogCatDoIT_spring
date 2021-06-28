<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
<c:if test="${dto.userId == sessionScope.member.userId || sessionScope.member.userId  == 'admin' }">
function deleteExpert(){
	if(confirm("게시물을 삭제 하시겠습니까?")){
		expertNum = "${dto.expertNum}";
		var url = "${pageContext.request.contextPath}/expert/delete?expertNum="+expertNum+"&${query}";
		location.href=url;
	}
}
</c:if>
</script>

<div class="container body-container">
	<div class="body-title">
		<h2><i class="icofont-ebook"></i> 동물행동전문가 Q&A 게시판 </h2>
	</div>
	
	<div class="body-main wx-700 ml-30 pt-15">
		<table class="table table-border table-content">
			<tr align="center">
				<th width="15%" align="center">번호</th>
				<th width="30%"  align="center">제목</th>
				<th width="15%"  align="center">작성자</th>
				<th width="20%"  align="center">작성일</th>
				<th width="20%"  align="center">조회수</th>				
			</tr>
		
			
			<tr>
				<td  width="20%" align="center">
				 	${dto.expertNum}
				</td>
				<td width="20%"  align="center">
					<c:if test="${dto.depth!=0}">[Re]</c:if>
					${dto.subject}
				</td>
				<td width="20%" align="center">
					${dto.name}
				</td>
				<td width="20%" align="center">
					${dto.created}
				</td>
				<td width="20%" align="center">
					${dto.hitCount}
				</td>
			</tr>
			
			<tr>
				<td colspan="5" valign="top" height="200">
					${dto.content}
				</td>
			</tr>
			
			<tr>
				<td colspan="5">
					이전글 :
					<c:if test="${not empty preReadDto}">
						<a href="${pageContext.request.contextPath}/expert/article?expertNum=${preReadDto.expertNum}&${query}">${preReadDto.subject}</a>
					</c:if>
				</td>
			</tr>
			
			<tr>
				<td colspan="5">
					다음글 :
					<c:if test="${not empty nextReadDto}">
						<a href="${pageContext.request.contextPath}/expert/article?expertNum=${nextReadDto.expertNum}&${query}">${nextReadDto.subject}</a>
					</c:if>
				</td>
			
			</tr>
						
		</table>
		
		<table class="table">
			<tr>
				<td class="text-left" width="15%" align="left">
					<button type="button" class="btn btn-dark btn-outline-hover-dark" style="font-family: Jua; font-size: 18px;" onclick="javascript:location.href='${pageContext.request.contextPath}/expert/reply?expertNum=${dto.expertNum}&page=${page}&rows=${rows}';">답변</button>
				
				</td>
			
				<td class="text-center" width="50%" >
					<c:choose>
						<c:when test="${sessionScope.member.userId== dto.userId}">
							<button type="button" class="btn btn-dark btn-outline-hover-dark" style="font-family: Jua; font-size: 18px;" onclick="javascript:location.href='${pageContext.request.contextPath}/expert/update?expertNum=${dto.expertNum}&page=${page}&rows=${rows}';">수정</button>
						</c:when>
						<c:otherwise>
							<button type="button"class="btn btn-dark btn-outline-hover-dark" style="font-family: Jua; font-size: 18px;" disabled="disabled">수정</button>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
							<button type="button" class="btn btn-dark btn-outline-hover-dark" style="font-family: Jua; font-size: 18px;" onclick="deleteExpert();">삭제</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-dark btn-outline-hover-dark" style="font-family: Jua; font-size: 18px;" disabled="disabled">삭제</button>
						</c:otherwise>
					</c:choose>
				
				</td>
				
				<td class="text-right" align="right" width="25%">
					<button type="button" class="btn btn-dark btn-outline-hover-dark" style="font-family: Jua; font-size: 18px;" onclick="javascript:location.href='${pageContext.request.contextPath}/expert/list?${query}';">리스트</button>
				</td>
			</tr>
		</table>
		
		<table class="table table-border table-list">
			
			
			<c:forEach var="vo" items="${listArticle}">
			<tr>
				<td>${vo.expertNum}</td>
				<td>
					<c:forEach var="n" begin="1" end="${vo.depth}">
						&nbsp;
					</c:forEach>
					<c:if test="${vo.depth!=0}">└&nbsp;</c:if>
					<c:if test="${dto.expertNum == vo.expertNum}">
						${vo.subject}
					</c:if>
					<c:if test="${dto.expertNum != vo.expertNum}">
						<a href="${pageContext.request.contextPath}/expert/article?${query}&expertNum=${vo.expertNum}">${vo.subject}</a>
					</c:if>
				</td>
				<td>${vo.name}</td>
				<td>${vo.created}</td>
				<td>${vo.hitCount}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>