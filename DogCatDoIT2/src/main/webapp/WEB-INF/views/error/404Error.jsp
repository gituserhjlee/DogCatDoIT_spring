<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Learts – Handmade Shop eCommerce HTML Template</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/mainResources/images/favicon.png">

    <!-- CSS
	============================================ -->
    <!-- Vendor CSS (Bootstrap & Icon Font) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/${pageContext.request.contextPath}/resources/mainResources/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/vendor/font-awesome-pro.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/vendor/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/vendor/customFonts.css">

    <!-- Plugins CSS (All Plugins Files) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/select2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/swiper.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/nice-select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/ion.rangeSlider.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/photoswipe.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/photoswipe-default-skin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/slick.css">

    <!-- Main Style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/style.css">

    <!-- Use the minified version files listed below for better performance and remove the files listed above -->
    <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/vendor/vendor.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/plugins/plugins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/style.min.css"> -->

</head>
<body>
    <!-- 404 Section Start -->
    <div class="section-404 section" data-bg-image="${pageContext.request.contextPath}/resources/mainResources/images/bg/bg-404.jpg">
        <div class="container">
            <div class="content-404" style="margin-left: 30px;">
                <h1 class="title" style="font-family: Jua;">404</h1>
                <h2 class="sub-title" style="font-family: Jua;">페이지를 찾을 수 없어요!</h2>
                <p style="font-family: Jua;">버튼을 눌러 홈페이지로 돌아가세요.</p>
                <div class="buttons">
                    <a class="btn btn-dark btn-outline-hover-dark" href="${pageContext.request.contextPath}/">홈페이지</a>
                </div>
            </div>
        </div>
    </div>
    <!-- 404 Section End -->

    <!-- JS
============================================ -->

    <!-- Vendors JS -->
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/vendor/modernizr-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/vendor/jquery-3.4.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/vendor/jquery-migrate-3.1.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/vendor/bootstrap.bundle.min.js"></script>

    <!-- Plugins JS -->
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/swiper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/slick.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/mo.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.instagramFeed.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.ajaxchimp.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/imagesloaded.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.matchHeight-min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/ion.rangeSlider.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/photoswipe.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/photoswipe-ui-default.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.zoom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/ResizeSensor.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.sticky-sidebar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/product360.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/jquery.scrollUp.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/scrollax.min.js"></script>

    <!-- Use the minified version files listed below for better performance and remove the files listed above -->
    <!-- <script src="${pageContext.request.contextPath}/resources/mainResources/js/vendor/vendor.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/mainResources/js/plugins/plugins.min.js"></script> -->

    <!-- Main Activation JS -->
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/main.js"></script>

</body>

</html>