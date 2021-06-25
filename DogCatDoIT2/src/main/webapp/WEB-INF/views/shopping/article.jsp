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
<!-- Product Details Section Begin -->
<section class="product-details spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="product__details__pic">
					<div class="product__details__pic__item">
					<c:if test="${empty item.saveFileName }">
					<img class="product__details__pic__item--large"
							src="${pageContext.request.contextPath}/resources/img/hero/mainpets.jpg"
							alt="사진">
					</c:if>
					
						<img class="product__details__pic__item--large"
							src="${pageContext.request.contextPath}/uploads/item/${item.saveFileName}"
							alt="사진이 등록되지 않았어요">
					</div>

				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="product__details__text">
					<h3>${item.itemName}</h3>
					<div class="product__details__rating">
						평점: ${average} <span>(${count} reviews)</span>
					</div>
					<div class="product__details__price">

						<c:if test="${item.discountRate!=0}">
							<h5 style="color: #F79F81;">할인율: -${item.discountRate}%</h5>
							<h5 style="color: gray; text-decoration: line-through;">${item.itemSalePrice}원</h5>
							<h5 style="color: red;">${item.discountedPrice}원</h5>
						</c:if>
						<c:if test="${'0' eq item.discountRate}">
							<h5>${item.itemSalePrice}원</h5>
						</c:if>

					</div>
					<div>${item.des}</div>

					<form name="oform" action="${pageContext.request.contextPath}/order/orderForm" method="get">
						<div>
							<select name="detailId" id="cartdetailId">
								<c:forEach var="o" items="${options}">
									<option value="${o.detailId}">(${o.optionName})
										${o.detailname} (주문가능:${o.stock} 개)</option>
								</c:forEach>
							</select>
						</div>


						<div class="product__details__quantity" style="clear: both;">
							<div class="quantity">
								<div class="pro-qty" style="background: white">
									<input type="text" name="count" id="cartcount" value="1"
										style="border: none; background: #F79F81; color: white;">
								</div>
							</div>
						</div>
						<div style="margin-top: 10px;">
							<button type="button" class="primary-btn" style="border: 2px solid #F79F81;"
								onclick="addCart()">ADD TO CART</button>
							<button type="submit" style="border: 2px solid #F79F81;"  class="primary-btn" >BUY NOW</button>
							
						</div>
					</form>

				</div>

			</div>
			<div class="col-lg-12">
				<div class="product__details__tab">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link"
							data-toggle="tab" href="#tabs-1" role="tab" aria-selected="false">Description</a>
						</li>

						<li class="nav-item"><a class="nav-link active" data-toggle="tab"
							href="#tabs-2" role="tab" aria-selected="true" >Reviews <span>(${count})</span></a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane " id="tabs-1" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>Products Infomation</h6>
								<p>${item.content}</p>
							</div>
						</div>

						<div class="tab-pane active" id="tabs-2" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>Reviews</h6>
								<form name="reviewForm">
									<input type="hidden" name="itemId" id="itemId" value="${item.itemId}">
									<div style="text-align: center; font-family: Jua; font-size: x-large; padding: 20px;">
										<span>별점을 선택해주세요 </span>
										<div class="starRev">
										  <span class="starR on">별1</span>
										  <span class="starR on">별2</span>
										  <span class="starR on">별3</span>
										  <span class="starR on">별4</span>
										  <span class="starR on">별5</span>
										 
									</div>
									
									<div>
										<span>느낀점을 입력해주세요 </span>
										<textarea name="content" id="content" style="height: 100px; display: block; border:2px solid #F79F81; border-radius:10px; ">
										${review.content}</textarea>
									</div> 
									<c:if test="${mode eq 'insert' }">
									<button type="button" class="primary-btn" style="border: 2px solid #F79F81; border-radius:10px;"
									onclick="addReview()">Submit</button>
									</c:if>
									<c:if test="${mode eq 'update'}">
									<button type="button" class="primary-btn" style="border: 2px solid #F79F81; border-radius:10px;"
									onclick="updateReview(${review.reviewNum}, ${review.itemId}, ${review.useridx});">Update</button>
									</c:if>
									</div>
									
								</form>		
								<button type="button" class="primary-btn" style="border: 2px solid #F79F81; border-radius:10px; font-family: Jua"
									onclick="reviewlist();">모든 리뷰 보기</button>
			
							<div class="reviewList"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Product Details Section End -->

<script>

function reviewlist(){
	var itemId=$('#itemId').val();
	$.ajax({
		url:"${pageContext.request.contextPath}/shopping/review?itemId="+itemId,
		type:"GET",
		dataType:'html',
		success:function(data){
			$(".reviewList").html(data);
			
		}
	})
}
</script>

<script>
function addReview(){
	var score=$('.on').length;
	var itemId=$('#itemId').val();
	var content=$('#content').val();
	var f = document.reviewForm;

	var str = f.content.value;
	if (!str) {
		f.content.focus();
		return false;
	}
	
	if(confirm("등록하시겠습니까 ? ") == true){
    }
    else{
        return false ;
    }
	//에이잭스로 처리 
	$.ajax({
			url:"${pageContext.request.contextPath}/shopping/review",
			type:"POST",
			data:{"score":score, "itemId":itemId, "content":content},
			dataType:'html',
			success:function(data){
				$(".reviewList").html(data);
				f.reset();
			}
		})
	
}
</script>
<script>
function updateReview(reviewNum,itemId, useridx){
	var score=$('.on').length;
	var content=$('#content').val();
	var f = document.reviewForm;

	var str = f.content.value;
	if (!str) {
		f.content.focus();
		return false;
	}
	
	if(confirm("수정하시겠습니까 ? ") == true){
    }
    else{
        return false ;
    }
	//에이잭스로 처리 
	$.ajax({
			url:"${pageContext.request.contextPath}/shopping/updatereview",
			type:"POST",
			data:{"score":score, "content":content, "reviewNum":reviewNum, "itemId":itemId, "useridx":useridx},
			dataType:'html',
			success:function(data){
		        alert("수정되었습니다");
		        window.location.href = "${pageContext.request.contextPath}/shopping/article?num="+itemId;

			}
		})
	
}
</script>
<script>
function deleteReview(reviewNum, useridx, itemId){
	if(confirm("삭제하시겠습니까 ? ") == true){
        
    }
    else{
        return false ;
    }
	
	$.ajax({
		url:"${pageContext.request.contextPath}/shopping/deletereview",
		type:"POST",
		data:{"reviewNum":reviewNum, "useridx":useridx, "itemId":itemId},
		dataType:'html',
		success:function(data){
			alert("삭제되었습니다");
			$(".reviewList").html(data);
		}
	});
	
}
</script>
<script>
function addCart(){
	
	var detailId=$("#cartdetailId").val()
	var count=$("#cartcount").val()
	
	$.ajax({
		url:"${pageContext.request.contextPath}/order/insertCart",
		type:"POST",
		data:{"detailId":detailId, "count":count},
		dataType:'json',
		success:function(data){
			if(data.state==='true'){
				alert("장바구니에 담겼습니다");
			}
		}
	});
}

</script>


