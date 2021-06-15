<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="myPageMenu">
	<div>
		<h3>마이페이지</h3>
	</div>
	<div class="myPageMenu-list">
		<ul id="ul">
			<li><a href="${pageContext.request.contextPath}/myPage/attendance">출석체크</a></li>
			<li><a href="${pageContext.request.contextPath}/myPage/userCalendar">캘린더</a></li>
			<li>회원정보</li>
			<li><a href="${pageContext.request.contextPath}/myPage/userProfile?orderNum=1">프로필</a></li>
			<li><a href="${pageContext.request.contextPath}/myPage/insertRequestQualification">자격신청</a></li>
			<li><a href="${pageContext.request.contextPath}/myPage/listQualification">자격신청내역</a></li>
			<li><a href="${pageContext.request.contextPath}/myPage/setMasterProfile">펫시터, 훈련사 프로필</a></li>
			<li><a href="${pageContext.request.contextPath}/myPage/setCompanyProfile">업체 프로필</a></li>
			<li><a href="${pageContext.request.contextPath}/myPage/checkPwd?mode=1">회원정보수정</a></li>
			<li><a href="${pageContext.request.contextPath}/myPage/checkPwd?mode=2">회원탈퇴</a></li>
			<li><a href="${pageContext.request.contextPath}/myPage/written">내가 쓴 글</a></li>
			<li><a href="${pageContext.request.contextPath}/myPage/reserve">예약 내역</a></li>
			<li>포인트 및 쿠폰</li>
			<li><a href="${pageContext.request.contextPath}/myPage/point">포인트</a></li>
			<li><a href="${pageContext.request.contextPath}/myPage/cupon">쿠폰</a></li>
			<li>쇼핑</li>
			<li><a href="${pageContext.request.contextPath}/myPage/purchase">구매내역</a></li>
			<li><a href="${pageContext.request.contextPath}/myPage/cart">장바구니</a></li>
			<li><a href="${pageContext.request.contextPath}/myPage/zzim">찜</a></li>
		</ul>
	</div>
</div>