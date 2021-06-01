<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


		
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
												
												<td>70%</td>
												<td>November 21, 2015</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- <div class="col-xl-4 col-lg-12">
						<div class="card">
							<div class="card-header">
								<h5 class="card-header-text">Bar chart</h5>
							</div>
							<div class="card-block">
								<div id="piechart"
									style="min-width: 250px; height: 460px; margin: 0 auto"></div>
							</div>
						</div>
					</div> -->
				</div>
				<!-- 2-1 block end -->
			</div>
			
		</div>
	

