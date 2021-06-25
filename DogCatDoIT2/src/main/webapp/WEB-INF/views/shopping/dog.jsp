<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

						<form>	
							<input type="text" name="searchkeyword" id="searchkeyword" placeholder="검색어를 입력하세요"
								style="width: 70%; padding-left: 20px;">
							<button type="button" class="site-btn" onclick="EngCheck()">SEARCH</button>
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
	data-setbg="${pageContext.request.contextPath}/resources/img/dog.png">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>Dog</h2>

				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Featured Section Begin -->
<section class="featured spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>Dog Product</h2>
					<br> <br>
					<h4>total ${dataCount} products</h4>
						<a onclick="location.href='${pageContext.request.contextPath}/shopping/dog?sort=forRecent'">최신순 | </a>
						<a onclick="location.href='${pageContext.request.contextPath}/shopping/dog?sort=forhigh'">가격높은순 | </a>
						<a onclick="location.href='${pageContext.request.contextPath}/shopping/dog?sort=forlow'">가격낮은순 | </a>
						<a onclick="location.href='${pageContext.request.contextPath}/shopping/dog?sort=fordiscount'">할인율높은순</a>
				</div>
				<div class="featured__controls">
					<ul>
						<li class="active" data-filter="*">All</li>
						<li data-filter=".saro">사료</li>
						<li data-filter=".gansic">간식</li>
						<li data-filter=".clean">위생/배변</li>
						<li data-filter=".yak">영양제</li>
						<li data-filter=".products">용품</li>
						<li data-filter=".fashion">패션</li>

					</ul>
				</div>
			</div>
		</div>
		<div class="row featured__filter">
			<c:forEach var="d" items="${items}">
				<c:if test="${3 eq d.itemCategoryId}">
					<div class="col-lg-3 col-md-4 col-sm-6 mix saro">
				</c:if>
				<c:if test="${4 eq d.itemCategoryId}">
					<div class="col-lg-3 col-md-4 col-sm-6 mix gansic">
				</c:if>
				<c:if test="${6 eq d.itemCategoryId}">
					<div class="col-lg-3 col-md-4 col-sm-6 mix clean">
				</c:if>
				<c:if test="${7 eq d.itemCategoryId}">
					<div class="col-lg-3 col-md-4 col-sm-6 mix yak">
				</c:if>
				<c:if test="${8 eq d.itemCategoryId}">
					<div class="col-lg-3 col-md-4 col-sm-6 mix products">
				</c:if>
				<c:if test="${9 eq d.itemCategoryId}">
					<div class="col-lg-3 col-md-4 col-sm-6 mix fashion">
				</c:if>
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

