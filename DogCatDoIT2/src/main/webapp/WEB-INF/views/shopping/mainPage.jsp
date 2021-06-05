<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Hero Section Begin -->
<section class="hero">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i> <span>All Items</span>
					</div>
					<ul>
						<li style="color: red">Dog</li>
						<li><a href="#">사료</a></li>
						<li><a href="#">간식</a></li>
						<li><a href="#">위생/배변</a></li>
						<li><a href="#">영양제</a></li>
						<li><a href="#">용품</a></li>
						<li><a href="#">패션</a></li>
						<li style="color: red">Cat</li>
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

						<form action="#">
							<div>
								<select>
									<option value="">All Categories</option>
									<option value="dog">강아지</option>
									<option value="cat">고양이</option>
								</select>

							</div>
							<input type="text" placeholder="검색어를 입력하세요" style="width:70%; padding-left: 20px;">
							<button type="submit" class="site-btn">SEARCH</button>
						</form>
					</div>

				</div>
				<br> <br>

				
				<div class="hero__item set-bg"
					data-setbg="${pageContext.request.contextPath}/resources/img/hero/mainpets.jpg">
					<div class="hero__text">
						<br> <span style="color:white;">shopping together</span>
						<h2>
							Dog Cat do it!! <br />shopping mall
						</h2>
						<a href="${pageContext.request.contextPath}/shopping/dog"
							class="primary-btn" style="background:#696969">Dog</a> <a
							href="${pageContext.request.contextPath}/shopping/cat"
							class="primary-btn" style="background:#696969">Cat</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Hero Section End -->


<!-- Categories Section Begin -->
<section class="categories">
	<div class="container">
		<div class="section-title" style="text-align: center">
			<h2>On Sale</h2>
		</div>
		<c:if test="${empty onSale}">
			<div style="text-align: center">
				<h6>세일중인 상품이 없습니다</h6>
			</div>
		</c:if>
		<div class="row">

			<div class="categories__slider owl-carousel">
				<c:forEach var="o" items="${onSale}">
					<div class="col-lg-3">

						<div class="product__discount__item__pic set-bg "
							data-setbg="${pageContext.request.contextPath}/uploads/item/${o.saveFileName}"
							onclick="javascript:location.href='${pageContext.request.contextPath}/shopping/article?num=${o.itemId}';">
							<div class="product__discount__percent">-${o.discountRate}%</div>

						</div>

						<div class="featured__item__text">
							<h6>
								<a href="#">${o.itemName}</a>
							</h6>
							<h5 style="color: gray; text-decoration: line-through;">${o.itemSalePrice}원</h5>
							<h5 style="color: red;">${o.discountedPrice}원</h5>

						</div>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
</section>
<!-- Categories Section End -->
<br>
<br>
<!-- Banner Begin -->
<div class="banner">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="banner__pic">
					<img
						src="${pageContext.request.contextPath}/resources/img/banner/banner3.jpg"
						alt="">
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="banner__pic">
					<img
						src="${pageContext.request.contextPath}/resources/img/banner/banner2.png"
						alt="">
				</div>
			</div>

		</div>
	</div>
</div>
<!-- Banner End -->


<!-- Featured Section Begin -->
<section class="featured spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>New Product</h2>
				</div>
				<div class="featured__controls">
					<ul>
						<li class="active" data-filter="*">All</li>
						<li data-filter=".dog">Dog</li>
						<li data-filter=".cat">Cat</li>

					</ul>
				</div>
			</div>
		</div>
		<div class="row featured__filter">
			<c:forEach var="d" items="${dog}">
				<div class="col-lg-3 col-md-4 col-sm-6 mix dog">
					<div class="featured__item">
						<div class="product__discount__item__pic set-bg"
							data-setbg="${pageContext.request.contextPath}/uploads/item/${d.saveFileName}"
							onclick="javascript:location.href='${pageContext.request.contextPath}/shopping/article?num=${d.itemId}';">
							<c:if test="${d.discountRate!=0}">
								<div class="product__discount__percent">-${d.discountRate}%</div>

							</c:if>
							
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">${d.itemName}</a>
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


			<c:forEach var="c" items="${cat}">
				<div class="col-lg-3 col-md-4 col-sm-6 mix cat">
					<div class="featured__item">
						<div class="product__discount__item__pic set-bg"
							data-setbg="${pageContext.request.contextPath}/uploads/item/${c.saveFileName}"
							onclick="javascript:location.href='${pageContext.request.contextPath}/shopping/article?num=${c.itemId}';">
							<c:if test="${c.discountRate!=0}">
								<div class="product__discount__percent">-${c.discountRate}%</div>

							</c:if>
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-heart"></i></a></li>
								<li><a href="#"><i class="fa fa-retweet"></i></a></li>
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">${c.itemName}</a>
							</h6>
							<c:if test="${c.discountRate!=0}">
								<h5 style="color: gray; text-decoration: line-through;">${c.itemSalePrice}원</h5>
								<h5 style="color: red;">${c.discountedPrice}원</h5>
							</c:if>
							<c:if test="${'0' eq c.discountRate}">
								<h5>${c.itemSalePrice}원</h5>
							</c:if>

						</div>
					</div>
				</div>
			</c:forEach>


		</div>
	</div>
</section>
<!-- Featured Section End -->



