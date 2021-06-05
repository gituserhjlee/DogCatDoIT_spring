<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>독캣두잇</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="resources/mainResources/images/favicon.png">

    <!-- CSS
	============================================ -->

    <!-- Vendor CSS (Bootstrap & Icon Font) -->
    <link rel="stylesheet" href="resources/mainResources/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="resources/mainResources/css/vendor/font-awesome-pro.min.css">
    <link rel="stylesheet" href="resources/mainResources/css/vendor/themify-icons.css">
    <link rel="stylesheet" href="resources/mainResources/css/vendor/customFonts.css">

    <!-- Plugins CSS (All Plugins Files) -->
    <link rel="stylesheet" href="resources/mainResources/css/plugins/select2.min.css">
    <link rel="stylesheet" href="resources/mainResources/css/plugins/perfect-scrollbar.css">
    <link rel="stylesheet" href="resources/mainResources/css/plugins/swiper.min.css">
    <link rel="stylesheet" href="resources/mainResources/css/plugins/nice-select.css">
    <link rel="stylesheet" href="resources/mainResources/css/plugins/ion.rangeSlider.min.css">
    <link rel="stylesheet" href="resources/mainResources/css/plugins/photoswipe.css">
    <link rel="stylesheet" href="resources/mainResources/css/plugins/photoswipe-default-skin.css">
    <link rel="stylesheet" href="resources/mainResources/css/plugins/magnific-popup.css">
    <link rel="stylesheet" href="resources/mainResources/css/plugins/slick.css">

    <!-- Main Style CSS -->
    <link rel="stylesheet" href="resources/mainResources/css/style.css">
    <!-- 독캣두잇 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">

    <!-- Use the minified version files listed below for better performance and remove the files listed above -->
    <!-- <link rel="stylesheet" href="resources/mainResources/css/vendor/vendor.min.css">
    <link rel="stylesheet" href="resources/mainResources/css/plugins/plugins.min.css">
    <link rel="stylesheet" href="resources/mainResources/css/style.min.css"> -->

</head>

