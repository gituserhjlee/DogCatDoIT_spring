<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<body>
    <!-- Topbar Section Start -->
    <div class="topbar-section section" style="background-color: #F79F81;">
        <div class="container">
            <div class="row justify-content-between align-items-center">
                <div class="col-md-auto col-12">
                    <p class="text-white text-center text-md-left my-2"><a class="js-weather"></a></p>
                   
                </div>
                <div class="col-auto d-none d-md-block">
                    <div class="topbar-menu">
                        <ul>
                            <li><a href="#" class="text-white"><i class="fa fa-map-marker-alt"></i>서울 마포구</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar Section End -->
    <!-- Header Section Start -->
    <div class="header-section section bg-white d-none d-xl-block">
        <div class="container">
            <div class="row row-cols-lg-3 align-items-center">

                <!-- Header Language & Currency Start -->
                <div class="col">
                    <ul class="header-lan-curr" style="float: left; margin-top: 3px;">
                        <li><a href="#">마이페이지</a>
                            <ul class="curr-lan-sub-menu">
                                <li><a href="${pageContext.request.contextPath}/myPage/main">회원정보</a></li>
                                <li><a href="${pageContext.request.contextPath}/myPage/written">내가 쓴 글</a></li>
                                <li><a href="${pageContext.request.contextPath}/talk/receive/list">쪽지함</a></li>
                                <li><a href="${pageContext.request.contextPath}/myPage/attendance">출석체크</a></li>
                                <li>
                                	<c:if test="${sessionScope.member.userId=='admin'}">
                                		<a href="${pageContext.request.contextPath}/cAdmin/main">관리자페이지</a>
                                	</c:if>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <p style="display: inline; color: lightgray;">&nbsp;&nbsp;|&nbsp;&nbsp;</p>
                    <a href="${pageContext.request.contextPath}/faq/main" style="display: inline; font-size: 16px; font-weight: 400; color: gray;">고객센터</a>
                </div>
                <!-- Header Language & Currency End -->

                <!-- Header Logo Start -->
                <div class="col">
                    <div class="header-logo justify-content-center">
                    	<!-- <a href="index.jsp"><img src="resources/mainResources/images/logo/logo.png" alt="DogCatDoIt Logo"></a> -->
                        <a href="${pageContext.request.contextPath}/"><span class="logotitle" style="font-family: Jua; font-size: 65px; margin-bottom: -10px; color: #696969">독캣두잇</span></a>
                    </div>
                </div>
                <!-- Header Logo End -->

                <!-- Header Tools Start -->
                <div class="col">
                    <div class="header-tools justify-content-end">
                        <div class="header-login" style="font-size: 16px; font-weight: 400; color: gray;">
                        <c:if test="${empty sessionScope.member}">
                        	<a href="${pageContext.request.contextPath}/member/login"><i class="fal fa-user"></i></a>
						</c:if>
						<c:if test="${not empty sessionScope.member}">
							<span style="color:blue; display: inline;">${sessionScope.member.userName}</span>님 
							<p style="display: inline; color: lightgray;">|</p>
							<c:if test="${sessionScope.member.userId!='admin'}">
		                        <span>
		                           <c:choose>
		                              <c:when test="${sessionScope.member.clevel==0}">신규회원</c:when>                           
		                              <c:when test="${sessionScope.member.clevel==1}">일반회원</c:when>
		                              <c:when test="${sessionScope.member.clevel==2}">열심회원</c:when>
		                              <c:when test="${sessionScope.member.clevel==3}">우수회원</c:when>
		                              <c:when test="${sessionScope.member.clevel==4}">대표회원</c:when>
		                           </c:choose>
		                        </span>
		                    </c:if>
							<c:if test="${sessionScope.member.userId=='admin'}">
								<a href="${pageContext.request.contextPath}/cAdmin/main" style="display: inline; color: gray;">관리자</a> <i></i>
							</c:if>
							<p style="display: inline; color: lightgray;">|</p>
							<a href="${pageContext.request.contextPath}/member/logout" style="display: inline; color: gray;"> 로그아웃 </a>
						</c:if>
                        </div>
                    </div>
                </div>
                <!-- Header Tools End -->

            </div>
        </div>

        <!-- Site Menu Section Start -->
        <div class="site-menu-section section">
            <div class="container">
                <nav class="site-main-menu justify-content-center">
                    <ul>
                        <li class="has-children"><a href="#"><span class="menu-text">모두보기</span></a>
                            <ul class="sub-menu mega-menu">
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">홈페이지</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/shopping/mainPage" class="mega-menu-title"><span class="menu-text">두잇몰</span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/shopping/dog"><span class="menu-text">강아지 용품</span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/shopping/cat"><span class="menu-text">고양이 용품</span></a></li>
                                       
                                    </ul>
                                </li>
                                
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">커뮤니티</span></a>
                                    <ul>
                                    <li><a href="${pageContext.request.contextPath}/notice/list"><span class="menu-text">공지사항</span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/zau/list"><span class="menu-text">자유게시판</span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/junggo/main"><span class="menu-text">중고거래게시판</span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/expert/list"><span class="menu-text">동물행동 전문가 Q&A 게시판</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/company/list" class="mega-menu-title"><span class="menu-text">제휴업체</span></a>
                                    
                                </li>
                            </ul>
                        </li>
                        <li class="has-children"><a href="#"><span class="menu-text">두잇몰</span></a>
                            <ul class="sub-menu mega-menu">
                            	<li>
                                    <a href="${pageContext.request.contextPath}/shopping/mainPage" class="mega-menu-title"><span class="menu-text">두잇몰 홈</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/shopping/dog" class="mega-menu-title"><span class="menu-text">강아지</span></a>
                                    <ul>
                                        <li><a href="shop.html"><span class="menu-text">사료</span></a></li>
                                        <li><a href="shop-left-sidebar.html"><span class="menu-text">간식</span></a></li>
                                        <li><a href="shop-right-sidebar.html"><span class="menu-text">위생/배변</span></a></li>
                                        <li><a href="shop-fullwidth-no-gutters.html"><span class="menu-text">영양제</span></a></li>
                                        <li><a href="shop-fullwidth.html"><span class="menu-text">용품</span></a></li>
                                        <li><a href="shop-fullwidth-left-sidebar.html"><span class="menu-text">패션</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/shopping/cat" class="mega-menu-title"><span class="menu-text">고양이</span></a>
                                    <ul>
                                        <li><a href="shop.html"><span class="menu-text">사료</span></a></li>
                                        <li><a href="shop-left-sidebar.html"><span class="menu-text">간식</span></a></li>
                                        <li><a href="shop-right-sidebar.html"><span class="menu-text">위생/배변</span></a></li>
                                        <li><a href="shop-fullwidth-no-gutters.html"><span class="menu-text">영양제</span></a></li>
                                        <li><a href="shop-fullwidth.html"><span class="menu-text">용품</span></a></li>
                                        <li><a href="shop-fullwidth-left-sidebar.html"><span class="menu-text">패션</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">기획전</span></a>
                                    <ul>
                                        <li><a href="product-details-background.html"><span class="menu-text">여름특집! 더위 탈출 넘버원</span></a></li>
                                        <li><a href="shopping-cart.html"><span class="menu-text">묘확행</span></a></li>
                                        <li><a href="checkout.html"><span class="menu-text">위트있는 신상 둘러보기</span></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        
                        <li class="has-children"><a href="#"><span class="menu-text">커뮤니티</span></a>
                            <ul class="sub-menu">
                            <li class="no-children"><a href="${pageContext.request.contextPath}/notice/list"><span class="menu-text">공지사항</span></a></li>
                                <li class="no-children"><a href="${pageContext.request.contextPath}/zau/list"><span class="menu-text">자유게시판</span></a>
                                </li>
                                <li class="no-children"><a href="${pageContext.request.contextPath}/junggo/main"><span class="menu-text">중고거래게시판</span></a>
                                </li>

                              <%--   <li class="has-children"><a href="${pageContext.request.contextPath}/expert/list"><span class="menu-text">동물행동전문가 게시판</span></a>
