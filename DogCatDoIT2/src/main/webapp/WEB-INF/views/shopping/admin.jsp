<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
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
			<a href="${pageContext.request.contextPath}/shopping/main" class="logo"><img
				class="img-fluid able-logo"
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
					<li class="active treeview"><a class="waves-effect waves-dark"
						href="/shopping/admin"> <i class="icon-speedometer"></i><span>
								Dashboard</span>
					</a></li>
					<li class="treeview"><a class="waves-effect waves-dark"
						href="#!"><i class="icon-book-open"></i><span> 주문조회</span></a></li>
					<li class="treeview"><a class="waves-effect waves-dark"
						href="#!"><i class="icon-briefcase"></i><span> 상품관리</span></a></li>

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


		<!-- Sidebar chat end-->
		<div class="content-wrapper">
			<!-- Container-fluid starts -->
			<!-- Main content starts -->
			<div class="container-fluid">
				<div class="row">
					<div class="main-header">
						<h4>Dashboard</h4>
					</div>
				</div>
				<!-- 4-blocks row start -->
				<div class="row dashboard-header">
					<div class="col-lg-3 col-md-6">
						<div class="card dashboard-product">
							<span>모든 상품 개수</span>
							<h2 class="dashboard-total-products">4500</h2>

							<div class="side-box">
								<i class="ti-signal text-warning-color"></i>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="card dashboard-product">
							<span>누적 팔린 개수</span>
							<h2 class="dashboard-total-products">37,500</h2>

							<div class="side-box ">
								<i class="ti-gift text-primary-color"></i>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="card dashboard-product">
							<span>쇼핑몰 이용 고객 수 </span>
							<h2 class="dashboard-total-products">
								<span>30,780</span>
							</h2>
							<div class="side-box">
								<i class="ti-direction-alt text-success-color"></i>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="card dashboard-product">
							<span>누적 쇼핑몰 순 이익</span>
							<h2 class="dashboard-total-products">
								$<span>30,780</span>
							</h2>
							<div class="side-box">
								<i class="ti-rocket text-danger-color"></i>
							</div>
						</div>
					</div>
				</div>
				<!-- 4-blocks row end -->

				<!-- 1-3-block row start -->
				<div class="row">

					<div class="col-lg-8">
						<div class="card">
							<div class="card-header">
								<h5 class="card-header-text">Bar chart</h5>
							</div>
							<div class="card-block">
								<div id="barchart"
									style="min-width: 250px; height: 330px; margin: 0 auto"></div>
							</div>
						</div>
					</div>
					<div class="col-xl-4 col-lg-12 grid-item">
						<div class="card">
							<div class="card-block horizontal-card-img d-flex">
								<img class="media-object img-circle"
									src="${pageContext.request.contextPath}/resources/shopAdmin/images/avatar-3.png"
									alt="Generic placeholder image">
								<div class="d-inlineblock  p-l-20">
									<h6>Josephin Doe</h6>
									<a href="#">contact@admin.com</a>
								</div>
								<h6 class="txt-warning rotate-txt">Designer</h6>
							</div>
						</div>
					</div>
					<div class="col-xl-4 col-lg-12 grid-item">
						<div class="card">
							<div class="card-block horizontal-card-img d-flex">
								<img class="media-object img-circle"
									src="${pageContext.request.contextPath}/resources/shopAdmin/images/lockscreen.png"
									alt="Generic placeholder image">
								<div class="d-inlineblock  p-l-20">
									<h6>Josephin Doe</h6>
									<a href="#">contact@admin.com</a>
								</div>
								<h6 class="txt-danger rotate-txt">Developer</h6>
							</div>
						</div>
					</div>
				</div>
				<!-- 1-3-block row end -->

				<!-- 2-1 block start -->
				<div class="row">
					<div class="col-xl-8 col-lg-12">
						<div class="card">
							<div class="card-block">
								<div class="table-responsive">
									<table class="table m-b-0 photo-table">
										<thead>
											<tr class="text-uppercase">
												<th>Photo</th>
												<th>Product Name</th>
												<th>percent</th>
												<th>누적판매량</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th><img class="img-fluid img-circle"
													src="${pageContext.request.contextPath}/resources/shopAdmin/images/avatar-2.png"
													alt="User"></th>
												<td>Appestia Project
													<p>
														<i class="icofont icofont-clock-time"></i>Created
														14.9.2016
													</p>
												</td>
												<td><span class="pie" style="display: none;">226,134</span>
													<svg class="peity" height="30" width="30">
														<path
															d="M 15.000000000000002 0 A 15 15 0 1 1 4.209902994920235 25.41987555688496 L 15 15"
															fill="#2196F3"></path>
														<path
															d="M 4.209902994920235 25.41987555688496 A 15 15 0 0 1 14.999999999999996 0 L 15 15"
															fill="#ccc"></path></svg></td>
												<td>50%</td>
												<td>October 21, 2015</td>
											</tr>
											<tr>
												<th><img class="img-fluid img-circle"
													src="${pageContext.request.contextPath}/resources/shopAdmin/images/avatar-4.png"
													alt="User"></th>
												<td>Contract with belife Company
													<p>
														<i class="icofont icofont-clock-time"></i>Created
														20.10.2016
													</p>
												</td>
												<td><span class="pie" style="display: none;">0.52/1.561</span>
													<svg class="peity" height="30" width="30">
														<path
															d="M 15.000000000000002 0 A 15 15 0 0 1 28.00043211809656 22.482564048691025 L 15 15"
															fill="#2196F3"></path>
														<path
															d="M 28.00043211809656 22.482564048691025 A 15 15 0 1 1 14.999999999999996 0 L 15 15"
															fill="#ccc"></path></svg></td>
												<td>70%</td>
												<td>November 21, 2015</td>
											</tr>
											<tr>
												<th><img class="img-fluid img-circle"
													src="${pageContext.request.contextPath}/resources/shopAdmin/images/avatar-1.png"
													alt="User"></th>
												<td>Web Consultancy project
													<p>
														<i class="icofont icofont-clock-time"></i>Created
														20.10.2016
													</p>
												</td>
												<td><span class="pie" style="display: none;">1,4</span>
													<svg class="peity" height="30" width="30">
														<path
															d="M 15.000000000000002 0 A 15 15 0 0 1 29.265847744427305 10.36474508437579 L 15 15"
															fill="#2196F3"></path>
														<path
															d="M 29.265847744427305 10.36474508437579 A 15 15 0 1 1 14.999999999999996 0 L 15 15"
															fill="#ccc"></path></svg></td>
												<td>40%</td>
												<td>September 21, 2015</td>
											</tr>
											<tr>
												<th><img class="img-fluid img-circle"
													src="${pageContext.request.contextPath}/resources/shopAdmin/images/avatar-3.png"
													alt="User"></th>
												<td>Contract with belife Company
													<p>
														<i class="icofont icofont-clock-time"></i>Created
														20.10.2016
													</p>
												</td>
												<td><span class="pie" style="display: none;">0.52/1.561</span>
													<svg class="peity" height="30" width="30">
														<path
															d="M 15.000000000000002 0 A 15 15 0 0 1 28.00043211809656 22.482564048691025 L 15 15"
															fill="#2196F3"></path>
														<path
															d="M 28.00043211809656 22.482564048691025 A 15 15 0 1 1 14.999999999999996 0 L 15 15"
															fill="#ccc"></path></svg></td>
												<td>70%</td>
												<td>November 21, 2015</td>
											</tr>
											<tr>
												<th><img class="img-fluid img-circle"
													src="${pageContext.request.contextPath}/resources/shopAdmin/images/avatar-1.png"
													alt="User"></th>
												<td>Contract with belife Company
													<p>
														<i class="icofont icofont-clock-time"></i>Created
														20.10.2016
													</p>
												</td>
												<td><span class="pie" style="display: none;">0.52/1.561</span>
													<svg class="peity" height="30" width="30">
														<path
															d="M 15.000000000000002 0 A 15 15 0 0 1 28.00043211809656 22.482564048691025 L 15 15"
															fill="#2196F3"></path>
														<path
															d="M 28.00043211809656 22.482564048691025 A 15 15 0 1 1 14.999999999999996 0 L 15 15"
															fill="#ccc"></path></svg></td>
												<td>70%</td>
												<td>November 21, 2015</td>
											</tr>
											<tr>
												<th><img class="img-fluid img-circle"
													src="${pageContext.request.contextPath}/resources/shopAdmin/images/avatar-2.png"
													alt="User"></th>
												<td>Contract with belife Company
													<p>
														<i class="icofont icofont-clock-time"></i>Created
														20.10.2016
													</p>
												</td>
												<td><span class="pie" style="display: none;">0.52/1.561</span>
													<svg class="peity" height="30" width="30">
														<path
															d="M 15.000000000000002 0 A 15 15 0 0 1 28.00043211809656 22.482564048691025 L 15 15"
															fill="#2196F3"></path>
														<path
															d="M 28.00043211809656 22.482564048691025 A 15 15 0 1 1 14.999999999999996 0 L 15 15"
															fill="#ccc"></path></svg></td>
												<td>70%</td>
												<td>November 21, 2015</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-4 col-lg-12">
						<div class="card">
							<div class="card-header">
								<h5 class="card-header-text">Bar chart</h5>
							</div>
							<div class="card-block">
								<div id="piechart"
									style="min-width: 250px; height: 460px; margin: 0 auto"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- 2-1 block end -->
			</div>
			<!-- Main content ends -->
			<!-- Container-fluid ends -->

		</div>
	</div>



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