<body>

    <!-- Topbar Section Start -->
    <div class="topbar-section section" style="background-color: #F79F81;">
        <div class="container">
            <div class="row justify-content-between align-items-center">
                <div class="col-md-auto col-12">
                    <p class="text-white text-center text-md-left my-2">날씨 23°C 맑음 | 산책하기 딱 좋은 날씨네요!</p>
                </div>
                <div class="col-auto d-none d-md-block">
                    <div class="topbar-menu">
                        <ul>
                            <li><a href="#" class="text-white"><i class="fa fa-map-marker-alt"></i>서울 마포구</a></li>
                            <li><a href="#" class="text-white"><i class="fa fa-truck"></i>배송안내</a></li>
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
                    <ul class="header-lan-curr">
                        <li><a href="#">고객센터</a>
                            <ul class="curr-lan-sub-menu">
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">자주묻는질문</a></li>
                                <li><a href="#">1:1문의</a></li>
                                <li><a href="#">제휴문의</a></li>
                            </ul>
                        </li>
                        <li><a href="#">마이페이지</a>
                            <ul class="curr-lan-sub-menu">
                                <li><a href="#">내정보관리</a></li>
                                <li><a href="#">내가쓴글</a></li>
                                <li><a href="#">주문배송</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- Header Language & Currency End -->

                <!-- Header Logo Start -->
                <div class="col">
                    <div class="header-logo justify-content-center">
                    	<!-- <a href="index.jsp"><img src="resources/mainResources/images/logo/logo.png" alt="DogCatDoIt Logo"></a> -->
                        <a href="${pageContext.request.contextPath}/"><span class="logotitle" style="font-family: Jua; font-size: 65px; margin-bottom: -10px;">독캣두잇</span></a>
                    </div>
                </div>
                <!-- Header Logo End -->

                <!-- Header Tools Start -->
                <div class="col">
                    <div class="header-tools justify-content-end">
                        <div class="header-login">
                            <a href="${pageContext.request.contextPath}/member/login"><i class="fal fa-user"></i></a>
                        </div>
                        <div class="header-search">
                            <a href="#offcanvas-search" class="offcanvas-toggle"><i class="fal fa-search"></i></a>
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
                                    <a href="index-2.html" class="mega-menu-title"><span class="menu-text">두잇몰</span></a>
                                    <ul>
                                        <li><a href="index-5.html"><span class="menu-text">강아지 용품</span></a></li>
                                        <li><a href="index-5.html"><span class="menu-text">고양이 용품</span></a></li>
                                        <li><a href="index-5.html"><span class="menu-text">사료</span></a></li>
                                        <li><a href="index-5.html"><span class="menu-text">장난감</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="index-2.html" class="mega-menu-title"><span class="menu-text">제휴업체</span></a>
                                    <ul>
                                        <li><a href="index-5.html"><span class="menu-text">미용</span></a></li>
                                        <li><a href="index-5.html"><span class="menu-text">애견 호텔</span></a></li>
                                        <li><a href="index-5.html"><span class="menu-text">훈련사</span></a></li>
                                        <li><a href="index-5.html"><span class="menu-text">펫시터</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="index-2.html" class="mega-menu-title"><span class="menu-text">커뮤니티</span></a>
                                    <ul>
                                        <li><a href="index-5.html"><span class="menu-text">자유게시판</span></a></li>
                                        <li><a href="index-5.html"><span class="menu-text">중고거래게시판</span></a></li>
                                        <li><a href="index-5.html"><span class="menu-text">훈련정보공유</span></a></li>
                                    </ul>
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
                                        <li><a href="shop-right-sidebar.html"><span class="menu-text">케어</span></a></li>
                                        <li><a href="shop-fullwidth-no-gutters.html"><span class="menu-text">리빙</span></a></li>
                                        <li><a href="shop-fullwidth.html"><span class="menu-text">외출</span></a></li>
                                        <li><a href="shop-fullwidth-left-sidebar.html"><span class="menu-text">장난감</span></a></li>
                                        <li><a href="shop-fullwidth-right-sidebar.html"><span class="menu-text">패션</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/shopping/cat" class="mega-menu-title"><span class="menu-text">고양이</span></a>
                                    <ul>
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
                                    <ul>
                                        <li><a href="product-details-background.html"><span class="menu-text">여름특집! 더위 탈출 넘버원</span></a></li>
                                        <li><a href="shopping-cart.html"><span class="menu-text">묘확행</span></a></li>
                                        <li><a href="checkout.html"><span class="menu-text">위트있는 신상 둘러보기</span></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="has-children"><a href="#"><span class="menu-text">제휴업체</span></a>
                            <ul class="sub-menu mega-menu">
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">모두보기</span></a>
                                </li>
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">미용</span></a>
                                    <ul>
                                        <li><a href="elements-category-banner.html"><span class="menu-text">둘러보기</span></a></li>
                                        <li><a href="elements-team.html"><span class="menu-text">후기 및 평점</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">펫시터</span></a>
                                    <ul>
                                       <li><a href="elements-category-banner.html"><span class="menu-text">둘러보기</span></a></li>
                                        <li><a href="elements-team.html"><span class="menu-text">후기 및 평점</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">애견호텔</span></a>
                                    <ul>
                                       <li><a href="elements-category-banner.html"><span class="menu-text">둘러보기</span></a></li>
                                        <li><a href="elements-team.html"><span class="menu-text">후기 및 평점</span></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="has-children"><a href="#"><span class="menu-text">커뮤니티</span></a>
                            <ul class="sub-menu">
                                <li class="has-children"><a href="blog-right-sidebar.html"><span class="menu-text">자유게시판</span></a>
                                </li>
                                <li class="has-children"><a href="blog-grid-right-sidebar.html"><span class="menu-text">중고거래게시판</span></a>
                                </li>
                                <li class="has-children"><a href="blog-list-right-sidebar.html"><span class="menu-text">정보공유게시판</span></a>
                                    <ul class="sub-menu">
                                        <li><a href="blog-list-right-sidebar.html"><span class="menu-text">훈련정보</span></a></li>
                                        <li><a href="blog-list-left-sidebar.html"><span class="menu-text">사료정보</span></a></li>
                                        <li><a href="blog-list-fullwidth.html"><span class="menu-text">꿀팁모음</span></a></li>
                                    </ul>
                                </li>
                                <li class="has-children"><a href="blog-masonry-right-sidebar.html"><span class="menu-text">산책메이트게시판</span></a>
                                </li>
                                <li class="has-children"><a href="blog-details-right-sidebar.html"><span class="menu-text">반려동물행사</span></a>
                                </li>
                            </ul>
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
                        <a href="index.html"><span class="logotitle" style="font-family: Jua; font-size: 50px; margin-bottom: -10px;">독캣두잇</span></a>
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
                                    <a href="index-2.html" class="mega-menu-title"><span class="menu-text">두잇몰</span></a>
                                    <ul>
                                        <li><a href="index-5.html"><span class="menu-text">강아지 용품</span></a></li>
                                        <li><a href="index-5.html"><span class="menu-text">고양이 용품</span></a></li>
                                        <li><a href="index-5.html"><span class="menu-text">사료</span></a></li>
                                        <li><a href="index-5.html"><span class="menu-text">장난감</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="index-2.html" class="mega-menu-title"><span class="menu-text">제휴업체</span></a>
                                    <ul>
                                        <li><a href="index-5.html"><span class="menu-text">미용</span></a></li>
                                        <li><a href="index-5.html"><span class="menu-text">애견 호텔</span></a></li>
                                        <li><a href="index-5.html"><span class="menu-text">훈련사</span></a></li>
                                        <li><a href="index-5.html"><span class="menu-text">펫시터</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="index-2.html" class="mega-menu-title"><span class="menu-text">커뮤니티</span></a>
                                    <ul>
                                        <li><a href="index-5.html"><span class="menu-text">자유게시판</span></a></li>
                                        <li><a href="index-5.html"><span class="menu-text">중고거래게시판</span></a></li>
                                        <li><a href="index-5.html"><span class="menu-text">훈련정보공유</span></a></li>
                                    </ul>
                                </li>
                            </ul>
                            </li>
                            <li class="has-children"><a href="#"><span class="menu-text">두잇몰</span></a>
                                <ul class="sub-menu mega-menu">
                            	<li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">두잇몰 홈</span></a>
                                </li>
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">강아지</span></a>
                                    <ul>
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
                                    <a href="#" class="mega-menu-title"><span class="menu-text">고양이</span></a>
                                    <ul>
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
                                    <ul>
                                        <li><a href="product-details-background.html"><span class="menu-text">여름특집! 더위 탈출 넘버원</span></a></li>
                                        <li><a href="shopping-cart.html"><span class="menu-text">묘확행</span></a></li>
                                        <li><a href="checkout.html"><span class="menu-text">위트있는 신상 둘러보기</span></a></li>
                                    </ul>
                                </li>
                            </ul>
                            </li>
                            <li class="has-children"><a href="#"><span class="menu-text">제휴업체</span></a>
                                <ul class="sub-menu mega-menu">
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">모두보기</span></a>
                                </li>
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">미용</span></a>
                                    <ul>
                                        <li><a href="elements-category-banner.html"><span class="menu-text">둘러보기</span></a></li>
                                        <li><a href="elements-team.html"><span class="menu-text">후기 및 평점</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">펫시터</span></a>
                                    <ul>
                                       <li><a href="elements-category-banner.html"><span class="menu-text">둘러보기</span></a></li>
                                        <li><a href="elements-team.html"><span class="menu-text">후기 및 평점</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">애견호텔</span></a>
                                    <ul>
                                       <li><a href="elements-category-banner.html"><span class="menu-text">둘러보기</span></a></li>
                                        <li><a href="elements-team.html"><span class="menu-text">후기 및 평점</span></a></li>
                                    </ul>
                                </li>
                            </ul>
                            </li>
                            <li class="has-children"><a href="#"><span class="menu-text">커뮤니티</span></a>
                                <ul class="sub-menu">
                                <li class="has-children"><a href="blog-right-sidebar.html"><span class="menu-text">자유게시판</span></a>
                                </li>
                                <li class="has-children"><a href="blog-grid-right-sidebar.html"><span class="menu-text">중고거래게시판</span></a>
                                </li>
                                <li class="has-children"><a href="blog-list-right-sidebar.html"><span class="menu-text">정보공유게시판</span></a>
                                    <ul class="sub-menu">
                                        <li><a href="blog-list-right-sidebar.html"><span class="menu-text">훈련정보</span></a></li>
                                        <li><a href="blog-list-left-sidebar.html"><span class="menu-text">사료정보</span></a></li>
                                        <li><a href="blog-list-fullwidth.html"><span class="menu-text">꿀팁모음</span></a></li>
                                    </ul>
                                </li>
                                <li class="has-children"><a href="blog-masonry-right-sidebar.html"><span class="menu-text">산책메이트게시판</span></a>
                                </li>
                                <li class="has-children"><a href="blog-details-right-sidebar.html"><span class="menu-text">반려동물행사</span></a>
                                </li>
                            </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!-- Search End -->

                <!-- Header Tools Start -->
                <div class="col-auto">
                    <div class="header-tools justify-content-end">
                        <div class="header-login">
                            <a href="my-account.html"><i class="fal fa-user"></i></a>
                        </div>
                        <div class="header-search d-none d-sm-block">
                            <a href="#offcanvas-search" class="offcanvas-toggle"><i class="fal fa-search"></i></a>
                        </div>
                        <div class="header-wishlist">
                            <a href="#offcanvas-wishlist" class="offcanvas-toggle"><span class="wishlist-count">3</span><i class="fal fa-heart"></i></a>
                        </div>
                        <div class="header-cart">
                            <a href="#offcanvas-cart" class="offcanvas-toggle"><span class="cart-count">3</span><i class="fal fa-shopping-cart"></i></a>
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
                        <a href="index.html"><span class="logotitle" style="font-family: Jua; font-size: 40px; margin-bottom: -10px;">독캣두잇</span></a>
                    </div>
                </div>
                <!-- Header Logo End -->

                <!-- Header Tools Start -->
                <div class="col-auto">
                    <div class="header-tools justify-content-end">
                        <div class="header-login d-none d-sm-block">
                            <a href="my-account.html"><i class="fal fa-user"></i></a>
                        </div>
                        <div class="header-search d-none d-sm-block">
                            <a href="#offcanvas-search" class="offcanvas-toggle"><i class="fal fa-search"></i></a>
                        </div>
                        <div class="header-wishlist d-none d-sm-block">
                            <a href="#offcanvas-wishlist" class="offcanvas-toggle"><span class="wishlist-count">3</span><i class="fal fa-heart"></i></a>
                        </div>
                        <div class="header-cart">
                            <a href="#offcanvas-cart" class="offcanvas-toggle"><span class="cart-count">3</span><i class="fal fa-shopping-cart"></i></a>
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
                        <a href="index.html"><span class="logotitle" style="font-family: Jua; font-size: 40px; margin-bottom: -10px;">독캣두잇</span></a>
                    </div>
                </div>
                <!-- Header Logo End -->

                <!-- Header Tools Start -->
                <div class="col-auto">
                    <div class="header-tools justify-content-end">
                        <div class="header-login d-none d-sm-block">
                            <a href="my-account.html"><i class="fal fa-user"></i></a>
                        </div>
                        <div class="header-search d-none d-sm-block">
                            <a href="#offcanvas-search" class="offcanvas-toggle"><i class="fal fa-search"></i></a>
                        </div>
                        <div class="header-wishlist d-none d-sm-block">
                            <a href="#offcanvas-wishlist" class="offcanvas-toggle"><span class="wishlist-count">3</span><i class="fal fa-heart"></i></a>
                        </div>
                        <div class="header-cart">
                            <a href="#offcanvas-cart" class="offcanvas-toggle"><span class="cart-count">3</span><i class="fal fa-shopping-cart"></i></a>
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
    <div id="offcanvas-search" class="offcanvas offcanvas-search">
        <div class="inner">
            <div class="offcanvas-search-form">
                <button class="offcanvas-close">Ã</button>
                <form action="#">
                    <div class="row mb-n3">
                        <div class="col-lg-8 col-12 mb-3"><input type="text" style="font-family: Jua;" placeholder="통합검색..."></div>
                        <div class="col-lg-4 col-12 mb-3">
                            <select class="search-select select2-basic">
                                <option value="0">모든 카테고리</option>
                                <option value="community">커뮤니티</option>
                                <option value="shopping">두잇몰</option>
                                <option value="store">입점업체</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <p class="search-description text-body-light mt-2"> <span style="font-family: Jua;"># 최소 한 글자 이상 입력해주세요.</span> <span style="font-family: Jua;"># 엔터 키를 눌러 검색 / ESC 키로 나가기</span></p>

        </div>
    </div>
    <!-- OffCanvas Search End -->

    <!-- OffCanvas Wishlist Start -->
    <div id="offcanvas-wishlist" class="offcanvas offcanvas-wishlist">
        <div class="inner">
            <div class="head">
                <span class="title">찜 목록</span>
                <button class="offcanvas-close">Ã</button>
            </div>
            <div class="body customScroll">
                <ul class="minicart-product-list">
                    <li>
                        <a href="product-details.html" class="image"><img src="resources/mainResources/images/product/cart-product-1.jpg" alt="Cart product Image"></a>
                        <div class="content">
                            <a href="product-details.html" class="title">고무 신발</a>
                            <span class="quantity-price">1 x <span class="amount">₩20,000</span></span>
                            <a href="#" class="remove">Ã</a>
                        </div>
                    </li>
                    <li>
                        <a href="product-details.html" class="image"><img src="resources/mainResources/images/product/cart-product-2.jpg" alt="Cart product Image"></a>
                        <div class="content">
                            <a href="product-details.html" class="title">구름 매트</a>
                            <span class="quantity-price">1 x <span class="amount">₩20,000</span></span>
                            <a href="#" class="remove">Ã</a>
                        </div>
                    </li>
                    <li>
                        <a href="product-details.html" class="image"><img src="resources/mainResources/images/product/cart-product-3.jpg" alt="Cart product Image"></a>
                        <div class="content">
                            <a href="product-details.html" class="title">볼던지기 도구</a>
                            <span class="quantity-price">1 x <span class="amount">₩20,000</span></span>
                            <a href="#" class="remove">Ã</a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="foot">
                <div class="buttons">
                    <a href="wishlist.html" class="btn btn-dark btn-hover-primary">찜 목록 바로가기</a>
                </div>
            </div>
        </div>
    </div>
    <!-- OffCanvas Wishlist End -->

    <!-- OffCanvas Cart Start -->
    <div id="offcanvas-cart" class="offcanvas offcanvas-cart">
        <div class="inner">
            <div class="head">
                <span class="title">장바구니</span>
                <button class="offcanvas-close">Ã</button>
            </div>
            <div class="body customScroll">
                <ul class="minicart-product-list">
                    <li>
                        <a href="product-details.html" class="image"><img src="resources/mainResources/images/product/cart-product-1.jpg" alt="Cart product Image"></a>
                        <div class="content">
                            <a href="product-details.html" class="title">스텐 식기</a>
                            <span class="quantity-price">1 x <span class="amount">₩20,000</span></span>
                            <a href="#" class="remove">Ã</a>
                        </div>
                    </li>
                    <li>
                        <a href="product-details.html" class="image"><img src="resources/mainResources/images/product/cart-product-2.jpg" alt="Cart product Image"></a>
                        <div class="content">
                            <a href="product-details.html" class="title">수제 사료</a>
                            <span class="quantity-price">1 x <span class="amount">₩20,000</span></span>
                            <a href="#" class="remove">Ã</a>
                        </div>
                    </li>
                    <li>
                        <a href="product-details.html" class="image"><img src="resources/mainResources/images/product/cart-product-3.jpg" alt="Cart product Image"></a>
                        <div class="content">
                            <a href="product-details.html" class="title">소프트츄 10개입</a>
                            <span class="quantity-price">1 x <span class="amount">₩20,000</span></span>
                            <a href="#" class="remove">Ã</a>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="foot">
                <div class="sub-total">
                    <strong>총 구매금액 :</strong>
                    <span class="amount">₩60,000</span>
                </div>
                <div class="buttons">
                    <a href="shopping-cart.html" class="btn btn-dark btn-hover-primary">장바구니 바로가기</a>
                    <a href="checkout.html" class="btn btn-outline-dark">결제하기</a>
                </div>
                <p class="minicart-message">5만원 이상 구매 시 무료 배송!</p>
            </div>
        </div>
    </div>
    <!-- OffCanvas Cart End -->

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
                                    <li><a href="index.html"><span class="menu-text">강아지 용품</span></a></li>
                                    <li><a href="index-2.html"><span class="menu-text">고양이 용품</span></a></li>
                                    <li><a href="index-3.html"><span class="menu-text">사료</span></a></li>
                                    <li><a href="index-4.html"><span class="menu-text">장난감</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><span class="menu-text">제휴업체</span></a>
                                <ul class="sub-menu">
                                    <li><a href="index-5.html"><span class="menu-text">미용</span></a></li>
                                    <li><a href="index-6.html"><span class="menu-text">펫시터</span></a></li>
                                    <li><a href="index-7.html"><span class="menu-text">훈련사</span></a></li>
                                    <li><a href="index-8.html"><span class="menu-text">애견 호텔</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><span class="menu-text">커뮤니티</span></a>
                                <ul class="sub-menu">
                                    <li><a href="index-9.html"><span class="menu-text">자유게시판</span></a></li>
                                    <li><a href="index-10.html"><span class="menu-text">중고거래게시판</span></a></li>
                                    <li><a href="index-11.html"><span class="menu-text">정보공유게시판</span></a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a href="#"><span class="menu-text">두잇몰</span></a>
                        <ul class="sub-menu">
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
                    <li><a href="#"><span class="menu-text">제휴업체</span></a>
                        <ul class="sub-menu">
                            <li>
                                <a href="#" class="mega-menu-title"><span class="menu-text">모두보기</span></a>
                            </li>
                            <li>
                                <a href="#" class="mega-menu-title"><span class="menu-text">미용</span></a>
                                <ul class="sub-menu">
                                    <li><a href="elements-category-banner.html"><span class="menu-text">둘러보기</span></a></li>
                                    <li><a href="elements-team.html"><span class="menu-text">후기 및 평점</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" class="mega-menu-title"><span class="menu-text">펫시터</span></a>
                                <ul class="sub-menu">
                                    <li><a href="elements-category-banner.html"><span class="menu-text">둘러보기</span></a></li>
                                    <li><a href="elements-team.html"><span class="menu-text">후기 및 평점</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" class="mega-menu-title"><span class="menu-text">애견 호텔</span></a>
                                <ul class="sub-menu">
                                    <li><a href="elements-category-banner.html"><span class="menu-text">둘러보기</span></a></li>
                                    <li><a href="elements-team.html"><span class="menu-text">후기 및 평점</span></a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a href="#"><span class="menu-text">커뮤니티</span></a>
                        <ul class="sub-menu">
                            <li><a href="#"><span class="menu-text">자유게시판</span></a>
                            </li>
                            <li><a href="#"><span class="menu-text">중고거래게시판</span></a>
                            </li>
                            <li><a href="#"><span class="menu-text">정보공유게시판</span></a>
                                <ul class="sub-menu">
                                    <li><a href="blog-list-right-sidebar.html"><span class="menu-text">훈련정보</span></a></li>
                                    <li><a href="blog-list-left-sidebar.html"><span class="menu-text">사료정보</span></a></li>
                                    <li><a href="blog-list-fullwidth.html"><span class="menu-text">꿀팁모음</span></a></li>
                                </ul>
                            </li>
                            <li><a href="#"><span class="menu-text">산책메이트게시판</span></a>
                            </li>
                            <li><a href="#"><span class="menu-text">반려동물행사</span></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="offcanvas-buttons">
                <div class="header-tools">
                    <div class="header-login">
                        <a href="my-account.html"><i class="fal fa-user"></i></a>
                    </div>
                    <div class="header-wishlist">
                        <a href="wishlist.html"><span>3</span><i class="fal fa-heart"></i></a>
                    </div>
                    <div class="header-cart">
                        <a href="shopping-cart.html"><span class="cart-count">3</span><i class="fal fa-shopping-cart"></i></a>
                    </div>
                </div>
            </div>
            <div class="offcanvas-social">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-youtube"></i></a>
            </div>
        </div>
    </div>
    <!-- OffCanvas Search End -->

    <div class="offcanvas-overlay"></div>

    <!-- Slider main container Start -->
    <div class="home1-slider swiper-container">
        <div class="swiper-wrapper">
            <div class="home1-slide-item swiper-slide" data-swiper-autoplay="5000" data-bg-image="resources/mainResources/images/slider/home1/slide-1.jpg">
                <div class="home1-slide1-content">
                    <span class="bg"></span>
                    <span class="slide-border"></span>
                    <span class="icon"><img src="resources/mainResources/images/slider/home1/slide-1-1.png" alt="Slide Icon"></span>
                    <h2 class="title" style="font-family: Jua;">독캣두잇</h2>
                    <h3 class="sub-title" style="font-family: Jua;">독점상품</h3>
                    <div class="link"><a href="shop.html" style="font-family: Jua;">지금 바로 구매하기</a></div>
                </div>
            </div>
            <div class="home1-slide-item swiper-slide" data-swiper-autoplay="5000" data-bg-image="resources/mainResources/images/slider/home1/slide-2.jpg">
                <div class="home1-slide2-content">
                    <span class="bg" data-bg-image="resources/mainResources/images/slider/home1/slide-2-1.png"></span>
                    <span class="slide-border"></span>
                    <span class="icon">
                        <img src="resources/mainResources/images/slider/home1/slide-2-2.png" alt="Slide Icon">
                        <img src="resources/mainResources/images/slider/home1/slide-2-3.png" alt="Slide Icon">
                    </span>
                    <h2 class="title" style="font-family: Jua;">신제품 출시</h2>
                    <h3 class="sub-title" style="font-family: Jua;">기간한정 할인<br>10%</h3>
                    <div class="link"><a href="shop.html" style="font-family: Jua;">지금 바로 구매하기</a></div>
                </div>
            </div>
            <div class="home1-slide-item swiper-slide" data-swiper-autoplay="5000" data-bg-image="${pageContext.request.contextPath}/resources/mainResources/images/slider/home1/slide-3.jpg">
                <div class="home1-slide3-content">
                    <h3 class="title" style="font-family: Jua; color: white;">동물복지캠페인</h3>
                    <h2 class="sub-title" style="font-family: Jua; color: white;">
                        <img class="left-icon " src="resources/mainResources/images/slider/home1/slide-2-2.png" alt="Slide Icon">
                        "다시 사랑 받개"
                        <img class="right-icon " src="resources/mainResources/images/slider/home1/slide-2-3.png" alt="Slide Icon">
                    </h2>
                    <div class="link"><a href="shop.html" style="font-family: Jua;">지금 바로 신청하기</a></div>
                </div>
            </div>
        </div>
        <div class="home1-slider-prev swiper-button-prev"><i class="ti-angle-left"></i></div>
        <div class="home1-slider-next swiper-button-next"><i class="ti-angle-right"></i></div>
    </div>
    <!-- Slider main container End -->

    <!-- Product Section Start -->
    <div class="section section-fluid section-padding pt-0">
        <div class="container">

            <!-- Section Title Start -->
            <div class="section-title text-center">
                <h3 class="sub-title" style="font-family: Jua; margin-top: 60px;">BEST</h3>
                <h2 class="title title-icon-both" style="font-family: Jua;">두잇몰 베스트 셀러</h2>
            </div>
            <!-- Section Title End -->

            <!-- Products Start -->
            <div class="products row row-cols-xl-5 row-cols-lg-4 row-cols-md-3 row-cols-sm-2 row-cols-1">

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="product-details.html" class="image">
                                <span class="product-badges">
                                    <span class="onsale">-10%</span>
                                </span>
                                <img src="resources/mainResources/images/product/s328/product-1.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/product-1-hover.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="Add to wishlist"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">그레인프리 10kg</a></h6>
                            <span class="price">
                                <span class="old">₩20,000</span>
                            <span class="new">₩18,000</span>
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="Quick View"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Add to Cart"><i class="fal fa-shopping-cart"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Compare"><i class="fal fa-random"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="product-details.html" class="image">
                                <img src="resources/mainResources/images/product/s328/product-2.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/product-2-hover.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="Add to wishlist"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">수제 사료</a></h6>
                            <span class="price">
                                ₩20,000
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="Quick View"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Add to Cart"><i class="fal fa-shopping-cart"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Compare"><i class="fal fa-random"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <span class="product-badges">
                                <span class="hot">hot</span>
                            </span>
                            <a href="product-details.html" class="image">
                                <img src="resources/mainResources/images/product/s328/product-3.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/product-3-hover.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="Add to wishlist"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">소프트츄 10개입</a></h6>
                            <span class="price">
                                ₩20,000
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="Quick View"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Add to Cart"><i class="fal fa-shopping-cart"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Compare"><i class="fal fa-random"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="product-details.html" class="image">
                                <span class="product-badges">
                                    <span class="onsale">-20%</span>
                                </span>
                                <img src="resources/mainResources/images/product/s328/product-4.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/product-4-hover.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="Add to wishlist"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">닭고기말이 껌</a></h6>
                            <span class="price">
                                <span class="old">₩20,000</span>
                            <span class="new">₩16,000</span>
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="Quick View"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Add to Cart"><i class="fal fa-shopping-cart"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Compare"><i class="fal fa-random"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="product-details.html" class="image">
                                <img src="resources/mainResources/images/product/s328/product-5.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/product-5-hover.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="Add to wishlist"><i class="far fa-heart"></i></a>
                            <div class="product-options">
                                <ul class="colors">
                                    <li style="background-color: #c2c2c2;">color one</li>
                                    <li style="background-color: #374140;">color two</li>
                                    <li style="background-color: #8ea1b2;">color three</li>
                                </ul>
                                <ul class="sizes">
                                    <li>Large</li>
                                    <li>Medium</li>
                                    <li>Small</li>
                                </ul>
                            </div>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">프리미엄 리드줄</a></h6>
                            <span class="price">
                                ₩20,000
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="Quick View"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Add to Cart"><i class="fal fa-shopping-cart"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Compare"><i class="fal fa-random"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="product-details.html" class="image">
                                <img src="resources/mainResources/images/product/s328/product-6.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/product-6-hover.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="Add to wishlist"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">스텐 식기</a></h6>
                            <span class="price">
                                ₩20,000
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="Quick View"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Add to Cart"><i class="fal fa-shopping-cart"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Compare"><i class="fal fa-random"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="product-details.html" class="image">
                                <span class="product-badges">
                                    <span class="hot">hot</span>
                                </span>
                                <img src="resources/mainResources/images/product/s328/product-7.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/product-7-hover.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="Add to wishlist"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">오트밀 샴푸</a></h6>
                            <span class="price">
                                ₩20,000
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="Quick View"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Add to Cart"><i class="fal fa-shopping-cart"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Compare"><i class="fal fa-random"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="product-details.html" class="image">
                                <span class="product-badges">
                                    <span class="outofstock"><i class="fal fa-frown"></i></span>
                                <span class="hot">hot</span>
                                </span>
                                <img src="resources/mainResources/images/product/s328/product-8.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/product-8-hover.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="Add to wishlist"><i class="far fa-heart"></i></a>
                            <div class="product-options">
                                <ul class="colors">
                                    <li style="background-color: #000000;">color one</li>
                                    <li style="background-color: #b2483c;">color two</li>
                                </ul>
                                <ul class="sizes">
                                    <li>Large</li>
                                    <li>Medium</li>
                                    <li>Small</li>
                                </ul>
                            </div>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">고무 신발</a></h6>
                            <span class="price">
                                ₩20,000
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="Quick View"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Add to Cart"><i class="fal fa-shopping-cart"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Compare"><i class="fal fa-random"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="product-details.html" class="image">
                                <img src="resources/mainResources/images/product/s328/product-9.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/product-9-hover.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="Add to wishlist"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">구름 매트</a></h6>
                            <span class="price">
                                ₩20,000
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="Quick View"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Add to Cart"><i class="fal fa-shopping-cart"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Compare"><i class="fal fa-random"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="product-details.html" class="image">
                                <img src="resources/mainResources/images/product/s328/product-10.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/product-10-hover.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="Add to wishlist"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">볼던지기 도구</a></h6>
                            <span class="price">
                                ₩20,000
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="Quick View"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Add to Cart"><i class="fal fa-shopping-cart"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="Compare"><i class="fal fa-random"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Products End -->

        </div>
    </div>
    <!-- Product Section End -->

    <div class="footer1-section section section-padding">
        <div class="container">
            <div class="row text-center row-cols-1">

                <div class="footer1-logo col text-center">
                    <span class="logotitle" style="font-family: Jua; font-size: 65px; margin-bottom: -10px;">독캣두잇</span></a>
                </div>

                <div class="footer1-menu col">
                    <ul class="widget-menu justify-content-center">
                        <li><a href="#">독캣두잇 소개</a></li>
                        <li><a href="#">오시는길</a></li>
                        <li><a href="#">채용정보</a></li>
                        <li><a href="#">이용약관</a></li>
                        <li><a href="#">개인정보처리방침</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
                </div>
                <div class="footer1-subscribe d-flex flex-column col">
                    <form id="mc-form" class="mc-form widget-subscibe">
                        <input id="mc-email" autocomplete="off" type="email" placeholder="이메일 주소를 입력해주세요.">
                        <button id="mc-submit" class="btn btn-dark">1:1 문의</button>
                    </form>
                    <!-- mailchimp-alerts Start -->
                    <div class="mailchimp-alerts text-centre">
                        <div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
                        <div class="mailchimp-success text-success"></div><!-- mailchimp-success end -->
                        <div class="mailchimp-error text-danger"></div><!-- mailchimp-error end -->
                    </div><!-- mailchimp-alerts end -->
                </div>
                <div class="footer1-social col">
                    <ul class="widget-social justify-content-center">
                        <li class="hintT-top" data-hint="Twitter"> <a href="https://www.twitter.com/"><i class="fab fa-twitter"></i></a></li>
                        <li class="hintT-top" data-hint="Facebook"> <a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a></li>
                        <li class="hintT-top" data-hint="Instagram"> <a href="https://www.instagram.com/"><i class="fab fa-instagram"></i></a></li>
                        <li class="hintT-top" data-hint="Youtube"> <a href="https://www.youtube.com/"><i class="fab fa-youtube"></i></a></li>
                    </ul>
                </div>
                <div class="footer1-copyright col">
                    <p class="copyright">&copy; 2021 독캣두잇. All Rights Reserved | <strong>02-1234-5678</strong> | <a href="mailto:contact@dogcatdoit.com">contact@dogcatdoit.com</a></p>
                </div>

            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="quickViewModal modal fade" id="quickViewModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <button class="close" data-dismiss="modal">&times;</button>
                <div class="row learts-mb-n30">

                    <!-- Product Images Start -->
                    <div class="col-lg-6 col-12 learts-mb-30">
                        <div class="product-images">
                            <div class="product-gallery-slider-quickview">
                                <div class="product-zoom" data-image="resources/mainResources/images/product/single/1/product-zoom-1.jpg">
                                    <img src="resources/mainResources/images/product/single/1/product-1.jpg" alt="">
                                </div>
                                <div class="product-zoom" data-image="resources/mainResources/images/product/single/1/product-zoom-2.jpg">
                                    <img src="resources/mainResources/images/product/single/1/product-2.jpg" alt="">
                                </div>
                                <div class="product-zoom" data-image="resources/mainResources/images/product/single/1/product-zoom-3.jpg">
                                    <img src="resources/mainResources/images/product/single/1/product-3.jpg" alt="">
                                </div>
                                <div class="product-zoom" data-image="resources/mainResources/images/product/single/1/product-zoom-4.jpg">
                                    <img src="resources/mainResources/images/product/single/1/product-4.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Product Images End -->

                    <!-- Product Summery Start -->
                    <div class="col-lg-6 col-12 overflow-hidden learts-mb-30">
                        <div class="product-summery customScroll">
                            <div class="product-ratings">
                                <span class="star-rating">
                                <span class="rating-active" style="width: 100%;">ratings</span>
                                </span>
                                <a href="#reviews" class="review-link">(<span class="count">3</span> customer reviews)</a>
                            </div>
                            <h3 class="product-title">Cleaning Dustpan & Brush</h3>
                            <div class="product-price">Â£38.00 â Â£50.00</div>
                            <div class="product-description">
                                <p>Easy clip-on handle â Hold the brush and dustpan together for storage; the dustpan edge is serrated to allow easy scraping off the hair without entanglement. High-quality bristles â no burr damage, no scratches, thick and durable, comfortable to remove dust and smaller particles.</p>
                            </div>
                            <div class="product-variations">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="label"><span>Size</span></td>
                                            <td class="value">
                                                <div class="product-sizes">
                                                    <a href="#">Large</a>
                                                    <a href="#">Medium</a>
                                                    <a href="#">Small</a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="label"><span>Color</span></td>
                                            <td class="value">
                                                <div class="product-colors">
                                                    <a href="#" data-bg-color="#000000"></a>
                                                    <a href="#" data-bg-color="#ffffff"></a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="label"><span>Quantity</span></td>
                                            <td class="value">
                                                <div class="product-quantity">
                                                    <span class="qty-btn minus"><i class="ti-minus"></i></span>
                                                    <input type="text" class="input-qty" value="1">
                                                    <span class="qty-btn plus"><i class="ti-plus"></i></span>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="product-buttons">
                                <a href="#" class="btn btn-icon btn-outline-body btn-hover-dark"><i class="fal fa-heart"></i></a>
                                <a href="#" class="btn btn-dark btn-outline-hover-dark"><i class="fal fa-shopping-cart"></i> Add to Cart</a>
                                <a href="#" class="btn btn-icon btn-outline-body btn-hover-dark"><i class="fal fa-random"></i></a>
                            </div>
                            <div class="product-brands">
                                <span class="title">Brands</span>
                                <div class="brands">
                                    <a href="#"><img src="resources/mainResources/images/brands/brand-3.png" alt=""></a>
                                    <a href="#"><img src="resources/mainResources/images/brands/brand-8.png" alt=""></a>
                                </div>
                            </div>
                            <div class="product-meta mb-0">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="label"><span>SKU</span></td>
                                            <td class="value">0404019</td>
                                        </tr>
                                        <tr>
                                            <td class="label"><span>Category</span></td>
                                            <td class="value">
                                                <ul class="product-category">
                                                    <li><a href="#">Kitchen</a></li>
                                                </ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="label"><span>Tags</span></td>
                                            <td class="value">
                                                <ul class="product-tags">
                                                    <li><a href="#">handmade</a></li>
                                                    <li><a href="#">learts</a></li>
                                                    <li><a href="#">mug</a></li>
                                                    <li><a href="#">product</a></li>
                                                    <li><a href="#">learts</a></li>
                                                </ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="label"><span>Share on</span></td>
                                            <td class="va">
                                                <div class="product-share">
                                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                                    <a href="#"><i class="fab fa-twitter"></i></a>
                                                    <a href="#"><i class="fab fa-google-plus-g"></i></a>
                                                    <a href="#"><i class="fab fa-pinterest"></i></a>
                                                    <a href="#"><i class="fal fa-envelope"></i></a>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- Product Summery End -->

                </div>
            </div>
        </div>
    </div>

    <!-- JS
