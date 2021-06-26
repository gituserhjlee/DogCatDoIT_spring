<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
function deleteRequest(requestNum) {
	if(confirm("삭제하시겠습니까?")){
		location.href='${pageContext.request.contextPath}/myPage/deleteRequestQualification?requestNum='+requestNum;		
	}
}
</script>
<div style="width: 800px; min-height: 800px; float: left;">
	<div style="width: 100%; height: 100%; padding-left: 100px; padding-top: 30px;">
		<div>
			<h4 style="margin-bottom: 30px;">자격신청내역</h4>
		</div>
		<div>
			<table>
				<tr style="font-weight: bold; border-bottom: 0.5px solid #eee; border-top: 0.5px solid #eee;" height="40">
					<td align="center" width="60">번호</td>
					<td align="center" width="150">신청일</td>
					<td align="center" width="100">구분</td>
					<td align="center" width="100">상태</td>
					<td align="center" width="60">파일</td>
					<td align="center" width="100">수정</td>
					<td align="center" width="100">신청삭제</td>
				</tr>
				<c:if test="${empty list}">
					<tr>
						<td colspan="7" align="center">신청 내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${list}">
					<tr style="border-bottom: 1px solid #eee;" height="40">
						<td align="center">${dto.listNum}</td>
						<td align="center">${dto.req_date}</td>
						<td align="center">${dto.gubun}</td>
						<td align="center">${dto.state}</td>
						<c:if test="${not empty dto.saveFilename}">
							<td align="center"><a href="${pageContext.request.contextPath}/myPage/download?requestNum=${dto.requestNum}"><i class="far fa-file"></i></a></td>
						</c:if>
						<td align="center"><button type="button" onclick="location.href='${pageContext.request.contextPath}/myPage/updateRequestQualification?requestNum=${dto.requestNum}'" style="background: white; border:1px solid #eee; border-radius: 5px; padding: 5px; font-size: 14px;">수정</button></td>
						<td align="center"><button type="button" onclick="deleteRequest('${dto.requestNum}');" style="background: white; border:1px solid #eee; border-radius: 5px; padding: 5px; font-size: 14px;">신청삭제</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>