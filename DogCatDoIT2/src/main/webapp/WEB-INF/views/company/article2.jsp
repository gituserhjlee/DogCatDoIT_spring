<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
<c:if test="${sessionScope.member.userId=='admin' || sessionScope.member.userId==dto.userId}">
function deleteCompany() {
	var q = "boardnum=${dto.boardnum}&${query}";
	var url = "${pageContext.request.contextPath}/company/delete?" + q;

	if(confirm("게시글을 삭제 하시 겠습니까 ? ")) {
			location.href=url;
	}
}
</c:if>
</script>

<script type="text/javascript">
function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status===403) {
				login();
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	$(".btnSendCompanyLike").click(function(){
		if(! confirm("게시물에 공감 하십니까 ? ")) {
			return false;
		}
		
		var url="${pageContext.request.contextPath}/company/insertCompanyLike";
		var boardnum="${dto.boardnum}";
		var query="boardnum="+boardnum;
		
		var fn = function(data){
			var state=data.state;
			if(state==="true") {
				var count = data.companyLikeCount;
				$("#companyLikeCount").text(count);
			} else if(state==="false") {
				alert("게시글 추천은 한번만 가능합니다. !!!");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});

$(function(){
	listPage(1);
});

function listPage(page) {
	var url = "${pageContext.request.contextPath}/company/listReview";
	var query = "boardnum=${dto.boardnum}&pageNo="+page;
	var selector = "#listReview";
	
	var fn = function(data){
		$(selector).html(data);
	};
	ajaxFun(url, "get", query, "html", fn);
}

$(function(){
	$(".btnSendReview").click(function(){
		var boardnum="${dto.boardnum}";
		var $tb = $(this).closest("table");
		var content=$tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/company/insertReview";
		var query="boardnum="+boardnum+"&content="+content;
		
		var fn = function(data){
			$tb.find("textarea").val("");
			
			var state=data.state;
			if(state==="true") {
				listPage(1);
			} else if(state==="false") {
				alert("리뷰를 추가 하지 못했습니다.");
			}
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});


$(function(){
	$("body").on("click", ".deleteReview", function(){
		if(! confirm("게시글을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		var reviewNum=$(this).attr("data-reviewNum");
		var page=$(this).attr("data-pageNo");
		
		var url="${pageContext.request.contextPath}/company/deleteReview";
		var query="reviewNum="+reviewNum+"&mode=review";
		
		var fn = function(data){
			listPage(page);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
});
</script>
<body>
<!-- Single Products Section Start -->
    <div class="section section-padding border-bottom">
        <div class="container">
            <div class="row learts-mb-n40">

                <!-- Product Images Start -->
                <div class="col-lg-6 col-12 learts-mb-40">
                    <div class="product-images">
                        <a href="https://www.youtube.com/watch?v=nJjoGCgh5x4" class="product-video-popup video-popup hintT-left" data-hint="유튜브 영상 보기"><i class="fal fa-play" style="color: white;"></i></a>
                        <div class="product-gallery-slider">
                            <div class="product-zoom" data-image="${pageContext.request.contextPath}/resources/mainResources/images/product/single/7/product-zoom-1.jpg">
                                <img src="${pageContext.request.contextPath}/resources/mainResources/images/product/single/6/product-11.jpg" alt="">
                            </div>
                            <div class="product-zoom" data-image="${pageContext.request.contextPath}/resources/mainResources/images/product/single/7/product-zoom-2.jpg">
                                <img src="${pageContext.request.contextPath}/resources/mainResources/images/product/single/6/product-22.jpg" alt="">
                            </div>
                            <div class="product-zoom" data-image="${pageContext.request.contextPath}/resources/mainResources/images/product/single/7/product-zoom-3.jpg">
                                <img src="${pageContext.request.contextPath}/resources/mainResources/images/product/single/6/product-33.jpg" alt="">
                            </div>
                        </div>
                        <div class="product-thumb-slider">
                            <div class="item">
                                <img src="${pageContext.request.contextPath}/resources/mainResources/images/product/single/6/product-thumb-11.jpg" alt="">
                            </div>
                            <div class="item">
                                <img src="${pageContext.request.contextPath}/resources/mainResources/images/product/single/6/product-thumb-22.jpg" alt="">
                            </div>
                            <div class="item">
                                <img src="${pageContext.request.contextPath}/resources/mainResources/images/product/single/6/product-thumb-33.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Product Images End -->

                <!-- Product Summery Start -->
                <div class="col-lg-6 col-12 learts-mb-40">
                    <div class="product-summery">
                        <div class="product-nav">
                            <a href="#"><i class="fal fa-long-arrow-left"></i></a>
                            <a href="#"><i class="fal fa-long-arrow-right"></i></a>
                        </div>
                        <div class="product-ratings">
                            <span class="star-rating">
                                <span class="rating-active" style="width: 100%;">ratings</span>
                            </span>
                            <a href="#reviews" class="review-link">(<span class="count">1</span> 후기)</a>
                        </div>
                        <h3 class="product-title">두잇 케어</h3>
                        <div class="product-description">
                            100% 예약제로 운영되는 반려동물 케어 플랫폼 두잇 케어입니다. 소중한 가족과 교감하며 고객님의 충분한 휴식과 즐거운 여가 시간을 보장합니다. 
                        </div>
                        <div class="group-product-list">
                            <span class="info-text">두잇 케어 전용 오프라인 쿠폰을 지참하시면 <span class="text-primary">10%</span> 할인 적용 가능합니다.</span>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="choose"><input type="checkbox"></td>
                                        <td class="quantity"></td>
                                        <td class="title">방문 돌봄: <span>30분</span></td>
                                        <td class="price"><span class="pro-price"><span>13,000₩</span></span></td>
                                    </tr>
                                    <tr>
                                        <td class="choose"><input type="checkbox"></td>
                                        <td class="quantity">-</td>
                                        <td class="title"><a href="#">방문 돌봄 30분 추가 비용</a></td>
                                        <td class="price"><span class="pro-price"><span class="new">8,000₩</span></span></td>
                                    </tr>
                                    <tr>
                                        <td class="choose"><input type="checkbox"></td>
                                        <td class="quantity">-</td>
                                        <td class="title"><a href="#">산책 추가 비용</a></td>
                                        <td class="price"><span class="pro-price"><span class="new">15,000₩</span></span></td>
                                    </tr>
                                    <!--
                                    <tr>
                                        <td class="choose"><input type="checkbox"></td>
                                        <td class="quantity">1</td>
                                        <td class="thumb"><img src="${pageContext.request.contextPath}/resources/mainResources/images/product/single/6/group-product-3.jpg" alt=""></td>
                                        <td class="title"><a href="#">목욕 추가 비용</a></td>
                                        <td class="price"><span class="pro-price"><span class="old">15,000₩</span><span class="new">15,000₩</span></span></td>
                                    </tr>
                                    -->
                                </tbody>
                            </table>
                            <span class="info-text">결제는 현장에서 진행됩니다.</span>
                        </div>
                        <div class="product-variations">
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="label"><span>수량</span></td>
                                        <td class="value">
                                            <div class="product-quantity">
                                                <span class="qty-btn minus"><i class="ti-minus"></i></span>
                                                <input type="text" class="input-qty" value="1">
                                                <span class="qty-btn plus"><i class="ti-plus"></i></span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="product-buttons">
                            <a href="#" class="btn btn-icon btn-outline-body btn-hover-dark hintT-top" data-hint="Add to Wishlist"><i class="fal fa-heart"></i></a>
                            <!-- <a href="#" class="btn btn-dark btn-outline-hover-dark"><i class="fal fa-shopping-cart"></i> Add to Cart</a> -->
                            <a href="#" class="btn btn-dark btn-outline-hover-dark">예약하기</a>
                            <a href="#" class="btn btn-icon btn-outline-body btn-hover-dark hintT-top" data-hint="Compare"><i class="fal fa-random"></i></a>
                        </div>
                        <!--
                        <div class="product-brands">
                            <span class="title">Brands</span>
                            <div class="brands">
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/mainResources/images/brands/brand-6.png" alt=""></a>
                                <a href="#"><img src="${pageContext.request.contextPath}/resources/mainResources/images/brands/brand-8.png" alt=""></a>
                            </div>
                        </div>
                        -->
                        <div class="product-meta">
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="label"><span>사업자등록번호</span></td>
                                        <td class="value">123-45-67890</td>
                                    </tr>
                                    <tr>
                                        <td class="label"><span>업종</span></td>
                                        <td class="value">
                                            <ul class="product-category">
                                                <li><a href="#">펫시터</a></li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label"><span>태그</span></td>
                                        <td class="value">
                                            <ul class="product-tags">
                                                <li><a href="#">반려동물</a></li>
                                                <li><a href="#">펫시터</a></li>
                                                <li><a href="#">돌봄</a></li>
                                                <li><a href="#">산책</a></li>
                                                <li><a href="#">예약</a></li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="label"><span>SNS</span></td>
                                        <td class="va">
                                            <div class="product-share">
                                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Product Summery End -->

            </div>
        </div>

    </div>
    <!-- Single Products Section End -->

    <!-- Single Products Infomation Section Start -->
    <div class="section section-padding border-bottom">
        <div class="container">

            <ul class="nav product-info-tab-list">
                <li><a class="active" data-toggle="tab" href="#tab-description">상세정보</a></li>
                <li><a data-toggle="tab" href="#tab-pwb_tab">업체정보</a></li>
                <li><a data-toggle="tab" href="#tab-reviews">후기 (1)</a></li>
            </ul>
            <div class="tab-content product-infor-tab-content">
                <div class="tab-pane fade show active" id="tab-description">
                    <div class="row">
                        <div class="col-lg-10 col-12 mx-auto">
                            <p>기본 방문 돌봄 30분 : 13,000원<br>추가 방문 돌봄 30분 당 : 8,000원<br>산책 추가 비용 : 15,000원</p>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="tab-pwb_tab">
                    <div class="row learts-mb-n30">
                        <div class="col-12 learts-mb-30">
                            <div class="row learts-mb-n10">
                                <div class="col learts-mb-10" style="text-align: center;">
                                    <p>100% 예약제로 운영되는 반려동물 케어 플랫폼 두잇 케어입니다.<br>소중한 가족과 교감하며 고객님의 충분한 휴식과 즐거운 여가 시간을 보장합니다. </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="tab-reviews">
                	<!-- <div id="listReply"></div> --> 
                    <div class="product-review-wrapper">
                        <span class="title">1개의 두잇 케어 이용 후기</span>
                        <ul class="product-review-list">
                            <li>
                                <div class="product-review">
                                    <div class="thumb"><img src="${pageContext.request.contextPath}/resources/mainResources/images/review/review-1.jpeg" alt=""></div>
                                    <div class="content">
                                        <div class="ratings">
                                            <span class="star-rating">
                                                <span class="rating-active" style="width: 100%;">ratings</span>
                                            </span>
                                        </div>
                                        <div class="meta">
                                            <h5 class="title">김감자</h5>
                                            <span class="date">2021년 6월 1일</span>
                                        </div>
                                        <p>친절하고 좋았습니다.</p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <span class="title">후기 작성하기</span>
                        <div class="review-form">
                            <form action="#">
                                <div class="row learts-mb-n30">
                                    <div class="col-12 learts-mb-10">
                                        <div class="form-rating">
                                            <span class="title">별점 주기</span>
                                            <span class="rating"><span class="star"></span></span>
                                        </div>
                                    </div>
                                    <div class="col-12 learts-mb-30"><textarea placeholder="후기 작성 *"></textarea></div>
                                    <div class="col-12 text-center learts-mb-30"><button class="btn btn-dark btn-outline-hover-dark btnSendReview">등록하기</button></div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- Single Products Infomation Section End -->
<!-- Contact Information & Map Section Start -->
    <div class="section section-padding">
        <div class="container">
            <!-- Section Title Start -->
            <div class="section-title2 text-center">
                <h2 class="title">가족 같은 편안함</h2>
                <p>100% 예약제로 운영되는 반려동물 케어 플랫폼 두잇 케어입니다.<br>소중한 가족과 교감하며 고객님의 충분한 휴식과 즐거운 여가 시간을 보장합니다.</p>
            </div>
            <!-- Section Title End -->

            <!-- Contact Information Start -->
            <div class="row learts-mb-n30">
                <div class="col-lg-4 col-md-6 col-12 learts-mb-30">
                    <div class="contact-info">
                        <h4 class="title">주소</h4>
                        <span class="info"><i class="icon fal fa-map-marker-alt"></i> 서울시 마포구 월드컵북로 21 1층</span>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-12 learts-mb-30">
                    <div class="contact-info">
                        <h4 class="title">연락처</h4>
                        <span class="info"><i class="icon fal fa-phone-alt"></i> 휴대전화: 010 – 1234 – 5678 <br> 매장전화: 02 - 123 – 4567</span>
                        <span class="info"><i class="icon fal fa-envelope"></i> 이메일: <a href="#">contact@petsitter.com</a></span>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-12 learts-mb-30">
                    <div class="contact-info">
                        <h4 class="title">영업시간</h4>
                        <span class="info"><i class="icon fal fa-clock"></i> 월요일 – 금요일 : 09:00 – 20:00 <br> 토요일 & 공휴일: 10:30 – 22:00</span>
                    </div>
                </div>
            </div>
            <!-- Contact Information End -->

            <!-- Contact Map Start -->
            <div class="row learts-mt-60">
                <div class="col">
                    <iframe class="contact-map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.9391721116226!2d126.91732551519401!3d37.55649687979986!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c98dc8ca7c5ff%3A0xd583b32c3b59965a!2z7ISc7Jq47Yq567OE7IucIOuniO2PrOq1rCDshJzqtZDrj5kg7JuU65Oc7Lu167aB66GcIDIx!5e0!3m2!1sko!2skr!4v1622979954051!5m2!1sko!2skr" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                </div>
            </div>
            <!-- Contact Map End -->

        </div>
    </div>
    <!-- Contact Information & Map Section End -->
    <div style="text-align: center; margin-bottom: 50px;">
    	<c:choose>
			<c:when test="${sessionScope.member.userId==dto.userId}">
			    <button type="button" class="btn btn-info btn-outline-info" onclick="javascript:location.href='${pageContext.request.contextPath}/company/update?boardnum=${dto.boardnum}&page=${page}';">수정</button>
			   </c:when>
			   <c:otherwise>
			    <button type="button" class="btn btn-info btn-outline-info" disabled="disabled">수정</button>
			   </c:otherwise>
			  </c:choose>
			    	
			  <c:choose>
			   <c:when test="${sessionScope.member.userId==dto.userId || sessionScope.member.userId=='admin'}">
			    <button type="button" class="btn btn-primary btn-outline-primary" onclick="deleteCompany();">삭제</button>
			   </c:when>
			   <c:otherwise>
			    <button type="button" class="btn btn-primary btn-outline-primary" disabled="disabled">삭제</button>
			   </c:otherwise>
			  </c:choose>
    </div>
					
</body>
</html>