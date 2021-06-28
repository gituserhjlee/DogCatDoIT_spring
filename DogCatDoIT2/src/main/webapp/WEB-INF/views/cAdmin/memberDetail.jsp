<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table style="margin: 10px auto 20px; width: 100%; border-spacing: 1px; background: #ccc">
	<tr height="37" style="background: #fff;">
		<td align="right" width="18%" style="padding-right: 7px;"><label style="font-weight: 900;">회원번호</label></td>
		<td align="left" width="32%" style="padding-left: 5px;"><span>${dto.userIdx}</span></td>
		<td align="right" width="18%" style="padding-right: 7px;"><label style="font-weight: 900;">아이디</label></td>
		<td align="left" width="32%" style="padding-left: 5px;"><span>${dto.userId}</span></td>
	</tr>
	<tr height="37" style="background: #fff;">
		<td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">이름</label></td>
		<td align="left" style="padding-left: 5px;"><span>${dto.name}</span></td>
		<td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">전화번호</label></td>
		<td align="left" style="padding-left: 5px;"><span>${dto.tel}</span></td>
	</tr>
	<tr height="37" style="background: #fff;">
		<td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">이메일</label></td>
		<td align="left" style="padding-left: 5px;"><span>${dto.email}</span></td>
		<td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">회원가입일</label></td>
		<td align="left" style="padding-left: 5px;"><span>${dto.reg_date}</span></td>
	</tr>
	
	<tr height="37" style="background: #fff;">
		<td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">회원 구분</label></td>
		<td align="left" style="padding-left: 5px;"><span>${dto.qualificationName}</span></td>
		<td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">포인트</label></td>
		<td align="left" style="padding-left: 5px;"><span>${dto.point}</span></td>
	</tr>
	
	<tr height="37" style="background: #fff;">
		<td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">커뮤니티 등급</label></td>
		<td align="left" style="padding-left: 5px;"><span><c:set var="b">${dto.clevel}</c:set>${map[b]}</span></td>
		<td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">쇼핑몰 등급</label></td>
		<td align="left" style="padding-left: 5px;"><span>${dto.levelName}</span></td>
	</tr>
</table>

<form id="detailedMemberForm" name="detailedMemberForm" method="post">
	<h3 style="font-size: 15px;">등급 및 포인트 관리</h3>
	
	<table style="margin: 5px auto 0; width: 100%; border-spacing: 1px; background: #ccc">
		<tr height="37" style="background: #fff;">
			<td align="right" width="18%" style="padding-right: 9px;"><label style="font-weight: 900;">커뮤니티 등급</label></td>
			<td style="padding-left: 5px;" width="32%">
				<select class="selectField" id="clevel" name="clevel" onchange="selectClevelChange()">
					<option value="">커뮤니티 등급</option>
					<option value="0" ${dto.clevel==0? "selected='selected'":""}>0</option>
					<option value="1" ${dto.clevel==1? "selected='selected'":""}>1</option>
					<option value="2" ${dto.clevel==2? "selected='selected'":""}>2</option>
					<option value="3" ${dto.clevel==3? "selected='selected'":""}>3</option>
					<option value="4" ${dto.clevel==4? "selected='selected'":""}>4</option>
				</select>
			</td>
			<td align="right" width="18%" style="padding-right: 9px;"><label style="font-weight: 900;">포인트 수정</label></td>
			<td style="padding-left: 5px;" width="32%">
				<input type="text" name="point" value="${dto.point}">
			</td>
		</tr>
		
	</table>
	<input type="hidden" name="userIdx" value="${dto.userIdx}">
	<input type="hidden" name="userId" value="${dto.userId}">
</form>
<h3 style="font-size: 15px;">게시글 내역</h3>
<table style="width: 100%; border-collapse: collapse; border-spacing: 0; font-size: 15px;">
	<c:if test="${empty postingList}">
		게시글 내역이 없습니다.
	</c:if>
	<c:if test="${not empty postingList}">
		<tr style="border-top: 0.5px solid #eee; border-bottom: 0.5px solid #eee;" height="30">
			<td width="20%">번호</td>
			<td width="50%">제목</td>
			<td width="30%">등록일자</td>
		</tr>
	</c:if>
	<c:forEach var="vo" items="${postingList}">
		<tr style="border-bottom: 0.5px solid #eee;" height="30">
			<td>${vo.listNum}</td>
			<td>${vo.subject}</td>
			<td>${vo.reg_date}</td>
		</tr>	
	</c:forEach>
</table>
<h3 style="font-size: 15px;">최근 구매 내역</h3>
<table style="width: 100%; border-collapse: collapse; border-spacing: 0; font-size: 15px;">
	<c:if test="${empty list}">
		구매내역이 없습니다.
	</c:if>
	<c:if test="${not empty list}">
		<tr style="border-top: 0.5px solid #eee; border-bottom: 0.5px solid #eee;" height="30">
			<td width="20%">구매일자</td>
			<td width="60%">상품명</td>
			<td width="20%">총구매가격</td>
		</tr>
	</c:if>
	<c:forEach var="vo" items="${list}">
		<tr style="border-bottom: 0.5px solid #eee;" height="30">
			<td>${vo.order_date}</td>
			<td>${vo.orderName}</td>
			<td>${vo.totalItemPrice}</td>
		</tr>	
	</c:forEach>
</table>