<!--                                     <ul class="sub-menu">
                                        <li><a href="blog-list-right-sidebar.html"><span class="menu-text">훈련정보</span></a></li>
                                        <li><a href="blog-list-left-sidebar.html"><span class="menu-text">사료정보</span></a></li>
                                        <li><a href="blog-list-fullwidth.html"><span class="menu-text">꿀팁모음</span></a></li>
                                    </ul> -->
                                </li> --%>

                                <li class="no-children"><a href="${pageContext.request.contextPath}/expert/list"><span class="menu-text">동물행동 전문가 Q&A 게시판</span></a></li>


                                <li class="has-children"><a href="blog-masonry-right-sidebar.html"><span class="menu-text">산책메이트게시판</span></a>
                                </li>
                                <li class="has-children"><a href="blog-details-right-sidebar.html"><span class="menu-text">반려동물행사</span></a>
                                </li>

                            </ul>
                        </li>
                        <li class="no-children"><a href="${pageContext.request.contextPath}/company/list"><span class="menu-text">제휴업체</span></a>
     
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- Site Menu Section End -->

    </div>
    <!-- Header Section End -->

    <!-- Header Sticky Section Start -->
    <div class="sticky-header header-menu-center section bg-white d-none d-xl-block">
        <div class="container">
            <div class="row align-items-center">

                <!-- Header Logo Start -->
                <div class="col">
                    <div class="header-logo">
                        <a href="${pageContext.request.contextPath}/"><span class="logotitle" style="font-family: Jua; font-size: 50px; margin-bottom: -10px;color: #696969;">독캣두잇</span></a>
                    </div>
                </div>
                <!-- Header Logo End -->

                <!-- Search Start -->
                <div class="col d-none d-xl-block">
                    <nav class="site-main-menu justify-content-center">
                        <ul>
                            <li class="has-children"><a href="#"><span class="menu-text">모두보기</span></a>
                                <ul class="sub-menu mega-menu">
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">홈페이지</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/shopping/mainPage" class="mega-menu-title"><span class="menu-text">두잇몰</span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/shopping/dog"><span class="menu-text">강아지 용품</span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/shopping/cat"><span class="menu-text">고양이 용품</span></a></li>
                                    </ul>
                                </li>
                                
                                <li>
                                    <a href="index-2.html" class="mega-menu-title"><span class="menu-text">커뮤니티</span></a>
                                    <ul>
                                    <li><a href="${pageContext.request.contextPath}/notice/list"><span class="menu-text">공지사항</span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/zau/list"><span class="menu-text">자유게시판</span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/junggo/main"><span class="menu-text">중고거래게시판</span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/expert/list"><span class="menu-text">동물행동전문가 Q&A 게시판</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/company/list" class="mega-menu-title"><span class="menu-text">제휴업체</span></a>
                                    
                                </li>
                            </ul>
                            </li>
                            <li class="has-children"><a href="#"><span class="menu-text">두잇몰</span></a>
                                <ul class="sub-menu mega-menu">
                            	<li>
                                    <a href="${pageContext.request.contextPath}/shopping/mainPage" class="mega-menu-title"><span class="menu-text">두잇몰 홈</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/shopping/dog" class="mega-menu-title"><span class="menu-text">강아지</span></a>
                                    <ul>
                                        <li><a href="shop.html"><span class="menu-text">사료</span></a></li>
                                        <li><a href="shop-left-sidebar.html"><span class="menu-text">간식</span></a></li>
                                        <li><a href="shop-right-sidebar.html"><span class="menu-text">위생/배변</span></a></li>
                                        <li><a href="shop-fullwidth-no-gutters.html"><span class="menu-text">영양제</span></a></li>
                                        <li><a href="shop-fullwidth.html"><span class="menu-text">용품</span></a></li>
                                        <li><a href="shop-fullwidth-right-sidebar.html"><span class="menu-text">패션</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/shopping/cat" class="mega-menu-title"><span class="menu-text">고양이</span></a>
                                    <ul>
                                        <li><a href="shop.html"><span class="menu-text">사료</span></a></li>
                                        <li><a href="shop-left-sidebar.html"><span class="menu-text">간식</span></a></li>
                                        <li><a href="shop-right-sidebar.html"><span class="menu-text">위생/배변</span></a></li>
                                        <li><a href="shop-fullwidth-no-gutters.html"><span class="menu-text">영양제</span></a></li>
                                        <li><a href="shop-fullwidth.html"><span class="menu-text">용품</span></a></li>
                                        <li><a href="shop-fullwidth-right-sidebar.html"><span class="menu-text">패션</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">기획전</span></a>
                                    <ul>
                                        <li><a href="product-details-background.html"><span class="menu-text">여름특집! 더위 탈출 넘버원</span></a></li>
                                        <li><a href="shopping-cart.html"><span class="menu-text">묘확행</span></a></li>
                                        <li><a href="checkout.html"><span class="menu-text">위트있는 신상 둘러보기</span></a></li>
                                    </ul>
                                </li>
                            </ul>
                            </li>
                            
                            <li class="has-children"><a href="#"><span class="menu-text">커뮤니티</span></a>
                                <ul class="sub-menu">
                                <li class="no-children"><a href="${pageContext.request.contextPath}/notice/list"><span class="menu-text">공지사항</span></a></li>
                                <li class="no-children"><a href="${pageContext.request.contextPath}/zau/list"><span class="menu-text">자유게시판</span></a>
                                </li>
                                <li class="no-children"><a href="${pageContext.request.contextPath}/junggo/main"><span class="menu-text">중고거래게시판</span></a>
                                </li>

                                <li class="has-children"><a href="${pageContext.request.contextPath}/expert/list"><span class="menu-text">동물행동 전문가 Q&A 게시판</span></a>
