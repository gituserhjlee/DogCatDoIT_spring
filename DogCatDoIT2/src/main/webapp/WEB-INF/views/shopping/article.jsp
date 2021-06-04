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
							<input type="text" placeholder="검색어를 입력하세요">
							<button type="submit" class="site-btn">SEARCH</button>
						</form>
					</div>

				</div>

			</div>
		</div>
	</div>
</section>
<!-- Hero Section End -->
<!-- Product Details Section Begin -->
<section class="product-details spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="product__details__pic">
					<div class="product__details__pic__item">
						<img class="product__details__pic__item--large"
							src="${pageContext.request.contextPath}/uploads/item/${item.saveFileName}"
							alt="사진">
					</div>

				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="product__details__text">
					<h3>${item.itemName}</h3>
					<div class="product__details__rating">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star-half-o"></i> <span>(18 reviews)</span>
					</div>
					<div class="product__details__price">

						<c:if test="${item.discountRate!=0}">
							<h5 style="color: #7fad39;">할인율: -${item.discountRate}%</h5>
							<h5 style="color: gray; text-decoration: line-through;">${item.itemSalePrice}원</h5>
							<h5 style="color: red;">${item.discountedPrice}원</h5>
						</c:if>
						<c:if test="${'0' eq item.discountRate}">
							<h5>${item.itemSalePrice}원</h5>
						</c:if>

					</div>
					<div>${item.des}</div>

				 	<div>
						<select>
							<c:forEach var="o" items="${options}">
								<option value="${o.detailId}">(${o.optionName})
									${o.detailname} (주문가능:${o.stock} 개)</option>
							</c:forEach>
						</select>
					</div> 


					<div class="product__details__quantity" style="clear:both">
						<div class="quantity">
							<div class="pro-qty">
								<input type="text" value="1">
							</div>
						</div>
					</div>
					<div>
						<a href="#" class="primary-btn">ADD TO CARD</a> <a href="#"
							class="primary-btn">BUY NOW</a> <a href="#" class="heart-icon"><span
							class="icon_heart_alt"></span></a>
					</div>

				</div>

			</div>
			<div class="col-lg-12">
				<div class="product__details__tab">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">Description</a>
						</li>

						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-2" role="tab" aria-selected="false">Reviews <span>(1)</span></a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>Products Infomation</h6>
								<p>${item.content}</p>
							</div>
						</div>

						<div class="tab-pane" id="tabs-2" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>Products Infomation</h6>
								<p>리뷰입니다</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Product Details Section End -->

