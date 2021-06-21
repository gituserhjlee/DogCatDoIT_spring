<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- Hero Section Begin -->
<section class="hero hero-normal">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i> <span>All Items</span>
					</div>

					<ul>
						<li style="color: #F79F81; font-weight: bolder;">Dog</li>
						<li><a href="#">사료</a></li>
						<li><a href="#">간식</a></li>
						<li><a href="#">위생/배변</a></li>
						<li><a href="#">영양제</a></li>
						<li><a href="#">용품</a></li>
						<li><a href="#">패션</a></li>
						<li style="color: #F79F81; font-weight: bolder;">Cat</li>
						<li><a href="#">사료</a></li>
						<li><a href="#">간식</a></li>
						<li><a href="#">위생/배변</a></li>
						<li><a href="#">영양제</a></li>
						<li><a href="#">용품</a></li>
						<li><a href="#">패션</a></li>

					</ul>
				</div>
			</div>
			<div class="col-lg-9">

				<div class="hero__search">

					<div class="hero__search__form">

						<form action="${pageContext.request.contextPath}/shopping/search" method="get">
							
							<input type="text" name="searchkeyword" id="searchkeyword" placeholder="검색어를 입력하세요"
								style="width: 70%; padding-left: 20px;">
							<button type="submit" class="site-btn">SEARCH</button>
						</form>
					</div>

				</div>

			</div>
		</div>
	</div>
</section>
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	data-setbg="${pageContext.request.contextPath}/resources/img/hero/dogs.jpg" style="padding: 45px 0 500px;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text" >
					<h2 style="color:black;">Searched List</h2>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Featured Section Begin -->
<section class="featured spad">
	<div class="container">
		
		<div class="row featured__filter">
		<c:if test="${fn:length(list)==0 }">
		<div style="text-align: center; margin: 0 auto;">
		검색된 내역이 없습니다
		</div>
		</c:if>
			<c:forEach var="d" items="${list}">
			<div class="col-lg-3 col-md-4 col-sm-6 mix">
				<div class="featured__item">
					<div class="product__discount__item__pic set-bg"
						data-setbg="${pageContext.request.contextPath}/uploads/item/${d.saveFileName}"
						onclick="javascript:location.href='${pageContext.request.contextPath}/shopping/article?num=${d.itemId}';"
						>
						<c:if test="${d.discountRate!=0}">
							<div class="product__discount__percent">-${d.discountRate}%</div>
						</c:if>
						
					</div>
					<div class="featured__item__text">
						<h6>
							<a>${d.itemName}</a>
						</h6>
						<c:if test="${d.discountRate!=0}">
							<h5 style="color: gray; text-decoration: line-through;">${d.itemSalePrice}원</h5>
							<h5 style="color: red;">${d.discountedPrice}원</h5>
						</c:if>
						<c:if test="${'0' eq d.discountRate}">
							<h5>${d.itemSalePrice}원</h5>
						</c:if>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
	</div>
</section>
<!-- Featured Section End -->

