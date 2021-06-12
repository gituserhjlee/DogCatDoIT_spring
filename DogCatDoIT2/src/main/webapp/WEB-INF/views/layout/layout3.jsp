<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Jquery -->
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/vendor/jquery-3.4.1.min.js"></script>
    
    
    
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/mainResources/images/favicon.png">
	<title><tiles:insertAttribute name="title"/></title>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	
	<!-- Vendor CSS (Bootstrap & Icon Font) -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mainResources/css/vendor/bootstrap.min.css">
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
    <!-- 독캣두잇 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Jua:400" rel="stylesheet">
	<script type="text/javascript">
	$(function(){
		$(document)
		   .ajaxStart(function(){ // AJAX 시작
			   $("#loadingImage").center();
			   $("#loadingLayout").fadeTo("slow", 0.5);
		   })
		   .ajaxComplete(function(){ // AJAX 종료
			   $("#loadingLayout").hide();
		   });
	});
	
	</script>
</head>

<body>
	<header>
	    <tiles:insertAttribute name="header"/>
	</header>
		
	<main class="container">
	    <tiles:insertAttribute name="body"/>
	</main>
	
	<footer>
	    <tiles:insertAttribute name="footer"/>
	</footer>

	<div id="loadingLayout" style="display: none; position: absolute; left: 0; top:0; width: 100%; height: 100%; z-index: 9000; background: #eeeeee;">
		<i id="loadingImage" class="fa fa-cog fa-spin fa-fw" style="font-size: 70px; color: 333;"></i> 
	</div>
	
	<!-- Vendors JS -->
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/vendor/modernizr-3.6.0.min.js"></script>
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
    <!-- <script src="resources/mainResources/js/vendor/vendor.min.js"></script>
<script src="resources/mainResources/js/plugins/plugins.min.js"></script> -->

    <!-- Main Activation JS -->
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/resources/mainResources/js/weather.js"></script>
</body>
</html>