<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:forEach  var="r" items="${reviews}">
	<div style="font-family: Jua; font-size: x-large; padding: 20px; border:2px solid #F79F81;">
	<c:if test="${sessionScope.member.userIdx eq r.useridx}">
		<a onclick="deleteReview(${r.reviewNum}, ${r.useridx}, ${r.itemId})">삭제 |</a>
		<a href="${pageContext.request.contextPath}/shopping/updatereview?reviewNum=${r.reviewNum}&useridx=${r.useridx}&itemId=${r.itemId}">수정</a>
	</c:if>
		<br>
		<span>작성자: ${r.name }</span>
		<br>
		<span>작성일: ${r.registered }</span>
		<br>
		<span>
		별점: ${r.score }
		<c:choose>
		<c:when test="${r.score eq 1 }">
		<div class="starRev">
			  <span class="starR on2">별1</span>
			  <span class="starR ">별2</span>
			  <span class="starR ">별3</span>
			  <span class="starR ">별4</span>
			  <span class="starR ">별5</span>	 
		</div>
		</c:when>
		<c:when test="${r.score eq 2 }">
		<div class="starRev">
			  <span class="starR on2">별1</span>
			  <span class="starR on2">별2</span>
			  <span class="starR ">별3</span>
			  <span class="starR ">별4</span>
			  <span class="starR ">별5</span>	 
		</div>
		</c:when>
		<c:when test="${r.score eq 3 }">
		<div class="starRev">
			  <span class="starR on2">별1</span>
			  <span class="starR on2">별2</span>
			  <span class="starR on2">별3</span>
			  <span class="starR ">별4</span>
			  <span class="starR ">별5</span>	 
		</div>
		</c:when>
		<c:when test="${r.score eq 4 }">
		<div class="starRev">
			  <span class="starR on2">별1</span>
			  <span class="starR on2">별2</span>
			  <span class="starR on2">별3</span>
			  <span class="starR on2">별4</span>
			  <span class="starR ">별5</span>	 
		</div>
		</c:when>
		<c:when test="${r.score eq 5 }">
		<div class="starRev">
			  <span class="starR on2">별1</span>
			  <span class="starR on2">별2</span>
			  <span class="starR on2">별3</span>
			  <span class="starR on2">별4</span>
			  <span class="starR on2">별5</span>	 
		</div>
		</c:when>
		</c:choose>
		
		
		</span>
		<hr>
		<span>${r.content }</span>
		

	</div>
</c:forEach>