============================================ -->

    <!-- Vendors JS -->
    <script src="resources/mainResources/js/vendor/modernizr-3.6.0.min.js"></script>
    <script src="resources/mainResources/js/vendor/jquery-3.4.1.min.js"></script>
    <script src="resources/mainResources/js/vendor/jquery-migrate-3.1.0.min.js"></script>
    <script src="resources/mainResources/js/vendor/bootstrap.bundle.min.js"></script>

    <!-- Plugins JS -->
    <script src="resources/mainResources/js/plugins/select2.min.js"></script>
    <script src="resources/mainResources/js/plugins/jquery.nice-select.min.js"></script>
    <script src="resources/mainResources/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="resources/mainResources/js/plugins/swiper.min.js"></script>
    <script src="resources/mainResources/js/plugins/slick.min.js"></script>
    <script src="resources/mainResources/js/plugins/mo.min.js"></script>
    <script src="resources/mainResources/js/plugins/jquery.instagramFeed.min.js"></script>
    <script src="resources/mainResources/js/plugins/jquery.ajaxchimp.min.js"></script>
    <script src="resources/mainResources/js/plugins/jquery.countdown.min.js"></script>
    <script src="resources/mainResources/js/plugins/imagesloaded.pkgd.min.js"></script>
    <script src="resources/mainResources/js/plugins/isotope.pkgd.min.js"></script>
    <script src="resources/mainResources/js/plugins/jquery.matchHeight-min.js"></script>
    <script src="resources/mainResources/js/plugins/ion.rangeSlider.min.js"></script>
    <script src="resources/mainResources/js/plugins/photoswipe.min.js"></script>
    <script src="resources/mainResources/js/plugins/photoswipe-ui-default.min.js"></script>
    <script src="resources/mainResources/js/plugins/jquery.zoom.min.js"></script>
    <script src="resources/mainResources/js/plugins/ResizeSensor.js"></script>
    <script src="resources/mainResources/js/plugins/jquery.sticky-sidebar.min.js"></script>
    <script src="resources/mainResources/js/plugins/product360.js"></script>
    <script src="resources/mainResources/js/plugins/jquery.magnific-popup.min.js"></script>
    <script src="resources/mainResources/js/plugins/jquery.scrollUp.min.js"></script>
    <script src="resources/mainResources/js/plugins/scrollax.min.js"></script>

    <!-- Use the minified version files listed below for better performance and remove the files listed above -->
    <!-- <script src="resources/mainResources/js/vendor/vendor.min.js"></script>
<script src="resources/mainResources/js/plugins/plugins.min.js"></script> -->

    <!-- Main Activation JS -->
    <script src="resources/mainResources/js/main.js"></script>

</body>

</html>