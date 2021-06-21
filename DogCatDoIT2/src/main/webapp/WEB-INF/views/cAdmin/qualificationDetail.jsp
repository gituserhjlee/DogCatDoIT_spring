<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table style="margin: 10px auto 20px; width: 100%; border-spacing: 1px; background: #ccc">
	<tr height="37" style="background: #fff;">
		<td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">회원아이디</label></td>
		<td align="left" width="35%" style="padding-left: 5px;"><span>${dto.userId}</span></td>
		<td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">이름</label></td>
		<td align="left" style="padding-left: 5px;"><span>${dto.name}</span></td>
	</tr>
	<tr height="37" style="background: #fff;">
		<td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">전화번호</label></td>
		<td align="left" style="padding-left: 5px;"><span>${dto.tel}</span></td>
		<td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">신청일</label></td>
		<td align="left" style="padding-left: 5px;"><span>${dto.req_date}</span></td>
	</tr>
	<tr height="37" style="background: #fff;">
		<td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">구분</label></td>
		<td align="left" style="padding-left: 5px;"><span>${dto.gubun}</span></td>
		<td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">상태</label></td>
		<td align="left" style="padding-left: 5px;"><span>${dto.state}</span></td>
	</tr>
</table>
<div>
	<label style="font-weight: 900; display: block;">자격증</label>
	<img src="${pageContext.request.contextPath}/uploads/requestQualification/${dto.saveFilename}">
</div>