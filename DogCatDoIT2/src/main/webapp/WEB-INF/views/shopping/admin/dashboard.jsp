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
				<div class="row dashboard-header" style="font-family: 'JUA';">
					<div class="col-lg-3 col-md-6">
						<div class="card dashboard-product">
							<span>모든 상품 개수</span>
							<h2 class="dashboard-total-products">${datacount}</h2>

							<div class="side-box">
								<i class="ti-signal text-warning-color"></i>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="card dashboard-product">
							<span>누적 주문 건수</span>
							<h2 class="dashboard-total-products">${ordercount}</h2>

							<div class="side-box ">
								<i class="ti-gift text-primary-color"></i>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="card dashboard-product">
							<span>쇼핑몰 이용 고객 수 </span>
							<h2 class="dashboard-total-products">
								<span>${customercount}</span>
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
								<span>${profit}원</span>
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

					<div class="col-lg-8" style="margin:0 auto;font-family: 'JUA';">
						<div class="card">
							<div class="card-header">
								<h5 class="card-header-text">올해 월별 매출액</h5>
							</div>
							<div class="card-block">
								<div id="container"
									style="min-width: 250px; height: 330px; margin: 0 auto"></div>
							</div>
						</div>
					</div>
				
					
				</div>
				<!-- 1-3-block row end -->

				<!-- 2-1 block start -->
				<div class="row">
					<div class="col-xl-8 col-lg-12" style="margin:0 auto; text-align: center;">
					<h5>Best Item</h5>
						<div class="card">
							<div class="card-block">
								<div class="table-responsive">
									<table class="table m-b-0 photo-table" style="font-family: 'JUA';">
										<thead>
											<tr class="text-uppercase">
												<th>상품명</th>
												<th>옵션명</th>
												<th>상세옵션명</th>
												<th>주문수량</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${list}">
											<tr>
												
												<td>${item.itemname}</td>
												<td>${item.optionname}</td>
												<td>${item.detailname}</td>
												<td>${item.qty}</td>
											</tr>
											</c:forEach>
										
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				
				</div>
				
			</div>
			
		</div>
<script>	
$(function(){
	var url="${pageContext.request.contextPath}/shopping/admin/chart";
	
	$.getJSON(url,function(data){
		Highcharts.chart('container', {
		    chart: {
		        type: 'column'
		    },
		    title: {
		        text: '월별 매출현황'
		    },
		 
		    xAxis: {
		        categories: [
		            'Jan',
		            'Feb',
		            'Mar',
		            'Apr',
		            'May',
		            'Jun',
		            'Jul',
		            'Aug',
		            'Sep',
		            'Oct',
		            'Nov',
		            'Dec'
		        ],
		        crosshair: true
		    },
		    yAxis: {
		       
		        title: {
		            text: '매출액(원) k=1000'
		        }
		    },
		    tooltip: {
		        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		            '<td style="padding:0"><b>{point.y} 원</b></td></tr>',
		        footerFormat: '</table>',
		        shared: true,
		        useHTML: true
		    },
		    plotOptions: {
		        column: {
		            pointPadding: 0.2,
		            borderWidth: 0
		        }
		    },
			series:data.series

		});
		              
});
});
</script>