<!--                                     <ul class="sub-menu">
                                        <li><a href="blog-list-right-sidebar.html"><span class="menu-text">훈련정보</span></a></li>
                                        <li><a href="blog-list-left-sidebar.html"><span class="menu-text">사료정보</span></a></li>
                                        <li><a href="blog-list-fullwidth.html"><span class="menu-text">꿀팁모음</span></a></li>
                                    </ul> -->
                                </li>

                                <li class="no-children"><a href="${pageContext.request.contextPath}/expert/list"><span class="menu-text">동물행동 전문가 Q&A 게시판</span></a></li>

                                <li class="has-children"><a href="blog-masonry-right-sidebar.html"><span class="menu-text">산책메이트게시판</span></a>
                                </li>
                                <li class="has-children"><a href="blog-details-right-sidebar.html"><span class="menu-text">반려동물행사</span></a>
                                </li>

                            </ul>
                            </li>
                            <li class="no-children"><a href="${pageContext.request.contextPath}/company/list"><span class="menu-text">제휴업체</span></a>
                                
                            </li>
                        </ul>
                    </nav>
                </div>
                <!-- Search End -->

                <!-- Header Tools Start -->
                <div class="col-auto">
                    <div class="header-tools justify-content-end">
                        <div class="header-login" style="font-size: 16px; font-weight: 400; color: gray;">
                        <c:if test="${empty sessionScope.member}">
                        	<a href="${pageContext.request.contextPath}/member/login"><i class="fal fa-user"></i></a>
						</c:if>
						<c:if test="${not empty sessionScope.member}">
							<span style="color:blue; display: inline;">${sessionScope.member.userName}</span>님 
							<p style="display: inline; color: lightgray;">|</p>
							<a href="${pageContext.request.contextPath}/member/logout" style="display: inline; color: gray;"> 로그아웃 </a>
						</c:if>
                        </div>
                        <div class="mobile-menu-toggle d-xl-none">
                            <a href="#offcanvas-mobile-menu" class="offcanvas-toggle">
                                <svg viewBox="0 0 800 600">
                                    <path d="M300,220 C300,220 520,220 540,220 C740,220 640,540 520,420 C440,340 300,200 300,200" id="top"></path>
                                    <path d="M300,320 L540,320" id="middle"></path>
                                    <path d="M300,210 C300,210 520,210 540,210 C740,210 640,530 520,410 C440,330 300,190 300,190" id="bottom" transform="translate(480, 320) scale(1, -1) translate(-480, -318) "></path>
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Header Tools End -->

            </div>
        </div>

    </div>
    <!-- Header Sticky Section End -->
    <!-- Mobile Header Section Start -->
    <div class="mobile-header bg-white section d-xl-none">
        <div class="container">
            <div class="row align-items-center">

                <!-- Header Logo Start -->
                <div class="col">
                    <div class="header-logo">
                        <a href="${pageContext.request.contextPath}/"><span class="logotitle" style="font-family: Jua; font-size: 40px; margin-bottom: -10px;color: #696969;">독캣두잇</span></a>
                    </div>
                </div>
                <!-- Header Logo End -->

                <!-- Header Tools Start -->
                <div class="col-auto">
                    <div class="header-tools justify-content-end">
                        <div class="header-login" style="font-size: 16px; font-weight: 400; color: gray;">
                        <c:if test="${empty sessionScope.member}">
                        	<a href="${pageContext.request.contextPath}/member/login"><i class="fal fa-user"></i></a>
						</c:if>
						<c:if test="${not empty sessionScope.member}">
							<span style="color:blue; display: inline;">${sessionScope.member.userName}</span>님 
							<p style="display: inline; color: lightgray;">|</p>
							<a href="${pageContext.request.contextPath}/member/logout" style="display: inline; color: gray;"> 로그아웃 </a>
						</c:if>
                        </div>
                        <div class="mobile-menu-toggle">
                            <a href="#offcanvas-mobile-menu" class="offcanvas-toggle">
                                <svg viewBox="0 0 800 600">
                                    <path d="M300,220 C300,220 520,220 540,220 C740,220 640,540 520,420 C440,340 300,200 300,200" id="top"></path>
                                    <path d="M300,320 L540,320" id="middle"></path>
                                    <path d="M300,210 C300,210 520,210 540,210 C740,210 640,530 520,410 C440,330 300,190 300,190" id="bottom" transform="translate(480, 320) scale(1, -1) translate(-480, -318) "></path>
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Header Tools End -->

            </div>
        </div>
    </div>
    <!-- Mobile Header Section End -->

    <!-- Mobile Header Section Start -->
    <div class="mobile-header sticky-header bg-white section d-xl-none">
        <div class="container">
            <div class="row align-items-center">

                <!-- Header Logo Start -->
                <div class="col">
                    <div class="header-logo">
                        <a href="${pageContext.request.contextPath}/"><span class="logotitle" style="font-family: Jua; font-size: 40px; margin-bottom: -10px; color: #696969;">독캣두잇</span></a>
                    </div>
                </div>
                <!-- Header Logo End -->

                <!-- Header Tools Start -->
                <div class="col-auto">
                    <div class="header-tools justify-content-end">
                        <div class="header-login" style="font-size: 16px; font-weight: 400; color: gray;">
                        <c:if test="${empty sessionScope.member}">
                        	<a href="${pageContext.request.contextPath}/member/login"><i class="fal fa-user"></i></a>
						</c:if>
						<c:if test="${not empty sessionScope.member}">
							<span style="color:blue; display: inline;">${sessionScope.member.userName}</span>님 
							<p style="display: inline; color: lightgray;">|</p>
							<a href="${pageContext.request.contextPath}/member/logout" style="display: inline; color: gray;"> 로그아웃 </a>
						</c:if>
                        </div>
                        <div class="mobile-menu-toggle">
                            <a href="#offcanvas-mobile-menu" class="offcanvas-toggle">
                                <svg viewBox="0 0 800 600">
                                    <path d="M300,220 C300,220 520,220 540,220 C740,220 640,540 520,420 C440,340 300,200 300,200" id="top"></path>
                                    <path d="M300,320 L540,320" id="middle"></path>
                                    <path d="M300,210 C300,210 520,210 540,210 C740,210 640,530 520,410 C440,330 300,190 300,190" id="bottom" transform="translate(480, 320) scale(1, -1) translate(-480, -318) "></path>
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Header Tools End -->

            </div>
        </div>
    </div>
    <!-- Mobile Header Section End -->
    
    <!-- OffCanvas Search Start -->
    <div id="offcanvas-mobile-menu" class="offcanvas offcanvas-mobile-menu">
        <div class="inner customScroll">
        	<!--  
            <div class="offcanvas-menu-search-form">
                <form action="#">
                    <input type="text" placeholder="Search...">
                    <button><i class="fal fa-search"></i></button>
                </form>
            </div>
            -->
            <div class="offcanvas-menu">
                <ul>
                    <li><a href="#"><span class="menu-text">모두보기</span></a>
                        <ul class="sub-menu">
                            <li>
                                <a href="#"><span class="menu-text">두잇몰</span></a>
                                <ul class="sub-menu">
                                	<li><a href="${pageContext.request.contextPath}/shopping/mainPage"><span class="menu-text">두잇몰홈</span></a></li>
                                    <li><a href="index.html"><span class="menu-text">강아지 용품</span></a></li>
                                    <li><a href="index-2.html"><span class="menu-text">고양이 용품</span></a></li>
                                    <li><a href="index-3.html"><span class="menu-text">사료</span></a></li>
                                    <li><a href="index-4.html"><span class="menu-text">장난감</span></a></li>
                                </ul>
                            </li>
                            
                            <li>
                                <a href="#"><span class="menu-text">커뮤니티</span></a>
                                <ul class="sub-menu">
                                <li><a href="${pageContext.request.contextPath}/notice/list"><span class="menu-text">공지사항</span></a></li>
                                    <li><a href="${pageContext.request.contextPath}/zau/list"><span class="menu-text">자유게시판</span></a></li>
                                    <li><a href="${pageContext.request.contextPath}/junggo/main"><span class="menu-text">중고거래게시판</span></a></li>
                                    <li><a href="${pageContext.request.contextPath}/expert/list"><span class="menu-text">동물행동전문가 Q&A 게시판</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/company/list"><span class="menu-text">제휴업체</span></a>
                                
                            </li>
                        </ul>
                    </li>
                    <li><a href="#"><span class="menu-text">두잇몰</span></a>
                        <ul class="sub-menu">
                        	<li>
                        	<a href="${pageContext.request.contextPath}/shopping/mainPage"><span class="menu-text">두잇몰홈</span></a>
                            </li>
                            <li>
                                <a href="#"><span class="menu-text">강아지</span></a>
                                <ul class="sub-menu">
                                    <li><a href="shop.html"><span class="menu-text">사료</span></a></li>
                                    <li><a href="shop-left-sidebar.html"><span class="menu-text">간식</span></a></li>
                                    <li><a href="shop-right-sidebar.html"><span class="menu-text">케어</span></a></li>
                                    <li><a href="shop-fullwidth-no-gutters.html"><span class="menu-text">리빙</span></a></li>
                                    <li><a href="shop-fullwidth.html"><span class="menu-text">외출</span></a></li>
                                    <li><a href="shop-fullwidth-left-sidebar.html"><span class="menu-text">장난감</span></a></li>
                                    <li><a href="shop-fullwidth-right-sidebar.html"><span class="menu-text">패션</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><span class="menu-text">고양이</span></a>
                                <ul class="sub-menu">
                                    <li><a href="shop.html"><span class="menu-text">사료</span></a></li>
                                    <li><a href="shop-left-sidebar.html"><span class="menu-text">간식</span></a></li>
                                    <li><a href="shop-right-sidebar.html"><span class="menu-text">케어</span></a></li>
                                    <li><a href="shop-fullwidth-no-gutters.html"><span class="menu-text">리빙</span></a></li>
                                    <li><a href="shop-fullwidth.html"><span class="menu-text">외출</span></a></li>
                                    <li><a href="shop-fullwidth-left-sidebar.html"><span class="menu-text">장난감</span></a></li>
                                    <li><a href="shop-fullwidth-right-sidebar.html"><span class="menu-text">패션</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" class="mega-menu-title"><span class="menu-text">기획전</span></a>
                                <ul class="sub-menu">
                                    <li><a href="shopping-cart.html"><span class="menu-text">여름특집 더위탈출 넘버원!</span></a></li>
                                    <li><a href="checkout.html"><span class="menu-text">묘확행</span></a></li>
                                    <li><a href="order-tracking.html"><span class="menu-text">신상 둘러보기</span></a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    
                    <li><a href="#"><span class="menu-text">커뮤니티</span></a>
                        <ul class="sub-menu">
                        <li><a href="${pageContext.request.contextPath}/notice/list"><span class="menu-text">공지사항</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/zau/list"><span class="menu-text">자유게시판</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/junggo/main"><span class="menu-text">중고거래게시판</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/expert/list"><span class="menu-text">동물행동 전문가 Q&A 게시판</span></a></li>
                            
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/company/list"><span class="menu-text">제휴업체</span></a>
     
                    </li>
                    <li><a href="#"><span class="menu-text">마이페이지</span></a>
                        <ul class="sub-menu">
                            <li><a href="${pageContext.request.contextPath}/myPage/main"><span class="menu-text">회원정보</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/myPage/written"><span class="menu-text">내가 쓴 글</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/talk/receive/list"><span class="menu-text">쪽지함</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/myPage/attendance"><span class="menu-text">출석체크</span></a>
                            </li>
                            <li>
                                <c:if test="${sessionScope.member.userId=='admin'}">
                                	<a href="${pageContext.request.contextPath}/cAdmin/main">관리자페이지</a>
                                </c:if>
                            </li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/faq/main"><span class="menu-text">자주 묻는 질문</span></a></li>
                </ul>
            </div>
            <div class="offcanvas-buttons">
                <div class="header-tools">
                    <div class="header-login" style="font-size: 16px; font-weight: 400; color: gray;">
                        <c:if test="${empty sessionScope.member}">
                        	<a href="${pageContext.request.contextPath}/member/login"><i class="fal fa-user"></i></a>
						</c:if>
						<c:if test="${not empty sessionScope.member}">
							<span style="color:blue; display: inline;">${sessionScope.member.userName}</span>님 
							<p style="display: inline; color: lightgray;">|</p>
							<c:if test="${sessionScope.member.userId!='admin'}">
		                        <span>
		                           <c:choose>
		                              <c:when test="${sessionScope.member.clevel==0}">신규회원</c:when>                           
		                              <c:when test="${sessionScope.member.clevel==1}">일반회원</c:when>
		                              <c:when test="${sessionScope.member.clevel==2}">열심회원</c:when>
		                              <c:when test="${sessionScope.member.clevel==3}">우수회원</c:when>
		                              <c:when test="${sessionScope.member.clevel==4}">대표회원</c:when>
		                           </c:choose>
		                        </span>
		                    </c:if>
							<c:if test="${sessionScope.member.userId=='admin'}">
								<a href="${pageContext.request.contextPath}/cAdmin/main" style="display: inline; color: gray;">관리자</a> <i></i>
							</c:if>
							<p style="display: inline; color: lightgray;">|</p>
							<a href="${pageContext.request.contextPath}/member/logout" style="display: inline; color: gray;"> 로그아웃 </a>
						</c:if>
                        </div>
                </div>
            </div>
            <div class="offcanvas-social">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
            </div>
        </div>
    </div>
    <!— OffCanvas Search End —>

    <div class="offcanvas-overlay"></div>
</body>