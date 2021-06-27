<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div style="width: 800px; min-height: 800px; float: left;">
	<div style="width: 100%; height: 100%; padding-left: 100px; padding-top: 30px;">
		<div>
			<h4>내가 쓴 글</h4>
		</div>
		<div>
			<table style="width: 100%">
				<tr>
					<td align="right">
						${dataCount}개(${page}/${total_page} 페이지)
					</td>
				</tr>
			</table>
			<table style="border-collapse: collapse; border-spacing: 0; width: 100%">
				<tr style="border-bottom: 0.5px solid #eee; border-top: 0.5px solid #eee; width: 600px; height: 35px;"> 
					<th style="width: 15%; color: #787878; text-align: center;">번호</th>
					<th style="width: 60%; color: #787878;">제목</th>
					<th style="width: 25%; color: #787878; text-align: center;">날짜</th>
				</tr>
				 
				<c:forEach var="dto" items="${list}">
					<tr style="border-bottom: 1px solid #eee; height: 35px;"> 
						<td style="text-align: center;">${dto.listNum}</td>
						<td>${dto.subject}</td>
						<td style="text-align: center;">${dto.reg_date}</td>
					</tr>
				</c:forEach> 
			</table>
				 
			<table style="width: 90%; margin-top: 20px;">
				<tr align="center">
					<td align="left" width="100">
						<button type="button" style="border: 1px solid #eee; background: white; font-size: 15px; border-radius: 5px;" onclick="javascript:location.href='${pageContext.request.contextPath}/myPage/posting';">새로고침</button>
					</td>
					<td align="center" class="paging pagination-sm">
						${empty list? "등록된 자료가 없습니다.":paging}
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>