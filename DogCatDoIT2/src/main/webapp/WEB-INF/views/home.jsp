<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>λμΊ£λμ</title>
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
    <!-- λμΊ£λμ ν°νΈ -->
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
                    <p class="text-white text-center text-md-left my-2"><a class="js-weather"></a></p>
                </div>
                <div class="col-auto d-none d-md-block">
                    <div class="topbar-menu">
                        <ul>
                            <li><a href="#" class="text-white"><i class="fa fa-map-marker-alt"></i>μμΈ λ§ν¬κ΅¬</a></li>
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
                        <li><a href="#">λ§μ΄νμ΄μ§</a>
                            <ul class="curr-lan-sub-menu">
                                <li><a href="${pageContext.request.contextPath}/myPage/main">νμμ λ³΄</a></li>
                                <li><a href="${pageContext.request.contextPath}/myPage/written">λ΄κ° μ΄ κΈ</a></li>
                                <li><a href="${pageContext.request.contextPath}/talk/receive/list">μͺ½μ§ν¨</a></li>
                                <li><a href="${pageContext.request.contextPath}/myPage/attendance">μΆμμ²΄ν¬</a></li>
                                <li>
                                	<c:if test="${sessionScope.member.userId=='admin'}">
                                		<a href="${pageContext.request.contextPath}/cAdmin/main">κ΄λ¦¬μνμ΄μ§</a>
                                	</c:if>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <p style="display: inline; color: lightgray;">&nbsp;&nbsp;|&nbsp;&nbsp;</p>
                    <a href="${pageContext.request.contextPath}/faq/main" style="display: inline; font-size: 16px; font-weight: 400; color: gray;">κ³ κ°μΌν°</a>
                </div>
                <!-- Header Language & Currency End -->

                <!-- Header Logo Start -->
                <div class="col">
                    <div class="header-logo justify-content-center">
                    	<!-- <a href="index.jsp"><img src="resources/mainResources/images/logo/logo.png" alt="DogCatDoIt Logo"></a> -->
                        <a href="${pageContext.request.contextPath}/"><span class="logotitle" style="font-family: Jua; font-size: 65px; margin-bottom: -10px;">λμΊ£λμ</span></a>
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
							<span style="color:blue; display: inline;">${sessionScope.member.userName}</span>λ 
							<p style="display: inline; color: lightgray;">|</p>
							<c:if test="${sessionScope.member.userId!='admin'}">
		                        <span>
		                           <c:choose>
		                              <c:when test="${sessionScope.member.clevel==0}">μ κ·νμ</c:when>                           
		                              <c:when test="${sessionScope.member.clevel==1}">μΌλ°νμ</c:when>
		                              <c:when test="${sessionScope.member.clevel==2}">μ΄μ¬νμ</c:when>
		                              <c:when test="${sessionScope.member.clevel==3}">μ°μνμ</c:when>
		                              <c:when test="${sessionScope.member.clevel==4}">λννμ</c:when>
		                           </c:choose>
		                        </span>
		                    </c:if>
							<c:if test="${sessionScope.member.userId=='admin'}">
								<a href="${pageContext.request.contextPath}/cAdmin/main" style="display: inline; color: gray;">κ΄λ¦¬μ</a> <i></i>
							</c:if>
							<p style="display: inline; color: lightgray;">|</p>
							<a href="${pageContext.request.contextPath}/member/logout" style="display: inline; color: gray;"> λ‘κ·Έμμ </a>
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
                        <li class="has-children"><a href="#"><span class="menu-text">λͺ¨λλ³΄κΈ°</span></a>
                            <ul class="sub-menu mega-menu">
                                <li>
                                    <a href="${pageContext.request.contextPath}/" class="mega-menu-title"><span class="menu-text">ννμ΄μ§</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/shopping/mainPage" class="mega-menu-title"><span class="menu-text">λμλͺ°</span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/shopping/dog"><span class="menu-text">κ°μμ§ μ©ν</span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/shopping/cat"><span class="menu-text">κ³ μμ΄ μ©ν</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">μ»€λ?€λν°</span></a>
                                    <ul>
                                    	<li><a href="${pageContext.request.contextPath}/notice/list"><span class="menu-text">κ³΅μ§μ¬ν­</span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/zau/list"><span class="menu-text">μμ κ²μν</span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/junggo/main"><span class="menu-text">μ€κ³ κ±°λκ²μν</span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/expert/list"><span class="menu-text">λλ¬Όνλμ λ¬Έκ° Q&A κ²μν</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/company/list" class="mega-menu-title"><span class="menu-text">μ ν΄μμ²΄</span></a>
                                </li>
                            </ul>
                        </li>
                        <li class="has-children"><a href="#"><span class="menu-text">λμλͺ°</span></a>
                            <ul class="sub-menu mega-menu">
                            	<li>
                                    <a href="${pageContext.request.contextPath}/shopping/mainPage" class="mega-menu-title"><span class="menu-text">λμλͺ° ν</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/shopping/dog" class="mega-menu-title"><span class="menu-text">κ°μμ§</span></a>
                                    <ul>
                                        <li><a href="shop.html"><span class="menu-text">μ¬λ£</span></a></li>
                                        <li><a href="shop-left-sidebar.html"><span class="menu-text">κ°μ</span></a></li>
                                        <li><a href="shop-right-sidebar.html"><span class="menu-text">μμ/λ°°λ³</span></a></li>
                                        <li><a href="shop-fullwidth-no-gutters.html"><span class="menu-text">μμμ </span></a></li>
                                        <li><a href="shop-fullwidth.html"><span class="menu-text">μ©ν</span></a></li>
                                        <li><a href="shop-fullwidth-right-sidebar.html"><span class="menu-text">ν¨μ</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/shopping/cat" class="mega-menu-title"><span class="menu-text">κ³ μμ΄</span></a>
                                    <ul>
                                        <li><a href="shop.html"><span class="menu-text">μ¬λ£</span></a></li>
                                        <li><a href="shop-left-sidebar.html"><span class="menu-text">κ°μ</span></a></li>
                                        <li><a href="shop-right-sidebar.html"><span class="menu-text">μμ/λ°°λ³</span></a></li>
                                        <li><a href="shop-fullwidth-no-gutters.html"><span class="menu-text">μμμ </span></a></li>
                                        <li><a href="shop-fullwidth.html"><span class="menu-text">μ©ν</span></a></li>
                                        <li><a href="shop-fullwidth-right-sidebar.html"><span class="menu-text">ν¨μ</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">κΈ°νμ </span></a>
                                    <ul>
                                        <li><a href="product-details-background.html"><span class="menu-text">μ¬λ¦νΉμ§! λμ νμΆ λλ²μ</span></a></li>
                                        <li><a href="shopping-cart.html"><span class="menu-text">λ¬νν</span></a></li>
                                        <li><a href="checkout.html"><span class="menu-text">μνΈμλ μ μ λλ¬λ³΄κΈ°</span></a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        
                        <li class="has-children"><a href="#"><span class="menu-text">μ»€λ?€λν°</span></a>
                            <ul class="sub-menu">
                            <li><a href="${pageContext.request.contextPath}/notice/list"><span class="menu-text">κ³΅μ§μ¬ν­</span></a></li>
                                <li class="has-children"><a href="${pageContext.request.contextPath}/zau/list"><span class="menu-text">μμ κ²μν</span></a>
                                </li>
                                <li class="has-children"><a href="${pageContext.request.contextPath}/junggo/main"><span class="menu-text">μ€κ³ κ±°λκ²μν</span></a>
                                </li>
                                <li class="no-children"><a href="${pageContext.request.contextPath}/expert/list"><span class="menu-text">λλ¬Όνλ μ λ¬Έκ° Q&A κ²μν</span></a>
                              	</li>
                                
                            </ul>
                        </li>
                        <li class="no-children"><a href="company/list"><span class="menu-text">μ ν΄μμ²΄</span></a>

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
                        <a href="${pageContext.request.contextPath}/"><span class="logotitle" style="font-family: Jua; font-size: 50px; margin-bottom: -10px;">λμΊ£λμ</span></a>
                    </div>
                </div>
                <!-- Header Logo End -->

                <!-- Search Start -->
                <div class="col d-none d-xl-block">
                    <nav class="site-main-menu justify-content-center">
                        <ul>
                            <li class="has-children"><a href="#"><span class="menu-text">λͺ¨λλ³΄κΈ°</span></a>
                                <ul class="sub-menu mega-menu">
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">ννμ΄μ§</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/shopping/mainPage" class="mega-menu-title"><span class="menu-text">λμλͺ°</span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/shopping/dog"><span class="menu-text">κ°μμ§ μ©ν</span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/shopping/cat"><span class="menu-text">κ³ μμ΄ μ©ν</span></a></li>
                                    </ul>
                                </li>
                                
                                <li>
                                    <a href="index-2.html" class="mega-menu-title"><span class="menu-text">μ»€λ?€λν°</span></a>
                                    <ul>
                                    <li><a href="${pageContext.request.contextPath}/notice/list"><span class="menu-text">κ³΅μ§μ¬ν­</span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/zau/list"><span class="menu-text">μμ κ²μν</span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/junggo/main"><span class="menu-text">μ€κ³ κ±°λκ²μν</span></a></li>
                                        <li><a href="${pageContext.request.contextPath}/expert/list"><span class="menu-text">λλ¬Όνλ μ λ¬Έκ° Q&A κ²μν</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/company/list" class="mega-menu-title"><span class="menu-text">μ ν΄μμ²΄</span></a>
                                   
                                </li>
                            </ul>
                            </li>
                            <li class="has-children"><a href="#"><span class="menu-text">λμλͺ°</span></a>
                                <ul class="sub-menu mega-menu">
                            	<li>
                                    <a href="${pageContext.request.contextPath}/shopping/mainPage" class="mega-menu-title"><span class="menu-text">λμλͺ° ν</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/shopping/dog" class="mega-menu-title"><span class="menu-text">κ°μμ§</span></a>
                                    <ul>
                                        <li><a href="shop.html"><span class="menu-text">μ¬λ£</span></a></li>
                                        <li><a href="shop-left-sidebar.html"><span class="menu-text">κ°μ</span></a></li>
                                        <li><a href="shop-right-sidebar.html"><span class="menu-text">μμ/λ°°λ³</span></a></li>
                                        <li><a href="shop-fullwidth-no-gutters.html"><span class="menu-text">μμμ </span></a></li>
                                        <li><a href="shop-fullwidth.html"><span class="menu-text">μ©ν</span></a></li>
                                        <li><a href="shop-fullwidth-right-sidebar.html"><span class="menu-text">ν¨μ</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/shopping/cat" class="mega-menu-title"><span class="menu-text">κ³ μμ΄</span></a>
                                    <ul>
                                        <li><a href="shop.html"><span class="menu-text">μ¬λ£</span></a></li>
                                        <li><a href="shop-left-sidebar.html"><span class="menu-text">κ°μ</span></a></li>
                                        <li><a href="shop-right-sidebar.html"><span class="menu-text">μμ/λ°°λ³</span></a></li>
                                        <li><a href="shop-fullwidth-no-gutters.html"><span class="menu-text">μμμ </span></a></li>
                                        <li><a href="shop-fullwidth.html"><span class="menu-text">μ©ν</span></a></li>
                                        <li><a href="shop-fullwidth-right-sidebar.html"><span class="menu-text">ν¨μ</span></a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="mega-menu-title"><span class="menu-text">κΈ°νμ </span></a>
                                    <ul>
                                        <li><a href="product-details-background.html"><span class="menu-text">μ¬λ¦νΉμ§! λμ νμΆ λλ²μ</span></a></li>
                                        <li><a href="shopping-cart.html"><span class="menu-text">λ¬νν</span></a></li>
                                        <li><a href="checkout.html"><span class="menu-text">μνΈμλ μ μ λλ¬λ³΄κΈ°</span></a></li>
                                    </ul>
                                </li>
                            </ul>
                            </li>
                            
                            <li class="has-children"><a href="#"><span class="menu-text">μ»€λ?€λν°</span></a>
                                <ul class="sub-menu">
                                <li class="no-children"><a href="${pageContext.request.contextPath}/notice/list"><span class="menu-text">κ³΅μ§μ¬ν­</span></a></li>
                                <li class="no-children""><a href="${pageContext.request.contextPath}/zau/list"><span class="menu-text">μμ κ²μν</span></a>
                                </li>
                                <li class="no-children""><a href="${pageContext.request.contextPath}/junggo/main"><span class="menu-text">μ€κ³ κ±°λκ²μν</span></a>
                                </li>
                                <li class="no-children"><a href="${pageContext.request.contextPath}/expert/list"><span class="menu-text">λλ¬Όνλ μ λ¬Έκ° Q&A κ²μν</span></a>
                              </li>
                               
                            </ul>
                            </li>
                            <li class="no-children"><a href="${pageContext.request.contextPath}/company/list"><span class="menu-text">μ ν΄μμ²΄</span></a>
                               
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
							<span style="color:blue; display: inline;">${sessionScope.member.userName}</span>λ 
							<p style="display: inline; color: lightgray;">|</p>
							<a href="${pageContext.request.contextPath}/member/logout" style="display: inline; color: gray;"> λ‘κ·Έμμ </a>
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
                        <a href="${pageContext.request.contextPath}/"><span class="logotitle" style="font-family: Jua; font-size: 40px; margin-bottom: -10px;">λμΊ£λμ</span></a>
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
							<span style="color:blue; display: inline;">${sessionScope.member.userName}</span>λ 
							<p style="display: inline; color: lightgray;">|</p>
							<a href="${pageContext.request.contextPath}/member/logout" style="display: inline; color: gray;"> λ‘κ·Έμμ </a>
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
                        <a href="${pageContext.request.contextPath}/"><span class="logotitle" style="font-family: Jua; font-size: 40px; margin-bottom: -10px;">λμΊ£λμ</span></a>
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
							<span style="color:blue; display: inline;">${sessionScope.member.userName}</span>λ 
							<p style="display: inline; color: lightgray;">|</p>
							<a href="${pageContext.request.contextPath}/member/logout" style="display: inline; color: gray;"> λ‘κ·Έμμ </a>
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
                    <li><a href="#"><span class="menu-text">λͺ¨λλ³΄κΈ°</span></a>
                        <ul class="sub-menu">
                            <li>
                                <a href="#"><span class="menu-text">λμλͺ°</span></a>
                                <ul class="sub-menu">
                                    <li><a href="index.html"><span class="menu-text">κ°μμ§ μ©ν</span></a></li>
                                    <li><a href="index-2.html"><span class="menu-text">κ³ μμ΄ μ©ν</span></a></li>
                                    <li><a href="index-3.html"><span class="menu-text">μ¬λ£</span></a></li>
                                    <li><a href="index-4.html"><span class="menu-text">μ₯λκ°</span></a></li>
                                </ul>
                            </li>
                            
                            <li>
                                <a href="#"><span class="menu-text">μ»€λ?€λν°</span></a>
                                <ul class="sub-menu"> <!-- ${pageContext.request.contextPath}/faq/main -->
                                
                                <li><a href="${pageContext.request.contextPath}/notice/list"><span class="menu-text">κ³΅μ§μ¬ν­</span></a></li>
                                    <li><a href="${pageContext.request.contextPath}/zau/list"><span class="menu-text">μμ κ²μν</span></a></li>
                                    <li><a href="${pageContext.request.contextPath}/junggo/main"><span class="menu-text">μ€κ³ κ±°λκ²μν</span></a></li>
                                    <li><a href="${pageContext.request.contextPath}/expert/list"><span class="menu-text">λλ¬Όνλ μ λ¬Έκ° Q&A κ²μν</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/company/list"><span class="menu-text">μ ν΄μμ²΄</span></a>
                               
                            </li>
                            
                        </ul>
                    </li>
                    <li><a href="#"><span class="menu-text">λμλͺ°</span></a>
                        <ul class="sub-menu">
                        	<li>
                        	<a href="${pageContext.request.contextPath}/shopping/mainPage"><span class="menu-text">λμλͺ°ν</span></a>
                            </li>
                            <li>
                                <a href="#"><span class="menu-text">κ°μμ§</span></a>
                                <ul class="sub-menu">
                                    <li><a href="shop.html"><span class="menu-text">μ¬λ£</span></a></li>
                                        <li><a href="shop-left-sidebar.html"><span class="menu-text">κ°μ</span></a></li>
                                        <li><a href="shop-right-sidebar.html"><span class="menu-text">μμ/λ°°λ³</span></a></li>
                                        <li><a href="shop-fullwidth-no-gutters.html"><span class="menu-text">μμμ </span></a></li>
                                        <li><a href="shop-fullwidth.html"><span class="menu-text">μ©ν</span></a></li>
                                        <li><a href="shop-fullwidth-right-sidebar.html"><span class="menu-text">ν¨μ</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><span class="menu-text">κ³ μμ΄</span></a>
                                <ul class="sub-menu">
                                    <li><a href="shop.html"><span class="menu-text">μ¬λ£</span></a></li>
                                        <li><a href="shop-left-sidebar.html"><span class="menu-text">κ°μ</span></a></li>
                                        <li><a href="shop-right-sidebar.html"><span class="menu-text">μμ/λ°°λ³</span></a></li>
                                        <li><a href="shop-fullwidth-no-gutters.html"><span class="menu-text">μμμ </span></a></li>
                                        <li><a href="shop-fullwidth.html"><span class="menu-text">μ©ν</span></a></li>
                                        <li><a href="shop-fullwidth-right-sidebar.html"><span class="menu-text">ν¨μ</span></a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#" class="mega-menu-title"><span class="menu-text">κΈ°νμ </span></a>
                                <ul class="sub-menu">
                                    <li><a href="shopping-cart.html"><span class="menu-text">μ¬λ¦νΉμ§ λμνμΆ λλ²μ!</span></a></li>
                                    <li><a href="checkout.html"><span class="menu-text">λ¬νν</span></a></li>
                                    <li><a href="order-tracking.html"><span class="menu-text">μ μ λλ¬λ³΄κΈ°</span></a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    
                    <li><a href="#"><span class="menu-text">μ»€λ?€λν°</span></a>
                        <ul class="sub-menu">
                        <li><a href="${pageContext.request.contextPath}/notice/list"><span class="menu-text">κ³΅μ§μ¬ν­</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/zau/list"><span class="menu-text">μμ κ²μν</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/junggo/main"><span class="menu-text">μ€κ³ κ±°λκ²μν</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/expert/list"><span class="menu-text">λλ¬Όνλ μ λ¬Έκ° Q&A κ²μν</span></a></li>
                            
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/company/list"><span class="menu-text">μ ν΄μμ²΄</span></a>
           
                    </li>
             		<li><a href="#"><span class="menu-text">λ§μ΄νμ΄μ§</span></a>
                        <ul class="sub-menu">
                            <li><a href="${pageContext.request.contextPath}/myPage/main"><span class="menu-text">νμμ λ³΄</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/myPage/written"><span class="menu-text">λ΄κ° μ΄ κΈ</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/talk/receive/list"><span class="menu-text">μͺ½μ§ν¨</span></a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/myPage/attendance"><span class="menu-text">μΆμμ²΄ν¬</span></a>
                            </li>
                            <li>
                                <c:if test="${sessionScope.member.userId=='admin'}">
                                	<a href="${pageContext.request.contextPath}/cAdmin/main">κ΄λ¦¬μνμ΄μ§</a>
                                </c:if>
                            </li>
                        </ul>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/faq/main"><span class="menu-text">μμ£Ό λ¬»λ μ§λ¬Έ</span></a></li>
                </ul>
            </div>
            <div class="offcanvas-buttons">
                <div class="header-tools">
                    <div class="header-login" style="font-size: 16px; font-weight: 400; color: gray;">
                        <c:if test="${empty sessionScope.member}">
                        	<a href="${pageContext.request.contextPath}/member/login"><i class="fal fa-user"></i></a>
						</c:if>
						<c:if test="${not empty sessionScope.member}">
							<span style="color:blue; display: inline;">${sessionScope.member.userName}</span>λ 
							<p style="display: inline; color: lightgray;">|</p>
							<c:if test="${sessionScope.member.userId!='admin'}">
		                        <span>
		                           <c:choose>
		                              <c:when test="${sessionScope.member.clevel==0}">μ κ·νμ</c:when>                           
		                              <c:when test="${sessionScope.member.clevel==1}">μΌλ°νμ</c:when>
		                              <c:when test="${sessionScope.member.clevel==2}">μ΄μ¬νμ</c:when>
		                              <c:when test="${sessionScope.member.clevel==3}">μ°μνμ</c:when>
		                              <c:when test="${sessionScope.member.clevel==4}">λννμ</c:when>
		                           </c:choose>
		                        </span>
		                    </c:if>
							<c:if test="${sessionScope.member.userId=='admin'}">
								<a href="${pageContext.request.contextPath}/cAdmin/main" style="display: inline; color: gray;">κ΄λ¦¬μ</a> <i></i>
							</c:if>
							<p style="display: inline; color: lightgray;">|</p>
							<a href="${pageContext.request.contextPath}/member/logout" style="display: inline; color: gray;"> λ‘κ·Έμμ </a>
						</c:if>
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
    
    <div class="section section-padding">
        <div class="container">
            <div class="row">

                <div class="col-xl-7 col-lg-8 col-12 mx-auto">
                    <div class="about-us2">
                        <div class="inner">
                            <h2 class="title" style="font-family: Jua; font-size: 60px; color: gray">ν¨κ» λλ¦¬λ λ°λ € μν</h2>
                            <h5 class="sub-title">WELCOME TO DOG CAT DO IT</h5>
                            <div class="desc">
                                <p>λμΊ£λμκ³Ό ν¨κ»λΌλ©΄ λ°μ μΌμ μμμλ νμν λͺ¨λ  κ²μ μμ½κ² λλ¦¬λ μλ‘μ΄ μνμ΄ νΌμ³μ§ κ±°μμ.<br>κΈ°λνμΈμ! λλ¦΄ μ μλ κ²λ€μ΄ μκ° μ΄μμΌλ‘ λ§μνλκΉμ.</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div> 
    <!-- About us Section End -->

    <!-- Category Banner Section Start -->
    <div class="section section-padding pt-0">
        <div class="container">
            <div class="row row-cols-lg-4 row-cols-sm-2 row-cols-1 learts-mb-n40">

                <div class="col learts-mb-40">
                    <div class="category-banner4">
                        <a href="shop.html" class="inner">
                            <div class="image"><img src="resources/mainResources/images/banner/category/banner-s4-1.jpg" alt=""></div>
                            <div class="content" data-bg-color="#f4ede7">
                                <h3 class="title">μ»€λ?€λν° μ΅μ κΈ</h3>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="col learts-mb-40">
                    <div class="category-banner4">
                        <a href="shop.html" class="inner">
                            <div class="image"><img src="${pageContext.request.contextPath}/resources/mainResources/images/banner/category/banner-s4-2.jpg" alt=""></div>
                            <div class="content" data-bg-color="#e8f5f2">
                                <h3 class="title">μ»€λ?€λν° μΈκΈ°κΈ</h3>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="col learts-mb-40">
                    <div class="category-banner4">
                        <a href="${pageContext.request.contextPath}/shopping/mainPage" class="inner">
                            <div class="image"><img src="resources/mainResources/images/banner/category/banner-s4-3.jpg" alt=""></div>
                            <div class="content" data-bg-color="#e3e4f5">
                                <h3 class="title">λμλͺ°</h3>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="col learts-mb-40">
                    <div class="category-banner4">
                        <a href="${pageContext.request.contextPath}/company/list" class="inner">
                            <div class="image"><img src="resources/mainResources/images/banner/category/banner-s4-4.jpg" alt=""></div>
                            <div class="content" data-bg-color="#faf5e5">
                                <h3 class="title">μ ν΄μμ²΄</h3>
                            </div>
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Category Banner Section End -->

    <!-- Slider main container Start -->
    <div class="home1-slider swiper-container">
        <div class="swiper-wrapper">
            <div class="home1-slide-item swiper-slide" data-swiper-autoplay="5000" data-bg-image="resources/mainResources/images/slider/home1/slide-2.jpg">
                <div class="home1-slide1-content">
                    <span class="bg"></span>
                    <span class="slide-border"></span>
                    <span class="icon"><img src="resources/mainResources/images/slider/home1/slide-1-1.png" alt="Slide Icon"></span>
                    <h2 class="title" style="font-family: Jua;">λμΊ£λμ</h2>
                    <h3 class="sub-title" style="font-family: Jua;">λμ μν</h3>
                    <div class="link"><a href="${pageContext.request.contextPath}/shopping/mainPage" style="font-family: Jua;">μ§κΈ λ°λ‘ κ΅¬λ§€νκΈ°</a></div>
                </div>
            </div>
            <div class="home1-slide-item swiper-slide" data-swiper-autoplay="5000" data-bg-image="resources/mainResources/images/slider/home1/slide-1.jpg">
                <div class="home1-slide2-content">
                    <span class="bg" data-bg-image="resources/mainResources/images/slider/home1/slide-2-1.png"></span>
                    <span class="slide-border"></span>
                    <span class="icon">
                        <img src="resources/mainResources/images/slider/home1/slide-2-2.png" alt="Slide Icon">
                        <img src="resources/mainResources/images/slider/home1/slide-2-3.png" alt="Slide Icon">
                    </span>
                    <h2 class="title" style="font-family: Jua;">μ μ ν μΆμ</h2>
                    <h3 class="sub-title" style="font-family: Jua;">κΈ°κ°νμ  ν μΈ<br>10%</h3>
                    <div class="link"><a href="${pageContext.request.contextPath}/shopping/article?num=43" style="font-family: Jua;">μ§κΈ λ°λ‘ κ΅¬λ§€νκΈ°</a></div>
                </div>
            </div>
            <div class="home1-slide-item swiper-slide" data-swiper-autoplay="5000" data-bg-image="${pageContext.request.contextPath}/resources/mainResources/images/slider/home1/slide-3.jpg">
                <div class="home1-slide3-content">
                    <h3 class="title" style="font-family: Jua; color: white;">λλ¬Όλ³΅μ§μΊ νμΈ</h3>
                    <h2 class="sub-title" style="font-family: Jua; color: white;">
                        <img class="left-icon " src="resources/mainResources/images/slider/home1/slide-2-2.png" alt="Slide Icon">
                        "λ€μ μ¬λ λ°κ°"
                        <img class="right-icon " src="resources/mainResources/images/slider/home1/slide-2-3.png" alt="Slide Icon">
                    </h2>
                    <div class="link"><a href="shop.html" style="font-family: Jua;">μ§κΈ λ°λ‘ μ μ²­νκΈ°</a></div>
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
                <h2 class="title title-icon-both" style="font-family: Jua;">λμλͺ° λ² μ€νΈ μλ¬</h2>
            </div>
            <!-- Section Title End -->

            <!-- Products Start -->
            <div class="products row row-cols-xl-5 row-cols-lg-4 row-cols-md-3 row-cols-sm-2 row-cols-1">

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="${pageContext.request.contextPath}/shopping/article?num=42" class="image">
                                <span class="product-badges">
                                    <span class="onsale">-4%</span>
                                </span>
                                <img src="resources/mainResources/images/product/s328/1.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/1.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="μ° λͺ©λ‘μ μΆκ°"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">κ°μμ§ μΉ«μ</a></h6>
                            <span class="price">
                                <span class="old">β©15,000</span>
                            <span class="new">β©14,400</span>
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="λ―Έλ¦¬λ³΄κΈ°"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="μ₯λ°κ΅¬λ λ΄κΈ°"><i class="fal fa-shopping-cart"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="${pageContext.request.contextPath}/shopping/article?num=40" class="image">
                            	<span class="product-badges">
                                    <span class="onsale">-5%</span>
                                </span>
                                <img src="resources/mainResources/images/product/s328/2.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/2.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="μ° λͺ©λ‘μ μΆκ°"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">λ€νμ© λ°°λ³ ν¨λ</a></h6>
                            <span class="price">
                                <span class="old">β©31,000</span>
                            <span class="new">β©29,450</span>
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="λ―Έλ¦¬λ³΄κΈ°"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="μ₯λ°κ΅¬λ λ΄κΈ°"><i class="fal fa-shopping-cart"></i></a>
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
                            <a href="${pageContext.request.contextPath}/shopping/article?num=38" class="image">
                            	<span class="product-badges">
                                    <span class="onsale">-2%</span>
                                </span>
                                <img src="resources/mainResources/images/product/s328/3.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/3.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="μ° λͺ©λ‘μ μΆκ°"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">μμ΄λ§μμ΄ μ¬λ£</a></h6>
                            <span class="price">
                                <span class="old">β©22,000</span>
                            <span class="new">β©21,560</span>
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="λ―Έλ¦¬λ³΄κΈ°"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="μ₯λ°κ΅¬λ λ΄κΈ°"><i class="fal fa-shopping-cart"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="${pageContext.request.contextPath}/shopping/article?num=37" class="image">
                                <span class="product-badges">
                                    <span class="onsale">-4%</span>
                                </span>
                                <img src="resources/mainResources/images/product/s328/4.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/4.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="μ° λͺ©λ‘μ μΆκ°"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">κ°μμ§ κ³΅μ£Όλ μ·</a></h6>
                            <span class="price">
                                <span class="old">β©12,000</span>
                            <span class="new">β©11,520</span>
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="λ―Έλ¦¬λ³΄κΈ°"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="μ₯λ°κ΅¬λ λ΄κΈ°"><i class="fal fa-shopping-cart"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="${pageContext.request.contextPath}/shopping/article?num=26" class="image">
                            	<span class="product-badges">
                                    <span class="onsale">-1%</span>
                                </span>
                                <img src="resources/mainResources/images/product/s328/5.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/5.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="μ° λͺ©λ‘μ μΆκ°"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">λΌκ±΄κ° λ§μ΄λ³Έ</a></h6>
                            <span class="price">
                                <span class="old">β©6,666</span>
                            <span class="new">β©6,599</span>
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="λ―Έλ¦¬λ³΄κΈ°"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="μ₯λ°κ΅¬λ λ΄κΈ°"><i class="fal fa-shopping-cart"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="${pageContext.request.contextPath}/shopping/article?num=44" class="image">
                            	<span class="product-badges">
                                    <span class="onsale">-1%</span>
                                </span>
                                <img src="resources/mainResources/images/product/s328/6.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/6.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="μ° λͺ©λ‘μ μΆκ°"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">κ³ μμ΄ μκΈ°</a></h6>
                            <span class="price">
                                <span class="old">β©17,000</span>
                            <span class="new">β©16,320</span>
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="λ―Έλ¦¬λ³΄κΈ°"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="μ₯λ°κ΅¬λ λ΄κΈ°"><i class="fal fa-shopping-cart"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="${pageContext.request.contextPath}/shopping/article?num=43" class="image">
                                <span class="product-badges">
                                    <span class="hot">hot</span>
                                </span>
                                <span class="product-badges">
                                    <span class="onsale">-10%</span>
                                </span>
                                <img src="resources/mainResources/images/product/s328/7.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/7.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="μ° λͺ©λ‘μ μΆκ°"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">κ³ μμ΄ μ₯λκ° λͺ¨μ</a></h6>
                            <span class="price">
                                <span class="old">β©5,000</span>
                            <span class="new">β©4,500</span>
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="λ―Έλ¦¬λ³΄κΈ°"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="μ₯λ°κ΅¬λ λ΄κΈ°"><i class="fal fa-shopping-cart"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="${pageContext.request.contextPath}/shopping/article?num=41" class="image">
                                <span class="product-badges">
                                    <span class="hot">hot</span>
                                </span>
                                <span class="product-badges">
                                    <span class="onsale">-3%</span>
                                </span>
                                <img src="resources/mainResources/images/product/s328/8.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/8.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="μ° λͺ©λ‘μ μΆκ°"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">κ³ μμ΄ κ·μ¬μ΄ μ·</a></h6>
                            <span class="price">
                                <span class="old">β©6,000</span>
                            <span class="new">β©5,820</span>
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="λ―Έλ¦¬λ³΄κΈ°"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="μ₯λ°κ΅¬λ λ΄κΈ°"><i class="fal fa-shopping-cart"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="${pageContext.request.contextPath}/shopping/article?num=39" class="image">
                                <span class="product-badges">
                                    <span class="onsale">-4%</span>
                                </span>
                                <img src="resources/mainResources/images/product/s328/9.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/9.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="μ° λͺ©λ‘μ μΆκ°"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">κ³ μμ΄ λ°°λ³μ© λͺ¨λ</a></h6>
                            <span class="price">
                                <span class="old">β©15,000</span>
                            <span class="new">β©14,400</span>
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="λ―Έλ¦¬λ³΄κΈ°"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="μ₯λ°κ΅¬λ λ΄κΈ°"><i class="fal fa-shopping-cart"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="product">
                        <div class="product-thumb">
                            <a href="${pageContext.request.contextPath}/shopping/article?num=33" class="image">
                                <span class="product-badges">
                                    <span class="hot">hot</span>
                                </span>
                                <span class="product-badges">
                                    <span class="onsale">-1%</span>
                                </span>
                                <img src="resources/mainResources/images/product/s328/10.jpg" alt="Product Image">
                                <img class="image-hover " src="resources/mainResources/images/product/s328/10.jpg" alt="Product Image">
                            </a>
                            <a href="wishlist.html" class="add-to-wishlist hintT-left" data-hint="μ° λͺ©λ‘μ μΆκ°"><i class="far fa-heart"></i></a>
                        </div>
                        <div class="product-info">
                            <h6 class="title"><a href="product-details.html">μ λ§ λμ μΊ£νμ</a></h6>
                            <span class="price">
                                <span class="old">β©55,000</span>
                            <span class="new">β©54,995</span>
                            </span>
                            <div class="product-buttons">
                                <a href="#quickViewModal" data-toggle="modal" class="product-button hintT-top" data-hint="λ―Έλ¦¬λ³΄κΈ°"><i class="fal fa-search"></i></a>
                                <a href="#" class="product-button hintT-top" data-hint="μ₯λ°κ΅¬λ λ΄κΈ°"><i class="fal fa-shopping-cart"></i></a>
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
                    <span class="logotitle" style="font-family: Jua; font-size: 65px; margin-bottom: -10px;">λμΊ£λμ</span></a>
                </div>

                <div class="footer1-menu col">
                    <ul class="widget-menu justify-content-center">
                        <li><a href="#">λμΊ£λμ μκ°</a></li>
                        <li><a href="#">μ€μλκΈΈ</a></li>
                        <li><a href="#">μ±μ©μ λ³΄</a></li>
                        <li><a href="#">μ΄μ©μ½κ΄</a></li>
                        <li><a href="#">κ°μΈμ λ³΄μ²λ¦¬λ°©μΉ¨</a></li>
                        <li><a href="#">κ³ κ°μΌν°</a></li>
                    </ul>
                </div>
                <div class="footer1-subscribe d-flex flex-column col">
                    <form id="mc-form" class="mc-form widget-subscibe">
                        <input id="mc-email" autocomplete="off" type="email" placeholder="μ΄λ©μΌ μ£Όμλ₯Ό μλ ₯ν΄μ£ΌμΈμ.">
                        <button id="mc-submit" class="btn btn-dark" style="font-family: Jua; font-size: 18px;">1:1 λ¬Έμ</button>
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
                    <p class="copyright">&copy; 2021 λμΊ£λμ. All Rights Reserved | <strong>02-1234-5678</strong> | <a href="mailto:contact@dogcatdoit.com">contact@dogcatdoit.com</a></p>
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
                                <a href="#reviews" class="review-link">(<span class="count">3</span> λ¦¬λ·°)</a>
                            </div>
                            <h3 class="product-title">μν μ΄λ¦</h3>
                            <div class="product-price">10,000β©</div>
                            <div class="product-description">
                                <p>κ°λ¨ν μν μ€λͺ</p>
                            </div>
                            <div class="product-variations">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="label"><span>μ¬μ΄μ¦</span></td>
                                            <td class="value">
                                                <div class="product-sizes">
                                                    <a href="#">Large</a>
                                                    <a href="#">Medium</a>
                                                    <a href="#">Small</a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="label"><span>μμ</span></td>
                                            <td class="value">
                                                <div class="product-colors">
                                                    <a href="#" data-bg-color="#000000"></a>
                                                    <a href="#" data-bg-color="#ffffff"></a>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="label"><span>μλ</span></td>
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
                                <a href="#" class="btn btn-dark btn-outline-hover-dark"><i class="fal fa-shopping-cart"></i> μ₯λ°κ΅¬λ λ΄κΈ°</a>
                                <a href="#" class="btn btn-icon btn-outline-body btn-hover-dark"><i class="fal fa-random"></i></a>
                            </div>
                            <div class="product-meta mb-0">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="label"><span>μ¬μμλ±λ‘λ²νΈ</span></td>
                                            <td class="value">123-45-67890</td>
                                        </tr>
                                        <tr>
                                            <td class="label"><span>μμ’</span></td>
                                            <td class="value">
                                                <ul class="product-category">
                                                    <li><a href="#">κΈ°ν</a></li>
                                                </ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="label"><span>νκ·Έ</span></td>
                                            <td class="value">
                                                <ul class="product-tags">
                                                    <li><a href="#">μμ μ¬λ£</a></li>
                                                    <li><a href="#">κ°μμ§</a></li>
                                                    <li><a href="#">κ³ μμ΄</a></li>
                                                    <li><a href="#">μ©ν</a></li>
                                                </ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="label"><span>SNS</span></td>
                                            <td class="va">
                                                <div class="product-share">
                                                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                                                    <a href="#"><i class="fab fa-twitter"></i></a>
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
	<script src="${pageContext.request.contextPath}/resources/mainResources/js/weather.js"></script>
</body>

</html>