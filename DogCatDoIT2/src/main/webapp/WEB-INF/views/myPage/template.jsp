<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
$(function () {
	$("#profileMenu").click(function () {
		$("#profile").toggle(100);
	});
	
	$("#pointCuponMenu").click(function () {
		$("#pointCupon").toggle(100);
	});
	
	$("#shoppingMenu").click(function () {
		$("#shopping").toggle(100);
	});
	
	$("#memberMenu").click(function () {
		$("#member").toggle(100);
	});
});
</script>
<div class="myPageMenu" style="width: 250px; float: left;">
	<div>
		<h3>마이페이지</h3>
	</div>
	<div>
		<ul style="list-style: none; padding: 20px 0;">
			<li><a href="${pageContext.request.contextPath}/myPage/attendance">출석체크</a></li>
			<li><a href="${pageContext.request.contextPath}/myPage/userCalendar">캘린더</a></li>
			<li>
				<span id="profileMenu" style="cursor: pointer">프로필</span>
				<ul style="list-style: none; display: none;" id="profile">
					<li><a href="${pageContext.request.contextPath}/myPage/userProfile">프로필</a></li>
					<li><a href="${pageContext.request.contextPath}/myPage/setMasterProfile">펫시터, 훈련사 프로필</a></li>
					<li><a href="${pageContext.request.contextPath}/myPage/setCompanyProfile">업체 프로필</a></li>
				</ul>
			</li>
			
			<li><a href="${pageContext.request.contextPath}/myPage/insertRequestQualification">자격신청</a></li>
			<li><a href="${pageContext.request.contextPath}/myPage/listQualification">자격신청내역</a></li>
			<li><a href="${pageContext.request.contextPath}/myPage/written">내가 쓴 글</a></li>
			<li><a href="${pageContext.request.contextPath}/myPage/reserve">예약 내역</a></li>
			<li>
				<span id="pointCuponMenu" style="cursor: pointer">포인트 및 쿠폰</span>
				<ul style="list-style: none; display: none;" id="pointCupon">
					<li><a href="${pageContext.request.contextPath}/myPage/point">포인트</a></li>
					<li><a href="${pageContext.request.contextPath}/myPage/cupon">쿠폰</a></li>
				</ul>
			</li>
			<li>
				<span id="shoppingMenu" style="cursor: pointer">쇼핑</span>
				<ul style="list-style: none; display: none;" id="shopping">
					<li><a href="${pageContext.request.contextPath}/myPage/purchase">구매내역</a></li>
					<li><a href="${pageContext.request.contextPath}/order/cart">장바구니</a></li>
				</ul>
			</li>
			<li>
				<span id="memberMenu" style="cursor: pointer">회원정보</span>
				<ul style="list-style: none; display: none;" id="member">
					<li><a href="${pageContext.request.contextPath}/myPage/checkPwd?mode=1">회원정보수정</a></li>
					<li><a href="${pageContext.request.contextPath}/myPage/checkPwd?mode=2">회원탈퇴</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>