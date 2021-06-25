<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
.table-content tr > td {
	padding-left: 5px; padding-right: 5px;
}
</style>

<script type="text/javascript">
<c:if test="${sessionScope.member.userId=='admin'}">
	function deleteSend() {
		var query = "num=${dto.num}&${query}";
		var url = "${pageContext.request.contextPath}/notice/delete?" + query;
	
		if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
			location.href=url;
		}
	}
</c:if>
</script>

<div class="container body-container">
    <div class="body-title">
		<h2><i class="icofont-clip-board"></i> 공지사항 </h2>
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
					${dto.created} | 조회 ${dto.hitCount}
				</td>
			</tr>
			
			<tr>
				<td colspan="2" valign="top" height="200">
					${dto.content}
				</td>
			</tr>
			
			<c:forEach var="vo" items="${listFile}">
				<tr>
					<td colspan="2">
						<a href="${pageContext.request.contextPath}/notice/download?fileNum=${vo.fileNum}"><i class="icofont-file-alt"></i> ${vo.originalFilename}</a>
						(<fmt:formatNumber value="${vo.fileSize/1024}" pattern="0.00"/> KByte)
					</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="2">
					이전글 :
					<c:if test="${not empty preReadDto}">
						<a href="${pageContext.request.contextPath}/notice/article?${query}&num=${preReadDto.num}">${preReadDto.subject}</a>
					</c:if>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					다음글 :
					<c:if test="${not empty nextReadDto}">
						<a href="${pageContext.request.contextPath}/notice/article?${query}&num=${nextReadDto.num}">${nextReadDto.subject}</a>
					</c:if>
				</td>
			</tr>
		</table>
			
		<table class="table">
			<tr>
				<td width="50%" align="left">
					<c:choose>
						<c:when test="${sessionScope.member.userId=='admin'}">
			    			<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/notice/update?num=${dto.num}&page=${page}';">수정</button>
			    		</c:when>
			    		<c:otherwise>
			    			<button type="button" class="btn" disabled="disabled">수정</button>
			    		</c:otherwise>
			    	</c:choose>
			    	
			    	<c:choose>
			    		<c:when test="${sessionScope.member.userId=='admin'}">
			    			<button type="button" class="btn" onclick="deleteSend();">삭제</button>
			    		</c:when>
			    		<c:otherwise>
			    			<button type="button" class="btn" disabled="disabled">삭제</button>
			    		</c:otherwise>
			    	</c:choose>
				</td>
			
				<td align="right">
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/notice/list?${query}';">리스트</button>
				</td>
			</tr>
		</table>
    </div>
    
</div>