<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap4/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap4/css/bootstrap-icons.css"
	type="text/css">

<!-- Favicon icon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/shopAdmin/images/favicon.png"
	type="image/x-icon">
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/shopAdmin/images/favicon.ico"
	type="image/x-icon">

<!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Ubuntu:400,500,700"
	rel="stylesheet">

<!-- themify -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/shopAdmin/icon/themify-icons/themify-icons.css">

<!-- iconfont -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/shopAdmin/icon/icofont/css/icofont.css">

<!-- simple line icon -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/shopAdmin/icon/simple-line-icons/css/simple-line-icons.css">

<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/shopAdmin/plugins/bootstrap/css/bootstrap.min.css">

<!-- Chartlist chart css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/shopAdmin/plugins/chartist/dist/chartist.css"
	type="text/css" media="all">

<!-- Weather css -->
<link
	href="${pageContext.request.contextPath}/resources/shopAdmin/css/svg-weather.css"
	rel="stylesheet">


<!-- Style.css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/shopAdmin/css/main.css">

<!-- Responsive.css-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/shopAdmin/css/responsive.css">

<title>쇼핑몰 관리자페이지</title>
</head>
<body class="sidebar-mini fixed">
	<div class="loader-bg">
		<div class="loader-bar"></div>
	</div>
	<div class="wrapper">
		<!-- Navbar-->
		<header class="main-header-top hidden-print">
			<a href="${pageContext.request.contextPath}/shopping/main"
				class="logo"><img class="img-fluid able-logo"
				src="${pageContext.request.contextPath}/resources/shopAdmin/images/logo.png"
				alt="Theme-logo"></a>
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#!" data-toggle="offcanvas" class="sidebar-toggle"></a>

			</nav>
		</header>
		<!-- Side-Nav-->
		<aside class="main-sidebar hidden-print ">
			<section class="sidebar" id="sidebar-scroll">
				<!-- Sidebar Menu-->
				<ul class="sidebar-menu">
					<li class="nav-level">--- Navigation</li>
					<li class="active treeview" id="dashboard"><a
						class="waves-effect waves-dark"
						href="${pageContext.request.contextPath}/shopping/admin/dashboard">
							<i class="icon-speedometer"></i><span> Dashboard</span>
					</a></li>
					<li class="treeview"><a class="waves-effect waves-dark"
						href="#!"><i class="icon-book-open"></i><span> 주문조회</span></a></li>
					<li class="treeview" id="ItemManage"><a
						class="waves-effect waves-dark"
						href="${pageContext.request.contextPath}/shopping/admin/ItemManage"><i
							class="icon-briefcase"></i><span> 상품관리</span></a></li>

					<li class="treeview"><a class="waves-effect waves-dark"
						href="#!"><i class="icon-list"></i><span> 쿠폰관리</span></a></li>



					<li class="treeview"><a class="waves-effect waves-dark"
						href="basic-table.html"> <i class="icon-list"></i><span>
								발주 업체관리</span>
					</a></li>
					<li class="treeview"><a class="waves-effect waves-dark"
						href="basic-table.html"> <i class="icon-list"></i><span>
								재고관리</span>
					</a></li>
					<li class="treeview"><a class="waves-effect waves-dark"
						href="basic-table.html"> <i class="icon-list"></i><span>
								쇼핑몰 등급 관리</span>
					</a></li>

				</ul>
			</section>
		</aside>

		<main class="container">
			<tiles:insertAttribute name="body" />

		</main>
		<!-- Required Jqurey -->


		<script
			src="${pageContext.request.contextPath}/resources/shopAdmin/plugins/Jquery/dist/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/shopAdmin/plugins/jquery-ui/jquery-ui.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/shopAdmin/plugins/tether/dist/js/tether.min.js"></script>

		<!-- Required Fremwork -->
		<script
			src="${pageContext.request.contextPath}/resources/shopAdmin/plugins/bootstrap/js/bootstrap.min.js"></script>

		<!-- Scrollbar JS-->
		<script
			src="${pageContext.request.contextPath}/resources/shopAdmin/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/shopAdmin/plugins/jquery.nicescroll/jquery.nicescroll.min.js"></script>

		<!--classic JS-->
		<script
			src="${pageContext.request.contextPath}/resources/shopAdmin/plugins/classie/classie.js"></script>

		<!-- notification -->
		<script
			src="${pageContext.request.contextPath}/resources/shopAdmin/plugins/notification/js/bootstrap-growl.min.js"></script>

		<!-- Sparkline charts -->
		<script
			src="${pageContext.request.contextPath}/resources/shopAdmin/plugins/jquery-sparkline/dist/jquery.sparkline.js"></script>

		<!-- Counter js  -->
		<script
			src="${pageContext.request.contextPath}/resources/shopAdmin/plugins/waypoints/jquery.waypoints.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/shopAdmin/plugins/countdown/js/jquery.counterup.js"></script>

		<!-- Echart js -->
		<script
			src="${pageContext.request.contextPath}/resources/shopAdmin/plugins/charts/echarts/js/echarts-all.js"></script>

		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/exporting.js"></script>
		<script src="https://code.highcharts.com/highcharts-3d.js"></script>

		<!-- custom js -->
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/shopAdmin/js/main.min.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/shopAdmin/pages/dashboard.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/shopAdmin/pages/elements.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/shopAdmin/js/menu.min.js"></script>
		<script>
			var $window = $(window);
			var nav = $('.fixed-button');
			$window.scroll(function() {
				if ($window.scrollTop() >= 200) {
					nav.addClass('active');
				} else {
					nav.removeClass('active');
				}
			});
		</script>
</body>

</html>