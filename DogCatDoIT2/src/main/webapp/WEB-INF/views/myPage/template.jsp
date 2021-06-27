<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
$(function () {
	$("#shoppingMenu").click(function () {
		$("#shopping").toggle(100);
	});
	
	$("#memberMenu").click(function () {
		$("#member").toggle(100);
	});
});
</script>
<div class="myPageMenu" style="width: 230px; float: left;">
	<div style="text-align: center;">
		<h3>마이페이지</h3>
	</div>
	<div>
		<ul style="list-style: none; padding: 20px 0 20px 40px; width: 230px; min-height: 370px;">
			<li style="padding: 5px;"><a href="${pageContext.request.contextPath}/myPage/attendance">출석체크</a></li>
			<li style="padding: 5px;"><a href="${pageContext.request.contextPath}/myPage/userCalendar">캘린더</a></li>
			<li style="padding: 5px;"><a href="${pageContext.request.contextPath}/myPage/userProfile">프로필</a></li>
			<li style="padding: 5px;"><a href="${pageContext.request.contextPath}/myPage/insertRequestQualification">자격신청</a></li>
			<li style="padding: 5px;"><a href="${pageContext.request.contextPath}/myPage/listQualification">자격신청내역</a></li>
			<li style="padding: 5px;"><a href="${pageContext.request.contextPath}/myPage/posting">내가 쓴 글</a></li>
			<li style="padding: 5px;"><a href="${pageContext.request.contextPath}/myPage/reserve">예약 내역</a></li>	
			<li style="padding: 5px;"><a href="${pageContext.request.contextPath}/myPage/point">포인트</a></li>
			<li style="padding: 5px;">
				<span id="shoppingMenu" style="cursor: pointer">쇼핑</span>
				<ul style="list-style: none; display: none;" id="shopping">
					<li><a href="${pageContext.request.contextPath}/order/orderList">구매내역</a></li>
					<li><a href="${pageContext.request.contextPath}/order/cart">장바구니</a></li>
				</ul>
			</li>
			<li style="padding: 5px;">
				<span id="memberMenu" style="cursor: pointer">회원정보</span>
				<ul style="list-style: none; display: none;" id="member">
					<li><a href="${pageContext.request.contextPath}/myPage/checkPwd?mode=1">회원정보수정</a></li>
					<li><a href="${pageContext.request.contextPath}/myPage/checkPwd?mode=2">회원탈퇴</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>